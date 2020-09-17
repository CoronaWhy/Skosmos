from stain/jena-fuseki 
RUN apt-get update && \
apt-get install -y curl procps vim git ruby
RUN PATH=$PATH:/jena-fuseki/bin;export PATH
COPY datasets-loader.sh /fuseki
COPY /data/jena-text.jar /jena-fuseki/jena-text.jar 
RUN chmod 755 /jena-fuseki/bin/*
