
Describe your Changes
Submit Change Request

vessels-tech / papers
Review your changes:
Additions are highlighted in green. Deletions are crossed out.

# MyWell: Crowdsourcing Citizen science for Groundwater Intervention

----
Purpose:
1. Present MyWell, and demonstrate how it can/is being used for PGWM
2. Compare to other approaches
3. Evaluate use and define how it may be used in the future
----


## Abstract

In rural India, over 60% of agriculture relies on groundwater. Groundwater is often over-exploited, and groundwater depletion threatens many livelihoods. Existing interventions have been insufficient, and often fail to engage farmers at the lowest level. MyWell sets out to build a participatory, bottom-up approach to groundwater management. MyWell is an application for data-driven insights of groundwater at the village level. MyWell crowdsources groundwater indicators from a group of connected farmers using SMS or a smartphone application. In this paper, we show how MyWell has the potential to impact the lives of farmers by (1) empowering them to participate in science, and finding solutions to groundwater scarcity, and (2) assist them in building communities which work together to conserve groundwater. Then, we assess MyWell's application across two watersheds in rural India. We show how farmers are using MyWell to gain visibility into the groundwater situation, and examine the limitations of MyWell's approach.

----

## Introduction

In this paper, we outline the challenges faced by rural communities that rely on groundwater in rural India. We introduce the MARVI project, a project which aims to promote participatory approaches to groundwater management. We show how MyWell can be used as a tool for facilitating PGWM and empowering villagers. We outline the MyWell system and talk through its implementation, and compare it to other similar approaches to citizen science. We then evaluate MyWell in two watersheds in rural west India, outlining its benefits, limitations, and the potential MyWell and of the MyWell approach to facilitate people to share water and stuff.

India uses the largest amount of groundwater in the world, estimated at 230 cubic kilometers per year (World Bank, 2010). Groundwater is a relatively cheap and accessible resource, which contributes to its over exploitation. As it is shared among a watershed, the property rights of groundwater are difficult to manage, as whoever pumps first owns the water (Maheshwari et al, 2014; Chinnasamy, Maheshwari and Prathapar, 2015). Groundwater is often overexploited for food production, with rainfall insufficient to recharge the groundwater levels (Rathore, 2004)

Groundwater is fundamental to the livelihoods of many farmers across India. In rural India, over 60 percent of agriculture is dependent on groundwater irrigation (World Bank, 2010). It allows farmers to grow crops in the dry season, as well as manage deficiencies in monsoonal rainfall, contributing to improved livelihoods and poverty alleviation (Maheshwari et al, 2014).

In order to better manage groundwater usage, intervention is required; both technological and social. Infrastructure is required to better facilitate aquifer recharge, and social frameworks are required to better manage groundwater use and sharing.  The MARVI project, Managing Aquifer Recharge and Sustaining Groundwater Use through Village-level Intervention, aims to address this situation around groundwater management, by developing a participatory approach and methodology with tools to assist in groundwater management (Maheshwari et al, 2014).

The goal of the MARVI project is to give the ownership of groundwater situation to the villagers, and assist them in developing their own solutions. We foster this process through engagement with the community; helping them to understand and own the groundwater issues, and technology, namely in the collection and dissemination of information, allowing for a greater understanding and ownership of groundwater management.

In order to develop frameworks for improving the groundwater situation, accurate well data and sociological data are required. While the Central Groundwater Board __make note that this is in India__ (CGWB) data are useful for groundwater monitoring on a national level, they are limited when applied to groundwater management at a village level. MARVI aims to collect more granular data, to better understand and apply to the issues directly to villages. Along with data collection, MARVI also conducted studies on the socio-economic aspects of groundwater management. Understanding the attitudes towards groundwater management for each village allows for MARVI to better apply solutions.

MARVI engages the community through water table monitoring, crop demonstrations, workshops, education in schools (Maheshwari, 2014). The goal of this is to foster community awareness around groundwater usage and depletion, and to create a platform for further discussion on improving groundwater management.  Community engagement is also achieved through the Bhujal Jankaar program. Within each village, a volunteer known as a Bhujal Jankaar (BJ) - a hindi word for groundwater informed volunteer- has been trained to monitor wells, and act as a connection between MARVI and each village. They are able to disseminate information on rainfall and groundwater conditions, based on their water table monitoring work. They also play an important part in gathering together village communities for meetings, workshops and demonstrations.

India has experienced exponential growth of mobile phones and almost every household has at least one mobile handset for communication (__TODO: REF__). With the availability of mobile phones brings their application to help village community to monitor the local resource such as groundwater and develop longer term strategies for village level water security.

---- 
## Citizen Science in Action

Crowdsourcing is the approach of collecting data from a large number of distributed people. The growth of information technology has simplified crowdsourcing, and allowed for more novel applications, such as in citizen science. Citizen science is when amateurs are actively involved in science; through their contributions, a certain field of science can progress. Crowdsourcing for citizen science is being used to go beyond the boundaries of traditional scientific study, such as budget or time constraints, and is opening up new ways for everyday citizens to be involved.

While citizen science has been around for many years, technology is allowing for new applications and approaches. One of the oldest and longest running examples of citizen science is the Audobon Society’s Christmas Bird Count, started in 1900 (Audobon, 2015). The United States Geological Survey (USGS) has used citizen science for geological surveys for over 100 years (Quinn, press).

An example of using mobile applications for crowdsourcing citizen science is IBM’s Creekwatch. Creekwatch is a crowdsourcing tool which collects qualitative data; text and images about waterways across 25 countries (IBM Research, 2012).

Social.Water was a project for collecting stream data from 9 different locations in New York (Lowry and Fienen, 2013). Over a 10-month period, the system used text messages and emails to receive and process 150 measurements from citizen scientists in New York. The creators of this project write how the readings can be used to supplement readings where “telemetry or continuous recording are infeasible” (Fienen and Lowry, 2013). They also note that a secondary purpose to their project is community engagement.

Crowdsourcing citizen science is also being used to solve problems in low-income countries. Agro-Met is a tool for providing farmers in rural Maharashtra localized weather predictions over SMS, helping them become more resilient in the face of climate change (Singh, press). This project uses 75 weather stations, and also involves a training component. It overcomes a number of challenges unique to crowdsourcing approaches in low income countries, such as a lack of 3G/4G mobile infrastructure, language barriers, and community training. Another example is from the National Environmental Engineering Research Institute (NEERI) in India, which uses crowdsourcing to monitor water quality. Volunteers are given kits to test a number of water quality measures, and then use text messages to submit these readings. These messages are processed, aggregated and analysed, to calculate the water quality for individual villages (Toon, 2016).

----
## The citizen science and groundwater management

Decisions regarding the sustainable management of groundwater should be based on objective science. By connecting farmers and local community members with hands-on monitoring opportunities, we can begin  village level movements for groundwater security by producing and empowering local groundwater champions. Crowdsourcing is suitable for groundwater monitoring since data are to be collected frequently (weekly or fortnightly) from wells, checkdams and rainfall stations spread across the country. Further, the data collection process is simple; anyone can learn how to monitor a well, checkdam or rainfall station.

Since 2012, the MARVI team has worked in Rajasthan and Gujarat with farmers, schools and others in the village community to develop village level groundwater monitoring approach.  The idea of Bhujal Jankaar was developed to assist in monitoring of groundwater levels around villages, collecting local data and developing scientific understanding of groundwater dynamics. The data collected by BJs can inform sound decision making about the sustainable management of groundwater. MARVI helped to empower BJs, schoolchildren and ordinary citizens to collect valid and valuable scientific data related to their local groundwater situation, while providing those individuals with unique experiences, insights and access to leading groundwater researchers.

Our aim is to demystify groundwater science at the village level, making it accessible to villagers, government agencies and NGOs, while ensuring that it is cost-effective, evidence based and helps to groundwater situation at village level and beyond. The MARVI approach provides villagers the opportunity to work alongside researchers and government agencies.

The data collected by BJs are critical to build an understanding of how the groundwater levels fluctuate during the monsoon and other times of the year when pumping is in full swing. Also, local data collected this way can help us understand how we are impacting the groundwater situation at the village and inform sound decision-making about the management of groundwater.

Involving villagers for groundwater monitoring enables them to make a direct contribution to scientific research in their village, gain new insights based on sound data, and learn new ways to cope with groundwater scarcity. Also, involving villagers in groundwater monitoring provide immersive experiences that can help challenge current groundwater management practices. 

----
## Study Area

MyWell has been piloted in two watersheds, the Dharta watershed in Rajasthan and the Meghraj watershed in Gujarat (Figure 2). In both watersheds, groundwater is the main source of irrigation water supply and plays an important role in agriculture and the livelihood of people. Both districts are in hard rock aquifer areas and groundwater levels have dropped significantly due to excessive pumping. MyWell is designed to be used in any part of India or in other parts of the world with minor modifications.

### Rajasthan

The study area of this project, the Dharta watershed, in Rajasthan is located in the Udaipur district, one of the 33 districts of the state. This district has about 2500 villages with population of 3 million and some parts of the district are predominantly tribal. The district is drained by the Sabarmati River in the west, the Banas River in the north and east and the Mahi River in the south and central parts. Agriculture plays a major role in the livelihoods of villagers but farmers often face Kharif __define__ crop failure due to the lack of rain at a critical stage of the crop growth.

The soil type in the district is sandy loam to clay loam and the topography is often undulating. The average rainfall of the district is 650 mm, and about 128,000 ha of land is under irrigation with 89,000 ha mainly dependent on groundwater. The Dharta watershed is about 55 km east of Udaipur city. The main Kharif crops in the Dharta Watershed are maize, pulses, sorghum, guar, soybeans and the Rabi crops are wheat, barley, chick pea and mustard. For irrigation they mainly depend on open wells or tubewells but a large proportion of open wells have dried up or they are not reliable as source of water supply. Many farmers have dug tubewells to a depth of up to 150 metres, but they can also dry up during summer months or drought years.

Irrigation is widely performed using the surface method, however some farmers are rolling out sprinkler and drip systems as there is a government subsidy on the installation cost of these systems. Drinking water in these villages is soley from groundwater and is accessed through hand pumps, open wells or tubewells. Hinta village has piped water supply to most homes from a village overhead water tank constructed by the Government. Recently, a village overhead tank was constructed in Dharta village but most homes do not have piped water supply yet. Families in Sunderpura rely on hand pumps for their domestic water supply.

### Gujarat

The study area in Gujarat is located in the Aravali district, the 29th district created in 2013 and lies north of Ahmedabad. It has about 650 villages with a total population over 1 million. The district is drained by the Sabarmati River in the west, the Banas river in the north and east and the Mahi River in the south and central parts. The Aravalli district has a large tribal population with approximately 30% of the population coming from socially and economically disadvantaged groups.

The soil in the district is loamy type with an undulating topography. This distruct does not have many industries or urban centres, and unlike other districts in the state, about 80% of rural livelihoods are dependent mainly on agriculture and dairying. The average rainfall of the district is 750 mm, and there are 444,000 ha under irrigation with 170,000 ha dependent on groundwater through dug and tube wells.

The Meghraj watershed is located about 25 km west of Modasa town and 100 km from the state capital Gandhinagar. In this watershed also, agriculture is quite important in the livelihoods of villagers and the threat of Kharif crop failure is always there if there is insufficient rainfall at some stage during the monsoon season. The main crops grown in the district are maize, cotton, wheat, pigeon pea and castor. The soil type in the district is sandy loam to clay loam and the topography is often undulating. The average rainfall of the district is 750 mm, and about 444,000 ha of land is under irrigation with 170,000 ha mainly dependent on groundwater.


----
## MyWell

MyWell is a smartphone and SMS application for crowdsourcing groundwater, rainfall, water quality and checkdam water levels in prject MARVI. BJs armed with a smartphone or feature phone can participate in a network of connected farmers who collect information, and glean insights into the groundwater situation.

In the MyWell system, any groundwater ____?___ is known as a "Resource", which can be a Well, Check dam or Rainfall Station. Every resource, village and collection of villages in the MyWell system is uniquely identifyable, using a combination of pincode, village ids and resource ids.

_Figure 2_

### Features

MyWell is available as an app on Android and iOS smartphones (MyWell Mobile), and also on any web browser as a web app (MyWelll web). For users with feature phones, MyWell's basic tools and analysis are also available over SMS (MyWell SMS). When a BJ takes a well, they can record it directly with MyWell - submitting the date, Well Id, and the depth to water level of the well.

With MARVI's network of BJs collecting data, MyWell is able to provide valuable insights to villagers. MyWell displays simple graphs; snapshots of the readings from a Well, Raingauge or Checkdam over the last 3 years.  MyWell also calculates village level statistics. These tools allow villagers to easily compare and benchmark their wells against each other, and previous years.

_Figure 4.?_


#### MyWell SMS

Users interact with MyWell by sending and recieving SMS messages, a part of the application known as MyWell SMS. MyWell users submit resource readings, as well as query MyWell for some basic groundwater statistics. 

Data submission is performed over a single SMS message to MyWell's phone number. The most common case is submitting a well reading. The message takes the format: "`MYWL S PINCODE/RESOURCE_ID/READING`", where reading is the depth to water level in centimetres.

Users can also query MyWell over SMS, for some basic basic groundwater statistics. To query the groundwater level of a well, most recent rainfall amount in a rainfall station, or water column height in a checkdam, users send a text message of the format "`MYWL Q PINCODE/RESOURCE_ID`". This query will return the current value, the value from last month, and the value one year ago.

To get the average for a village, a user can send a query with the format "`MYWL Q PINCODE/VILLAGE_ID`". This query will return the current average depth to water level and the average rainfall amount for this village __TODO: what does this do again?__

Users can also request for groundwater statistics for all resources within a pincode, which will aggregate the data from resources across multiple villages. This is done using a query with format "`MYWEL Q PINCODE`".


#### MyWell Mobile

The process for submitting readings on MyWell mobile is simpler than over SMS, but requires the user to have an Android or iOS smartphone and access to the internet, either over mobile data or Wifi.

To submit a reading, the user must first login using a one time code sent to either an email address or mobile number. The user then fills out a form, specifying the type of resource - well, rainfall station or checkdam-, pincode, resource id, date of the reading (used for backdating readings) and the value of the reading - either depth to water level, rainfall amount or water column height for a well, rainfall station and checkdam accordingly.

The user then presses the "submit" button, and MyWell mobile performs some validation and submits the reading. If the user doesn't have access to the internet, they can choose to save the reading locally onto the device, and submit the reading later.

Groundwater statistics are also available for users of MyWell mobile. The map screen displays a map containing all the resources registed in MyWell, along with village names.
** fig. n [MyWell mobile map screen, with wells, rainfall stations, checkdams and village names]**

When the user clicks a resource, users get a popup with the Village name of the well, the resource id, and the last recorded reading of the resource. Clicking the "more" button takes the user to a page that shows more information about that resource, including a graph that displays data for the last 3 years.

_fig. n [MyWell popup screen]_
_fig. n [MyWell resource detail screen]_

MyWell also has a host of tools for BJs to manage the MyWell system. BJs can register a new Well, Rainfall Station or Checkdam - using their device's inbuilt GPS to pinpoint the location. Each well also has a unique Banner Image - usually of the well and well's owner -  allowing for greater personalisation and buy-in at the village level.

Finally, MyWell allows MARVI project administrators and groundwater researchers to upload a large number of readings at a time. This allows an import of large amounts of historical data; increasing the immediate value of MyWell to the farmers.

### MyWell Architecture

- talk about all the components, how they work together. Don't go into too much detail

MyWell can be seen as a collection of a number of smaller services. Figure _n_ shows an overview of each service, and how they work together.

The core of the MyWell System is a service called MyWell Server. MyWell server is a web service written in Javascript, running on node js. All users, whether it be those using MyWell Web, Android or SMS ultimately end up interacting with MyWell Server.

MyWell's database is a MariaDB database running in RDS, Amazon's managed database service. RDS is responsible for securing and backing up data of the MyWell system. MyWell Server interacts with the database in order to save and retrieve data.

The SMS gateway provider is responsible for recieving and sending SMS messages for MyWell. It converts SMS messages into http calls that call MyWell Server. It also converts http calls from MyWell Server into SMS messages that get delivered to MyWell's users.

The MyWell Mobile application is available on iOS and Android devices. It interacts directly with MyWell server, and also has some offline functionality to save readings and reduce the data usage for end users.

Finally, MyWell Web is MyWell's website, which can be found at https://mywell.vessels.tech this site is hosted on Amazon's Cloudfront, a content delivery network (CDN) that allows for fast loading of MyWell in users's browsers.


### Implementation Journey

MyWell has been under development since 2015. It originally started as a university project, run by students of Carnegie Mellon University. Since the developers have graduated, the continued development of MyWell has been taken over by australian social enterprise Vessels Tech.

MyWell has gone through four major iterations, starting as as a small web server receiving SMS messages from an SMS gateway provider, through to it's current architecture, running as a collection of services hosted on AWS.

#### Version 1:

The first version of MyWell was a prototype that supported SMS only. This prototype was developed by Romin Parek, Constantin Baumgartner and James Laney at Carnegie Mellon University. They wrote a web server that recieved SMS messages containing well readings, and displayed them using a heatmap on a website.


#### Version 2:

After this initial prototype, Lewis Daly came on board to start building MyWell mobile, the mobile app component of MyWell. MyWell was also migrated from running on spare university infrastructure to a managed hosting service, using Azure Mobile backend as a service.

After this prototype was released, we conducted field trials, learning of the benefits and limitations of the current approach, which was incorporated into the next stages.


#### Version 3:

The third iteration of MyWell added new features, allowing the application to handle new resource types - Checkdams and Rainfall Stations. We also added more features to help manage the MyWell system, allowing users to upload large amounts of past readings at once, and allowing for new wells to be registered at a time. We also migrated the web components of MyWell to a self-managed environment, in order to reduce costs and prevent vendor lock-in.


#### Version 4:

In the fourth - and latest - version of MyWell, we moved the hosting to Amazon Web Services, to allow for a greater level of security and maintainability. We also redesigned the SMS queries to make MyWell SMS easier to use.


----
## Testing & Evaluation
**We will include feedback from the recent Workshop and evaluation of MyWell.**

While there have been some limited field tests, MyWell is yet to receive full scale testing. The first tests revealed the querying system to be effective, but some issues were uncovered with MyWell Mobile in areas of low mobile data coverage. The initial results looked promising, with MyWell SMS and Mobile fully operational. A full scale test is planned in the next few months, and will involve three components, training, testing on a small subset of wells, and scaling up to more wells.

### What’s Happened
Limited field tests on both MyWell SMS and Mobile were conducted. These tests involved travelling to two different wells, and attempting to query the history of each well, and submit the current level of each well over SMS and mobile. An example case of submitting a well level over SMS is demonstrated below.
_TODO: include from blog post!_

After well data were successfully submitted over MyWell, MyWell mobile was also tested to ensure that the visualisations were also updated, and correct.

_Figure 6._

### Initial Results
These limited field tests revealed that MyWell worked successfully, with a few areas for improvement. While MyWell SMS functioned as expected, MyWell Mobile encountered issues when mobile data coverage was limited. Google Maps, the mapping platform used for the visualisations in MyWell Mobile, doesn’t allow for offline access to maps. This meant that when there was no or unreliable data coverage, Google Maps failed to load, and stopped the entire application from working. Related to this is the issue of data usage. Google Maps downloads maps for the current area every time MyWell opens. This wastes valuable data, and is something that will need to be addressed in future versions of MyWell.
Potential issues were also encountered over the translation of MyWell. Currently, MyWell exists in English, which will decrease the utility of the app, as most BJ’s and the MARVI farmers speak mainly Hindi or Gujarati. This is also something that will need to be addressed in the future.
MyWell SMS started with a small set of text-based queries. As features have been added to MyWell, the complexity of the queries has also grown. Testing revealed that erroneous SMS messages resulted in no response to the user. MyWell SMS will need a more robust system for handling errors. This system could reply to a user if their query doesn’t make sense, or even attempt to auto-correct the query before processing.
Despite some minor issues, the initial results show MyWell to be fully functional; users can update wells over SMS and MyWell mobile. These changes are reflected almost instantly in the mobile heat map, which can be found at watervisualizationmobile.azurewebsites.net, or on MyWell mobile. The system for querying data was also tested for both the SMS and mobile application, and found to be working, as shown below

_Figure 7._

_Figure 8_

### Full Scale Testing
Larger scale tests for MyWell are planned over the next three months. These tests will involve BJ’s from a number of villages. Before conducting these tests, the BJ’s must first be trained in using MyWell SMS. To aid this training, an SMS Query guide is currently being written to explain the functions and query formats of MyWell SMS. Once the BJ’s use MyWell for a number of weeks, the data collected will be analysed for accuracy, and the BJ’s will be interviewed to find any difficulties they encountered, and receive general feedback. After this stage, should there be no major flaws found, MyWell will be scaled up to the entire MARVI study areas in Gujarat and Rajasthan.


---- 
## MyWell Benefits

MyWell is an example of crowdsourcing citizen science, made to address the needs of farmers in rural India and project MARVI. It builds on previous applications of crowdsourcing citizen science, to fit the requirements of MARVI. It also has potential as a data collection and processing platform, with a focus on data collection in low income countries.

Similar to IBM's Creekwatch, MyWell uses a mobile app for data collection, with a map-based visualisation on the web. However, Creekwatch collects qualitative data such as images and text, while MyWell focuses on quantitative data.

The SMS based aspect to MyWell is also similar to Social.Water. Fienen notes that in the US, using SMS lowers the barriers to entry for the platform (Lowry and Fienen, 2012). In India, where data coverage is low, and smartphones are not as popular (GSMA, 2016) Statista, 2016) this is even more the case. Using both SMS and mobile app, MyWell can have the advantage of providing advanced features to those users with smartphones, while keeping the platform accessible for all. MyWell SMS also focuses information dissemination, while Social.Water is purely a means for data collection.

MyWell is unique from the above examples, as it was built with an application for data collection in a low income country. Like Agro-Met and NEERI’s water monitoring project, MyWell must work within the technology constraints, such as limited access to mobile data and language constraints (an area of improvement for MyWell. For this reason, MyWell was built with a focus on both SMS data collection, and data collection from a smartphone app.

One of the key values of MyWell is its ability to remove the need for paper-based data collection and allow a distributed, self-organised network of data collection; lowering the barriers of entry into citizen science. MyWell can minimise the manual data entry requirements of MARVI, and reduce the time demand, and errors associated with manual data entry.  Additionally, MyWell is much more ready to scale than paper-based data collection; MyWell server is configured to increase the supply of computing resources as the demand increases, something that cannot happen with manual entry.

MyWell is currently being used for groundwater data collection and information dissemination, but also has potential for other applications, especially in low income countries. The three main components; (1) data collection and processing, (2) basic analytics and (3), user verification are common to many different data collection applications, and could easily be adapted and extended for other purposes. The combination of SMS and mobile app allow it to reach a wide audience, especially in countries or situations where mobile data is limited. MyWell also has robust authentication and administration tools to protect the integrity of the data being collected, while allowing public access to the information collected.

MyWell also deals with a number of constraints that are unique to the areas of low income countries, such as technology. Mobile coverage, especially mobile data coverage is still limited in many parts of rural India, with 3G coverage reaching 75% of the population (GMSA, 2015). Also, smartphone uptake in these communities is small. In 2015, only 29.8% of all Indian mobile phone users had a smartphone (Statista, 2016). In order for MyWell as a platform to have the reach required, it needs to exist as a smartphone application and SMS application.

----
## Conclusion

Groundwater scarcity is a serious issue faced by many communities in rural India, and around the world. In this paper we looked at project MARVI, and its approach to facilitating paticipatory approaches for groundwater management.

Project MARVI looks at the issues of groundwater management in rural India, and aims to give the ownership of groundwater monitoring to the villagers, and to assist them in developing their own solutions to the issues they face. MyWell, the technology component of MARVI, is a tool that aims to facilitate crowdsourced citizen science among the villagers.

In this paper, we looked at how MyWell has the potential to impact the lives of farmers by (1) empowering them to participate in science, and finding solutions to groundwater scarcity, and (2) assist them in building communities which work together to conserve groundwater. We also outlined the design, architecture and development process of MyWell, and compared it to other approaches in crowdsourcing citizen science.


Our findings in the field... show... We show how farmers are using MyWell to gain visibility into the groundwater situation, and examine the limitations of MyWell's approach.



Within the scope of project MARVI, a desirable future of MyWell is to increase the usage and utility of the application. We are actively working on features to make MyWell easier to use for both researchers and BJs, as well as looking for partnerships with ther NGOs and governments to share water data together, this will foster new opportunities in groundwater management and...

We are also rolling MyWell out into other communities, and learning much about how the MyWell approach can work, and can be adapted to work in other communities.




>Abstract. Don't forget
>In rural India, over 60% of agriculture relies on groundwater. Groundwater is often over-exploited, and groundwater depletion threatens many livelihoods. Existing interventions have been insufficient, and often fail to engage farmers at the lowest level. MyWell sets out to build a participatory, bottom-up approach to groundwater management. MyWell is an application for data-driven insights of groundwater at the village level. MyWell crowdsources groundwater indicators from a group of connected farmers using SMS or a smartphone application. In this paper, we show how MyWell has the potential to impact the lives of farmers by (1) empowering them to participate in science, and finding solutions to groundwater scarcity, and (2) assist them in building communities which work together to conserve groundwater. Then, we assess MyWell's application across two watersheds in rural India. We show how farmers are using MyWell to gain visibility into the groundwater situation, and examine the limitations of MyWell's approach.


>In this paper, we examined the challenges faced by communities in rural India facing groundwater scarcity. We introducted project MARVI





















----
## Definitions

- WaterShed: __TODO__
- Aquifer Recharge: Aquifer recharge is when surface water moves through the ground into an aquifer.
- Depth to Water Level: Depth to water level is a method for measuring well depths. Instead of measuring from the bottom of the well, the well is measured from the well opening. This gives an accurate way for well depths to be compared.
- Bhujal Jankaar: Bhujal Jankaar (BJ) is a Hindi word meaning “Groundwater informed”. Within MARVI, BJ’s are trained, and then train farmers and villagers in effective groundwater management practices.
- Autoscaling: In computing, autoscaling is when the supply of computing resources (e.g., Number of servers) is increased and decreased to match the demand placed on the resources.
- Continuous Integration: Continuous Integration is a development practice that allows code to be tested and deployed automatically whenever a change is made. Within the context of MyWell, whenever code changes are submitted, MyWell will update automatically to reflect these changes.
-

----
## References

Chinnasamy, Pennan, Basant Maheshwari, and Sanmugam Prathapar. "Understanding Groundwater Storage Changes and Recharge in Rajasthan, India Through Remote Sensing". Water 7.10 (2015): 5547-5565. Web.
Deep Wells and Prudence. Washington D.C.: World Bank, 2010. Print.
“Pew, 2014", “Emerging Nations Embrace Internet, Mobile Technology". Pew Research Center's Global Attitudes Project. N.p., 2014. Web. 9 Apr. 2016.
Fienen, Michael N., and Christopher S. Lowry. "Social.Water—A Crowdsourcing Tool for Environmental Data Acquisition". Computers & Geosciences 49 (2012): 164-169. Web.
“IBM    Research, 2012”, IBM    Research:    Creek    Watch    IPhone    App    Goes Social".
Ibmresearchnews.blogspot.com.au. N.p., 2012. Web. 9 Apr. 2016.
Lowry, Christopher S., and Michael N. Fienen. "Crowdhydrology: Crowdsourcing Hydrologic Data and Engaging Citizen Scientists". Ground Water 51.1 (2012): 151-156. Web.
Maheshwari, Basant et al. "The Role of Transdisciplinary Approach and Community Participation in Village Scale Groundwater Management: Insights from Gujarat and Rajasthan, India". Water 6.11 (2014): 3386-3408. Web.
Rathore, M. S. State Level Analysis of Drought Policies and Impacts in Rajasthan, India. Colombo, Sri Lanka: International Water Management Institute, 2004. Print.
Rural Coverage: Strategies for Sustainability. GSMA Intelligence, 2015. Web. 1 Apr. 2016. Country Case Studies.
"Service Level Agreements Summary Microsoft Azure". Azure.microsoft.com. N.p., 2016. Web. 9 Apr. 2016.
"Smartphone User Penetration in India 2014-2019". Statista. N.p., 2016. Web. 9 Apr. 2016.
"The Geological Society of London - Crowdsourcing Science". Geolsoc.org.uk. N.p., 2016. Web. 9 Apr. 2016.
"The History of Audubon". Audubon. N.p., 2015. Web. 9 Apr. 2016.
Toon, John. "Crowdsourcing Could Lead to Better Water in Rural India". News.gatech.edu. N.p., 2016. Web. 9 Apr. 2016.
Singh, Tanaya. "Farmers in Rural Maharashtra Are Fighting Climate Change. With Just a Mobile Phone.". The Better India. N.p., 2016. Web. 10 Apr. 2016.
