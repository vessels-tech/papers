

## Goal:

- run a webserver on D1Mini that updates sensor measurements every n seconds
- run a publisher that reads from this webserver and publishes to mam
- run a subscriber that reads from mam




For this demo, I'm going to be using the D1Mini. It has a [ ESP-8266EX] wifi chip on board already, and has some great sample code already out there. I got mine (I think it's a cheap knockoff [here](insert_affilliate_link))

Let's start with the demo


This is a good place to start:
https://github.com/esp8266/Arduino

I use git to manage my arduino library, so I installed the libraries like so:

```bash
cd $SKETCHES_DIR
mkdir -p hardware/esp8266com
cd hardware/esp8266com
git clone https://github.com/esp8266/Arduino.git esp8266
cd esp8266/tools
python get.py
```

We're going to start with the simple WifiWebServer Sketch:

```c++
/*
 *  This sketch demonstrates how to set up a simple HTTP-like server.
 *  The server will set a GPIO pin depending on the request
 *    http://server_ip/gpio/0 will set the GPIO2 low,
 *    http://server_ip/gpio/1 will set the GPIO2 high
 *  server_ip is the IP address of the ESP8266 module, will be 
 *  printed to Serial when the module is connected.
 */

#include <ESP8266WiFi.h>

const char* ssid = "vividwireless-03BC";
const char* password = "TM38366J1JN";

// Create an instance of the server
// specify the port to listen on as an argument
WiFiServer server(80);

void setup() {
  Serial.begin(115200);
  delay(10);

  // prepare GPIO2
  pinMode(2, OUTPUT);
  digitalWrite(2, 0);
  
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  
  // Start the server
  server.begin();
  Serial.println("Server started");

  // Print the IP address
  Serial.println(WiFi.localIP());
}

void loop() {
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
  
  // Wait until the client sends some data
  Serial.println("new client");
  while(!client.available()){
    delay(1);
  }
  
  // Read the first line of the request
  String req = client.readStringUntil('\r');
  Serial.println(req);
  client.flush();
  
  // Match the request
  int val;
  if (req.indexOf("/gpio/0") != -1)
    val = 0;
  else if (req.indexOf("/gpio/1") != -1)
    val = 1;
  else {
    Serial.println("invalid request");
    client.stop();
    return;
  }

  // Set GPIO2 according to the request
  digitalWrite(2, val);
  
  client.flush();

  // Prepare the response
  String s = "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n<!DOCTYPE HTML>\r\n<html>\r\nGPIO is now ";
  s += (val)?"high":"low";
  s += "</html>\n";

  // Send the response to the client
  client.print(s);
  delay(1);
  Serial.println("Client disonnected");

  // The client will actually be disconnected 
  // when the function returns and 'client' object is detroyed
}
```


From the serial monitor:
```
Connecting to vividwireless-03BC
.
WiFi connected
Server started
192.168.0.106

```

So if I curl the following ip...

```bash
$ curl 192.168.0.106/gpio/0
<!DOCTYPE HTML>
<html>
GPIO is now low</html>
```

Cool. I think we could hook up a light or something, but I'm not too fussed about that right now. I want to hook up a sensor.


### Adding a moisture sensor

Lets start by just returning a response in json. I'm sure there's libraries we could use to do this properly, but I'm just going to man-handle it for now.

This is what my `loop()` function looks like now:

Notice that I changed the content-type header to `application/json`. Depending on your client, it might not be so important, but it's good practices.

```cpp
void loop() {
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
  
  // Wait until the client sends some data
  Serial.println("new client");
  while(!client.available()){
    delay(1);
  }
  
  // Read the first line of the request
  String req = client.readStringUntil('\r');
  Serial.println(req);
  client.flush();

  // Prepare the response
  String s = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{\"reading\":99.99}";

  // Send the response to the client
  client.print(s);
}
```

```bash
$ curl 192.168.0.106
{"reading":99.99}
```

Looking pretty good to me! Now let's hook up a moisture sensor. 

I'm using an: [insert], which you can get from [insert affiliate link]. Mine is pretty cheap, but you know, it's a start.

![mousture sensor schematic]([insert])



Here's the code:

```
#include <ESP8266WiFi.h>

const char* ssid = "vividwireless-03BC";
const char* password = "TM38366J1JN";

// Create an instance of the server
// specify the port to listen on as an argument
WiFiServer server(80);

int moisture = 0; //value for storing moisture value 
int soilPin = A0;//Declare a variable for the soil moisture sensor 
int loopCount = 1;

void setup() {
  Serial.begin(115200);
  delay(10);

  // prepare GPIO2
  pinMode(2, OUTPUT);
  digitalWrite(2, 0);
  
  // Connect to WiFi network
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  
  // Start the server
  server.begin();
  Serial.println("Server started");

  // Print the IP address
  Serial.println(WiFi.localIP());
}

void loop() {
  loopCount++;
  readMoisture();
  
  // Check if a client has connected
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
  
  // Wait until the client sends some data
  Serial.println("new client");
  while(!client.available()){
    delay(1);
  }
  
  // Read the first line of the request
  String req = client.readStringUntil('\r');
  Serial.println(req);
  client.flush();

  // Prepare the response
  String s = "HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n{\"reading\":" + String(moisture) + "}";

  // Send the response to the client
  client.print(s);
  
}


void readMoisture() {
  
  //Only take a reading every 1000 iterations
  if (loopCount % 100000 == 0) {
    //TODO: calibrate and scale our readings
    //TODO: average over last n readings
    moisture = analogRead(soilPin);
    Serial.print("moisture:");
    Serial.println(moisture);    
  }
}
```

Every 100,000 times through the loop, update the reading from the sensor. We should also calibrate this sensor, and maybe take a moving average, but this will do for now.

Now when we curl:
```
#in a cup of water
$ curl 192.168.0.106
{"reading":567}

#in air only
$ curl 192.168.0.106
{"reading":1024}

```

So now we have a real sensor taking real readings on a real network! Now let's get this hooked up to an IOTA MAM publishing server.


## The publisher

In my [previous post](insert_link to post #1), we explored a simple pub/sub example of MAM using Javascript. That time, we were making up random readings. But now is different. This time we have sensors! Well one sensor (for now). Let's hook up our publisher, and get this arduino talking to the tangle.


>> Some Caveats
>> This method is great for a prototype, but requires a server to talk to the tangle for us. I would really love to make a device that can talk to the tangle directly. I'm currently working on an upcoming tutorial where we get the arduino to talk directly to the tangle, but that requires a little more C wizardry than I have time for at the moment.


So with that in mind, let's get this working.

If you read my [post about building a simple pubsub with MAM](insert link to post #1), we had a webserver that published a message from a url parameter to the tangle.

You can find the code for this publisher [here](insert pubsub github link)

>>A quick note about ts and js.
>>I'm currently moving between javascript and typescript, and my tutorials reflect this transition. Sorry for any confusion caused - eventually I'd like to update all my tutorials to ts, but we'll see how we go! As always, get in touch if you need help understanding something.

Basically, it's like this:
`publisher.ts`
```ts
declare var require: any

const Mam = require('../lib/mam.node.js');
const IOTA = require('iota.lib.js');
const express = require('express');

var iota = new IOTA({ provider: `https://testnet140.tangle.works` })
const app = express();

// Initialise MAM State - PUBLIC
var mamState = Mam.init(iota)

// Publish to tangle
const publish = async (packet: any) => {
  // Create MAM Payload - STRING OF TRYTES
  var message = Mam.create(mamState, packet)
  // Save new mamState
  mamState = message.state
  // Attach the payload.
  console.log('Root: ', message.root)
  console.log('Address: ', message.address)
  await Mam.attach(message.payload, message.address)
  
  return message.root;
}


app.get('/', async (req: any, res: any) => {
  const { message } = req.query;

  console.log("publishing message:", message);

  const root = await publish(message);

  res.json({message, root});
});

app.listen(3000, () => console.log('Publisher listening on port 3000!'));
```

This time round, we don't want to publish a message based on a http request, but based on a time delay - say 30 seconds or so.

Let's change our publisher to look a little more like the following:

`new_publisher.ts`
```
[insert]

```




Now that that's working, I'm going to let the pub and sub run for a bit, while taking the sensor in and out of the cup.

Here's some juicy console output you've been waiting for:

`publisher`
```
[nodemon] restarting due to changes...
[nodemon] starting `node dist/app.js`
Reading is: 525
published message at root: KVCAWPIAKWK9NWNPOLXHUKZSKJHVBRPUU9EVTTFPWLUWKJRJCASKOGAFWICXWNTIXVKINN9EHGNYKFKCJ
Reading is: 528
published message at root: SQIVFXRITENYEIHKREJDHRZHCV9UZNNROPRUKTYHIOTXDCR9BSKLHQCBMGBZTBHOMYLUYHSJRRPOGFLFS
Reading is: 535
published message at root: STM9XQEDOYVZXQXIVGCBNLBBVHUVWZGONUWREJUDHJPXGGPYSXZDMFZIFY9BTCLEKUEQSYVPRGYYCXDE9
Reading is: 538
published message at root: MDXG9WNSQFHXHJVTNXBDGSMDWOZCWAITIFJBNUAIKIUAQ9ZJWZVQGAGNSJXK9JRDGFLDS9RTHGWBEXDKR
Reading is: 542
```

`subscriber`
```bash
{ nextRoot: 'SQIVFXRITENYEIHKREJDHRZHCV9UZNNROPRUKTYHIOTXDCR9BSKLHQCBMGBZTBHOMYLUYHSJRRPOGFLFS',
  messages: [ 'ODGAFDTCPCSCXCBDVCGADBZAWAZAQD' ] }
{ nextRoot: 'SQIVFXRITENYEIHKREJDHRZHCV9UZNNROPRUKTYHIOTXDCR9BSKLHQCBMGBZTBHOMYLUYHSJRRPOGFLFS',
  messages: [] }
{ nextRoot: 'STM9XQEDOYVZXQXIVGCBNLBBVHUVWZGONUWREJUDHJPXGGPYSXZDMFZIFY9BTCLEKUEQSYVPRGYYCXDE9',
  messages: [ 'ODGAFDTCPCSCXCBDVCGADBZAWABBQD' ] }
{ nextRoot: 'STM9XQEDOYVZXQXIVGCBNLBBVHUVWZGONUWREJUDHJPXGGPYSXZDMFZIFY9BTCLEKUEQSYVPRGYYCXDE9',
  messages: [] }
{ nextRoot: 'STM9XQEDOYVZXQXIVGCBNLBBVHUVWZGONUWREJUDHJPXGGPYSXZDMFZIFY9BTCLEKUEQSYVPRGYYCXDE9',
  messages: [] }
{ nextRoot: 'MDXG9WNSQFHXHJVTNXBDGSMDWOZCWAITIFJBNUAIKIUAQ9ZJWZVQGAGNSJXK9JRDGFLDS9RTHGWBEXDKR',
  messages: [ 'ODGAFDTCPCSCXCBDVCGADBZAXAZAQD' ] }
{ nextRoot: 'O9IJSSMAF9MMMKQYDKCZTUMYOJYVMSBOMYUBUKC9ELKPOVQSTBUSLQPL99ZLVFMZLKKFUVLPNPRDASLJV',
  messages: [ 'ODGAFDTCPCSCXCBDVCGADBZAXABBQD' ] }
{ nextRoot: 'O9IJSSMAF9MMMKQYDKCZTUMYOJYVMSBOMYUBUKC9ELKPOVQSTBUSLQPL99ZLVFMZLKKFUVLPNPRDASLJV',
  messages: [] }
{ nextRoot: 'O9IJSSMAF9MMMKQYDKCZTUMYOJYVMSBOMYUBUKC9ELKPOVQSTBUSLQPL99ZLVFMZLKKFUVLPNPRDASLJV',
  messages: [] }
```

Pretty good! Although the messages are just garbage really. Let's decode them from trytes back to json.

`subscriber/app.ts`
```
//imports etc...

// Init State
let root = process.env.ROOT;
console.log('Listening to root:', root);

// Initialise MAM State
var mamState = Mam.init(iota)

const execute = async () => {
  const response = await Mam.fetch(root, 'public');
  response.messages.forEach((trytes: string) => {
    const decoded = iota.utils.fromTrytes(trytes);
    console.log("decoded:", JSON.parse(decoded));
  });

  if (response.nextRoot) {
    root = response.nextRoot;
    execute();
  } 
}

execute();

```

Great. Now our output looks more like this:

`subscriber console`
```
Listening to root: KVCAWPIAKWK9NWNPOLXHUKZSKJHVBRPUU9EVTTFPWLUWKJRJCASKOGAFWICXWNTIXVKINN9EHGNYKFKCJ
decoded: { reading: 525 }
decoded: { reading: 528 }
decoded: { reading: 535 }
decoded: { reading: 538 }
```


