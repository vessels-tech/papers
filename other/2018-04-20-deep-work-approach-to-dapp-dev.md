My Deep Work Approach to Becoming an Eth dApp Expert

Goal: become a proficent dApp developer in 1 week
Background: Software developer for 8 or so years. Working as an SRE, Back end web, some data analytics and deep learning

Inspired by Cal Newport’s Deep Learning, specifically the story of Jason Benn, who managed to learn sofware development froms scratch in 2 months or so. 


“Highlight the programming textbooks, transfer the ideas to notecards, and practice them out loud”
What’s the equivalent for us?

>Not sure, it seems that most of the ways to learn this stuff is through tutorials.

Perhaps we can have a dedicated reading and note taking time (maybe the entire first day + start of each day the rest of the week)

> download all reading resources to the iPad, and sit in a room with the iPad all day.


Day 1: Concepts

background:
- http://www.imponderablethings.com/2013/07/how-bitcoin-works-under-hood.html
- https://github.com/bitcoinbook/bitcoinbook
    - this is too long! Going to move onto eth

eth:
- https://github.com/ethereum/wiki/wiki/White-Paper
    Done. This wasn't actually too bad
- https://ethereum.github.io/yellowpaper/paper.pdf
    Wow. I might be able to work my way through it, but it seems too low level for what I'm trying to achieve right now
- https://medium.com/@FolusoOgunlana/cracking-the-ethereum-white-paper-e0e60c44126
    Going to read this, but it may not really be worth my while. I understood the white paper better than I thought I would.

    Good summary, highlighted some nuances I missed in the whitepaper
- https://media.consensys.net/time-sure-does-fly-ed4518792679
    Skimmed this, I think I've understood it elsewhere.

ipfs
- https://ipfs.io/ipfs/QmR7GSQM93Cx5eAg6a6yRzNde1FQv7uL6X1o4k7zrJa3LX/ipfs.draft3.pdf
    Wow. very heavy. I have a bunch of questions, but I think I grasped the concepts.

    Things I don't understand:
    - how can this scale if objects are never deleted? Is it meant to scale?
    - Didn't fully grasp Self certified names section
    - Don't fully undersand how identity is secure? What stops me from copying your node id and pretending to be you? Why not use a signature signed by private key + public key as the nodeId?

- https://decentralized.blog/understanding-the-ipfs-white-paper-part-1.html
- https://hackernoon.com/understanding-the-ipfs-white-paper-part-2-df40511addbd

These two are simply providing summaries for above, along with some half-working code samples. The author also investigates some holes and wip aspects of ipfs.

I'm a little unsure about the object storage section, but we'll just leave that for now.


oracles

- https://blog.oraclize.it/understanding-oracles-99055c9c9f7b

An oracle is a trusted 3rd party that you can get data from. They solve the problem of getting data into smart contracts when you cannot trust anyone.

Oraclize is solving this problem in an interesting way, by building ways to prove that they are not tampering with the data.

But how do you trust oraclize's underlying data sources? There are a number of ways, such as staking.



>Ok so we got through today's readings in about 4.5 hours. Mind you, we did skip the rest of the bitcoin book, but that would easily have taken up the rest of the day. I think we'll read one more chapter of that book, and move onto other things for the day. But before that, let's write a little summary of what we've done and learned:

Read a high level overview of bitcoin, and chapter 6 of the bitcoin book (I've read ch 1-5 previously). Combined with my past knowledge, this has given me a pretty good working knowledge of bitcoin basics, including some lower level details about how transactions work.

We moved onto the Eth white and yellow papers. I got through the eth whitepaper without too much difficulty (a lot of it was just about bitcoin really), but I didn't spend too much time on the yellow paper, as it felt too technical for my needs at the moment. I would love to come back to it in the future, but right now just doesn't seem like the best time.

The critical thing I learnt from Eth was about how it extends the blockchain script principles to add turing completeness. It is also interesting that in eth, an account has a balance, whereas in blockchain, balance is implied by the sum of all UTXOs for a given address.

The paper addresses scalablity, but I wasn't all that satisfied with the answers. This seems like a major issue in DLT at the moment, so I'll be keeping an eye out for solutions. IOTA claims to have fixed the scalablity issue, but it still seems like it would need unlimited storage in the future. A lot of talk is about making space more efficent, but with an append only ledger, someday we will run out of storage! This seems too inneficent to me.

There were a couple of other high level eth overviews, which helped point out other things I missed in the whitepaper also.

I then looked into IPFS, which seems like another building block for Dapps. I found the whitepaper pretty heavy, but manageable. I came away with the following questions:
 - how can this scale if objects are never deleted? Is it meant to scale?
- Didn't fully grasp Self certified names section
- Don't fully undersand how identity is secure? What stops me from copying your node id and pretending to be you? Why not use a signature signed by private key + public key as the nodeId?

I then spent a little bit of time learning about oracles (which are touched on in the Eth whitepaper). They seem like one of the next enabling technolgies in this ecosystem, and most research is really quite new. I would love to dig more into how one builds an oracle. Oraclize seems to be the leader in this space.

Alright, so that's all for today. I still have a few hours left in the day, so I might spend some more time reading before going on with my other tasks. Looking forward to tomorrow!


Day 2: Skills:

Solidity
- https://github.com/ethereum/wiki/wiki/Safety (dapp section)
- https://solidity.readthedocs.io/en/develop/solidity-by-example.html
- https://solidity.readthedocs.io/en/develop/solidity-in-depth.html

Dapp Design
- https://github.com/ConsenSys/Ethereum-Development-Best-Practices/wiki/Dapp-Architecture-Designs
- learn design patterns
    - https://www.slideshare.net/mids106/dapp-design-patterns
    - https://www.youtube.com/watch?v=nPpi9BPkRbo
- https://blog.zeppelin.solutions/designing-the-architecture-for-your-ethereum-application-9cec086f8317

Truffle:
- http://truffleframework.com/docs/getting_started/project


Bonus: Learn about Hyperledger
- https://blockgeeks.com/guides/what-is-hyperledger/
- https://www.youtube.com/watch?v=gAxK6zYrfxI
- https://hyperledger-fabric.readthedocs.io/en/latest/


Day 3: Tutorials

- https://medium.com/@merunasgrincalaitis/the-ultimate-end-to-end-tutorial-to-create-and-deploy-a-fully-descentralized-dapp-in-ethereum-18f0cf6d7e0e
- https://dweb-primer.ipfs.io/
- https://medium.com/@mustwin/building-an-oracle-for-an-ethereum-contract-6096d3e39551
- http://truffleframework.com/tutorials/building-testing-frontend-app-truffle-3
- http://truffleframework.com/tutorials/ethereum-devops-truffle-testrpc-vsts


Day 4: Application

- Design, Build & Deploy a Decentralized AirBnb from scratch
    - uses multiple contracts
    - hosted on IPFS
- Build on chain/off chain application?


Day 5: Next Steps

- Read the Eth + IPFS white papers again. 
- Come up with new ideas
    - what can we build that helps making this process easier?
    - what can we build that leverages this technology?




## Thoughts and ideas:
- could we implement a novel way to share docker images quickly over IPFS? This would be a really cool and practical application. Perhaps we could see if it's faster than running your own registry, and you wouldn't need to store common images in your docker ipfs server...
- investigate: **cryptoeconomics** seems like an interesting field

- What about making a simple, provable clock oracle. Wouldn't that be a good idea?
- How does one pay oracles? Perhaps they could take payments over smart contracts. Could we build a system for allowing oracle payments?



Potential resources:
- https://ethereumbuilders.gitbooks.io/guide/content/en/building_on_mac_os.html
- https://blog.zeppelin.solutions/the-hitchhikers-guide-to-smart-contracts-in-ethereum-848f08001f05



