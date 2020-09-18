!/usr/bash

cp -R /fuseki/databases/skosmos /tmp/
rm /tmp/skosmos/tdb.lock
java -cp $FUSEKI_HOME/fuseki-server.jar jena.textindexer --desc=/data/skosmos.ttl
rm -rf /tmp/skosmos
