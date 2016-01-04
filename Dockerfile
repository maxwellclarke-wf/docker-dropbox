FROM centos
# adapted from Nick Heinemans (nick@hostlogic.nl)
MAINTAINER Max Clarke (maxwelljclarke@gmail.com)

WORKDIR /root
VOLUME ["/root/Dropbox", "/root/.dropbox"]
ADD run_dropbox.sh /root/
RUN chmod +x /root/run_dropbox.sh

RUN yum install -y python tar \
&& yum clean all

RUN cd /home \
&& curl -L -s "https://www.dropbox.com/download?plat=lnx.x86_64" | tar -xz

RUN curl -L -s https://www.dropbox.com/download?dl=packages/dropbox.py -o /bin/dropbox.py \
&& chmod +x /bin/dropbox.py

ENTRYPOINT /root/run_dropbox.sh
