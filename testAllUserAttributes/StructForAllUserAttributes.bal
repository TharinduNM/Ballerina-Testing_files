package wso2.samples.testAllUserAttributes;


public struct Group{
    string displayName;
    string id;
    Member[] members;
    Meta meta;
}

public struct Member{
    string display;
    string value;
}

public struct User {
    string userName;
    string id;
    string password;
    string externalId;
    string displayName;
    string nickName;
    string profileUrl;
    string userType;
    string title;
    string preferredLanguage;
    string timezone;
    string active;
    string locale;
    json[] schemas;
    Name name;
    Meta meta;
    X509Certificate[] x509Certificates;
    Group[] groups;
    Address [] addresses;
    Email[] emails;
    PhonePhotoIms [] phoneNumbers;
    PhonePhotoIms [] ims;
    PhonePhotoIms [] photos;
    EnterpriseExtension |urn:scim:schemas:extension:enterprise:1.0|;
}

public struct Address{
    string streetAddress;
    string locality;
    string postalCode;
    string country;
    string formatted;
    string primary;
    string region;
}

public struct Name{
    string formatted;
    string givenName;
    string familyName;
    string middleName;
    string honorificPrefix;
    string honorificSuffix;
}

public struct Meta{
    string created;
    string location;
    string lastModified;
}

public struct PhonePhotoIms{
    string value;
    string |type|;
}

public struct Email{
    string value;
    string |type|;
    string primary;
}

public struct X509Certificate{
    string value;
}

public struct EnterpriseExtension {
    string employeeNumber;
    string costCenter;
    string organization;
    string division;
    string department;
    Manager manager;
}

public struct Manager{
    string managerId;
    string displayName;
}
