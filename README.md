# .NET Core 5 Container w/ SSH Enabled on Azure App Service
This sample leverages a startup script as the entrypoint. This script allows us to start the SSH service & .net app without have to parse multiple commands in the entrypoint or call RUN instructions to start our SSH process.

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

## Building off the image repo with new code
1. Remove all files but the Dockerfile, start.sh & sshd_config.
2. Copy your .NET Core 5 project files into /dotnet-container-ssh-azure
3. Test & publish the project. Docker will run the published version of the app as a best practice.
```
$ dotnet publish -c Release
```
4. Update the start.sh with the new .dll name. (Shown when running dotnet publish)
5. Build & test locally then push to your registry  
```
$ docker build -t dotnet-ssh .
$ docker push Azure/dotnet-ssh
```

## Update the container image tag
https://docs.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux
