

## Introduction

- Mappings are basically hash tables, but are already instantiated, such that every possible key exists and is mapped to a value whose byte representations is all zeros (this likely depends on the datatype)

  Cannot get a list of keys or list of values (I suppose that list would be infinetly large).

- Solidity contains the notion of events, which applications can listen for quite cheaply.

- "Magic Global Variables" what are they, and what purpose do they serve?

- Sending a transaction to the account with address `0` creates a new contract. The address of the contract is then created from scratch
- contract can call themselves, although this is limited to a depth of 1024
- delegate call, I don't fully understand, but opens up the possibility of making a reusable 'library' of code within a contract


>Thoughts so far:
>Reasonably straight forward. I understood most of this so far thanks to my previous reading. This seems like a new class of engineering - hard, cold realities mixed with code that is pretty immature


## Solidity by example

- modifying the 'database' is just modifying variables
- Currently, many transactions are needed to assign the rights to vote to all participants. Can you think of a better way?
  - perhaps we can give the voter the right to vote by default? For example when they go to vote, look up their address in the mapping. If their mapping is empty, then we know they haven't voted, and create a new Voter for them


- natspec comment - three slashes - shown to user?

- sending eth in a message:
   - you don't need any arguments, just use `msg.value`

nice tip:
```java
// It is a good guideline to structure functions that interact
// with other contracts (i.e. they call functions or send Ether)
// into three phases:
// 1. checking conditions
// 2. performing actions (potentially changing conditions)
// 3. interacting with other contracts
// If these phases are mixed up, the other contract could call
// back into the current contract and modify the state or cause
// effects (ether payout) to be performed multiple times.
// If functions called internally include interaction with external
// contracts, they also have to be considered interaction with
// external contracts.
```

- blind auction example seem a little flawed - but it eems really hard to make auctions binding and blind at the same time. This is because eth values sent in messages can never be obscured

- modifiers - interesting approach to validation. 

## Solidity In Depth

- imports are pretty similar to ES6 JS
- with respect to functions, `public` is synonymous with `external`. I don't fully understand the nuances between when a function is by default internal or external

- has value and reference types. I don't think there is a heap that these can be stored on. Instead they are stored on memory (default for function params) or storage (for local or state variables).
  - apparently also can be on `calldata`

This is important:
>Data locations are important because they change how assignments behave: assignments between storage and memory and also to a state variable (even from other state variables) always create an independent copy. Assignments to local storage variables only assign a reference though, and this reference always points to the state variable even if the latter is changed in the meantime. On the other hand, assignments from a memory stored reference type to another memory-stored reference type do not create a copy.

- Copies when assigning between storage and memory, or state variable
- References when assigning between memory and memory or storage and storage

- Arrays work mostly as expected
  - fixed size array 
  - create a dynamic array with the `new` keyword
  - array types seems a little fiddly


- Structs
  - looks pretty similar to rust
  - cannot contain themselves 

- Mappings
  - see above
  - can mark as public, and Solidity will create a getter


- Contains special ether and time units, eg. `2 ether  == 2000 finney`
- Also has special global variables, such as `now`, `block.coinbase` etc.


functions:
  - can return multiple outputs! Yay
  - can use `returns` statements in the function signature. This is similar to rust

- no switch statement!
- no conversion from non-boolean to boolean, eg:
```
#this is invalid
if (1) {
  ... 
}
```

- "passing memory references to internally-called functions is very efficient" interesting stuff!

- when calling a contract from another contract, can we dynamically calculate the gas we will send?
- calling contracts (especially unknown) is dangerous and must be done very carefully
  - modify state first, then call contract. That way it is reversible
  - can a sub contract spend my eth?


## Dapp Safety

- .send is safer than .call.value(), since there is a gas limit enforced in send
- what's a raw call vs a contract call?
  - raw call: eg. `address.call()`, `address.callCode()`
  - contract call: `ExternalContract.doSomething()` <- use this, it propagates exceptions properly


- push vs pull
  - for some reason, it's better to let users withdraw funds instead of pushing funds to them.
    this seems to me like we're just waiting for bad user experiences...

- event names should start with a capital letter


'race' conditions (not really race conditions, but similar implications)

Bad:
```js
// INSECURE
mapping (address => uint) private userBalances;

function withdrawBalance() public {
    uint amountToWithdraw = userBalances[msg.sender];
    if (!(msg.sender.call.value(amountToWithdraw)())) { throw; } // At this point, the caller's code is executed, and can call withdrawBalance again
    userBalances[msg.sender] = 0;
}
```

Good:
```js
mapping (address => uint) private userBalances;

function withdrawBalance() public {
    uint amountToWithdraw = userBalances[msg.sender];
    userBalances[msg.sender] = 0;
    if (!(msg.sender.call.value(amountToWithdraw)())) { throw; } // The user's balance is already 0, so future invocations won't withdraw anything
}
```

The second example is preferable because the state has already been modified before doing an external call

**always be careful when sharing state**
- in order to remember this rule, add the prefix `untrusted` to the start of a function that makes external calls

eg:

```js
mapping (address => uint) private userBalances;
mapping (address => bool) private claimedBonus;
mapping (address => uint) private rewardsForA;

function untrustedWithdraw(address recipient) public {
  uint amountToWithdraw = userBalances[recipient];
  rewardsForA[recipient] = 0;
  if (!(recipient.call.value(amountToWithdraw)())) { 
    throw; 
  }
}

function untrustedGetFirstWithdrawalBonus(address recipient) public {
    if (claimedBonus[recipient]) { throw; } // Each recipient should only be able to claim the bonus once

    claimedBonus[recipient] = true;
    rewardsForA[recipient] += 100;
    untrustedWithdraw(recipient); // claimedBonus has been set to true, so reentry is impossible
}
```

can use mutexes to lock functions and avoid race conditions, but this has its own set of complexities

pull over push payments help prevent against malicious users making .send() fail, and locking up entire contracts.


Be careful when looping over an array of unknown size, as you can hit the gas limit easily, especially if there are malicious users 



- expect that your contract will fail, but build in fail safes and methods for contracts to fail gracefully
- upgrading contracts is a new thing, and apparently an active area of research 2 main options: 
  1. registry contract, which contains the latest version of the contract
  2. a relay contract, which forwards calls and data onto the latest version of the contract

- how can code changes be approved? Perhaps we could build systems to do this nicely
  - you could use a multi signature to achieve this. Set 3 addresses as the owner of a registry contract, and require at least 2 addresses in order to update it
  - but how about data migrations?

Wow. this is really cool stuff. As I said earlier, this is a new class of engineering to me, and I really look forward to getting stuck into it!



# Design Patterns of Dapps

- designers need to understand code
- we need to be mindful of user intiface design
- simplify - imagine a 'button which owns itself'
- don't try too much, build a single button, perhaps its a viable business model in and of itself? Do one job really well. (not sure I 100% agree with this)
- Use free fonts: `Source Sants Pro`, `Montserrat`, `Libre Baskerville (ampersand)` that are accessible on ipfs, swarm etc
- use 32px x 18.4 grids
- how to keep users in control of their data?

## Designing the architecture for your Ethereum application
- dapp can be as simple as webpage with web3 client
- need to connect to an actual node. Can use Mist or Metamask, but it must first be installed by the user
  - if you don't have a node, but just want to read from the blockchain, you can use a public node, eg. Infura

- lots of complicated design decisions. This doesn't seem like a one-size-fits all approach
- using both backend and front end has a number of interesting implications
  - how to listen for events?
  - perhaps there is a pub sub model we could use, 


## Dapp Architecture Designs

- a lot of this is going over my head. I think the more we dig into actually writing code, the easier this will be to see and implement

## Questions:

- what does `emit` do?, eg:
```java
emit Sent(msg.sender, receiver, amount);
```

emit sends a message to an event. Client side applications can easily listen for events 


- if `now` can be manipulated by the miner, then how do we use timestamps securely?

- how might one unit and integration test contracts?



## Wrestling Tutorial

```bash
# start geth locally
cd ~/developer/eth/geth_config/
geth --datadir=./.chaindata/ --rpc

# run mist, point to local geth
open -a /Applications/Mist.app --args --rpc http://127.0.0.1:8545


#getch attach to local
geth attach http://localhost:8545
```

```bash
#link the geth.ipc created by the locally running geth to where other eth clients look
ln -s ~/developer/eth/geth_config/.chaindata/geth.ipc ~/Library/Ethereum/geth.ipc
```

```bash

$ geth --datadir=./.chaindata/miner1 account new
Address: {ee31ca00f7b5ae75907112af5659974ec8831486}
$ geth --datadir=./.chaindata/miner1 account new
Address: {f18a79cef4be9faa2dabfadb07fa1cbfd909f78f}

geth attach
miner.setEtherbase('ee31ca00f7b5ae75907112af5659974ec8831486');
miner.start();
```


## Deploying a new contract from truffle to local geth

1. add the following local config to `truffle.js`
```js
local: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*", // Match any network id
    }
```

2. In one window, run geth locally
```bash
# start geth locally
cd ~/developer/eth/geth_config/
geth --datadir=./.chaindata/ --rpc
```

3. in another terminal window, 
```bash
#link the geth.ipc created by the locally running geth to where other eth clients look
ln -s ~/developer/eth/geth_config/.chaindata/geth.ipc ~/Library/Ethereum/geth.ipc
geth attach

#unlock the account we will be deploying to
personal.unlockAccount('0x944d61C11868Dfe946282461d724a4Fa51Db64fa', 'password');

miner.setEtherbase('ee31ca00f7b5ae75907112af5659974ec8831486'); #only needed once
miner.start();
```

4. From truffle window, run:
```bash
truffle migrate --network local #this deploys the contract

truffle console --network local #login to running geth using truffle

#get the address and abi. Replace Recommend with whatever your contract is called.
Recommend.address
JSON.stringify(Recommend.abi)
```

5. Now we need to get the ABI, so we can interact with it.

```
Mist Browser > Contracts > Watch Contract
```





While a fungible token hold value in itself, a non-fungible token is just the representation of an asset in a smart contract.

ERC20 tokens are fungible tokens. ERC721 (cryptokitties) is gaining popularity, and there are others such at ERC841 and ERC821 that extend from these ideas.


Idea:

- crypto collectibles you mine by travelling to locations. You can only mine the deed at a specific location, and people can trade assets back and forth (like stamps I suppose...)
https://www.coindesk.com/crypto-collectables-ethereums-next-killer-app-is-on-its-way/

Could be a fun and interesting demo



Network config sample for truffle.js

```js
 networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    local: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    }
  }
```


fix stupid nvm not working:
```bash
bass source $nvm_prefix/nvm.sh
```