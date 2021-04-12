# .NET Core 5 Container w/ SSH Enabled on Azure App Service
### Repository Modifications 

| Files             |  Content                                   |
|----------------------|--------------------------------------------|
| `Dockerfile`           | Microsoft aspnet 5 base image, Debian           |
| `sshd_config`       | OpenSSH SSH daemon configuration file                       |
| `start.sh`               | Initalization Script to start SSH, & the dll.                                 |


SSH Reference: https://docs.microsoft.com/bs-latn-ba/Azure/app-service/containers/configure-custom-container#enable-ssh

