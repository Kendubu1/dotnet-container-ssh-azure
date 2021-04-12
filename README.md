# .NET Core 5 Container w/ SSH Enabled on Azure App Service
### Repository Modifications 

| Files             |  Content                                   |
|----------------------|--------------------------------------------|
| `Dockerfile`           | Microsoft aspnet 5 base image            |
| `sshd_config`       | OpenSSH SSH daemon configuration file                       |
| `start.sh`               | Initalization Script to start SSH, & the dll.                                 |
| `dev.py/prod.py`       | Enabled debug level logging & configured database engine within prod since gunicorn targets prod.py by default                  |


SSH Reference: https://docs.microsoft.com/bs-latn-ba/Azure/app-service/containers/configure-custom-container#enable-ssh

