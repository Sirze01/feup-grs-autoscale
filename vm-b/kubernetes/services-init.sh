#! /bin/bash

docker build ./services/nginx-crab/ -t movie/crab

kind load docker-image movie/crab

for file in services/*.yaml; do 
    if [ -f "$file" ]; then 
        kubectl apply -f $file 
    fi 
done
