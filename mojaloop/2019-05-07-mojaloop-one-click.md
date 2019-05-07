# One Click Mojaloop Deployment using Terraform, GKS, K8s, Helm and Make

Ok that was a mouthful of a title.

I've been wanting to start making contributions to the [Mojaloop](insert link) project after attending the [Mojaloop bootcamp](https://medium.com/dfs-lab/heres-what-actually-went-down-at-the-2019-mojaloop-bootcamp-e40568b12cc4) earlier this year.

Since I don't have the funds to leave instances running around the clock, I thought I'd make a simple tool for automating the deployment and configuration of a Mojaloop deployment on Google Kubernetes Engine.


## Why GKS?

The answer is quite simple really - I accidentally paid them $150 in advance (instead of $15), and hence have money to burn with Google. I actually already ran through a manual version of this demo using Digital Ocean's managed Kubernetes service, and found the steps to be mostly the same.

Also, Amazon charges for their managed Kubernetes service, and Google does not.


## Initial Setup

Before we get to the `make` commands, there's a few things you will need to set up first on your local machine. 

I'm using macOS, so my guide will be tailored for my environment, but if you want to contribute instructions for Windows or Linux, feel free to help out in the comments below.

You will need to install the following things before this step. I'll leave that up to you to figure out.
- `brew`
- `make`
[todo: anything else?]


```bash
# install terraform + kubernetes cli
brew install terraform
brew install kubernetes-cli
brew install kubernetes-helm
```

### Google Cloud Config

Then set up a new project in Google Cloud Console. I called mine `moja-box`. Then download the service.json file. I followed [this](https://github.com/daaain/terraform-kubernetes-on-gcp/blob/master/docs/gcp.md) guide to help me set up the correct access key.

- Create a new service account key `default@moja-box.iam.gserviceaccount.com`
  Role: `Project/Editor`
- Click "Create"
- Save the .json file to `./config/default.json`
- run `echo 'default.json' > ./config/.gitignore` to make sure we don't add accidentally this to git.

### Google Cloud Local

```bash
#Install `GCloud` and setup
brew tap caskroom/cask
brew cask install google-cloud-sdk

gcloud components update
gcloud auth application-default login
gcloud config set compute/location asia-southeast1-a #or a region that makes sense for you
gcloud config set project moja-box #or your project name
```

### The configuration

Checkout my `moja-box` repo:

```bash
git clone https://github.com/vessels-tech/moja-box.git
```

Shout out to https://github.com/daaain/terraform-kubernetes-on-gcp/ , where I got the initial Terraform configuration for the Kubernetes cluster.


Then we need to configure the terraform secrets:

```bash
cp ./terraform/secrets.auto.tfvars.example ./terraform/secrets.auto.tfvars
```

Edit this file to your desired username and password. Keep in mind that the password must be at least 16 digits long.

Then run `make deploy-infra` to perform a dry run with Terraform and verify the config before actually spinning up the Kubernetes cluster.


## Terraform, Kubernetes and Mojaloop:

Once all this configuration is set up, it's as easy as running:
```bash
make deploy-infra-apply
```

To deploy the kubernetes infrastructure, and

```bash
make deploy-kube
```

This will then download the kubernetes config to your local machine, set up Helm and install the following charts:
- mojaloop
- nginx ingress
- kubernetes dashboard


_note: I wouldn't recommend these settings for a production system, this is really just for testing only. There are a few key security shortcuts we took, such as deploying the kubernetes-dashboard in insecure mode._

Finally, run `make print-hosts-settings` to show how you can configure your `/etc/hosts` file to allow you to talk to the mojaloop deployment. 

```bash
$ make print-host-settings

#Make sure your /etc/hosts contains the following:
#
#  <cluster_ip>	interop-switch.local central-kms.local forensic-logging-sidecar.local #central-ledger.local central-end-user-registry.local central-directory.local #central-hub.local central-settlement.local ml-api-adapter.local
```

After waiting a 5-10 minutes, the dashboard should be running. 
In a seperate shell, run:

```bash
make proxy-kube-dash
```
and follow the printed link to log into the dashboard. You should see something similar to this:

[](./dashboard_begin.png)
The dashboard when mojaloop has just been started on the cluster

After a few more minutes, everything should start to turn green, and Mojaloop should be available:

[](./dashboard_done.png)

After that you can check that everything is up and running using curl:

```bash
curl -H Host:'central-directory.local' <cluster_ip_address>/health

#eg
curl -H Host:'central-directory.local' http://35.247.170.113/health
#should print {"status":"OK"}

#you can also go to your browser if your /etc/hosts is set up correctly
open http://central-directory.local/
```

## Mojaloop Config:

Once the mojaloop deployment is up and running, we can run a bunch of `curl` commands to configure the settlement accounts and demo dfsps.

First we should set up the environment variables. copy `./config/mojaloop.private.example.sh` to `./config/mojaloop.private.sh`, and edit the fields there.

Next, edit the variables in `./config/mojaloop.public.sh`.

Now run `make env`, to set up the env file that the curl scripts will use.

Next, run the following:

```bash
make config-all 
```

This will run through the scripts in the `./mojaloop_config` directory, and set up the required Settlement accounts and dfsps.


### Test Transfer

Now that our DFSPs are set up, we can initiate a test transfer. Just run:
```bash
make example-create-transfer
```

and should everything be configured correctly, the bash script will create a transer, accept it, and then print out the payer position.

Example output:
```
Setting up environment
Creating the transfer (request from Payer -> Payee)
Created a transfer with TRANSFER_ID: 8474fe8f-d6f3-2a72-8ce6-bb7cac42ae78

fulfilling the transfer (request from Payee -> Payer)
Approved transfer: 8474fe8f-d6f3-2a72-8ce6-bb7cac42ae78

Get Payer Position
[{"currency":"AUD","value":1000,"changedDate":"2019-05-07T04:55:00.000Z"}]
Success

Get Payee Position
[{"currency":"AUD","value":0,"changedDate":"2019-05-07T04:55:00.000Z"}]
Success

```


## Next Steps:

Now that this is all configured, you can now run:

```bash
make deploy-infra-destroy
```

To tear down the entire deployment (don't worry, it will ask for confirmation first.)

And to redeploy the whole environment, you can run:

```bash
make deploy
```

You can also set up a proxy to the kubernetes dashboard by running 
```bash
make proxy-kube-dash
```

And pointing your browser to the location printed in the command output.