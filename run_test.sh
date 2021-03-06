#!/bin/bash

apk update && apk add ca-certificates && update-ca-certificates && apk add openssl
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/i_investigation.txt -P /tmp/
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/s_BII-S-1.txt -P /tmp/
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/s_BII-S-2.txt -P /tmp/
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_metabolome.txt -P /tmp/
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_microarray.txt -P /tmp/
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_proteome.txt -P /tmp/
wget --no-check-certificate https://raw.githubusercontent.com/ISA-tools/ISAdatasets/master/tab/BII-I-1/a_transcriptome.txt -P /tmp/

isatab2json.py /tmp/ out.json

# check that files were created
if ! [ -e "/out.json" ]; then
	echo "Output ISA JSON file doesn't exist"
	exit 1
fi

echo "All files created successfully"
