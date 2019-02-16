# Loop through all json files in 'Update Logic App' Folder

for filename in *.json; do
    echo "$filename" 

    resource_group="$(jq -r '."resource-group"' $filename)" 
    logic_app="$(jq -r '."logic-app"' $filename)" 

    len=$(jq '.actions' $filename|jq length)
    
    for i in $( seq 0 $(($len - 1)) ); do
            
        action="$(jq -r .actions[$i]."action" $filename)"
        contract="$(jq -r .actions[$i]."contract" $filename)"
        addr="$(jq '.networks."1337".address' ../build/contracts/$contract.json)"

        echo ${resource_group}, ${logic_app}, ${action}, ${addr}

        az resource update --resource-group ${resource_group} \
            --resource-type "Microsoft.Logic/workflows" \
            --name ${logic_app} \
            --set properties.definition.actions.${action}.inputs.queries.contractAddress="$addr"
    done

    len2=$(jq '.triggers' $filename|jq length)
    
    for i in $( seq 0 $(($len2 - 1)) ); do
            
        trigger="$(jq -r .triggers[$i]."trigger" $filename)"
        contract="$(jq -r .triggers[$i]."contract" $filename)"
        addr="$(jq '.networks."1337".address' ../build/contracts/$contract.json)"

        echo ${resource_group}, ${logic_app}, ${trigger}, ${addr}

        az resource update --resource-group ${resource_group} \
            --resource-type "Microsoft.Logic/workflows" \
            --name ${logic_app} \
            --set properties.definition.triggers.${trigger}.inputs.queries.contractAddress="$addr"
    done

done
