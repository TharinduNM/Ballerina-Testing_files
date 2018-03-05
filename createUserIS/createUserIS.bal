package wso2.samples.createUserIS;

import ballerina.net.http;
import ballerina.io;

public function main (string[] args) {
    endpoint<http:HttpClient> httpEndpoint{
        create http:HttpClient("https://localhost:9443/scim2",getConnectionConfigs());
    }

    http:OutRequest req={};
    http:InResponse resp={};
    http:HttpConnectorError e;

    //json payload = {"schemas":[],"name":{"familyName":"malawaraarachchi"},"userName":"tharindu14",
    //                   "password":"tn@wso2","emails":[{"value":"kim.jackson@gmail.com","type":"home"},
    //                                                            {"value":"kim.jackson@gmail.com","type":"work"}]
    //                  };



    json payload = {
                       "emails": [{
                                      "type": "work",
                                      "value": "kim_j@wso2.com"
                                  },
                                  {
                                      "type": "home",
                                      "value": "kim.jackson@gmail.com"
                                  }
                                 ],
                       "ims": [],
                       "photos": [],
                       "addresses": [],
                       "groups": [],
                       "entitlements": [],
                       "roles": [],
                       "x509Certificates": [],
                       "meta": {

                               },
                       "EnterpriseUser": {

                                         },
                       "name": {
                                   "givenName": "tharindu",
                                   "familyName": "malawaraarachchi"
                               },
                       "id": "",
                       "userName": "tnm",
                       "password": "killlosfd",
                       "displayName": "Tharindu",
                       "nickName": "",
                       "profileUrl": "",
                       "title": "president",
                       "userType": "Employee",
                       "preferredLanguage": "sinhala",
                       "locale": "colombo",
                       "timezone": "",
                       "active": "",
                       "phoneNumbers": [{
                                            "type": "home",
                                            "value": "345343"
                                        },
                                        {
                                            "type": "work",
                                            "value": "0909099999"
                                        }
                                       ]
                   };




    req.addHeader("Authorization", "Basic YWRtaW46YWRtaW4=");
    req.addHeader("Content-Type", "application/json");
    req.setJsonPayload(payload);

    resp,e=httpEndpoint.post("/Users",req);
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
