#!/bin/sh
#@uthor - VishwaPrabhakar Singh 
#vtechcoder.blogspot.in
#please run this script from inside the same directory where you have downloaded the jdk if not then it will download it for you.
#script is for install Latest JDK version jdk1.8.0_121 from ORacle only.
#this script has been testing for Debian based distros only please stop if your system is 32 bit or not Debian or Ubuntu
echo -e "this script has been testing for Debian based distros only please stop if your system is 32 bit or not Debian or Ubuntu"
#J_INSTALL_DIR=/usr/lib/jvm/java-8-oracle
sudo mkdir -v /usr/local/java
#URL=$(curl -s http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html | \
#    awk "/downloads\['/ && ! /demos/ && /\['files'\]/ && /linux-x64/ && /\.tar\.gz/" | \
#    grep -o 'http.*\.tar\.gz' 

#AVAILABLE=$(echo $URL | grep -o -P 'jdk-8u.{0,2}' | cut -d "u" -f 2)
#CURRENT=$("$J_INSTALL_DIR"/bin/java -version 2>&1 | awk '/version/ {print $3}' | cut -d_ -f 2 | tr -d '"')

#if [ -z $CURRENT ] || [ $AVAILABLE -gt $CURRENT ]; then
    
    sudo cp -r jdk-8u121-linux-x64.tar.gz /usr/local/java
    #rm -f jdk-8u"$CURRENT"-linux-x64.tar.gz
    #wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" $URL
cd /usr/local/java
    tar -xvzf jdk-8u121-linux-x64.tar.gz
    rm -rf jdk-8u121-linux-x64.tar.gz
    #mv jdk1.8.0_"$AVAILABLE"/ $J_INSTALL_DIR
pwd
ls -a
sudo echo "
JAVA_HOME=/usr/local/java/jdk1.8.0_121
JRE_HOME=$JAVA_HOME/jre
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME
export JRE_HOME
export PATH " >> /etc/profile

echo "Java installed"
echo "updating java alternative please wait a sec"
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_121/jre/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_121/bin/javac" 1 
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jre1.7.0_45/bin/javaws" 1 

 sudo update-alternatives --set java /usr/local/java/jdk1.8.0_121/jre/bin/java
sudo update-alternatives --set javac /usr/local/java/jdk1.8.0_121/bin/javac 
sudo update-alternatives --set javaws /usr/local/java/jdk1.8.0_121/bin/javaws

. /etc/profile
#    LATEST=$(LANG=C update-alternatives --display java | grep ^/ | sed -e 's/.* //g' | sort -n | tail -1)
#    if [ -z $LATEST ]; then
#        LATEST=1
#    else
#        J_PATH=$(LANG=C update-alternatives --display java | grep "priority "$LATEST"" | awk '{print $1}')
#        [ $J_PATH = "$J_INSTALL_DIR"/jre/bin/java ] || LATEST=$((LATEST+1))
#    fi  

    #link JRE files
#    for f in $J_INSTALL_DIR/jre/bin/*; do
#        name=`basename $f`;
#        if [ ! -f "/usr/bin/$name" -o -L "/usr/bin/$name" ]; then  #some files, like jvisualvm might not be links
#            if [ -f "$J_INSTALL_DIR/man/man1/$name.1.gz" ]; then

#                update-alternatives --install /usr/bin/$name $name $J_INSTALL_DIR/jre/bin/$name $LATEST --slave /usr/share/man/man1/$name.1.gz $name.1.gz $J_INSTALL_DIR/man/man1/$name.1.gz
#            fi
#        else     
#                update-alternatives --install /usr/bin/$name $name $J_INSTALL_DIR/jre/bin/$name $LATEST

#        fi
#    done

    echo "Oracle Java 8 installed"

#fi

#if [ $AVAILABLE -eq $CURRENT ]; then
    echo "Java is up to date"
#fi
