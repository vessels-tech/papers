# 
##


I recently noticed a new project called Totangle. Totangle integrates the tangle with Zapier, which allows you to integrate things happening on tangle to your existing APIs or workflows. The first use case they present is receiving an email alert when you get a payment on the tangle.

Inspired by this, and also needing this functionality myself (I want to get alerts when I recieve tips from my Medium articles) without having to constantly keep my wallet open), I thought I'd see if I could make an open source lambda function that copies this basic functionality.

## Here's How It (might) work:

- We write a lambda function that looks for an `address` or `tag` on the tangle every 30 minutes or so. 
- If the lambda function sees new transactions it hasn't previously seen, it sends an email using SNS to my email address.
- Once it has sent the email, it saves the recently seen transactions to some list somewhere - maybe S3 will work for now, or we could use DynamoDB.




## Part One: Setting up the lambda

We're going to use the excellent, if poorly named, serverless framework to manage our AWS lambdas and triggers for us.

Let's start by creating a new project.

```bash
$ npm install -g serverless
$ serverless create --template aws-nodejs --path tangle-trigger
$ cd tangle-trigger
$ npm init -y
```

We also need to install the iota library, and set up some nice environment variables

```bash
$ touch .env
$ npm install --save iota.lib.js
```

Let's edit the `.env` file first:
```env
export AWS_PROFILE=default
export IOTA_URL="http://localhost:14265"
export IOTA_ADDRESS="9999"
```
We use the AWS_PROFILE environment variable to control which AWS account serverless deploys to. I quite often have to navigate between accounts, so this environment variable is very helpful.

The two `IOTA_*` environment variables are just placeholder, but I wanted to show you how to get them into the running lambda function.

Let's add a `deploy` script to the `package.json`:

```json
{
  "name": "tangle-trigger",
  "version": "1.0.0",
  "description": "",
  "main": "handler.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "deploy": "source .env && serverless deploy"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "iota.lib.js": "^0.4.7"
  }
}
```


Next up, we need to modify the Serverless.yml file to define the lambda function and the event triggering the function.

```yml
service: TangleTrigger
provider:
  name: aws
  runtime: nodejs6.10
  stage: dev
  region: ap-southeast-2
  environment:
    IOTA_URL: ${env:IOTA_URL}
    IOTA_ADDRESS: ${env:IOTA_ADDRESS}

functions:
  checkAddress:
    handler: handler.checkAddress
    events:
      - schedule:
          name: shedule-check-address
          description: check the tangle for a given address
          # rate: rate(30 minutes)
          rate: rate(1 minute)
          enabled: true
```

For now, we are scheduling the lambda function every minute - just so we don't have to wait 30 minutes to debug any problems. You can also see how we are passing through the `IOTA_*` environment variables, which will automatically get placed into the lambda runtime. 

The last thing we need to do is actually write the lambda function! Here's a placeholder `handler.js`

```js
'use strict';

const IOTA = require('iota.lib.js');
const iota = new IOTA({provider: process.env.IOTA_URL});

module.exports.checkAddress = (event, context, callback) => {

  console.log("CHECKING ADDRESS:", process.env.IOTA_ADDRESS);
};
```

Pretty straightforward, right? But it lets us make sure our environment variables are being passed in correctly, and also ensures that our lambda is being packaged properly with the iota.lib.js dependency.


Let's deploy it, and poke around the AWS console.

```bash
$ npm run deploy
```

You should see some terminal output like the following (I'm using `yarn` instead of `npm` btw).

![deploy part one](./payment_lambda_terminal_1.png)

Navigating to the AWS console, we should be able to see a Cloudformation stack:


![cloudformation_stack](./pl_cf_1.png)

A Lambda Function:

![lambda_function](./pf_lambda_1.png)

and some Cloudwatch logs, which are written every time the lambda is triggered:

![cloudwatch_logs](./pf_cloudwatch_1.png)


## Part Two: Talking to the tangle

Now that we have a basic lambda function running every *n* minutes, we need a way to check for transfers to the tangle of a specific address. We will do this using the `findTransactionObjects()` method on the iota js lib.

Before we implement this however, we should probably make a way to run the serverless function locally, otherwise debugging this function will be a real pain.

Make a new file called `local.js`:

```js
const {checkAddress} = require('./handler');
checkAddress();
```

Now we can run `local.js` with the following:
```
$ node local.js
```

You should see something like the following:
```
CHECKING ADDRESS: undefined
```

Alright! It's half working. We need to make sure to source our .env file first. We can put it all together in a npm script:
`package.json
```js
...
"test": "source .env && node local.js",
...
```

Now, when we run `yarn run test` (or `npm run test`), we get the following:
```
yarn run v1.6.0
$ source .env && node local.js
CHECKING ADDRESS: 9999
✨  Done in 0.22s.
```

Our environment variables are getting passed in just fine. Let's talk to the tangle

### Talk to the tangle


First, let's put some proper values in our .env file:
```
...
export IOTA_URL="https://durian.iotasalad.org:14265"
export IOTA_ADDRESS="BJSLSJNPWSM9QLO9JYJAG9A9LLAUKZAQJGYZLNN9YMBNPCUUS9E9EYE9PIKIKNYHXAPNFAMDGXVIPVKIWGDUVDALPD"
```

I'm currently in singapore, so `durial.iotasalad.org` seems pretty fitting.

And let's update our handler.js to call the api:

```js
...

module.exports.checkAddress = (event, context, callback) => {
  console.log("CHECKING ADDRESS:", process.env.IOTA_ADDRESS);

  const searchValues = { addresses: [process.env.IOTA_ADDRESS]};
  iota.api.findTransactionObjects(searchValues, (err, res) => {
    if (err) {
      console.log("error finding transactions!", err);
      throw err;
    }

    console.log("found the transactionObjects:", res);
  });
};
```
Now when we run our test, we should get something like the following:

![terminal 2](./pl_terminal_2.png)

Great! We're able to look up the transfers to a given address! Now we need to count the number of transfers, and make sure we filter out transfers we've already seen. For that, we're going to use AWS S3.

Let's install the aws-sdk:
```
npm install --save aws-sdk
```

And now we need to add a add an s3 bucket to our `serverless.yml` file, as well as a new environment variable:

`serverless.yml`
```yml
service: TangleTrigger
provider:
  name: aws
  runtime: nodejs6.10
  stage: dev
  region: ap-southeast-2
  environment:
    IOTA_URL: ${env:IOTA_URL}
    IOTA_ADDRESS: ${env:IOTA_ADDRESS}
    S3_BUCKET_NAME: ${env:S3_BUCKET_NAME}

functions:
  checkAddress:
    handler: handler.checkAddress
    events:
      - schedule:
          name: shedule-check-address
          description: check the tangle for a given address
          rate: rate(30 minutes)
          enabled: true

resources:
  Resources:
    ExistingTxs:
      Type: AWS::S3::Bucket
      Properties:
        BucketName: ${env:S3_BUCKET_NAME}
```

`.env`
```bash
...
export S3_BUCKET_NAME="tangletrigger"
```


Ok. Now we need to tidy up a little bit, and functions that read and write from s3. Here's what I came up with.

`handler.js`

```js
'use strict';

const IOTA = require('iota.lib.js');
const iota = new IOTA({provider: process.env.IOTA_URL});

var AWS = require('aws-sdk');
var s3 = new AWS.S3();

module.exports.checkAddress = (event, context, callback) => {
  console.log("CHECKING ADDRESS:", process.env.IOTA_ADDRESS);

  return Promise.all([
    getExistingHashes(),
    findTransactionsPromise()
  ])
  .then(([existingTx, allTx]) => {
    //Remove the existing from all
    const newTx = Object.keys(allTx).filter(hash => existingTx[hash] !== true);
    console.log("new tx are:", newTx);
    //TODO: Trigger a new email/notification

    return saveNewHashes(newTx);
  })
  .catch(err => {
    console.log(err);
    throw err;
  });
};

/**
 * Get the existing tx hashes by looking up files in s3
 * This is limited to 1000, but good enough for our demo
 * 
 * Returns an object, where the key is the hash
 */
const getExistingHashes = () => {
  var params = {
    Bucket: process.env.S3_BUCKET_NAME,
  };

  return s3.listObjects(params).promise()
  .then(data => {
    const existingHashList = data.Contents.map(file => file.Key);
    const existingHashes = {};
    existingHashList.forEach(hash => existingHashes[hash] = true);
    
    return existingHashes;
  });
}


/**
 * Creates new files in s3 for each hash in the hash list
 * essentially adding them to a 'seen' list
 */
const saveNewHashes = (hashList) => {
  return Promise.all(hashList.map(hash => {
    const params = {
      Body: '\"true\"',
      Bucket: process.env.S3_BUCKET_NAME,
      Key: hash
    };

    return s3.putObject(params).promise();
  }));
}


const findTransactionsPromise = () => {
  const searchValues = { addresses: [process.env.IOTA_ADDRESS] };

  return new Promise((resolve, reject) => {
    iota.api.findTransactionObjects(searchValues, (err, res) => {
      if (err) {
        reject(err);
      }

      const foundHashList = res.map(tx => tx.hash);
      const foundHashes = {};
      foundHashList.forEach(hash => foundHashes[hash] = true);
      resolve(foundHashes);
    });
  })
}
```


[todo: walk through each function.]

Hopefully this is pretty self explanatory. In this case, we're simply writing new files to our s3 bucket using the tx hash as the key. It's a little lazy, and using database would work much better, but s3 is free and easier to get going with. I'll leave it up to you to to set up a database.



Now when after running this locally again, we can check our aws bucket: (you need to have the aws cli installed, otherwise you can use the web console)

```
$ aws s3 ls s3://tangletrigger/
2018-05-30 10:05:01          6 BGTXJCVKTJZR9GVZOVJOUPQTZSFRQYTWMNBWBDNUVHLTMLNLQBNBSJEINSRJFEEXOHUBNOGXMXKEA9999
```



## Adding an Email Notification

Finally, we need to send an email should we see any new transactions on the tangle. AWS makes this pretty easy with SNS, so first, let's add a new SNS topic to our `serverless.yml`

Our resources section should now look like this:

```yml
resources:
  Resources:
    ExistingTxs:
      Type: AWS::S3::Bucket
      Properties:
        BucketName: ${env:S3_BUCKET_NAME}
    
    TxNotification:
      Type: AWS::SNS::Topic
      Properties:
        TopicName: ${env:SNS_TOPIC_NAME}
        Subscription:
        - Endpoint: ${env:SNS_EMAIL}
          Protocol: email
```


Here's our final `handler.js`, with the email settings added in.

[insert note about SNS ARN]

```js
'use strict';

const IOTA = require('iota.lib.js');
const iota = new IOTA({provider: process.env.IOTA_URL});

const AWS = require('aws-sdk');
const s3 = new AWS.S3();
const sns = new AWS.SNS({
  region: 'ap-southeast-2'
});

module.exports.checkAddress = (event, context, callback) => {
  let newTx = null;

  return Promise.all([
    getExistingHashes(),
    findTransactionsPromise()
  ])
  .then(([existingTx, allTx]) => {
    //Remove the existing from all
    newTx = Object.keys(allTx).filter(hash => existingTx[hash] !== true);

    return saveNewHashes(newTx);
  })
  .then(() => {
    if (newTx.length > 0) {
      const message = `You have ${newTx.length} new transactions on the tangle!`;
      return publishSNSMessage(message);
    }
  })
  .catch(err => {
    console.log(err);
    throw err;
  });
};

/**
 * Get the existing tx hashes by looking up files in s3
 * This is limited to 1000, but good enough for our demo
 * 
 * Returns an object, where the key is the hash
 */
const getExistingHashes = () => {
  var params = {
    Bucket: process.env.S3_BUCKET_NAME,
  };

  return s3.listObjects(params).promise()
  .then(data => {
    const existingHashList = data.Contents.map(file => file.Key);
    const existingHashes = {};
    existingHashList.forEach(hash => existingHashes[hash] = true);
    
    return existingHashes;
  });
}


/**
 * Creates new files in s3 for each hash in the hash list
 * essentially adding them to a 'seen' list
 */
const saveNewHashes = (hashList) => {
  return Promise.all(hashList.map(hash => {
    const params = {
      Body: '\"true\"',
      Bucket: process.env.S3_BUCKET_NAME,
      Key: hash
    };

    return s3.putObject(params).promise();
  }));
}


const findTransactionsPromise = () => {
  const searchValues = { addresses: [process.env.IOTA_ADDRESS] };

  return new Promise((resolve, reject) => {
    iota.api.findTransactionObjects(searchValues, (err, res) => {
      if (err) {
        reject(err);
      }

      const foundHashList = res.map(tx => tx.hash);
      const foundHashes = {};
      foundHashList.forEach(hash => foundHashes[hash] = true);
      resolve(foundHashes);
    });
  })
}


const publishSNSMessage = (message) => {

  const params = {
    Message: message,
    Subject: 'You have new Transactions on the Tangle!',
    TopicArn: process.env.SNS_TOPIC_ARN
  }

  return sns.publish(params).promise();
}
```


And here's an email telling me I have new transactions:

![email 1](./pl_email_1.png)



Now we just need to change the notification time back to 30 minutes and we can deploy it again.

I'm also going to make a 3 small transactions, and see what happens!

![sending myself 1 iota](./pl_send_1.png)

Now all I need to do is wait around for an email


TODO:
- finish email section
- add to git
- create gists
- make pretty pictures
- and postamble
- publish to medium
- update readme to point to medium
- publish to reddit
- post on discord

