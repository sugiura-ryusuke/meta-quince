#!/bin/sh

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

NTP_SERVERS="ntp.nict.jp time.google.com"
NTPD="ntpd"

for i in ${NTP_SERVERS}; do
	NTPD="${NTPD} -p ${i}"
done

${NTPD}

