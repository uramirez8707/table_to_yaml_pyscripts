#!/usr/bin/env sh

my_script="../../data_table/"

cat <<_EOF > data_table
#THIS IS A COMMENT
"ICE", "sic_obs", "ice", "INPUT/hadisst_ice.data.nc", "bilinear", 0.01

"ICE", "sit_obs", "",    "INPUT/hadisst_ice.data.nc", "none",     2.0
"ICE", "sst_obs", "sst", "INPUT/hadisst_sst.data.nc", "bilinear", 1.0
_EOF

python3 ${my_script}data_table_to_yaml.py -f data_table
