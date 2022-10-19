#!/bin/sh

URL='http://localhost:8080/api_jsonrpc.php'
HEADER='Content-Type:application/json'

USER='"Admin"'
PASS='"zabbix"'

autenticacao()
{

    JSON='
    {   
        "jsonrpc":"2.0",
        "method":"user.login",
        "params":
        {
            "user": '$USER',
            "password":'$PASS'
        },
        "id":2
    }
    '
    curl -s -X POST -H "$HEADER" -d "$JSON"  "$URL"  | cut -d '"'  -f8

}

TOKEN=$(autenticacao)



pegarhosts()
{

    JSON='
    {
        "jsonrpc": "2.0",        
        "method": "host.get",
        "params":
        {
            "output": ["hostid", "host"],
            "selectInterfaces": ["interfaceid", "ip"]
        },
        "id": 2,
        "auth": "'$TOKEN'" 
    }    
    '
    curl -s -X POST -H "$HEADER" -d "$JSON" "$URL" | python3 -mjson.tool

}
pegarhosts
HOSTS=[$pegarhosts]
