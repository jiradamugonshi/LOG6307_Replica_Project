#!/bin/bash

# Search for repositories with size ranges from 101 to 500 kb and clone each one of them
gh search repos --size "100..500" --owner openstack --include-forks true --limit 1000 | while read -r repo _; do	
	gh repo clone "$repo" "$repo"
done

echo "cloning completed for repos with size ranges 101 to 500 kb."