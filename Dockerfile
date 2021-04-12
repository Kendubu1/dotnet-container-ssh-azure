#Base Debian Image
FROM mcr.microsoft.com/dotnet/aspnet:5.0

#Install openssh-server w/ required credentials for Azure App Service
RUN apt-get update \
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd

#Copy SSH config file, startup script with 775 permissions
COPY sshd_config /etc/ssh/sshd_config
COPY start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/start.sh

#Copy the published .NETCore 5 project files to "/AzureApp" 
COPY bin/Release/net5.0/publish/ AzureApp/
WORKDIR /AzureApp

#Create enviorment variable for our sshd_config
ENV SSH_PORT 2222

#Expose ports needed for the sample app(80) & SSH on Azure(2222)
EXPOSE 80 2222

#Script used the entry point, this is were we start ssh & our .NETCore 5 app
ENTRYPOINT ["/usr/local/bin/start.sh"]
