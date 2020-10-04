#!/bin/bash


wget -q https://charity.gofundme.com/o/en/campaign/xi-endowment -O xi-endowment

raised=$(cat xi-endowment | grep -i "donation_raised" | sed -e "s/__cr.set('page_specific.donation_raised', //"| sed -e "s/\..*$//" | xargs)

goal=$(cat xi-endowment |grep -i "page_specific.goal" | sed -e "s/__cr.set('page_specific.goal', //" | sed -e "s/).*$//" | xargs)

fraction=$(awk -v raised=$raised -v goal=$goal 'BEGIN { printf "%.1f\n", 100 * raised / goal }')

echo "$fraction% raised towards goal"