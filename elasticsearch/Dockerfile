ARG ELK_VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}

COPY config/sg/ config/sg/
COPY bin/ bin/

# Search Guard plugin
ARG ELK_VERSION
ARG SG_VERSION
RUN elasticsearch-plugin install --batch https://releases.floragunn.com/search-guard-7/${ELK_VERSION}-${SG_VERSION}/search-guard-7-${ELK_VERSION}-${SG_VERSION}.zip \
	&& chmod +x plugins/search-guard-7/tools/*.sh \
	&& chown -R elasticsearch config/sg/ \
	&& chmod -R go= config/sg/

# sgadmin and other third-party tools require a valid Java home
ENV JAVA_HOME /usr/share/elasticsearch/jdk

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu
## ES-Hadoop here
#RUN apk update 
RUN yum -y upgrade
RUN yum -y install wget
RUN wget https://artifacts.elastic.co/downloads/elasticsearch-hadoop/elasticsearch-hadoop-7.6.2.zip
RUN yum install unzip
RUN unzip elasticsearch-hadoop-7.6.2.zip
