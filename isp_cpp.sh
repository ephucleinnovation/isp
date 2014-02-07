mobatch -p 5 /home/ericsson/isp/sites_cpp.txt 'lt all;if $momversion ~ MGW; $password = mgw;fi;if $momversion ~ RNC;$password = rnc;fi ;ftget /c/logfiles/availability/CELLO_AVAILABILITY2_LOG.xml /home/ericsson/isp/$nodename_CELLO_AVAILABILITY2_LOG.xml'
cd /home/ericsson/isp
zip isp.zip *.xml
rm *.xml

