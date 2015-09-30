#
# WSO2 MB 2.2.0 on CentOS Linux with Oracle JDK 1.7.0_80
#

FROM	thoeni/centos-oracle-java:1.7.0_80

MAINTAINER Antonio Troina, thoeni@gmail.com

ENV 	WSO2_SOFT_VER=2.2.0

# copy zip from local folder to container
RUN     wget -P /opt --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download" http://product-dist.wso2.com/products/message-broker/${WSO2_SOFT_VER}/wso2mb-${WSO2_SOFT_VER}.zip && \
	yum update -y && \
	yum install -y unzip && \
        unzip /opt/wso2mb-${WSO2_SOFT_VER}.zip -d /opt && \
	mv /opt/wso2mb-${WSO2_SOFT_VER} /opt/wso2mb && \
        rm /opt/wso2mb-${WSO2_SOFT_VER}.zip

EXPOSE 9443 9763 8243 8280 10389 8000 11111 9999 45564 4000 5672 8672 1883 8833 7611 7000 7001 9160 7199

CMD ["/opt/wso2mb/bin/wso2server.sh"]	
