![Green Fields!]({{site.baseurl}}/mywell/IMG_5908.jpg)
Green Fields in Dharta

# Water, Wells and Workshops
## A summary of our field work with MyWell in January

_What's MyWell you ask? Well feel free to read on, but the basics of what we're doing with MyWell are here: https://medium.com/vessels/https-medium-com-vessels-mywell-ict4dev-india-water-d8f628f9bdb6__. In short: MyWell is an app for crowdsourcing groundwater levels in rural India from groups of Groundwater informed volunteers, known as Bhujal Jankars (BJs) in Hindi. MyWell aims to engage everyday villagers in groundwater science, and helps to build communities that are resilient in the face of groundwater scarcity and climate change._

Over two days in early January, we ventured out to run workshops and conduct field trials for MyWell. Apart from flying kites (apparently a tradition in Gujarat for Hindu New Years) and drinking copious amounts of tea, we had a great time teaching BJs about MyWell, and learning from their experiences.


## What did we do?

We ran MyWell workshops with BJs (groundwater monitoring volunteers) in both the Dharta and Megraj watersheds. These workshops involved demonstrating to BJs both MyWell on Android and MyWell over SMS.

We also conducted field trials where BJs uploaded well readings in real time, and we were able to see them on other devices.

![Using MyWell to record a new reading.]({{site.baseurl}}/mywell/well_reading.jpg)
Using MyWell to record a new well reading


We surveyed the BJs in attendance, along with researchers involved in the MARVI project. We gathered their feedback on things that worked, didn't work, and areas where they think MyWell could expand and grow.


## What did we learn?

There are many minor UI/UX improvements that need to be done. Users who were unfamilar with the interface found it a little confusing, and needed some help the first time. 

Once they had learned the interface, they seemed to pick it up more quickly, and were able to navigate around mywell with relative ease, however there were a few minor issues that turned out to be major in practice (eg. selecting the country code)

![Running a MyWell workshop in Dharta]({{site.baseurl}}/mywell/IMG_5883.jpg)
Running a MyWell workshop in Dharta


Since the first MyWell field trials, the 3G/4G network coverage has improved, making it easier to use in the field. Neverthless, the ability to save readings offline was still important, and was a key feature to both BJs and researchers.

Unfortunately, the MyWell SMS provider had stopped working only days earlier - and since we were in a holiday period in India, we were not able to get this working on the day. We were still able to demonstrate MyWell's features over SMS to the BJs, but we were not able to run a full end to end test.

There were a number of different coding schemes being used across the MARVI project to identify wells, checkdams and raingauges - which added another hurdle to the BJs.

At one stage in the Megraj workshop, we had to refer to a paper based list of wells to figure out which was the right one to record a reading for!



## Feedback

After running the workshops, we sat down with the BJs and asked them for their feedback about MyWell. This is what they had to say:

### The Good:

Just about everyone noted that using MyWell will lead to less errors, reduces the need for using paper, and makes recording well readings easier (this is coming from seasoned pros of recording well readings btw!). The BJs picked up the features really easily, and found it easy to understand - in spite of being only in English (more on that in a second). They saw how MyWell can be used to help with crop planning, and understanding their household and farm water needs. Finally, BJs and researchers alike liked that the data stored in MyWell is secure and isn't going to get lost very easily, and it's now shareable with just about anyone.

### The Bad:

As I said, there is currently only an English version of MyWell. Everyone expressed the need for a Hindi version, not to mention versions in local dialects (such as Mewari and Gujarati). Some users found it difficult to analyse the graphs, and asked for a few changes to be made to make the graphs digestable on smaller screen sizes. There were also other minor ui fixes that also need to be addressed - many of which are now on our todo list.

### The Future:

We also asked everyone about what they see the future of MyWell being used for. Some said they wanted a WhatsApp integration, and others suggested that we add more datapoints in, such as water quality data and farm size. Many said that they wanted to see MyWell expanded more than just these two watersheds - we couldn't agree more!


And - as a side note - my favourite piece of feedback was this:

>There should be a good music come from the background while using MyWell App. There should be 1 GB free data for users.

At first I dismissed this feedback, but I think this user has a point. Are there ways we can make MyWell more fun to use (maybe not necessarily by playing music)? And data is expensive. That's something we already know, and are looking for ways to lessen the costs of using MyWell for the BJs.


## Next Steps

These workshops and field trials are a vital step in progressing the development of MyWell.

![BJs using MyWell in Megraj]({{site.baseurl}}/mywell/IMG_5916.jpg)
BJs using MyWell in Megraj to record some paper readings.

As we keep on talking with other groundwater organisations about integrating MyWell, this trip was a good reminder of the minor issues that will affect the end user in a major way. Improvements to MyWell Android and MyWell SMS need to always take this into consideration.

One key improvement that we are working towards is making it easier to identify wells using a simple QR code attached to the pump or near the well - this will take an extra hurdle of BJs who manage readings for multiple wells, and help ensure the accuracy of data.

Curiously, this approach seems more and more popular in India with the rise of apps like PayTM.
