#!/usr/bin/env bash
set -e
networkBytes=80
privateKey=`echo -ne ${networkBytes}${1}`
privateKeyAsHex=$(echo -ne ${privateKey} |  sed -e 's/../\\x&/g')
echo "Network private key: ${privateKey}"

firstSha256=$(echo -ne ${privateKeyAsHex} | shasum -a 256 | cut -f1 -d' ')
echo "Private key SHA256 (1): ${firstSha256}"

firstSha256AsHex=$(echo -ne ${firstSha256} |  sed -e 's/../\\x&/g')

secondSha256=$(echo -ne ${firstSha256AsHex} | shasum -a 256 | cut -f1 -d' ')
echo "Private key SHA256 (2): ${secondSha256}"

checksum=$(echo ${secondSha256} | cut -c1-8 | awk '{print toupper($0)}')
echo "Checksum: ${checksum}"

privateKeyAndCheckSum=$(echo -ne "${privateKey}${checksum}")
echo "Network private key + checksum: ${privateKeyAndCheckSum}"

java -jar base58converter.jar ${privateKeyAndCheckSum}
