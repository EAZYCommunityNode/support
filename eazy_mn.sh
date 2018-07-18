#/bin/bash
clear
echo "Do you want to install all needed dependencies (no if you did it before)? [y/n]"
read DOSETUP

if [[ $DOSETUP =~ "y" ]] ; then
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y dist-upgrade
  sudo apt-get install -y nano htop git curl
  sudo apt-get install -y software-properties-common
  sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
  sudo apt-get install -y libboost-all-dev libzmq3-dev
  sudo apt-get install -y libevent-dev
  sudo apt-get install -y libminiupnpc-dev
  sudo apt-get install -y autoconf
  sudo apt-get install -y automake unzip
  sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
  sudo apt-get update
  sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

  cd /var
  sudo touch swap.img
  sudo chmod 600 swap.img
  sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=4000
  sudo mkswap /var/swap.img
  sudo swapon /var/swap.img
  sudo free
  sudo echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
  cd
  mkdir -p ~/bin
  echo 'export PATH=~/bin:$PATH' > ~/.bash_aliases
  source ~/.bashrc
fi

echo "Do you want to compile Daemon (please choose no if you did it before)? [y/n]"
read DOSETUPTWO

if [[ $DOSETUPTWO =~ "y" ]] ; then

sudo eazy-cli stop > /dev/null 2>&1
sleep 3
sudo wget http://95.179.146.176/eazy/eazyd-113 -O /usr/local/bin/eazyd
sudo wget http://95.179.146.176/eazy/eazy-cli-113 -O /usr/local/bin/eazy-cli
sudo chmod +x /usr/local/bin/eazy*
fi

echo ""
echo "Configuring IP - Please Wait......."

declare -a NODE_IPS
for ips in $(netstat -i | awk '!/Kernel|Iface|lo/ {print $1," "}')
do
  NODE_IPS+=($(curl --interface $ips --connect-timeout 2 -s4 icanhazip.com))
done

if [ ${#NODE_IPS[@]} -gt 1 ]
  then
    echo -e "More than one IP. Please type 0 to use the first IP, 1 for the second and so on...${NC}"
    INDEX=0
    for ip in "${NODE_IPS[@]}"
    do
      echo ${INDEX} $ip
      let INDEX=${INDEX}+1
    done
    read -e choose_ip
    IP=${NODE_IPS[$choose_ip]}
else
  IP=${NODE_IPS[0]}
fi

echo "IP Done"
echo ""
echo "Enter masternode private key for node $ALIAS , Go To your Windows Wallet Tools > Debug Console , Type masternode genkey"
read PRIVKEY

CONF_DIR=~/.eazy/
CONF_FILE=eazy.conf
PORT=9982

sudo mkdir -p $CONF_DIR
sudo echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` > $CONF_DIR/$CONF_FILE
sudo echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> $CONF_DIR/$CONF_FILE
sudo echo "rpcallowip=127.0.0.1" >> $CONF_DIR/$CONF_FILE
sudo echo "rpcport=9983" >> $CONF_DIR/$CONF_FILE
sudo echo "listen=1" >> $CONF_DIR/$CONF_FILE
sudo echo "server=1" >> $CONF_DIR/$CONF_FILE
sudo echo "daemon=1" >> $CONF_DIR/$CONF_FILE
sudo echo "logtimestamps=1" >> $CONF_DIR/$CONF_FILE
sudo echo "masternode=1" >> $CONF_DIR/$CONF_FILE
sudo echo "port=$PORT" >> $CONF_DIR/$CONF_FILE
sudo echo "mastenodeaddr=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
sudo echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE

sudo eazyd -daemon
