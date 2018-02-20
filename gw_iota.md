
## Groundwater Iota

GWIota is a project idea that I've been thinking about for a little while now. It comes out of my experiences learning about groundwater scarcity in India, and my want to test out IOTA for practical purposes.

The idea is to use micro payments between smart pumps to put a price on groundwater. Instead of paying to a central authority, a smart pump is capable of paying others in a network of collective farmers in a groundwater cooperative. This accurately puts the price of groundwater right where the costs are imposed, on a farmer's neighbour.

*Disclaimer: there is a good chance this idea will never be used in this particular form, for these villages that I have already visited. The technology barriers are much too high at this stage, and often it's better to promote conversations between farmers than doing it all for them. That said, I think it's an interesting problem, and may be adapted for other uses down the line.*


## Background

- Groundwater scarcity is bad
- Project MARVI and MyWell, building groundwater coooperatives
- What are groundwater cooperatives?
- GWIota puts a price on groundwater, enables farmers to better share water, and become more resilient in the face of global warming etc.


## How It Works

1. Using historical groundwater measurements (eg. last year's rainfall amount) determine how much water should be pumped for a given set of wells, and at what price per litre. This will involve more economics, hydrology etc, but we can make up numbers to begin with.

2. Farmers pay (in INR) to secure water for that month, which then gets converted to IOTAs on smart pumps.

3. When a farmer pumps groundwater, the smart pump automatically pays the other smart pumps, according to the price per litre determined in [1].


## Outcomes

- Farmers who have wells which don't perform as well are no longer incentiveised to dig deeper wells to ensure a stable future. They can be compensated by not accessing as much water to pursue other efforts, or grow less grops.

- When the pump runs out of funds, the water runs out. _(note: I'm not sure if we should set some soft/hard limits, or even introduce a penalty for going over the water quota instead)_ This prevents over exploitation of groundwater.

- Using this method we could set up other micro payments that may benefit the farmers. For example, by slightly inflating the price for groundwater and automatically subscribe farmers to crop insurance.


## Proposed Technology

- IOTA & IOTA Flash Channels
- Smart Pumps
- Rasberry Pi/Lightweight computing platform
- Network access point (sim or wifi)


## Roadmap

1. Feasibility investigation
2. Software development
3. Review, blog posts etc.
4. Hardware development
