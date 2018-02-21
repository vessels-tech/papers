
## Product Intro
_We're just going to keep iterating on this one_

1. 4PBot is a safe community for Filipinos on social welfare to share their experiences and assist one another.

2. 4PBot is a chatbot that improves service delivery, allows for safe conversations blah blah ... and delivers insights into the every day runnings and experiences of the beneficaries.

----
## Team
_todo: insert images_

- **Lewis Daly, CTO/Founder**
Product Development, Project Management

- **Kevin Doveton, Developer**
Software Architecture & Development

- **Yen Daly, __TODO title?__**
Research, Legal, Admin

- **Jheila Cashio __TODO title?__**
Translation, Customer Support

----

## How does it work?

_todo: insert from report_

### B & A
_todo: diagram_

#### Before:
- Clients are afraid to speak up and report issues
	- Power dynamic between clients and govt. workers
	- Reports aren't anonymous
- Greievances that go unreported aren't resolved
- GRS is hard to use, clients find it difficult to navigate
	- miscommunications
	- misunderstandings about expectations
- GRS doesn't factor into account client satisfaction into KPIs [this is more a cause]


#### After:

- Community effort between clients and DSWD to help make 4ps better
- Greater levels of trust and cooperation between DSWD and clients
- better use of communication channels
- better program monitoring and evaluation of 4ps
- Clients feel safer talking about issues


### Steps:

_todo: diagram_

1. User files report, which 4PBot anonomyses and releases to a community of 4ps clients and volunteers
2. community provides advice/response/advice
3. 4PBot helps user escalate to DSWD (connecting in with GRS), and monitors the progress of the case
4. Aggregates reports and mines data saftely and anonymously
5. 4PBot uses these data to conduct 3rd party evaluations on issues within the program, independent of DSWD


----
## Where does it belong?

- background
	- What is 4ps
    	- Pantawid Pamilya Philipino Program
        - CCT Program etc.

    - Existing Grievance program (GRS)
    	- core part of program design [^2]
    	- Designed to work at scale, most power seems to be in the communities, not at the very top
	    	"Grievances related to a particular level are addressed by the grievance unit just above that level. For instance, the national unit facilitates the resolution of serious grievances at all levels but particularly those that relate to the regional level." [^2]

	- why do we need 4PBot?

		- GRS is comprehensive, but many beneficaries are afraid to speak up
			- fear of losing payout for complaining
				- Suported by this:

				"The GRS played an important role in the de-listing of approx- imately 40,000 households—one percent of total active house- holds in the program. Of these households, 23 percent were de-listed after having been found to be ineligible with regard to grievances related to inclusion errors, 40 percent were found to have regular sources of income, and 9 percent were found to have reported fraudulent information ( gure 10). Forty percent of these households submitted voluntary waivers for de-listing because they felt they were not entitled to program benfits." [^2]

				So the GRS *is* used to delist beneficaries, but only a small amount. Are these people's fears rational?
				in 2014, 0.6% of total active households had been delisted after
				this was 77,000 by 2015 [3]

			- But how can we get around this? They need to verify the indentity of the beneficary to actually do anything.
				- Release problems to community first,
				- Then we ask the beneficary if they want to proceed
			- "If the complainant is anonymous, information about the resolution of the complaint is posted on the relevant city/municipal and barangay/village bulletin boards."[^2] It appears there are already anonymous reporting options. Why is the first we are hearing about it?


		- GRS can be more user friendly [^2]
			- Can users submit anonymous reports over SMS? This [^2] report says so, but I haven't seen elsewhere
				- We can use chatbots to open up this channel over IVR, Free Facebook, SMS
			- forms are still preferred (need newer numbers)
				- People we talked to found them difficult to use
			- face-to-face is not suitable for other types of reports
				- staff behaviour, informal payments [^2]
				- reports of favouritism between ML or PL and beneficary

		- direct communication can be improved
		 	- "Most grievance of cers and city/municipal links tend to communicate with complainants verbally, informally, and often indirectly through parent leaders." [^2]
			 	- 4PBot can help here

		- Forms are complicated.
			- They already have text, facebook,  twitter hot lines. Why aren't these working?
				- Internet access and cost, "Due to the accessibility and cost, grievances  led through the Internet are still limited (2 percent in 2013)."
					- These numbers are too old! (5 years!)
					- We can use Facebook Free data!
					- We can use free chat lines, or free sms numbers!
			- 4PBot can

		- Percentages of grievances resolved, and time they are resolved in are KPIs
			- This can lead to grievances being closed early, and/or not resolved from the client's perspective
			- 4PBot can introduce new ways to measure success - such as client satisfaction with the grievance


		- "In the field visits undertaken to Pangasinan and Abra provinces in Northern Luzon, the majority of the parent leaders and the beneficiaries were much less aware of the mechanisms of the Grievance Redress System than would have been ideal in order for the program to make full use of the GRS. In several focus group discussions undertaken, there were almost negligible instances of beneficiaries having made proper use of the formal grievance redress mechanisms, partly due to lack of awareness and partly due to the lack of expectations that the GRS would yield timely results." [^4]


    - 4PBot can help communities together to partner with DSWD to improve the program
	    - "Unlike grievance reporting on CCTs that can be more confrontational between a single individual and the government, social accountability efforts using a community approach by CSOs can potentially be undertaken more in the spirit of partnership with government to improve the quality of 4Ps implementation." [^4]
	    - also improve information dissemenation, leading to greater accountability

    - "Cash transfer programs around the world have been weak in involving communities in social audits or feedback loops. "
	    - 4PBot can act as a platform paticipatory monitoring and evaluation of 4ps
	    - "Measuring staff performance in implementing the 4Ps, such as reporting on the Municipal Links, is almost non-existent. The challenge has been to empower beneficiaries significantly enough for them not to feel threatened to report on the failings of the 4Ps for fear of losing their cash benefit entirely by doing so." [^4]


    - What is the current program evaluation process?
    	- external spot checks twice a year [1]
    	- now has CSO (civil society organisations) and Volunteer partners to help with implementation and oversight
    	- But is there still a need for 3rd party?
	    	- Maybe. CSOs will find it hard to be independent
	    	- keeping funding separate for a 3rd party service would be important


    -


    - 4Ps oversight (3rd party)
    	- "The DSWD partners with civil society organizations (CSOs) and nongovernmental organizations (NGOs) that serve as “watch dogs” for project implementation. [^2]

- marketplace
	- who are we selling to?

	- customers:
		- DSWD
		-


----

## Competitors

| Name           |Area | Description             | Status      |
|----------------|--|-------------------------|-------------|
|DSWD            | Resolving Grievances | The DSWD has existing grievance redress systems in place, allowing clients to submit grievences using in person or over Facebook, Twitter and SMS. |(1) Difficult to use, (2) Many clients are afraid to use it, (3) doesn't perserve anonymity |
|CSOs and NGOs   | Monitoring & Evaluation| 4Ps already has oversight by civil society organisations and NGOs which act as watch dogs for project implementation. These organisations are not completely separate from DSWD.             | In place |
|Facebook Groups | Support & Assistance| Many 4Ps clients are self organizing over Facebook groups to dicsuss their lives, challenges they face and to get/give support to each other. | (1) Limited to literate users with smartphones (2) Many users are embarrased to post issues they are facing     |

----
## Road map


### August - October 2017
*Initial Reseach Phase*
We researched the 4ps, undertook surveys of beneficaries and met with stakeholders in the DSWD and NGOs to discuss our ideas.

### October 2017
*4PBot private testing*
We released a private version of 4PBot, honing in on reporting features we found to be important during our research.

### November - December 2017
*4PBot released to public*
We released 4PBot out to the wild on Facebook Messenger, iterating on the feedback from our users and testers. We promoted 4PBot using Pantawid Pamilya Facebook groups.

### December 2017 - January 2018
*4PBot evaluation*
We sat down with users to learn what they thought about 4PBot, and where how they thought it could be improved. We also conducted some analysis based on the reports and feedback recieved.

### March 2018
*Presentation*
We presented 4PBot at the Chatbots challenge in Seattle, demonstrating what we had learned, and what we hope to achieve in the next iteration of 4PBot.

### 3-6 months:
*Expanding user base, working with Govt.*
We will expand 4Pbot's features to support SMS and IVR, making it more inclusive and easier to use. We will also resume talks with DSWD and Filipino government stakeholders to work on getting their support. We will also start working on the 4PBot Community - enabling and inventivising users to help one another with their 4Ps problems.

### 6-12 months:
*4PBot Reports and program evaluation*
We will start producing monthly reports on the health of 4Ps using the information gathered from 4PBot's conversations. We will look for other partnerships to expand 4PBot's impact.

### Beyond
*The future of 4PBot*
After 12 months, we will look for other programs we might be able to apply the 4PBot approach to, and look for partnerships with other financial institutions that can use 4PBot as a platform for delivering financial tools and services to the 4Ps clients.


----
## Revenue & Costs

### Revenue
- Monetising data and insights about the program to higher-up stakeholders such as the Filipino Government, Asian Development Bank or World Bank.
- Using 4PBot as a platform to deliver other financial tools and services to 4Ps clients or other underserved groups.
- 4PBot as a service - make and operate similar bots for private companies to assist in program monitoring and evaluation

### Costs
- Software Development & Ongoing Hosting Costs
- Marketing
- Support, consultants to assist in training 4PBot natural language progessing models in the short term

----
## Ask

We are asking for $100,000 USD, to facilitate the development and growth of 4PBot over the next 12 months, as outlined in our roadmap above.

These funds will be used for the following:

|$100,000|  |
|--------|--|
|$55,000 | Software Development & NLP Training|
| $2,000 | Hosting Fees|
| $6,000 | Admin, Legal and Accounting Expenses|
|$10,000 | Marketing|
|$18,000 | Travel expenses|
| $9,000 | Support, translating and local consultants|




## References:
[1] https://sites.google.com/site/ncrpantawidme/
[2] documents.worldbank.org/curated/en/.../901780BRI0P14600Philippines0Final02.pdf
[3] https://www.dswd.gov.ph/sec-soliman-measures-in-place-to-keep-a-clean-pantawid-pamilya-database-2/
[4] https://www.google.com.au/url?sa=t&rct=j&q=&esrc=s&source=web&cd=10&ved=0ahUKEwi7no_92rXZAhWMXrwKHTyeBLMQFghnMAk&url=http%3A%2F%2Fgpsaknowledge.org%2Fwp-content%2Fuploads%2F2015%2F03%2FPaper-on-Social-Accountability-in-CCTs-and-Philippines-4Ps-Final.pdf&usg=AOvVaw1sPFZBxnf9Egr7llS3U9Wn
