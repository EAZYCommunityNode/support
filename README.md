![Coin-Logo](https://i.imgur.com/sfV3x2E.png)
# EAZY Masternode Setup Guide
This guide is designed for a EAZY Mastenode Setup.

If you require further assistance, feel free to contact our team @ [Discord](https://discord.gg/V2gKBhw)
***
## Requirements
**2,000 EAZY** [BUY](https://discord.gg/V2gKBhw)

**EAZY Masternode VPS** [BUY](https://www.vultr.com)

**EAZY Wallet** [DOWNLOAD](https://github.com/eazynode/eazy/master/releases/)

***
## Contents
* **PART 1**: Create EAZY Masternode [VPS](https://www.vultr.com/).
* **PART 1.1**: Windows Wallet only! - Download [Bitvise](https://www.bitvise.com/ssh-client-download).
* **PART 2**: Setup and connect EAZY Masternode VPS
* **PART 3**: Prepare EAZY Wallet.
* **PART 4**: Starting the EAZY Masternode.
***

## PART 1 | Creating the VPS within [Vultr](https://www.vultr.com/?ref=7296974) 
***Step 1***
* Register at [Vultr](https://www.vultr.com/?ref=7296974) and setup your account [here](https://my.vultr.com/deploy/)

**Step 2*** 
* a) choose a server location (preferably somewhere close to you)
![Location](https://i.imgur.com/ozi7Bkr.png)

* b) select server type: Ubuntu 16.04!
![OS](https://i.imgur.com/aSMqHUK.png)

* c) select server size: $5/mo
![OS](https://i.imgur.com/UoGoHcM.png)
 
* d) set server label (optional)
![Hostname](https://i.imgur.com/uu0rvOr.png)

* e) click "Deploy now"

![Deploy](https://i.imgur.com/4qpYuH0.png)

* f) open the VPSdashboard by clicking on your server

![Select](https://i.imgur.com/8YwRhfM.png)

***


## PART 1.1 | Downloading and installing BitVise. [WINDOWS ONLY!]

***Step 1***
* Download Bitvise [here](https://dl.bitvise.com/BvSshClient-Inst.exe) and run the application.

***Step 2***
* a) copy your EAZY Masternode VPS IP address.

![Vultr](https://i.imgur.com/z41MiwY.png)

* b) in bitvise - paste IP address inside "Hostname".

![Bitvise-Installer](https://i.imgur.com/vkN1alC.png)

* c) copy the root password from the EAZY Masternode VPS.


* d) in bitvise - type "root" as the login/username and paste the password into the Bitvise terminal.

![RootPassEnter](https://i.imgur.com/zVhOAKu.png)

* e) confirm securtiy alert with yes!.

***

## PART 2 | Connect and Setup EAZY Masternode VPS

***Step 1 (for Linux and MacOS)*** 
* connect to your local machine to the EAZY Masternode VPS by using terminal:

`ssh root@VPS IP address` and enter your VPS password.

![RootPassEnter](https://i.imgur.com/6GJTddt.png)

and confirm with "yes".

![confirmsecurity](https://i.imgur.com/KuAsL3u.png)
***

***Step 2***
* a) paste the code below into the terminal then press enter

`wget -q https://raw.githubusercontent.com/eazynode/support/master/eazy_mn.sh`

`chmod +x eazy_mn.sh`

`./eazy_mn.sh`

* b) confirm dependencies installation with `y` and press enter - this step will take about 5-10 minutes.

![confirmdeps](https://i.imgur.com/GvCirv4.png)

* c) after successfull installation confirm daemon compilation with `y` and press enter.

![confirmdaemon](https://i.imgur.com/9Khulgc.png)

* d) when asked for masternode genkey switch over to your local wallet where you have your EAZY coins!

![getmnkey](https://i.imgur.com/vI4rTGU.png)
***


## PART 3 | Prepare EAZY Wallet.

***Step 1***
* Switch over to the EAZY wallet on your local machine (desktop pc) and create a masternode address "MN1".

![mn1](https://i.imgur.com/bRfXo7M.png)

***Step 2***

* Send exactly 2000 EAZY to your new generated address "MN1"!

![sendcollateral](https://i.imgur.com/WFOhzu8.png)

***Step 3***
* Go to Tools->Debug Console and type in "masternode genkey".

***Step 4***
* In same window type in "masternode outputs"

![mnoutput](https://i.imgur.com/aOWFDjj.png)

***Step 5***
* Go to Tools -> Masternode Configuration File and connect you masternode to the local wallet:

MN1 EAZY VPS address:port masternodegenkey masternodeoutputs (see example)

![mnconfig](https://i.imgur.com/I9sHZRY.png)

***Step 5***

* Close your local Wallet and keep the masternode.conf open to connect your wallet to the EAZY Masternode VPS.

# PART 4 | Connecting & Starting the masternode 

***Step 1***
* Go back to your terminal and paste the masternode genkey from before in the terminal to confirm server setup.

![pastemnkey](https://i.imgur.com/PkZ6Gjv.png)

* The EAZY Masternode VPS is now set and starting!

***Step 2***

* a) Open your EAZY Wallet and go to masternodes tab. You will see your masternode with status "missing".

![mntab](https://i.imgur.com/3qyR8MT.png)

* b) Click on update and than start your masternode by clicking "start-alias" (if you have multiple masternodes you can use start-all!)

***Step 3***

![mnsuccess](https://i.imgur.com/Uqtx74E.png)

* The Masternode Setup is confirmed and you should receive first rewards in less than 30 minutes. To check the status of your masternode within the EAZY Masternode VPS use the command below:

`/usr/local/bin/eazy-cli masternode status`

 ***

* CONGRATULATIONS - You are now owner of an EAZY Masternode!
