#!/bin/bash

ruby /jena-fuseki/bin/s-post http://localhost:3030/skosmos/data default /tmp/yso-skos.ttl
ruby /jena-fuseki/bin/s-post http://localhost:3030/skosmos/data http://skos.um.es/unescothes/ /data/unescothes.ttl
java -cp $FUSEKI_HOME/fuseki-server.jar jena.textindexer --desc=/data/skosmos.ttl
