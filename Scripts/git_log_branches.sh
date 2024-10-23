#!/bin/bash

# Create an array
#dir_array=("fuel-plugin-celebrer/" "fuel-plugin-external-ceph/" "pmlc_cinder/" "pmlc_keystone/" "pmlc_neutron/" "pmlc_nova/" "profiles/" "puppet-deployapp/" "puppet-foreman_proxy/" "puppet-haproxy/" "puppet-kafka/" "puppetlabs-apt/" "puppetlabs-cinder/" "puppetlabs-glance/" "puppetlabs-keystone/" "puppetlabs-mysql/" "puppetlabs-nova/" "puppetlabs-openstack/" "puppetlabs-rsync/" "puppetlabs-swift/" "puppet-manifests/" "puppet-mmm/" "puppet-module-keepalived/" "puppet-savanna/" "puppet-ssh/" "puppet-sudo/" "roles/" "solar/" "solar-resources/")
#dir_array=("analytics-vagrant-kraken/" "mediawiki-vagrant/" "operations-puppet/" "operations-puppet-cdh4/" "operations-puppet-kafka/" "operations-puppet-mariadb/" "operations-puppet-wikimetrics/")
#dir_array=("cheesecake/" "oldpto/" "opsec-puppet" "socorro-infra/")
dir_array=("devstack-vagrant/" "puppet-barbican/" "puppet-ceph/" "puppet-cinder/" "puppet-cloudkitty/" "puppet-designate/" "puppet-glance/" "puppet-gnocchi/" "puppet-heat/" "puppet-ironic/" "puppet-magnum/" "puppet-manila/" "puppet-mistral/" "puppet-octavia/" "puppet-openstack-cookiecutter/" "puppet-openstack-integration/" "puppet-oslo/" "puppet-placement/" "puppet-swift/" "puppet-vitrage/" "puppet-watcher/" "puppet-zaqar/")


# File to store the output
output_file="output.csv"

# Clear the output file if it exists
> "$output_file"

cd "../Replica/openstack"
# Loop through the array
for path in "${dir_array[@]}"; do
	cd $path
	git log --pretty=format:"${PWD##*/};%h;%an;%cs%n" >> "../../../Replica_Project/$output_file" 2>&1
	cd ../
done
