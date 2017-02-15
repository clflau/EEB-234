#!/bin/bash

wget http://www.birds.cornell.edu/clementschecklist/wp-content/uploads/2013/03/eBird_Taxonomy_v2016_9Aug2016.csv

# rename file to eBird_data
mv eBird_Taxonomy_v2016_9Aug2016.csv ./eBird_data.csv

# run replace_newlines.sh to change \r to \n
# the next line will create a new file called formatted_eBird_data.csv
replace_newlines.sh eBird_data.csv

# the next line will replace all extra commas and will replace the contents of formatted_eBird_data.csv
sed 's/,\s/ /g' formatted_eBird_data.csv > reformatted_eBird_data.csv

python ./eBird-species-fam.py reformatted_eBird_data.csv
