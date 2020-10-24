#!/bin/bash

wget -q https://charity.gofundme.com/o/en/campaign/xi-endowment -O xi-endowment

raised=$(grep -i "donation_raised" xi-endowment | sed -e "s/__cr.set('page_specific.donation_raised', //" | sed -e "s/\..*$//" | xargs)

goal=$(grep -i "page_specific.goal" xi-endowment | sed -e "s/__cr.set('page_specific.goal', //" | sed -e "s/).*$//" | xargs)

fraction=$(awk -v raised="$raised" -v goal="$goal" 'BEGIN { printf "%.1f\n", 100 * raised / goal }')

echo "$fraction% raised towards goal"
