# Smart License
### This is a product developed by a team of 4 people for [Everest Hack](https://www.everest-hack.com/), the biggest hackathon in Nepal.

### The main aim of this project is to:
1. Eradicate Corruption by making transactions transparent and immutable.
2. Detect Fraud License.
3. Reduce long and tiresome queues outside the transportation authority.
4. Strong security using Blockchain.

The project can be divided into 5 parts:

- [x] [Ethereum](https://www.ethereum.org/) based Blockchain
- [x] Database hosting with [IPFS](https://ipfs.io/) - the Distributed Web.
- [x] [NodeJS](https://nodejs.org/) server implementation in [AWS](https://aws.amazon.com/).
- [x] Website to register for license
- [x] [Dapp](license_issue_Dapp.apk) to track the records necessary to issue the license and run a smart contract to issue license transparently and immutably.
- [x] [Mobile app](fraud_detector_app.apk) for Traffic police to check if the license is fraud or not.

| Fraud Detector App                                                                                                   | Trial Officer App                                                                                                    |
|---|---|
| ![Screenshot1](https://user-images.githubusercontent.com/29589003/61585845-aba18480-ab85-11e9-8214-3ffdac816489.png) | ![Screenshot2](https://user-images.githubusercontent.com/29589003/61585830-54031900-ab85-11e9-9db4-4ec6c32a16ee.png) |

Registration Form Website
![Website](https://user-images.githubusercontent.com/29304788/61586071-08536e00-ab8b-11e9-9c09-959e20a15dc6.png)

Slides are availabe [here](https://docs.google.com/presentation/d/1ws-UiBxvEWOaIDOfpUQeOAC3MUrbxg_HHymqrwen7Mo/edit?usp=sharing).

## Team Members
- [Mitesh Pandey](https://www.github.com/davidmitesh)
- [Bibek Timsina](https://www.github.com/bimsina)
- [Nishesh Awale](https://www.github.com/nisheshawale)
- [Anish Dulal](https://www.github.com/anishdulal)


  



## Welcome to NodejsServer, Ganache-cli and IPFS installation
NodeJS server is hosted in AWS. A virtual Ethereum blockchain is setup using Ganache-cli by node module Ganache-Cli.

Ganache CLI uses ethereumjs to simulate full client behavior and make developing Ethereum applications faster, easier, and safer. It also includes all popular RPC functions and features (like events) and can be run deterministically to make development a breeze.

IPFS is hosted and a unique hash is obtained which is then stored in blockchain network along with other immutable records.


## Installation

`ganache-cli` is written in JavaScript and distributed as a Node.js package via `npm`. Make sure you have Node.js (>= v6.11.5) installed.

Using npm:

```Bash
npm install -g ganache-cli
```

or, if you are using [Yarn](https://yarnpkg.com/):

```Bash
yarn global add ganache-cli
```

`ganache-cli` utilizes [`ganache-core`](https://github.com/trufflesuite/ganache-core) internally, which is distributed with optional native dependencies for increased performance. If these native dependencies fail to install on your system `ganache-cli` will automatically fallback to `ganache-core`’s pre-bundled JavaScript build.

Having problems? Be sure to check out the [FAQ](https://github.com/trufflesuite/ganache-cli/wiki/FAQ) and if you're still having issues and you're sure its a problem with `ganache-cli` please open an issue.

### Using Ganache CLI

#### Command Line

```Bash
$ ganache-cli <options>
```



## Usage

As a [Web3](https://github.com/ethereum/web3.js/) provider:

```javascript
const ganache = require("ganache-core");
const web3 = new Web3(ganache.provider());
```
If web3 is already initialized:
```javascript
const ganache = require("ganache-core");
web3.setProvider(ganache.provider());
```
NOTE: depending on your web3 version, you may need to set a number of confirmation blocks
```javascript
const web3 = new Web3(provider, null, { transactionConfirmationBlocks: 1 });
```

As an [ethers.js](https://github.com/ethers-io/ethers.js/) provider:

```javascript
const ganache = require("ganache-cli");
const provider = new ethers.providers.Web3Provider(ganache.provider());
```

As a general HTTP and WebSocket server:

```javascript
const ganache = require("ganache-cli");
const server = ganache.server();
server.listen(port, function(err, blockchain) {...});
```


### Using IPFS

#### Command Line

```Bash
$ ipfs init <options>
$ ipfs daemon <options>
```

### Runnig Nodejs Server

#### Command Line

```Bash
$ git clone https://github.com/ElectroCoders/Li-Chain
$ npm install
$ node index.js

```







