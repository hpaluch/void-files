# Files to setup Jenkins CI

> [!WARNING]
> Package `jenkins`  is so outdated - so it will fail to download all plugins (!).


You have to install fonts to avoid https://wiki.jenkins.io/display/JENKINS/Jenkins+got+java.awt.headless+problem:
```shell
xbps-install -u dejavu-fonts-ttf jenkins
```

The `-Djava.awt.headless=true` parameter is added in provided `etc/sv/jenkins/conf`

You also have to create several new files/directories:
```shell
# run as root
mkdir -p /etc/sv/jenkins/log
cp -v etc/sv/jenkins/conf /etc/sv/jenkins/
cp -v etc/sv/jenkins/log/run /etc/sv/jenkins/log/
```

