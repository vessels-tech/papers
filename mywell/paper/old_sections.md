

# OLD:

## Abstract:

Citizen science is when everyday citizens are involved in scientific study. Citizen science allows professionals to harness a large of resources, and amateurs the opportunity to contribute to science. Crowdsourcing, or obtaining information from the general public can be a method of citizen science (Howe, 2006). The growth of mobile networks and the ubiquity of mobile phones in low income countries (Pew, 2014) has created an opportunity for innovation around crowdsourced citizen science to solve practical problems.

MyWell is a smartphone and SMS application for crowdsourcing groundwater, rainfall, water quality and checkdam water levels in rural India. Groundwater depletion is a serious issue for farmers and villagers who rely on groundwater for their livelihoods. MyWell crowdsources well information from villagers, and aims to improve the situation, both through information collection, and building community involvement and citizen ‘buy-in’.


## role of citizen science in pgwm:
_last bit_
Ultimately, citizen science allows for more research to be accomplished globally and connects people in a worldwide environmental movement.

## other bit?

MyWell has two clients, MyWell SMS and MyWell Mobile. Both clients share the same server and database. The server is a Node.js server, written in JavaScript, running on Microsoft Azure Mobile Backend as a Service (MBaaS). MBaaS abstracts away many aspects of traditional web servers, streamlining the maintenance and upkeep of MyWell. MBaaS provides important features, such as autoscaling, user authentication and database management. In addition, Microsoft Azure MSSQL Database is used for storing all of the MyWell relational data. MyWell also benefits from Azure’s 95.95% uptime guarantee, making the system reliable.



The MyWell Database is a MSSQL database, hosted on Microsoft’s Azure cloud. It is a relational database, containing 5 tables for storing all of the MyWell data, including well levels, user information, and historical data. As it is hosted on Azure, it is highly scalable, and is capable of handling thousands of well entries.


### Azure MBaaS
Both the MyWell Database and MyWell Server are managed through Microsoft Azure Mobile Backend as a Service (MBaaS). MBaaS adds another layer of abstraction to hosting and managing the server and database, simplifying the overall development and hosting process. MBaaS has a number of API’s, simplifying integration between MyWell Mobile and MyWell Server. Since it is hosted on Azure, it also has a 99.95% availability guarantee, and benefits from autoscaling and continuous integration (Microsoft Azure, 2015).
MyWell server and database also benefit from the autoscaling features of Azure. Autoscaling is when the supply of computing resources is configured to automatically change to match the demand on the system. As MyWell scales, and the MyWell network grows, more farmers are using MyWell to track their wells, and more BJ’s are submitting well levels on a regular basis. This puts more demand on MyWell server resources. Azure MBaaS will automatically scale the number of servers to match the needs of the system, allowing MyWell to grow without constant monitoring and manual adjustment of computing resources.


## Old architecture section:


## MyWell Architecture

__TODO: this section sucks, and is out of date. Maybe rewrite?__

**Figure 3.**

MyWell's architecture can be divided into a backend/client model. The client is the application running on the users device - be that the Android, Web browser or SMS chat interface - and the backend is the collection of services that handle the data processing, storage and delivery. These services are the MyWell Database, SMS Gateway, MyWell UI and MyWell server (confusingly).

### Client

#### MyWell Mobile & Web Applications
MyWell Mobile is a cross platform HTML5-based mobile app. It was built using Ionic, a framework for building mobile applications for iOS and Android from web apps. This enabled development of both iOS and Android simultaneously, simplifying the development and testing process. Ionic combines the AngularJS web framework with Apache Cordova, an open source tool for integrating web apps with mobile devices. MyWell also uses Google Maps for visualizing wells on a heatmap. It integrates with MyWell server using the Azure MBaaS API to process well updates, as well as user registration and verification.

#### MyWell SMS
First, a BJ or farmer takes a reading from a well in the MyWell system. They then send a text message in the format: "SMA 000 WellID DATE WT_DEPTH" to the virtual mobile number. The virtual number provider (Way2Mint) then forwards this message onto MyWell server in the cloud for processing. The message is then processed, and provided it passes a validation check, will be used to update the MyWell database. A reply is sent to the virtual number provider using a HTTP request. The virtual number provider then sends this message onto the user, letting them know that their submission was successful. Should there be an error in the message, the user is informed that they need to fix the error in the message and try again.


## Backend
MyWell's backend is built using a Microservices approach. This means dividing the individual components into smaller services which perform 1 job each. The goal of a microservices approach is to ensure reliable, scalabe and overall maintainable system. We used Docker, a containerization platform in order to manage each service in the backend.

### SMS Gateway
The SMS gateway acts as the middle-layer between the BJ submitting the query over SMS and MyWell Server. It is a critical part of MyWell, as allows for MyWell to receive SMS messages. It receives text messages from farmers and BJ’s, and converts them to HTTP requests. These requests have number and message parameters, allowing MyWell server to parse the message from the BJ, and reply to the mobile number that sent the message. The SMS gateway also receives replies from MyWell as HTTP requests, and converts them back to SMS messages, enabling MyWell to reply to a message.

### MyWell Server
- Built using Node.js
Its primary function is to receive and process HTTP requests from both the SMS gateway, and MyWell mobile app. Upon receiving these requests, it processes them, and connects to the database, allowing users to query and update the well levels.
- handles login and user authentication

### MyWell UI
- Also node.js

### MyWell Database
- MariaDB database
- relational database, stores well data across x tables
- able to scale and stuff

### Hosting
- Backend is hosted in DigitalOcean droplet
- managed using docker compose
- Uses continuous integration with CircleCI





## basant mail:

Dear Lewis,

I have added text at several places and provided comments for the revision in the document. For it to get published in an international peer reviewed journal, we need to keep the following points in mind:

1.       Citizen science and crowdsourcing is the way to go for groundwater management in developing countries;
2.       Review of similar apps and lessons from them;
3.       SMS capability is also included to allow villagers to use the app if they don’t have internet.
4.       Visualisation of the data collected by BJ and their role in decision making by farmers and village councils
5.       A good description of app development in the paper, what were the key challenges, what is so special in MyWell app etc.
6.       The idea is that this is a good example we want to share with wider public and how anyone can use mobile phone technology to manage natural resources in a developing country situation.

The above are some pointers for you to consider in revising/developing this paper.  Please use your imagination and thought process to develop this document into something you will be proud of to share with others and will demonstrate your scholarship in the future.

Best wishes,

Basant


#OLD:

MyWell has two clients, MyWell SMS and MyWell Mobile. Both clients share the same server and database. The server is a Node.js server, written in JavaScript, running on Microsoft Azure Mobile Backend as a Service (MBaaS). MBaaS abstracts away many aspects of traditional web servers, streamlining the maintenance and upkeep of MyWell. MBaaS provides important features, such as autoscaling, user authentication and database management. In addition, Microsoft Azure MSSQL Database is used for storing all of the MyWell relational data. MyWell also benefits from Azure’s 95.95% uptime guarantee, making the system reliable.



The MyWell Database is a MSSQL database, hosted on Microsoft’s Azure cloud. It is a relational database, containing 5 tables for storing all of the MyWell data, including well levels, user information, and historical data. As it is hosted on Azure, it is highly scalable, and is capable of handling thousands of well entries.


### Azure MBaaS
Both the MyWell Database and MyWell Server are managed through Microsoft Azure Mobile Backend as a Service (MBaaS). MBaaS adds another layer of abstraction to hosting and managing the server and database, simplifying the overall development and hosting process. MBaaS has a number of API’s, simplifying integration between MyWell Mobile and MyWell Server. Since it is hosted on Azure, it also has a 99.95% availability guarantee, and benefits from autoscaling and continuous integration (Microsoft Azure, 2015).
MyWell server and database also benefit from the autoscaling features of Azure. Autoscaling is when the supply of computing resources is configured to automatically change to match the demand on the system. As MyWell scales, and the MyWell network grows, more farmers are using MyWell to track their wells, and more BJ’s are submitting well levels on a regular basis. This puts more demand on MyWell server resources. Azure MBaaS will automatically scale the number of servers to match the needs of the system, allowing MyWell to grow without constant monitoring and manual adjustment of computing resources.


### SMS Gateway

The SMS gateway acts as the middle-layer between the BJ submitting the query over SMS and MyWell Server. It is a critical part of MyWell, as allows for MyWell to receive SMS messages. It receives text messages from farmers and BJ’s, and converts them to HTTP requests. These requests have number and message parameters, allowing MyWell server to parse the message from the BJ, and reply to the mobile number that sent the message. The SMS gateway also receives replies from MyWell as HTTP requests, and converts them back to SMS messages, enabling MyWell to reply to a message.





Deep Wells and Prudence. Washington D.C.: World Bank, 2010. Print.

“Pew, 2014", “Emerging Nations Embrace Internet, Mobile Technology". Pew Research Center's Global Attitudes Project. N.p., 2014. Web. 9 Apr. 2016.

Fienen, Michael N., and Christopher S. Lowry. "Social.Water—A Crowdsourcing Tool for Environmental Data Acquisition". Computers & Geosciences 49 (2012): 164-169. Web.

“IBM    Research, 2012”, IBM    Research:    Creek    Watch    IPhone    App    Goes Social". Ibmresearchnews.blogspot.com.au. N.p., 2012. Web. 9 Apr. 2016.

Lowry, Christopher S., and Michael N. Fienen. "Crowdhydrology: Crowdsourcing Hydrologic Data and Engaging Citizen Scientists". Ground Water 51.1 (2012): 151-156. Web.

Rathore, M. S. State Level Analysis of Drought Policies and Impacts in Rajasthan, India. Colombo, Sri Lanka: International Water Management Institute, 2004. Print.

Rural Coverage: Strategies for Sustainability. GSMA Intelligence, 2015. Web. 1 Apr. 2016. Country Case Studies.

"Service Level Agreements Summary Microsoft Azure". Azure.microsoft.com. N.p., 2016. Web. 9 Apr. 2016.

"Smartphone User Penetration in India 2014-2019". Statista. N.p., 2016. Web. 9 Apr. 2016.

"The Geological Society of London - Crowdsourcing Science". Geolsoc.org.uk. N.p., 2016. Web. 9 Apr. 2016.

"The History of Audubon". Audubon. N.p., 2015. Web. 9 Apr. 2016.

Toon, John. "Crowdsourcing Could Lead to Better Water in Rural India". News.gatech.edu. N.p., 2016. Web. 9 Apr. 2016.

Singh, Tanaya. "Farmers in Rural Maharashtra Are Fighting Climate Change. With Just a Mobile Phone.". The Better India. N.p., 2016. Web. 10 Apr. 2016.
