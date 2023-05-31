#! /bin/bash

for file in services/*; do 
    if [ -f "$file" ]; then 
        kubectl apply -f $file 
    fi 
done