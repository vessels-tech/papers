# Introducing DFSTalk
## Enabling number-based IVR Experiences, no matter the language

[todo: insert logo]

DFSTalk is a spinoff project from some of our work with delivering payment notifications to farmers in rural Tanzania. We aren't yet ready to share too many details of that project but in short:

- We needed a way to send payment notifications to rural people without consistent access to smartphones or data (no Whatsapp, sorry)
- We also needed to communicate these notifications to people who might not be too good at reading
- We needed a way to do this in Swahili, which only has basic support for text-to-speech engines

Our audio payment notifications were already pre-recorded in Swahili, but we had no way to make them dynamic. That meant that as soon as we got to a number, instead of reading the number as a human would, we had to read out the digits _(think: 125 as "one" "two" "five")_. When we tested this naive approach with the farmers we almost got laughed out of the room.

So we thought:
>>What if there was a service that let you build your own text-to-speech models in _any_ language, by simply stitching together numbers into a single audio file?

For example, _120,300 Shillings_ could be stitched into a string of numbers: _"one" "hundred" "and" "twenty" "thousand" "three" "hundred" "shillings"_. It was certainly quite simple in English, but how about for Swahili? After seeking some advice from Swahili-speaking peers, it seemed pretty do able.

What's more, instead of stitching together our pre-recorded IVR messages with computerized dynamic numbers, we could use the very same voice actor to record our numbers. This meant that the end message would sound more seamless and less like an annoying robo-call.


## Example

Below are some examples of numbers that have been converted to audio. We provide the English example as a demo only - there's already plenty of tools out there 

### English:
- [2976 with an Australian Male Accent.](https://raw.githubusercontent.com/vessels-tech/dfstalk/master/docs/audio/en_AU_male_2976.mp3)
- [576 with an Australian Male Accent](https://raw.githubusercontent.com/vessels-tech/dfstalk/master/docs/audio/en_AU_male_577.mp3?raw=true)

### Swahili:
[TODO: insert]


## A Web Service

We're opening DFSTalk up for private beta access at the moment. If you want to use it for your IVR application, drop us a line at lewis [at] vesselstech [dot] com, and we can get you access. As of today, we support only English and Swahili, but if there's a language you need, talk to us and we can build it together!

The API is very simple, you give us a number and a language, an we return a 24-hour link to that converted audio:

```bash
curl -X POST "https://<hostname>/number/" \
  -H "accept: application/json" \
  -H "authorization: Basic ZW1haWxAZXhhbXBsZS5jb206cGFzc3dvcmQ=" \
  -H "Content-Type: application/json" \
  -d "{ \"language\": \"en_AU_male\", \"number\": 1032}"
```


## Open Source

Instead of hoarding all of the goodies of this project, we thought this would be a great spin-off project to share with the world. If we want more companies to build more inclusive financial services, they need to be able to do so in very specific languages to reach their own target audiences [todo: write better].

We figured that this libary could be very useful for others working in to develop IVR applications for financial inclusion in Africa and around the world, and thus decided to release it publicly under an Open Source license. The hope for this project is that others can add their own languages and benefit financial inclusion projects around the world.

You can check out the github for this project [here](https://github.com/vessels-tech/dfstalk)



## Support

As always, thanks to our generous supporters at [DFS Lab](http://dfslab.net). They have a real vision for the future of financial services, and we at Vessels Tech are truly lucky that they have chosen to work with us to forward their vision. I'm a real big fan of these guys: so much so that as I'm sitting in a cafe writing this piece, I'm sporting my very own DFS Labs shirt. 

![insert screenshot of shirt](./img/dfs_shirt.png)
My coveted DFS Lab shirt.

Also, shout out to J Bland for the slick logo - every good Open Source project needs a good logo. [todo: insert link]




