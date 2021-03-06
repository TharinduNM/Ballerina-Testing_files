package wso2.samples.testAllUserAttributes;


transformer <json j, Name n> convertJsonToName() {
    n.givenName = j.givenName != null ? j.givenName.toString() : "";
    n.familyName = j.familyName.toString();
    n.formatted = j.formatted != null ? j.formatted.toString() : "";
    n.middleName = j.middleName != null ? j.middleName.toString() : "";
    n.honorificPrefix = j.honorificPrefix != null ? j.honorificPrefix.toString() : "";
    n.honorificSuffix = j.honorificSuffix != null ? j.honorificSuffix.toString() : "";
}

transformer <json j, User u> convertJsonToUser() {
    u.id = j.id.toString();
    u.userName = j.userName.toString();
    u.displayName = j.displayName != null ? j.displayName.toString() : "";
    u.name = j.name != null ? <Name, convertJsonToName()>j.name : {};
    u.active = j.active != null ? j.active.toString() : "";
    u.externalId = j.externalId != null ? j.externalId.toString() : "";
    u.nickName = j.nickName != null ? j.nickName.toString() : "";
    u.userType = j.userType != null ? j.userType.toString() : "";
    u.title = j.title != null ? j.title.toString() : "";
    u.timezone = j.timezone != null ? j.timezone.toString() : "";
    u.profileUrl = j.profileUrl != null ? j.profileUrl.toString() : "";
    u.preferredLanguage = j.preferredLanguage != null ? j.preferredLanguage.toString() : "";
    u.locale = j.locale != null ? j.locale.toString() : "";
    u.meta = <Meta, convertJsonToMeta()>j.meta;
    u.x509Certificates = j.x509Certificates != null ? j.x509Certificates.map(
                                                                        function (json j)(X509Certificate){
                                                                            return <X509Certificate, convertJsonToCertificate()>j;
                                                                        }) : [];
    u.schemas = j.schemas != null ? j.schemas.map(
                                             function (json j)(string){
                                                 return j.toString();
                                             }) : [];
    u.addresses =  j.addresses != null ? j.addresses.map(
                                                    function (json j)(Address){
                                                        return <Address, convertJsonToAddress()>j;
                                                    }) : [];
    u.phoneNumbers = j.phoneNumbers != null ? j.phoneNumbers.map(
                                                            function (json j)(PhonePhotoIms) {
                                                                return <PhonePhotoIms , convertJsonToPhoneNumbers()>j;
                                                            }) : [];
    u.photos = j.photos != null ? j.photos.map(
                                          function (json j)(PhonePhotoIms){
                                              return <PhonePhotoIms, convertJsonToPhoneNumbers()>j;
                                          }) : [];
    u.ims = j.ims != null ? j.ims.map(
                                 function (json j)(PhonePhotoIms){
                                     return <PhonePhotoIms, convertJsonToPhoneNumbers()>j;
                                 }) : [];
    u.emails = j.emails != null ? j.emails.map(
                                          function (json j)(Email){
                                              return <Email , convertJsonToEmail()>j;
                                          }) : [];
    u.groups = j.groups != null ? j.groups.map(
                                          function (json j)(Group){
                                              return <Group ,convertGroupInUser()>j;
                                          }) : [];
    u.|urn:scim:schemas:extension:enterprise:1.0| = j.|urn:scim:schemas:extension:enterprise:1.0| != null ? <EnterpriseExtension, convertJsonToEnterpriseExtension()>j.|urn:scim:schemas:extension:enterprise:1.0| : null;
}

transformer <json j, EnterpriseExtension e> convertJsonToEnterpriseExtension() {
    e.costCenter = j.costCenter != null ? j.costCenter.toString() : "";
    e.department = j.department != null ? j.department.toString() : "";
    e.division = j.division != null ? j.division.toString() : "";
    e.employeeNumber = j.employeeNumber != null ? j.employeeNumber.toString() : "";
    e.organization = j.organization != null ? j.organization.toString() : "";
    e.manager = j.manager != null ? <Manager,convertJsonToManager()>j.manager : {};
}

transformer <json j, Manager m> convertJsonToManager(){
    m.displayName = j.displayName != null ? j.displayName.toString() : "";
    m.managerId = j.managerId != null ? j.managerId.toString() : "";
}

transformer <json j, Address a> convertJsonToAddress() {
    a.streetAddress = j.streetAddress != null ? j.streetAddress.toString() : "";
    a.formatted = j.formatted != null ? j.formatted.toString() : "";
    a.country = j.country != null ? j.country.toString() : "";
    a.locality = j.locality != null ? j.locality.toString() : "";
    a.postalCode = j.postalCode != null ? j.postalCode.toString() : "";
    a.primary = j.primary != null ? j.primary.toString() : "false";
    a.region = j.region != null ? j.region.toString() : "";
}

transformer <json j, Meta m> convertJsonToMeta() {
    m.location = j.location.toString();
    m.lastModified = j.lastModified.toString();
    m.created = j.created.toString();
}

transformer <json j,PhonePhotoIms p> convertJsonToPhoneNumbers() {
    p.value = j.value.toString();
    p.|type| = j.|type|.toString();
}

transformer <json j,Email e> convertJsonToEmail() {
    e.|type| = j.|type| != null ? j.|type|.toString() : "";
    e.value = j.value != null ? j.value.toString() : "";
    e.primary = j.primary != null ? j.primary.toString() : "";
}

transformer <json j, Group g> convertGroupInUser() {
    g.displayName = j.display.toString();
    g.id = j.value.toString();
    g.members = j.members != null ? j.members.map(
                                             function(json j)(Member){
                                                 return <Member, convertJsonToMember()>j;
                                             }) : [];
    g.meta = j.meta != null ? <Meta, convertJsonToMeta()>j : {};

}

transformer <json j, Member m> convertJsonToMember() {
    m.value = j.value.toString();
    m.display = j.display.toString();
}

transformer <json j, X509Certificate x> convertJsonToCertificate(){
    x.value = j.value.toString();
}
//==========================================================================================================================================//
transformer <Group g, json j> convertGroupToJson(){
    j.display = g.displayName;
    j.value = g.id;
}

transformer <Name n, json j> convertNameToJson(){
    j.givenName = n.givenName;
    j.familyName = n.familyName;
    j.formatted = n.formatted;
    j.middleName = n.middleName;
    j.honorificPrefix = n.honorificPrefix;
    j.honorificSuffix = n.honorificSuffix;
}

transformer <Address a, json j> convertAddressToJson(){
    j.streetAddress = a.streetAddress;
    j.formatted = a.formatted;
    j.country = a.country;
    j.locality = a.locality;
    j.postalCode = a.postalCode;
    j.primary = a.primary;
    j.region = a.region;
}

transformer <Email e, json j> convertEmailToJson(){
    j.|type| = e.|type|;
    j.value = e.value;
    j.primary = e.primary;
}

transformer <PhonePhotoIms p, json j> convertPhonePhotoImsToJson(){
    j.value = p.value;
    j.|type| = p.|type|;
}

transformer <X509Certificate x, json j> convertCertificateToJson(){
    j.value = x.value;
}

transformer <EnterpriseExtension e, json j> convertEnterpriseExtensionToJson(){

}


transformer <User u, json j> convertUserToJson(){
    j.userName = u.userName;
    j.id = u.id;
    j.password = u.password;
    j.externalId = u.externalId;
    j.displayName = u.displayName;
    j.nickName = u.nickName;
    j.profileUrl = u.profileUrl;
    j.userType = u.userType;
    j.title = u.title;
    j.preferredLanguage = u.preferredLanguage;
    j.timezone = u.timezone;
    j.active = u.active;
    j.locale = u.locale;
    j.schemas = u.schemas != null ? u.schemas : [];
    j.name = u.name != null ? <json,convertNameToJson()>u.name : {};
    j.meta = {};
    json[] listCertificates = u.x509Certificates != null ? u.x509Certificates.map(
                                                                             function (X509Certificate x)(json){
                                                                                 return <json, convertCertificateToJson()>x;
                                                                             }) : [];
    j.x509Certificates = listCertificates;
    json[] listGroups = u.groups != null ? u.groups.map(
                                          function (Group g)(json){
                                              return <json ,convertGroupToJson()>g;
                                          }) : [];
    j.groups = listGroups;
    json[] listAddresses =  u.addresses != null ? u.addresses.map(
                                                    function (Address a)(json){
                                                        return <json, convertAddressToJson()>a;
                                                    }) : [];
    j.addresses = listAddresses;
    json[] listEmails = u.emails != null ? u.emails.map(
                                          function (Email e)(json){
                                              return <json , convertEmailToJson()>e;
                                          }) : [];
    j.emails = listEmails;
    json[] listNumbers = u.phoneNumbers != null ? u.phoneNumbers.map(
                                                            function (PhonePhotoIms p)(json) {
                                                                return <json , convertPhonePhotoImsToJson()>p;
                                                            }) : [];
    j.phoneNumbers = listNumbers;
    json[] listIms = u.ims != null ? u.ims.map(
                                 function (PhonePhotoIms i)(json){
                                     return <json, convertPhonePhotoImsToJson()>i;
                                 }) : [];
    j.ims = listIms;
    json[] listPhotos = u.photos != null ? u.photos.map(
                                          function (PhonePhotoIms p)(json){
                                              return <json, convertPhonePhotoImsToJson()>p;
                                          }) : [];
    j.photos = listPhotos;
}