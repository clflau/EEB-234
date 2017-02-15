# This python script will take the eBird data and print out all the species and the families they belong to

import sys

source_data_file = open(sys.argv[1], encoding="ISO-8859-1")
source_data = source_data_file.readlines()

# make dictionary
fam_list = []
species_list = []
for lines in source_data[1: ]:
    xx = lines.split(",")
    fam_list.append(xx[7])
    species_list.append(xx[3])

species_dict = {}
for ii in range(len(species_list)):
    species_dict[species_list[ii]] = fam_list[ii]

# write for loop to print sentence
for key, value in species_dict.items():
    print("Species {} belongs to Family {}\n".format(key, value))

source_data_file.close()
