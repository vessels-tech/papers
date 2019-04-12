---
title: Mojaloop Bootcamp Recap [better?]
subtitle: Here's what we worked on at the Mojaloop Bootcamp
---




In early April, myself from Vessels Tech along with Sid Garg from Teller were selected to take part in the very first Mojaloop Coding Bootamp in Dar es Salaam. The bootcamp was a hybrid of DFS Lab's normal design sprint, with more of a focus on engineering - specifically focussed on Mojaloop: a promising open source platform for interoperable banking championed by The Bill & Melinda Gates Foundation.

Among attendance were some of the most successful fintechs from the African continent and the world, including Paystack and Carbon from Nigeria, GrameenPhone from Bangladesh, Jumo [double check] from Kenya. The bootcamp also boasted an experienced team of mentors guiding the teams through the process from BMGF, ModusBox, Beyonic [finish]

Of course, this was all headed up by the experienced team from DFS Lab, of whom this is the 5th bootcamp.


You may have read my previous post about our ideas for fintech products on top of mojaloop [here] (insert link), but if you haven't that's ok - over the course of the 4 days our idea took on many different forms, culminating in our live demo of EastPay. You can checkout the demo [here](https://eastpay.vessels.tech).

I'm going to walk through each step of our experience at the bootcamp, process of taking our idea from just a half -formed idea to execution. Some of these steps will be familar if you have ever been through a design sprint before (lots of post-its, and copious amounts of dot stickers), combined with DFS Labs' experience with running sprints in teams, focussed on the [something about mojaloop tech]

## Monday: The idea (or lack thereof)

Monday was by far the toughest day for us. We started by writing up our company's goal and our goal for what mojaloop might specifically be able to do (named a Mojaloop Goal). During the bootcamp, each team would take a definitive first step towards their own Mojaloop Goal.

So here they are: 

VesselsTech/Teller Goal:
Mojaloop Goal: "Finding the cheapest/easiest way to get your money from A to B"

We were a little different from the other teams, as Vessels Tech doesn't have an already established Fintech product. In some ways, starting from a clean slate meant that our integration with Mojaloop could be anything, but on the other hand, this choice was pretty stifling. 

[talk about mojaloop quotes api]

But we went on with the sprint process, and by the end of the idea, we had picked our A and B; East African Entrepeneurs/SMEs, and Merchants on Alibaba. [finish]


## Tuesday: Too late to turn back

At the start of the day, I was worried that we our idea wasn't really going to pan out. Our initial mojaloop goal was far too broad, but our more specific goal for our prototype: helping East African Entrepeneurs find the cheapest way to get their money to Alibaba merchants.

While this protoype idea was interesting, it was mostly chosen on a whim. We needed to validate the market, understand an actual problem to be solved, and figure out how exactly we would be able to use mojaloop.

Without getting too technical, our initial proposed system wasn't yet possible using Mojaloop. We wanted to expose a public endpoint (or endpoints) to look at each DFSP's 'Quotes' (a quote is a lookup for a DFSP to find the fees associated with sending money). Luckily; we had an epiphany - instead of querying a common mojaloop api to get all of the quotes for multiple DFSPs, we could just query each and every DFSP attached to a Mojaloop switch to look up the transfer cost. This method would take a little more work on our server's side, but it meant not needing to reinvent the wheel.


## Wednesday: Build Build Drink

Wednesday saw us starting the code for our . We built out a simple API, which talks to a Mojaloop deployment using Finteract [insert link] and hacked together a pretty looking website that talks to this API. Overall, it was quite straightforward technically. That means that either our idea was too simple, or maybe it's I'm just getting better as a dev.


## Thursday: Build Build Present

With the code for our prototype well underway, we started Thursday with a comfortable amount of time. For the first time ever - we were to finish a hackathon by about lunch time, and had plenty of time to put together a reasonably slick presentation.


[mention other presentations]
[talk about our presentation]

We ended the night dining at an Ethiopian resturant, and sipping on Ethiopian honey wine. It's not a bad way to end a busy week!

## Friday and Onwards

On Friday morning, Sid and I planned ahead for EastPay. Both of us are big fans of the idea, and after just a little bit of desk research, we learned that the market for buying goods on Alibaba and shipping them to East Africa is growing, and the logistical challenges are not straightforward at all.

We're going to continue our market research, and then turn EastPay into a valid project: by integrating 3rd party remittance/currency exchange services, and (for now) removing the Mojaloop integration until it's ready. 

We are also going to work on a more formal report that will be helpful for presenting our concept at the upcoming GSMA conference in Kigali.

Apart from that, we had some great conversations with the Gates representative, and the DFS Labs guys about how we might start contributing to the Mojaloop project, so we'll start hunting around for a couple issues on Github that we can start with.


