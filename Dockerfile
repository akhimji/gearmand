FROM centos:latest
# Add reposdd
RUN rpm -ivh "https://labs.consol.de/repo/stable/rhel7/i386/labs-consol-stable.rhel7.noarch.rpm"
RUN rpm -ivh "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
RUN yum install -y gearmand.x86_64 gearmand-server.x86_64 mod_gearman.x86_64
ADD module.conf /etc/mod_gearman/module.conf
RUN useradd gearmand
RUN ["chown", "-R", "gearmand:gearmand", "/etc/mod_gearman"]
RUN ["chmod", "777", "/usr/sbin/gearmand"]
USER gearmand
EXPOSE 4730
ENTRYPOINT [ "gearmand" ]
