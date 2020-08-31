#!/bin/bash

set -eu

# there are ultiple README CHANGES and dataset_description.json entries -- per each subject!... TODO: do it smarter
# Also suggested to implement at DataLad level:
# https://github.com/datalad/datalad/issues/4840

# Did some with awk magic and limiting only to url and filename columns
# but I think there might need to be smarter/better way

cat - | tail -n +2 | sed -e 's,"\t",\t,g' -e 's,^",,g' -e 's," *$,,g' | awk -F\\t -v OFS=\\t '/associated_file/{$7="filename"; print };/^[0-9]/{$7=gensub(/.*\/submission_[0-9]*\//, "", "g", $6); print }' | tr '\t' ',' | \
   awk -F, -v OFS=, '{print $6,$7;}' | \
   awk '!seen[$0]++' 
