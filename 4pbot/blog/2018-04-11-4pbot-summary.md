

Cess lives in Las Piñas, in the greater Manila metro area. She's a proud mother of three, and her household is supported in part by the Pantawid Pamilyang Pilipino Program (4ps for short), the Philippines national social welfare program, which gives financial assistance to housholds who are deemed the 'poorest of the poor'.

Cess is meant to recieve payments for each of her children who are in school, at a maximum of 3 children. Since her three kids are in school, this should entitle her to 1,800 PHP (~25 USD at the time of writing) per month.

The problem is that Cess isn't recieving payments for her youngest child, who started elemantary school 6 months ago.

So what can Cess do about her situation? Can she complain to authorities? Yes. But she is afraid to. She's heard stories of other people losing their payouts when they complain, and she doesn't want to seem ungrateful for the assistance she is already receiving. Maybe she can fill out the necessary forms, to update her child's details. But she's already waiting on the results of one form she filled out to be processed, what good is another form going to do? So maybe she can just wait. Perhaps in two months time, when the next payments are due, she will get the full amount, and not need to follow it up any further. [finish]

In the last 10 months, we've heard plenty of stories like those of Cess. In fact, it was those stories that helped shape 4PBot's development [finish].

4PBot is a chatbot that helps people to navigate the social welfare program in the Philippines. We at Vessels Tech built 4PBot as a part of a grand challenge from DFS Lab, an incubator/seed stage investor.
[insert stuff we've written 100 times here]

In this post, I want to give you an overview of what we learned from the process of building 4PBot, and hopefully demonstrate the potential that we see for this project and others like it to succeed in assisting low income people to access financial services in emerging markets.


## Background

The 4Ps is one of the world's biggest conditional cash transfer programs, serving over 4.3 million households. It is run by the Filipino Department of Social Welfare and Development (DSWD) and has been around since [insert date]. 

The grant is payed out every 2 months, primarily to household mothers or grandmothers, and consists of:
- **Health*: P500 per month per household
- **Education*: Up to three children, P500 per child in high school, P300 per child in elementary school 

In order to receive the full granted amount, there are a number of conditions that need to be met:
- Pregnant women must go to pre-natal and post-natal care and be attended by a health professional at childbirth
- Parents/guardians must attend monthly family development session, which address topics such as responsible parenting, health and nutrition
- Children 0-5yo must receive regular check-ups and vaccines
- Children ages 6-14 must receive deworming pills twice a year
- Children aged 3-18 must enroll in school, and maintain an attendance of at least 85% of class days every month

Disbursement has been a key challenge throughout the life of the program, as for many logistics in a nation of over 7,000 islands. 60% of payouts are performed in person, with the second biggest payout amount being with ATM cash cards [clean up].

## Our Approach

We started this project with a significant research phase. During this phase, we met with program stakeholders, conducted in person interviews of 4Ps beneficaries, and conducted surveys. We took a less-traditional approach to surveying, in that we used Facebook in addition to traditional paper-based surveys.

Facebook turned out to be a powerful tool for the research and implementation of 4PBot. At the start of our research, we found that a large number (25,000+) of 4Ps beneficaries were already self organising in Facebook groups, offering advice, support and chatting about their lives and the 4Ps program.

We managed to get trusted in these groups and simply started asking people questions about their experiences with the program. This gave us a direct channel that traveresed the entire Philippines - something paper wouldn't have been able to give us for sure.

After the main implementation phase of 4PBot, we also travelled back to the Philippines to conduct in person user tests, where we sat down and watched people using the bot, and asked them questions [finish].

We came away from this research phase with 3 key ideas for what we might build:
- The power dynamic between 4Ps beneficiaries and govt. workers means many issues go unresolved.
- Payment dates are unpredictable, making it difficult for beneficiaries to plan or budget ahead of time.
- Gossip, misinformation and confusion is commonplace from one barangay/village to another.


>“The 4P is a big help in our family... but in the aspect of announcing to us, it is a little hard because sometimes we don’t know when the payout day is, it would be better that they send us an SMS...”


## The Bot

The prototype 4PBot runs in Facebook Messenger. 4PBot speaks Tagalog, Bisaya and English, and [finish]. It has a collection of features that are essentially conversation flows users can select between.

[insert gifs]

### Onboarding
- User selects language, Tagalog, Bisaya/Cebuano, or English
- Asked for mobile number, or can skip
- Presented with a scrollable menu

### Report a Payout Date
- Crowdsources payout dates to help predict future dates
- These data are rather hard to find
- Many beneficiaries post on Facebook groups when they have received their payout

### Make a Report
- Anonymous reports
- Able to collect data that isn’t already being captured by DSWD
- Share details they are afraid or embarrassed to share 

### Calculate My Payout
- Simple payment calculator 
- Helps beneficiaries figure out if they are receiving the wrong amount
- Also reminds of conditions to be met

### Get the Latest News
- 3 short news items
- Translated and curated by our team
- Mostly about DSWD and the future of 4Ps

## Technology Stack

We built 4Pbot with a modular approach [finish]

[insert screenshot system design]


## Findings

**The good:**
- Beneficiaries trusted 4PBot with personal information
- People loved to chat! So we built out a 4Pbot chat feature
- Many thought it was a real person!

**Less Good:**
- Facebook is hard to use for many beneficiaries
- Payday predictor was not accurate enough


[insert reports screenshot]

>“The children of our parent leader aren't studying anymore but the I don't know why they still recieve cash grants.”
>
>                     - anonymous 4Ps client
[explain this a little bit more]


[insert graphs about market size]

The market size for 4Pbot is simply massive [finish]

[insert average rating picture]

Feedback:
- Users wanted more regular 4PBot news updates
- Wanted more help with the questions and reports they filed
- Wanted help understanding the future of the 4ps


**88.9% of conversations were complete**


## Next Steps

- 4PBOT CAN 
AMPLIFY THE AGENCY OF INDIVIDUALS
- 4PBOT CAN 
AMPLIFY THE AGENCY OF INDIVIDUALS
- 4PBOT CAN 
STRENGTHEN & ENHANCE THE 4PS PROCESS


1. 4PBot Community (think Quora for 4Ps) and form automation
2. Impact analysis, fraud detection and program evaluation
3. Link in with DSWD, integrate 4PBot into service delivery

### Stakeholder interest:

- Hapinoy, which trains micro entrepreneurs to impact needy communities across the Philippines were interested in 4PBot for training their entrepreneurs.
- Early talks about using 4PBot for improving service delivery, gathering insights into the program and fraud detection
- Office of Senate, interested in 4pbot for better monitoring & evaluation, 3rd party accountability



### Closing Thoughts

This project would never be possible without support from DFS Lab
We gained a lot of experience, and we’re looking for partners to continue working with
Learned about understanding complex govt systems.
This has potential elsewhere, in other G2P programs
Also potential for other chatbot applications
Healthcare, legal systems
Anywhere where people need to navigate complex bureaucratic processes


