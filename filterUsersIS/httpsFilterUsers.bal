package wso2.samples.filterUsersIS;

import ballerina.net.http;
import ballerina.io;

public function main (string[] args) {
    endpoint<http:HttpClient> httpEndpoint{
        create http:HttpClient("https://localhost:9443/scim2",getConnectionConfigs());
    }

    string name = "ashan Jayawardena";
    string[] n=name.split(" ");
    http:OutRequest req={};
    http:InResponse resp={};
    http:HttpConnectorError e;
    req.addHeader("Authorization", "Basic YWRtaW46YWRtaW4=");
    string s="/Users?filter=name.familyName+Eq+"+n[1];
    resp,e = httpEndpoint.get(s,req);

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
