# 4PBot

## Lewis Daly - Vessels Tech

<!--
qs:

*As you prepare your presentations for the conference, please make sure you answer each of these questions.*

* What is the context and problem you are solving? Any evidence that illustrates the problem? 
* What was your design process and how did you arrive at your approach? 
* What approach did you take? 
* Describe the technology stack? What is off the shelf and what did you build? 
* Demo 
* What has the response been from users? Numbers of users, actives, interesting use cases, sample conversations, etc. 
* Is there any interest from other stakeholders? (e.g. the government, or program admin) 
* What is the future path? 
-->

---
# Background & Research

- 4Ps, or Pantawid Pamilya Pilipino Program
- Run by Department of Social Welfare and Development (DSWD)
- Funding mostly from Govt,  + ADB + World Bank

---
# Background & Research

- Serves 4.3M Households
- Households most ofen represented by Mother or Grandmother

- Grants make up around 14% of household income _ref?_
- 3rd biggest in the world
- often a poster child for other CCT programs

---
#grant
- Grants _^1_
  - Paid out every 2 months
  - Health: P500 per month per household 	
  - Education: P500 per child in high school, or P300 for a child in primary school
    - every ten months
    - households can register a maximum of 3 children
  - Rice subsidy: P600 a month for buying rice only (this is most often in the form of a reimbursement)

---
# Background & Research

- Conditions
  - Pregnant women must go to pre-natal and post-natal care and be attended by a health professional at childbirth
 	- Parents/guardians must attend monthly family development seminars, which address topics such as responsible parenting, health and nutrition.
 	- Children 0-5yo must receive regular check-ups and vaccines
 	- Children ages 6-14 must receive deworming pills twice a year
 	- Children aged 3-18 must enroll in school, and maintain an attendance of at least 85% of class days every month


*note: P50 ~= 1 USD*


### _1_ http://pantawid.dswd.gov.ph/images/stories/pantawidfaq.pdf
### _2_ ???



---

# Disbursement

- A challenge in a nation of over 7000 islands
- Mostly through ATM cash cards (40%), or in-person _^3_
- *Side note: Mobile money has been tried in the past, but didn't work out very well :(*
  - "However, GCASH struggled with its original 4Ps mobile money solution when it found that only 20 percent of the recipients in its payout areas had a phone." _^3_


_3_ http://www.cgap.org/publications/case-study-striving-e-payments-scale-philippines

---
# Financial inclusion in the Philippines

- A priority for govt, but not for the 4Ps program _^3_
- Mostly cash based socitey
- Mobile money players: GCash, PayMaya
  - Not popular in big cities, let alone provinces
  - anectodatal aside: lots of advertisment when we were in the city


- Low mobile penetration among 4Ps beneficaries
- Interviews we conducted:
  - 2 households we a part of a "Sinking" (shared savings) fund
  - Many households were in debt: paying 20-30% interest rates on motorbikes or the like to start a business
  - Nobody had a bank account
    - most wanted one, but felt they didn't have enough money to warrant it
    - One gentleman showed me his bank account: _insert picture here_

---

# Our Approach

- Most of our original ideas were garbage
- So we thought we would go broad and shallow, and see what ideas stuck

- 3 key areas we thought technology might be able to help:
1. While there are existing grievance resolution processes in place, the power dynamic between 4Ps clients and govt. workers means many issues go unresolved
2. Payment dates are unpredictable, making it difficult for clients to plan or budget ahead of time
3. Communication and information dissemination (we found a lot of different rumours and misinformation about the 4Ps floating around)

---
“The 4P is a big help in our family... but in the aspect of announcing to us, it is a little hard because sometimes we don’t know when the payout day is, it would be better that they send us an SMS...”
― Maria, 4Ps client

---

# Our Approach

- Split the development up into 3 distinct sprints, with a release at the end

- 0.1: built core features, set up frameworks, translations, script. Released to 10 private testers
- 0.2: Fixed issues from 0.1, added a section to crowdsource dates from people
- 0.3: Removed payout date predictor (too inaccurate), improved conversation flow, and removed friction steps in signing up:
  e.g. Asking for Phone number, many people got stuck, so we offered an option to skip

---

# Features

What does 4Pbot do?
well..

`//TODO: insert features slides`


---

# Technology Stack
  - Firebase functions + database
  - Google sheets for translations, data collection
  - Zapier to tie bits and pieces together
  - The bot itself was built using BotKit
    - BotKit is an open source framework
    - we will be able to migrate to SMS, IVR, other messaging platforms in the future easily
    - (note:) we started with a proprietary tool, but ditched it because we didn't want to have to re-write everything
  - Facebook messenger (also available on Free Basics)

---
# Demo
## On Boarding

`#TODO: Insert videos and gifs`


---
# Demo
## Report a Payout Date

---
# Demo
## Secret Report



---
# Demo
## Payout Calculator


---
# Demo
## News

---
# Response

- Feedback
`//TODO: insert reworked feedback slide`

- Insightful conversations


- stats
  - users, reports etc.
- graphs, charts etc.
  - even just make nice infographics


---
# Interest from stakeholders
- Other NGOs interested in using chatbots (eg. Hapinoy) for training
- Early talks with Govt. Really interested in accountability, fraud detection and impact analysis


---
# Next Steps
`//TODO:outline business plan here.`

- Technology seems viable, however Facebook messenger is not comfortable for many users. IVR seems like the way to go.
- Data collection and analysis seemed to be the key business case for 4PBot. Especially for delivering insights into how the program is working, conducting fraud analysis and accountability purposes.
-  We are in early talks with potential partners about adapting 4Pbot, and maybe using the chatbot principles for DFS not necessarily related to the welfare system.


---
# Vessels Tech
