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
    curl -sr -X POST -H "$HEADER" -d "$JSON"  "$URL"  | cut -d '"'  -f8

}

TOKEN=$(autenticacao)

echo $TOKEN