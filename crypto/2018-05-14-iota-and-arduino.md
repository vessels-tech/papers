
In [my previous post](https://medium.com/@lewdaly/dipping-our-toes-into-mam-c6da40088425), we started looking into IOTA's Masked Authenticated Messaging (MAM) module, and how to apply it to a simple pub/sub application.

In this post, we're going to explore a simple case of getting MAM interfacing with an Arduino, using Johnny Five. This post was inspired by **@Chrislaive** on Discord, with his great example of MAM and Arduino, which you can find [here](https://github.com/chrislaive/IOTA-Nodebots). Thanks Chris!


## Set Up

Aside from the Gists you see below, you can see all of the code for this tutorial [here](). As always, comments, corrections and pull requests are welcome!

### Step 1: Arduino + Johnny Five

First, we need to get johnny five running on the arduino. This is pretty easy to do nowadays. I followed [this](https://github.com/rwaldron/johnny-five#setup-and-assemble-arduino) guide here. 

Then, we can run the traditional arduino blink.

`./blink_test.js`
```js
var five = require("johnny-five"),
  board = new five.Board();

board.on("ready", function () {
  // Create an Led on pin 13
  var led = new five.Led(13);

  // Strobe the pin on/off, defaults to 100ms phases
  led.strobe(200);
});
```

https://gist.github.com/lewisdaly/6fbfd88779181183ab736265f0cd304f

```bash
node blink_test.js
```

### Step 2: IOTA and MAM libs

Ok, now that we can run JS on our Arduino, we need to get the IOTA libs working.

Shout out to @Chrislaive on Discord for the pointer to https://github.com/rwaldron/johnny-five#setup-and-assemble-arduino. We're going to use this to get us started with the IOTA libs on Arduino and Johnny-Five

Install the required dependencies:

```bash
yarn add iota.lib.js

mkdir lib
#Add the submodule - you don't have to do this if you're working from my code!
git submodule add https://github.com/iotaledger/mam.client.js.git lib/mam.client.js
# mam.client.js/lib/mam.client.js is the file we want!

```

Make a new file called `init_test.js`
https://gist.github.com/lewisdaly/c7937149d91d24fb4d5f0104820aa798

```js
const IOTA = require('iota.lib.js');
const MAM = require('./lib/mam.client.js/lib/mam.client');
var iota = new IOTA({ provider: `https://testnet140.tangle.works` })

const  five = require("johnny-five");
const board = new five.Board();


// Initialise MAM State - PUBLIC
var mamState = MAM.init(iota)

board.on("ready", () => {
  console.log("mamState", mamState);
});
```

Here, we're just making sure that we are including our libraries correctly, and initializing IOTA and MAM properly.

```bash
node init_test.js
```

Hopefully this should run correctly, and we should see some output about MAM in the console.

## From Arduino -> Tangle

Next up, we're going to try and actually send a message to the tangle. Unfortunately I left all of my cool sensors at home, so the message won't have any meaning, but we can at least get it working for a later tutorial.

`send_data.js`
https://gist.github.com/lewisdaly/54f5d9c18d43e747e7c9318ff8b1f187
```js

const IOTA = require('iota.lib.js');
const MAM = require('./lib/mam.client.js/lib/mam.client');
var iota = new IOTA({ provider: `https://testnet140.tangle.works` })

const five = require("johnny-five");
const board = new five.Board();


// Initialise MAM State - PUBLIC
var mamState = MAM.init(iota)

//Publish to tangle
const publish = (trytes) => {
  // Create MAM Payload - STRING OF TRYTES
  var message = MAM.create(mamState, trytes)
  // Save new mamState
  mamState = message.state
  // Attach the payload.
  console.log('Root: ', message.root)
  console.log('Address: ', message.address)
  
  return MAM.attach(message.payload, message.address);
}

board.on("ready", () => {
  console.log("mamState", mamState);

  const trytes = iota.utils.toTrytes(JSON.stringify({ message: 'Hello World' }))        //convert string to trytes
  return publish(trytes)
    .then(response => {
      console.log('response', response);
    })
    .catch(err => {
      console.log("Err", err);
      return Promise.reject(err);
    });

});
```

Here, once the board is ready we send a message of `Hello World` (in trytes of course) publicly using MAM. The publish function is pretty close to what we did [in my last tutorial](https://medium.com/@lewdaly/dipping-our-toes-into-mam-c6da40088425) for reference.


Now I should note here that the code isn't running on our Arduino, but on our developent machine. Once you close the Johnny-Five console, the execution stops. So while this is great for a demo, and Javascript is much more forgiving than C or C++, we need to find another solution to get a network of connected IoT devices publishing data to the Tangle using MAM - which is my ultimate goal.

Stay tuned for my next post, where I look at getting data from actual sensors to the Tangle, without needing to use Johnny Five.

>>If you enjoyed this post, or have any suggestions or questions, let me know in the comments. If you liked this post, give it a ❤️ or a 👏, or whatever you crazy cats are calling it nowadays.

Donations are always welcome!

`BJSLSJNPWSM9QLO9JYJAG9A9LLAUKZAQJGYZLNN9YMBNPCUUS9E9EYE9PIKIKNYHXAPNFAMDGXVIPVKIWGDUVDALPD`






>>A note about POW:
>>For the sake of this tutorial, we're not really worrying about proof of work, but it will soon become a problem for us! For now, we can simply connect to full nodes that offer to do the PoW for us, but in an upcoming tutorial, I'm going to show you how you can 'shim' PoW using AWS Lambda, allowing you to use public nodes that don't do proof of work, and not perform it locally! It's pretty magical really.




