podname=$(kubectl get pod -n default -o name | grep example-app)
if [ $? -ne 0 ]; then
   echo -e "get example-app failed"
   exit 1
fi

node=$(kubectl describe $podname -n default | grep "Node:")
nodeip=$(echo "${node##*/}" | xargs)

output=$(kubectl get svc example-app -n default -o yaml | grep nodePort:)
nodeport=$(echo "${output##*:}" | xargs)

echo -e '{\n\t"key1": "value1",\n\t"key2": "value2",\n\t"key3": "value3"\n}' > param.json
res_post=$(curl -vvv -X POST -H "Content-Type: application/json" http://$nodeip:$nodeport/appdetails -d @param.json)
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to execute POST to example-app"
    return 1
fi

res_get=$(curl -vvv -X GET -H "Content-Type: application/json" http://$nodeip:$nodeport/appdetails)
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to execute GET to example-app"
    return 1
fi
