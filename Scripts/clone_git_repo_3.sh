#!/bin/bash

# Search for repositories with size ranges from 501 to 5000 kb and clone each one of them
gh search repos --size "501..1000" --owner openstack --include-forks true --limit 1000 | while read -r repo _; do	
	gh repo clone "$repo" "$repo"
done

echo "cloning completed for repos with size ranges from 501 to 1000 kb."