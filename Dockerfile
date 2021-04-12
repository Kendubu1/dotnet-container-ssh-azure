FROM mcr.microsoft.com/dotnet/aspnet:5.0

RUN apt-get update \
  && apt-get install -y --no-install-recommends openssh-server \
  && echo "root:Docker!" | chpasswd


COPY sshd_config /etc/ssh/sshd_config
COPY start.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/start.sh

COPY bin/Release/net5.0/publish/ AzureApp/
WORKDIR /AzureApp

ENV SSH_PORT 2222
EXPOSE 80 2222
#ENTRYPOINT ["dotnet", "howdy.dll"]
ENTRYPOINT ["/usr/local/bin/start.sh"]
