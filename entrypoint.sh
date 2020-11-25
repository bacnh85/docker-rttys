#!/usr/bin/env sh

if [ "${RTTYS_TOKEN}" == "" ]; then 
    RTTYS_TOKEN=$(date +%s%N | md5sum | head -c 32); 
fi 

# Debug info
echo "Username: ${RTTYS_USERNAME}"
echo "Password: ${RTTYS_PASSWORD}"
echo "Token: ${RTTYS_TOKEN}"
echo "Version: ${RTTYS_VERSION}"
echo "Release: ${RTTYS_RELEASE}"
echo "CheckSum: ${RTTYS_CHECKSUM}"

# Generate config file
echo "http-username: ${RTTYS_USERNAME}" > /rttys/rttys.conf
echo "http-password: ${RTTYS_PASSWORD}" >> /rttys/rttys.conf
echo "token: ${RTTYS_TOKEN}" >> /rttys/rttys.conf

# Execute rttys
exec /rttys/rttys