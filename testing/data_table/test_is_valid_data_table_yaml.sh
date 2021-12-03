#!/usr/bin/env sh

my_script="../../data_table/"

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "MICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
_EOF

#Test if it catches a bad grid name
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : ""
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
_EOF

#Test if it catches a bad fieldname_code
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : ""
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
_EOF

#Test if it catches a bad fieldname_file
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "stuff"
   factor            : 0.01
_EOF

#Test if it catches a interp method
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
   region_type       : "bad"
_EOF

#Test if it catches a bad region_type
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
   region_type       : "inside_region"
   lon_start         : 100.0
   lon_end           : 10.0
   lat_start         : -8.0
   lat_end           : 90.0
_EOF

#Test if it catches a lon_start > lon_end
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
   region_type       : "inside_region"
   lon_start         : 0
   lon_end           : 10.0
   lat_start         : -8.0
   lat_end           : -90.0
_EOF

#Test if it catches a lat_start > lat_end
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
   region_type       : "inside_region"
   lon_end           : 10.0
   lat_start         : -8.0
   lat_end           : 90.0
_EOF

#Test if it catches a missing lon_start
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
   region_type       : "inside_region"
   lon_start         : 0
   lat_start         : -8.0
   lat_end           : 90.0
_EOF

#Test if it catches a missing lon_end
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
   region_type       : "inside_region"
   lon_start         : 0
   lon_end           : 10.0
   lat_end           : 90.0
_EOF

#Test if it catches a missing lat_start
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

cat <<_EOF > test_data_table.yaml
data_table:
 - gridname          : "ICE"
   fieldname_code    : "sic_obs"
   fieldname_file    : "ice"
   file_name         : "INPUT/hadisst_ice.data.nc"
   interpol_method   : "bilinear"
   factor            : 0.01
   region_type       : "inside_region"
   lon_start         : 0
   lon_end           : 10.0
   lat_start         : -8.0
_EOF

#Test if it catches a missing lat_end
python3 ${my_script}is_valid_data_table_yaml.py -f test_data_table.yaml

