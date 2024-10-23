#!/bin/bash

# Create an array
dir_array_mirantis=() #("fuel-plugin-celebrer" "pmlc_cinder" "pmlc_keystone" "pmlc_neutron" "pmlc_nova" "profiles" "puppet-deployapp" "puppet-foreman_proxy"  "puppet-haproxy" "puppet-manifests" "puppet-module-keepalived"  "puppet-sudo" "puppetlabs-cinder" "puppetlabs-glance" "puppetlabs-mysql" "puppetlabs-nova" "puppetlabs-swift" "roles" "solar" "solar-resources")
dir_array_wikimedia=() #("analytics-vagrant-kraken" "operations-puppet")
dir_array_mozilla=("cheesecake")

# File to store the output
output_file="list_issues.txt"

# Clear the output file if it exists
> "$output_file"

# Loop through the array
for path in "${dir_array_wikimedia[@]}"; do
	gh issue list --repo "wikimedia/$path" >> "./$output_file" 2>&1
done

for path in "${dir_array_mirantis[@]}"; do
	gh issue list --repo "Mirantis/$path" >> "./$output_file" 2>&1
done

for path in "${dir_array_mozilla[@]}"; do
	gh issue list --repo "mozilla/$path" >> "./$output_file" 2>&1
done
