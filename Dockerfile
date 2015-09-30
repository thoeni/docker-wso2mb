#
# WSO2 MB 3.0.0 APLHA3 on CentOS Linux with Oracle JDK 1.8.0_60
#

FROM	thoeni/centos-oracle-java:1.8.0_60

MAINTAINER Antonio Troina, thoeni@gmail.com

ENV 	WSO2_SOFT_VER=3.0.0-ALPHA3

# copy zip from local folder to container
RUN	wget -P /opt https://github.com/wso2/product-mb/releases/download/v${WSO2_SOFT_VER}/wso2mb-${WSO2_SOFT_VER}.zip && \
	yum update -y && \
	yum install -y unzip && \
        unzip /opt/wso2mb-${WSO2_SOFT_VER}.zip -d /opt && \
	mv /opt/wso2mb-${WSO2_SOFT_VER} /opt/wso2mb && \
        rm /opt/wso2mb-${WSO2_SOFT_VER}.zip

EXPOSE 9443 9763 8243 8280 10389 8000 11111 9999 45564 4000 5672 8672 1883 8833 7611 7000 7001 9160 7199

CMD ["/opt/wso2mb/bin/wso2server.sh"]	
