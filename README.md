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
 
## To run the Flutter app

 - Install directly from the apk in the root of this repository i.e. [Dapp](license_issue_Dapp.apk) and [Fraud Detector](fraud_detector_app.apk).
 - Make sure [Flutter](https://flutter.dev/) is installed correctly.
 - To run the License Issue app navigate to [license_issue_Dapp](https://github.com/ElectroCoders/Li-Chain/tree/master/license_issue_Dapp) :
    - run the command
    ```Bash
        $ flutter run --release
    ```
    
- To run the License Issue app navigate to [fraud_detector_app](https://github.com/ElectroCoders/Li-Chain/tree/master/fraud_detector_app) :
  - run the command
    ```Bash
        $ flutter run --release
    ```

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

## Deploy Node.js server on AWS
- [x] Create an AWS account
- [x] Select EC2 instance from Services dropdown, click on Launch Instance and select Free Tier Only.
- [x] Select Linux AMI and then, on the next screen, select t2.micro (highlighted as Free tier eligible)
- [x] Select Review and Launch. Ignoring the security warning and click Launch.
- [x] Follow the instances to create a custom name key pair and store in somewhere on your PC where you can access it later.
- [x] Select Launch Instances. You can select View Instances to go to the EC2 dashboard where you will see the instance up and running.
- [x] You will be assigned a Public DNS and an IPv4 Public IP
- [x] Now, ssh into your instance(For windows, use PuTTy). You can click the Connect button and select a standalone SSH client. Then, run the example code in your terminal.
- [x] Now you are in your instance and run the following code to install NVM (Node Version Manager).
```Bash 
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
```
- [x] Ignore the **command not found** error and install node using
*nvm install node*
- [x] Install git and then,
```Bash
$ sudo yum install git
$ git clone https://github.com/Electrocoders/Li-chain.git <folder-name>
$ cd <folder-name>
$ npm install
$ npm start
 ```
 - [x] Go to Security Groups and click Inbound. Add a **new custom TCP rule** with port range **3000** and accessible from everywhere(0.0.0.0/0)
 - [x] To keep the app running when you terminate your ssh, use
 ```Bash killall -9 node
 $ npm install pm2 -g
 $ screen
 $ pm2 start index.js
 $ pm2 startup
 $ pm2 save
 ```
 - [x] Press Ctrl-A then, Ctrl-D.
 - [x] To move the app to port 80, use
 ```Bash 
 $ sudo yum install nginx
 ```
  - [x] Go to Security Groups and click Inbound. Add a **HTTP** with port range **80** and accessible from everywhere(0.0.0.0/0)
 ```Bash 
 $ sudo nano /etc/nginx/nginx.conf
 ```
 - [x] If there’s no server block listening on port 80, add one or change it if it already exists to look like this:
 ```Bash
 server {
   listen         80 default_server;
   listen         [::]:80 default_server;
   server_name    localhost;
   root           /usr/share/nginx/html;   location / {
       proxy_pass http://127.0.0.1:3000;
       proxy_http_version 1.1;
       proxy_set_header Upgrade $http_upgrade;
       proxy_set_header Connection 'upgrade';
       proxy_set_header Host $host;
       proxy_cache_bypass $http_upgrade;
   }
}
 ```
 ```Bash
 $ sudo service nginx restart
 $ sudo chkconfig nginx on
