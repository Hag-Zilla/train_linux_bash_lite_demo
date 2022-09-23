#!/bin/bash

##### Parameters
cards_chart=(rtx3060 rtx3070 rtx3080 rtx3090 rx6700)
url_target='http://0.0.0.0:5000/'

##### Collection function
function collect_func {

	##### Variables management
	local var1=$1 # Url target
	shift # Shit all arguments to the left in order to get all cards name
	local var2=("$@") # Card chart

	##### Date read and write
	local now=$(date)
	echo "$now" >> ~/exam_MASCHEIX/sales.txt

	##### Read loop
	for card_sel in ${var2[@]}
		do
			# Read sales value
			local sales_val=$(curl --silent "${var1}${card_sel}")
			# Write sales value
			echo "$card_sel:$sales_val" >> ~/exam_MASCHEIX/sales.txt
		done
}

##### Call of the function
collect_func "$url_target" "${cards_chart[@]}"
