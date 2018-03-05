package wso2.samples.getUsersFromIS;


import ballerina.net.http;
import ballerina.io;

function main(string[] args){
    endpoint<http:HttpClient> httpEndPoint{
        create http:HttpClient("https://localhost:9443/scim2",getConnectionConfigs());
    }
    http:OutRequest req={};
    http:InResponse resp={};
    http:HttpConnectorError e;
    req.addHeader("Authorization", "Basic YWRtaW46YWRtaW4="); // setting password:username to header = admin:admin
    resp, e = httpEndPoint.get("/Users", req);

    //conversion of received blob object to json.///////////////////
    json payload;
    string str = resp.getBinaryPayload().toString("UTF-8");
    payload, _ = <json>str;
    ///////////////////////////////////////////////////////////////

    io:println(payload);

}

//to set the certificates (keytool -importkeystore -srckeystore client-truststore.jks -destkeystore truststore.p12 -srcstoretype JKS -deststoretype PKCS12 -deststorepass wso2carbon -srcalias wso2carbon -destalias wso2carbon)
//using above command truststore should be created and used here to set certificate
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
