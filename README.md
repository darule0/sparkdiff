# sparkdiff <event log 1> <event log 2>
A rudimentary command line utility for contrasting spark logs.

## Motivation
I have been troubleshooting Apache Spark application issues full time since around 2015. When a spark application slows down or stops working, I try to find out more information such as: Did the inputs change? Did the configuration change?

Spark logs from two runs of the same application cannot be contrasted using a general purpose diff tool as there would be thousands of changes detected which are not useful for troubleshooting.

I have decided to automate this part my job function in the form of a bash script which examines spark logs and identifies differences which I find useful when troubleshooting spark application performance and functionality problems. 
  
## Description
sparkdiff is a Linux command line utility which contrasts spark logs from two runs of a spark application and displays log entries which both, have changed; and that I find helpful when troubleshooting spark application performance and/or functionality problems.

For example, if a spark application has been running without problems for years and then suddenly slows down or stops working, then I will pass in the logs from both a known working run as well as the logs from the run which had problems. With a little luck, the sparkdiff output helps guide me towards the root cause and solution.

## Online Installation w/ CI
```console

mkdir ~/bin
chmod u+rx ~/bin
wget -O ~/bin/sparkdiff https://github.com/darule0/sparkdiff/blob/main/sparkdiff?raw=true
chmod u+rx ~/bin/sparkdiff
sparkdiff

```



## Offline Installation w/o CI
```console

sudo mkdir /opt/sparkdiff
sudo chmod o+rx /opt/sparkdiff
sudo git clone https://github.com/darule0/sparkdiff.git /opt/sparkdiff
sudo ln -s /opt/sparkdiff/sparkdiff.sh /usr/bin/sparkdiff
sparkdiff

```

## Tutorial
```console

# install sparkdiff w/ CI
mkdir ~/bin
chmod u+rx ~/bin
wget -O ~/bin/sparkdiff https://github.com/darule0/sparkdiff/blob/main/sparkdiff?raw=true
chmod u+rx ~/bin/sparkdiff

# display sparkdiff usage
sparkdiff

# contrast event files from a two runs of the same spark application
sparkdiff event_log_1 event_log_2

```

![alt text](https://raw.githubusercontent.com/darule0/sparkdiff/main/sparkdiff.png)

