package wso2.samples.testAllUserAttributes;

import ballerina.io;

public function main (string[] args) {

    json j =  {
                  "emails": [
                            {
                                "type": "work",
                                "value": "kim_j@wso2.com"
                            },
                            {
                                "type": "home",
                                "value": "kim.jackson@gmail.com"
                            }
                            ],
                  "meta": {
                              "created": "2018-03-08T18:40:50Z",
                              "location": "https://localhost:9443/scim2/Users/e310f831-be60-4b65-a821-dafb1b1f6bff",
                              "lastModified": "2018-03-08T18:47:12Z"
                          },
                  "schemas": ["sfdsfdsfadsa","dfasfdsafdsfasdf"],
                  "name": {
                              "givenName": "kim",
                              "familyName": "jackkkkkkkson"
                          },
                  "groups": [
                            {
                                "display": "BOSS",
                                "value": "dddef800-ef69-4241-be93-0d35b94d9932"
                            }
                            ],
                  "id": "e310f831-be60-4b65-a821-dafb1b1f6bff",
                  "userName": "kim"
              };

    User user = {};

    user = <User,convertJsonToUser()>j;
    io:println(user);
    //user.userName = "dilhe";
    //user.password = "fdajfkds";
    //Email e1 = {};
    //Email e2 = {};
    //e1.value = "emai.com";
    //e1.|type| = "work";
    //e2.value = "mail.com";
    //e2.|type| = "home";
    //user.x509Certificates = [{"value":"dfsdfasfdfas"}];
    //user.schemas = ["dfdsaf","fdsafdsaf"];
    //user.emails = [e1,e2];
    //j = <json,convertUserToJson()>user;
    //io:println(j);

}