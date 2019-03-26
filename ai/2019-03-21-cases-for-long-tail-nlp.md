# The case for Long Tail NLP
## A dive into some current use cases for low resource NLP.

https://unsplash.com/photos/jhtPCeQ2mMU


In my [last post](https://medium.com/vessels/the-long-tail-of-nlp-9f4997149375), I talked about the gap between Natural Language Processing (NLP) tools for high vs low resource languages. I predict that as we see internet adoption continue to grow worldwide, the demand for NLP tools to support these low-resource languages, will grow as well. This represents an opportunity to build NLP tools to target so called "long tail languages", languages which are too small for big consumers to take notice at the moment, but in aggregate make up a large number of consumers.

Indeed, we are seeing some of this technology appearing right before our eyes. Google recently announced beta support for 7 new Indian languages [1] as well as support for Voice typing on KaiOS phones (KaiOS is a new type of smart feature phone in emerging markets).

So it's clear that Google has identified an opportunity to support low resource languages, but are there some other cases where we can already see NLP tools for such languages? In this post, I'm going to take a look at 3 use cases, where we are seeing NLP being applied to low-resource languages.


## 1. UMATI - Monitoring Hate Speech In Kenya

UMATI [2] is a platform which monitors hate speech in Kenya. Kenya has a violent past when it comes to hate speech inspired violence, dating back to 1992 [3].

UMATI started by collecting and categorizing forms of hate speech online across 7 different languages. The initial work, all performed manually, fed into some important insights into the different types of hate speech and its effect on violence in the most recent elections. 

For the second phase of UMATI, the team will train machine learning models to automatically detect and classify hate speech scraped from social media and other sites. While it's too early to see any results from this phase, it will be interesting to see how automated tools for such work can be used in Sub Saharan Africa, and what other opportunites this may open up.


## 2. Well Told Story - Monitoring and Evaluation

Using a variety of multimedia platforms, Well Told Story aims to engage youth in Kenya and Tanzania to think about modern day social and economic issues [4]. 

Their main outreach tool is though a playform called Shujaaz, which spans comic books, radio shows and social media campaigns. Their audience interacts with the platform through social media and SMS in Sheng; a English and Kiswahili slang language common among youth.

As engagements have grown, Well Told Story needed the ability to understand how users were engaging through their outreach to the tune of 100,000 messages a month. This led them to partner with Africa's Voices to build a NLP platform that analyses these messages in real time, specifically with two approaches: (1) Classifying messages by topic, and (2) Performing sentiment analysis to see how their engagements are received.

From a joint blog post with Africa's Voices [4]:

>"With these tools [Well Told Story] will be able to track SMS conversations in response to their media in near time and measure the sentiments in these conversations, allowing them to ascertain if increased engagement is leading to positive shifts in social norms."

Well Told Story also expanded on these tools with the help of BFA to help understand the Kenyan young entrepeneur culture [5], in order to tailor services and programmes to support them.

This included gathring data from their Facebook campaigns and communities, and running clustering algorithms, which grouped together user data based on the lanuage they used and their interests. Using this analysis, Well Told Story was better able to identify young entrepeneurs, and design programmes to help support them.
  

## 3. Bahasa.ai - NLP for Indonesia

Bahasa.ai [6] is an NLP-as-a-Service company that specializes in understanding Indonesian languages. As the fourth most populous country in the world, Indonesia represents a great opportunity for a future powered by AI and NLP tools, and it seems that Bahasa.ai can already see its potential. Their key approach at this point is to power native Indonesian chatbots, but they are by no means stopping at chatbots alone. 

They specialize in building their language models by crawling social media, in order to understand modern day Indonesian slang and messages that switch between Indonesian dialects.

While I haven't been able to find any concrete use cases of Bahasa.ai powering a chatbot in the wild, in an interview with Reuters, a CTO Fathur Rachman Widhiantoko said: "A client of ours, who is a local distribution company, has consistently generated additional revenue of 600 million to 900 million rupiah monthly after implementing our chatbot strategy." [z]

It's interesting to see such an approach here, and while it certainly makes sense for a country the size of Indonesia, it will be interesting to see if and how they might scale out this approach to other countries in South East Asia.



## In Summary

While these are just 3 examples of where NLP has been used in low-resource languages, I hope they demonstrate the potential for building such NLP tools for low-resource languages in emerging markets. 

Do you know of other use cases that might be interesting? Feel free to share in the comments below.

This post is part of my research on the potential for building natural langauge processing APIs in emerging markets. We at Vessels Tech are actively researching this topic and building out an initial prototype for NLP in low resource langauges. If you are interested in working together, feel free to get in touch at lewis [at] vesselstech [dot] com. Cheers!

>>If you enjoyed this post, or have any suggestions or questions, let me know in the comments. If you liked this post, give it a ❤️ or a 👏, or whatever you crazy cats are calling it nowadays.







[1] https://www.firstpost.com/tech/news-analysis/google-assistant-on-kaios-to-receive-support-for-seven-indian-languages-actions-6150501.html
[2] https://dangerousspeech.org/umati-monitoring-online-dangerous-speech/
[3] https://issafrica.org/iss-today/hate-speech-and-ethnic-tension-ahead-of-kenyas-2017-elections
[4] https://www.africasvoices.org/case-studies/well-told-story-nlp-of-conversations-in-swahili-slang-sheng/
[5] http://www.welltoldstory.com/chai-chapatis-and-the-propensity-for-success/
[6] https://www.reuters.com/brandfeatures/venture-capital/article?id=48355