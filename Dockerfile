FROM registry.access.redhat.com/ubi8/php-74
USER root
RUN sed -i 's/#DocumentRoot/DocumentRoot/g' /etc/httpd/conf/httpd.conf && \
    sed -i 's/enabled=1/enabled=0/g' /etc/yum/pluginconf.d/subscription-manager.conf && \
    yum update -y && yum clean all

#USER default
RUN echo "<?php phpinfo(); ?>" > index.php
ENTRYPOINT ["httpd", "-D", "FOREGROUND"]