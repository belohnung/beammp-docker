#!/bin/bash
chmod +x /home/container/BeamMP-Server
cd /home/container && MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')` && echo ":/home/container$ ${MODIFIED_STARTUP}" && ${MODIFIED_STARTUP}