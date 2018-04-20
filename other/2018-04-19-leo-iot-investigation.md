
**Question:**
*What are the challenges faced by people wanting to use LEO satellites for data collection? Are there any problems that can be solved either with software or hardware?*



The advent of many companies (Myriota, fleet space, SpaceX, OneWeb) comes from the combination of a few breakthroughs:
- cheap satellite launches
- cheap components both for satellites and on the ground (thanks to smartphones)
- smarter radios: frequency hopping, power, etc


## Readings


http://www.circleid.com/posts/20171024_will_low_earth_orbit_satellite_internet_service_providers_succeed/
- standardization is an issue. It seems that these players aren't working towards a shared standard.
- we can already see the groundwork for some mega-monopolies here (in particular for broadband access). What are the implications of this? Surely privately owned broadband internet companies is a bad idea. 
- 

http://cis471.blogspot.com.au/2017/10/non-terrestrial-spectrum-sharing.html
- radio interference is going to be a problem
- SpaceX launch was delayed by FCC, defering to ITU about how spectum issues would be resolved


http://myriota.com/direct-orbit-satellite-communication-holy-grail-remote-iot/
- two ways for existing IOT satellite connectivity: 
    - direct to orbit (power hungry and expensive)
    - Aggregate data over local networks, and upload to satellite

    Apparently Myriota is different. Working more in sparse environments

## Cost investigation links:
http://www.dtic.mil/dtic/tr/fulltext/u2/a567395.pdf


## Thoughts

- spectrum fragmentation & licencing issues
  - how easy is it to deploy Myriota's tech to a different country?

- How can we be the Levi's of this trend?

- For IoT data collection purposes alone, there is already a lot of fragmentation. However, fragmentation and vendor-lock-in is the basis for how these companies plan on making money. This means that they will make it VERY hard to switch from one provider to another.

However, I'm unsure about the tooling that these companies will use. Say, for example, you want to manage IOT fleet across both Myriota and Fleet Space for different purposes. [come up with a more explained use case]. Perhaps Myriota works for one aspect, but Fleet Space works better for another. Or: maybe you are doing fleet management. When your devices (maybe on trucks?) are in cellular distance, they should use cellular, as it's cheaper, but when they are remote, they should use satellites. 

Is this a real use case? What would somebody pay for this option? 



