#!/bin/bash

cd "$(dirname "$0")"


if [ $1 ];
then
	echo "Custom IP: $1"
	export GT7_PLAYSTATION_IP=$1
else
	# fixed IP for PS5
	export GT7_PLAYSTATION_IP=192.168.1.5
fi

python3 helper/download_cars_csv.py

poetry run python3 -m bokeh serve . --allow-websocket-origin='192.168.1.*:5006'
