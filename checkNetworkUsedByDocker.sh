#!/bin/bash
## Checking which of the networks are in use by running containers. After
## running: docker network ls 
for network in $(docker network ls --format "{{.Name}}"); do
    container_names=$(docker network inspect $network |
        jq -r '.[] | .Containers[] | .Name'
    )

    echo "$network:"
    if [ -z "$container_names" ]; then
        echo -e "\tNo containers"
    else
        while IFS= read -r line
        do
            echo -e "\t$line"
        done <<< "$container_names"
    fi
done
