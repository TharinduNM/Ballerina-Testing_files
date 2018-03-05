package wso2.samples.createGroup;

import ballerina.net.http;
import ballerina.io;

public function main(string[] args){
    endpoint<http:HttpClient> groupEP{
        create http:HttpClient("https://localhost:9443/scim2",getConnectionConfigs());
    }

    http:OutRequest req={};
    http:InResponse resp={};
    http:HttpConnectorError e;

    json payload =
    {
        "schemas": ["urn:scim:schemas:core:1.0"],
        "id": "",
        "meta": {},
        "displayName": "baiyo",
        "members": null
    };
    io:println(payload.getKeys());
    req.addHeader("Authorization", "Basic YWRtaW46YWRtaW4=");
    req.addHeader("Content-Type", "application/json");
    req.setJsonPayload(payload);

    resp,e=groupEP.post("/Groups",req);
    io:println(resp.getBinaryPayload());
}

function getConnectionConfigs()(http:Options){
    http:Options option = {
                              ssl:{
                                      trustStoreFile:"/home/tharindu/Documents/IS_HOME/repository/resources/security/truststore.p12",
                                      trustStorePassword:"wso2carbon"
                                  //hostNameVerificationEnabled:false
                                  },
                              followRedirects:{}

                          };
    return option;
}
