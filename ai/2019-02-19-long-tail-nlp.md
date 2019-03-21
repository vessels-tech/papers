# The long Tail of NLP
## In order to make technology inclusive to the next billion, we need tools [finish]

As more of the world comes online, there is a growing divide between languages that are commonly available and those that are not. This is evident in natural languages processing (NLP) technologies, which are enablers for new businesses and technologies, but only support a small amount of languages.

In this post, we will look at Natural Language Processing technologies and the long tail of language support for low-income countries. We will look at the potential for using these technologies in low-income countries, and the challenges and possible solutions to building such NLP models.


## The NLP Long Tail

Farm.ink, along with DFS Lab recently published a survey of this field, where they outlined the challenges and opportunities in developing NLP technology for low-income countries. [1]

One stark observation was their observation of the major bot/NLP platforms' support for languages spoken by low-income people.

[insert infographic from DFS Lab]

As more of these populations come online, the need to serve them grows, and the need for such NLP tools will grow accordingly. Currently, the lack of support for these long tail languages stifles growth and innovation to these populations.

From our own experience building chatbots in the Philippines, Tanzania and Senegal, tools that are readily available in English are simply non-existent in Tagalog, Bisaya, Swahili and Wolof. This led to technology descions that made for bots with little-to-no NLP enabled, and much less promising user experiences for our users.

## NLP Research for the long tail

From a research perspective, long-tail languages are most often also low-resource languages. As Yulia Tsvetkov from the Language Technologies Institute at CMU puts it:
>Low-resource languages [are] languages lacking large monolingual or parallel corpora and/or ... linguistic resources sufficient for building statistical NLP applications[2]

Of the estimated 7,000 langauges in the world, only about 20 languages are considered high-resource languages [3].

## The Opportunity

We see a growing opportunity to offer NLP tools in low-income markets, especially in markets where access to the internet is growing. Not only is there a potential business opportunity, but we believe there is a social need for such tools in helping bridge the digital divide and offer services.

Think of a banking chatbot in Madagascar, that you can comfortably message in Malagasy instead of French. Or maybe an emergency response system in the Philippines that can understand tweets for medical assistance not only in English and Tagalog, but also Bisaya.

In a presentation on the Opportunities and Challenges in Working with Low-Resource Languages, Tsvetkov highlights one such example:

[add example of twitter sentiment analysis ]


## The Challenge:

Now if it were easy to build NLP engines for these long-tail languages, then it surely would have been done already. To build a model for a single language requires a large upfront investment, which is hard to justify in smaller markets. In addition, as [1] puts it: 
>Currently there appears to be a greater incentive for academics to improve the NLP technology that exists for English than there is to improve the resources available for lower-resource languages.

Modern NLP techniques rely on Machine Learning, which depend on a large amount of manually labelled training data. Older NLP older approaches, which can still be viable, rely on a heavy amount of linguistic expertise, and doesn't scale well.

In addition, langauges with non-standard spelling or in the extreme case, non-written languages (which is about 50% of the world's languages by the way [3]) present a considerable challenge to NLP research, one that has little short term commercial value.


## Potential Solutions:

While the challenges to building NLP tools for these long-tail languages make the situation sound bleak, there are some important developments that may just make it possible.

State of the art research described in [2] and [3] show methods for building models in a semi-supervised and unsupervised approach. Such methods include:
- Transfer Learning: Training a model using a high-resource language and apply it in a low-resource language
- Polyglot Learning: combining datasets from multiple languages together, and apply the same NLP techniques
- Using bilingual dictionaries to bootstrap NLP models

In addition to the above techniques, we will still need to obtain a large amount text in these langauges. Here's two of my ideas for how that might happen:

1. Build a human-in-the-loop chatbot, that relies on a human to manually parse and classify text. This approach would allow us to deploy a service, collect training data from actual humans speaking the language, and build up a training set gradually. This seems right in line with what [Figure Eight](https://www.figure-eight.com/) is doing.

2. Encourage partnerships between research insitiutions and social platforms. Already mentioned in [1], this approach could see data sharing take place between social media platforms, which have a large amount of data in many different languages, which could be used to power development of NLP models in low-resource-languages. 

In fact, Facebook recently released the [XLNI dataset](https://research.fb.com/publications/xnli-evaluating-cross-lingual-sentence-representations/), which contains a corpus for 15 languages, including Urdu and Swahili.


## The way forward

I'm really interested in how we can better build technology to serve low-income people, and the challenge of NLP for the long tail has rather captured me. I'm going to spend some more time researching this problem, and exploring the business opportnities. Afterwards, I'll start working on building a framework for training, benchmarking, and using NLP for the long tail.

One day, I hope this could turn into an API or service that offers NLP tools for long-tail languages. If you're building something that you think could make use of such a service, please get in touch at lewis __at__ vesselstech __dot__ com.




[1] Conversational interfaces and the long tail of languages in developing countries, Adam Wills, Georgia Barrie and Jake Kendall, https://dfslab.net/wp-content/uploads/2019/01/NLP-Language-Divide-Report-.pdf
[2] Opportunities and Challenges in Working with Low-Resource Languages - Yulia Tsvetkov, http://www.cs.cmu.edu/~ytsvetko/thesis/thesis.pdf
[3] Natural Language Processing for Resource-Poor Languages, A thesis presented by, Long Thanh Duong, https://minerva-access.unimelb.edu.au/handle/11343/192938



>>If you enjoyed this post, or have any suggestions or questions, let me know in the comments. If you liked this post, give it a ❤️ or a 👏, or whatever you crazy cats are calling it nowadays.




extra:

Additionally, there is a gap between NLP used in research and that which is commercially available. As David Bamman at UC Berklee Writes, 
>There is a substantial gap, however, between the quality of the NLP used by researchers in the humanities and the state of the art. [1]



The social benefits of expanding support for long-tail languages in NLP are clear, but the main unanswered question I have is: Can we profitably build NLP models for these langauges? I don't have answers to this question, but I think it's well worth a try.

I'm going to go away and write some code now, so stay tuned for more updates!
