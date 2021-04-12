# .NET Core 5 Container w/ SSH Enabled on Azure App Service
### Repository Modifications 

| Files             |  Content                                   |
|----------------------|--------------------------------------------|
| `Dockerfile`           | Microsoft aspnet 5 Debian base image           |
| `sshd_config`       | OpenSSH SSH daemon configuration file. Requires SSH_PORT ENV in dockerfile                      |
| `start.sh`               | Initalization Script to parse port number, pass env variables, start SSH, & the dll.                                 |


SSH Reference: https://docs.microsoft.com/bs-latn-ba/Azure/app-service/containers/configure-custom-container#enable-ssh

## Test Locally | localhost:5000
```
$ git clone https://github.com/Kendubu1/dotnet-container-ssh-azure.git
$ cd dotnet-container-ssh-azure
$ dotnet run
```

## Build Container Locally | localhost:4000
⚠ Make sure the start.sh shell script is saved with LF line-endings on your local machine before building in docker.
```
$ cd dotnet-container-ssh-azure
$ docker build -t <tag-name> .
$ docker run -d -p 4000:80 <tag-name>
```

## Push to Registry 
⚠ Assumed the tag is "dotnet-ssh" & registry username is "Azure"
```
$ docker login
$ docker tag dotnet-ssh Azure/dotnet-ssh
$ docker push Azure/dotnet-ssh
```
## Update the container image tag
https://docs.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux
