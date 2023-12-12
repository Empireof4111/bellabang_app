// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
    final int? id;
    final String? role;
    final String? uuid;
    final String? name;
    final String? businessName;
    final String? businessEmail;
    final String? businessMobile;
    final String? businessAddress;
    final String? businessCacLink;
    final String? businessNepcLink;
    final String? description;
    final String? handle;
    final String? idType;
    final String? idLink;
    final String? personalEmail;
    final String? email;
    final dynamic isVerified;
    final dynamic isSubscribed;
    final bool? isEnabled;
    final dynamic gender;
    final int? kycLevel;
    final dynamic categoryId;
    final String? accountType;
    final String? mobile;
    final dynamic preferredCurrency;
    final String? password;
    final String? status;
    final dynamic address;
    final String? country;
    final String? city;
    final dynamic dpLink;
    final dynamic thirdPartyToken;
    final String? authProvider;
    final dynamic location;
    final dynamic newsLetter;
    final int? lastLoginDate;
    final int? lastModifiedDate;
  User({
    this.id,
    this.role,
    this.uuid,
    this.name,
    this.businessName,
    this.businessEmail,
    this.businessMobile,
    this.businessAddress,
    this.businessCacLink,
    this.businessNepcLink,
    this.description,
    this.handle,
    this.idType,
    this.idLink,
    this.personalEmail,
    this.email,
    required this.isVerified,
    required this.isSubscribed,
    this.isEnabled,
    required this.gender,
    this.kycLevel,
    required this.categoryId,
    this.accountType,
    this.mobile,
    required this.preferredCurrency,
    this.password,
    this.status,
    required this.address,
    this.country,
    this.city,
    required this.dpLink,
    required this.thirdPartyToken,
    this.authProvider,
    required this.location,
    required this.newsLetter,
    this.lastLoginDate,
    this.lastModifiedDate,
  });

    // User({
    //     this.id,
    //     this.role,
    //     this.uuid,
    //     this.name,
    //     this.businessName,
    //     this.businessEmail,
    //     this.businessMobile,
    //     this.businessAddress,
    //     this.businessCacLink,
    //     this.businessNepcLink,
    //     this.description,
    //     this.handle,
    //     this.idType,
    //     this.idLink,
    //     this.personalEmail,
    //     this.email,
    //     this.isVerified,
    //     this.isSubscribed,
    //     this.isEnabled,
    //     this.gender,
    //     this.kycLevel,
    //     this.categoryId,
    //     this.accountType,
    //     this.mobile,
    //     this.preferredCurrency,
    //     this.password,
    //     this.status,
    //     this.address,
    //     this.country,
    //     this.city,
    //     this.dpLink,
    //     this.thirdPartyToken,
    //     this.authProvider,
    //     this.location,
    //     this.newsLetter,
    //     this.lastLoginDate,
    //     this.lastModifiedDate,
    // });

    // User copyWith({
    //     int? id,
    //     String? role,
    //     String? uuid,
    //     String? name,
    //     String? businessName,
    //     String? businessEmail,
    //     String? businessMobile,
    //     String? businessAddress,
    //     String? businessCacLink,
    //     String? businessNepcLink,
    //     String? description,
    //     String? handle,
    //     String? idType,
    //     String? idLink,
    //     String? personalEmail,
    //     String? email,
    //     dynamic isVerified,
    //     dynamic isSubscribed,
    //     bool? isEnabled,
    //     dynamic gender,
    //     int? kycLevel,
    //     dynamic categoryId,
    //     String? accountType,
    //     String? mobile,
    //     dynamic preferredCurrency,
    //     String? password,
    //     String? status,
    //     dynamic address,
    //     String? country,
    //     String? city,
    //     dynamic dpLink,
    //     dynamic thirdPartyToken,
    //     String? authProvider,
    //     dynamic location,
    //     dynamic newsLetter,
    //     int? lastLoginDate,
    //     int? lastModifiedDate,
    // }) => 
    //     User(
    //         id: id ?? this.id,
    //         role: role ?? this.role,
    //         uuid: uuid ?? this.uuid,
    //         name: name ?? this.name,
    //         businessName: businessName ?? this.businessName,
    //         businessEmail: businessEmail ?? this.businessEmail,
    //         businessMobile: businessMobile ?? this.businessMobile,
    //         businessAddress: businessAddress ?? this.businessAddress,
    //         businessCacLink: businessCacLink ?? this.businessCacLink,
    //         businessNepcLink: businessNepcLink ?? this.businessNepcLink,
    //         description: description ?? this.description,
    //         handle: handle ?? this.handle,
    //         idType: idType ?? this.idType,
    //         idLink: idLink ?? this.idLink,
    //         personalEmail: personalEmail ?? this.personalEmail,
    //         email: email ?? this.email,
    //         isVerified: isVerified ?? this.isVerified,
    //         isSubscribed: isSubscribed ?? this.isSubscribed,
    //         isEnabled: isEnabled ?? this.isEnabled,
    //         gender: gender ?? this.gender,
    //         kycLevel: kycLevel ?? this.kycLevel,
    //         categoryId: categoryId ?? this.categoryId,
    //         accountType: accountType ?? this.accountType,
    //         mobile: mobile ?? this.mobile,
    //         preferredCurrency: preferredCurrency ?? this.preferredCurrency,
    //         password: password ?? this.password,
    //         status: status ?? this.status,
    //         address: address ?? this.address,
    //         country: country ?? this.country,
    //         city: city ?? this.city,
    //         dpLink: dpLink ?? this.dpLink,
    //         thirdPartyToken: thirdPartyToken ?? this.thirdPartyToken,
    //         authProvider: authProvider ?? this.authProvider,
    //         location: location ?? this.location,
    //         newsLetter: newsLetter ?? this.newsLetter,
    //         lastLoginDate: lastLoginDate ?? this.lastLoginDate,
    //         lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
    //     );

    // factory User.fromJson(String str) => User.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    // factory User.fromMap(Map<String, dynamic> json) => User(
    //     id: json["id"],
    //     role: json["role"],
    //     uuid: json["uuid"],
    //     name: json["name"],
    //     businessName: json["businessName"],
    //     businessEmail: json["businessEmail"],
    //     businessMobile: json["businessMobile"],
    //     businessAddress: json["businessAddress"],
    //     businessCacLink: json["businessCACLink"],
    //     businessNepcLink: json["businessNEPCLink"],
    //     description: json["description"],
    //     handle: json["handle"],
    //     idType: json["idType"],
    //     idLink: json["idLink"],
    //     personalEmail: json["personalEmail"],
    //     email: json["email"],
    //     isVerified: json["isVerified"],
    //     isSubscribed: json["isSubscribed"],
    //     isEnabled: json["isEnabled"],
    //     gender: json["gender"],
    //     kycLevel: json["kycLevel"],
    //     categoryId: json["categoryId"],
    //     accountType: json["accountType"],
    //     mobile: json["mobile"],
    //     preferredCurrency: json["preferredCurrency"],
    //     password: json["password"],
    //     status: json["status"],
    //     address: json["address"],
    //     country: json["country"],
    //     city: json["city"],
    //     dpLink: json["dpLink"],
    //     thirdPartyToken: json["thirdPartyToken"],
    //     authProvider: json["authProvider"],
    //     location: json["location"],
    //     newsLetter: json["newsLetter"],
    //     lastLoginDate: json["lastLoginDate"],
    //     lastModifiedDate: json["lastModifiedDate"],
    // );

    // Map<String, dynamic> toMap() => {
    //     "id": id,
    //     "role": role,
    //     "uuid": uuid,
    //     "name": name,
    //     "businessName": businessName,
    //     "businessEmail": businessEmail,
    //     "businessMobile": businessMobile,
    //     "businessAddress": businessAddress,
    //     "businessCACLink": businessCacLink,
    //     "businessNEPCLink": businessNepcLink,
    //     "description": description,
    //     "handle": handle,
    //     "idType": idType,
    //     "idLink": idLink,
    //     "personalEmail": personalEmail,
    //     "email": email,
    //     "isVerified": isVerified,
    //     "isSubscribed": isSubscribed,
    //     "isEnabled": isEnabled,
    //     "gender": gender,
    //     "kycLevel": kycLevel,
    //     "categoryId": categoryId,
    //     "accountType": accountType,
    //     "mobile": mobile,
    //     "preferredCurrency": preferredCurrency,
    //     "password": password,
    //     "status": status,
    //     "address": address,
    //     "country": country,
    //     "city": city,
    //     "dpLink": dpLink,
    //     "thirdPartyToken": thirdPartyToken,
    //     "authProvider": authProvider,
    //     "location": location,
    //     "newsLetter": newsLetter,
    //     "lastLoginDate": lastLoginDate,
    //     "lastModifiedDate": lastModifiedDate,
    // };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'role': role,
      'uuid': uuid,
      'name': name,
      'businessName': businessName,
      'businessEmail': businessEmail,
      'businessMobile': businessMobile,
      'businessAddress': businessAddress,
      'businessCacLink': businessCacLink,
      'businessNepcLink': businessNepcLink,
      'description': description,
      'handle': handle,
      'idType': idType,
      'idLink': idLink,
      'personalEmail': personalEmail,
      'email': email,
      'isVerified': isVerified,
      'isSubscribed': isSubscribed,
      'isEnabled': isEnabled,
      'gender': gender,
      'kycLevel': kycLevel,
      'categoryId': categoryId,
      'accountType': accountType,
      'mobile': mobile,
      'preferredCurrency': preferredCurrency,
      'password': password,
      'status': status,
      'address': address,
      'country': country,
      'city': city,
      'dpLink': dpLink,
      'thirdPartyToken': thirdPartyToken,
      'authProvider': authProvider,
      'location': location,
      'newsLetter': newsLetter,
      'lastLoginDate': lastLoginDate,
      'lastModifiedDate': lastModifiedDate,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      role: map['role'] != null ? map['role'] as String : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      businessName: map['businessName'] != null ? map['businessName'] as String : null,
      businessEmail: map['businessEmail'] != null ? map['businessEmail'] as String : null,
      businessMobile: map['businessMobile'] != null ? map['businessMobile'] as String : null,
      businessAddress: map['businessAddress'] != null ? map['businessAddress'] as String : null,
      businessCacLink: map['businessCacLink'] != null ? map['businessCacLink'] as String : null,
      businessNepcLink: map['businessNepcLink'] != null ? map['businessNepcLink'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      handle: map['handle'] != null ? map['handle'] as String : null,
      idType: map['idType'] != null ? map['idType'] as String : null,
      idLink: map['idLink'] != null ? map['idLink'] as String : null,
      personalEmail: map['personalEmail'] != null ? map['personalEmail'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      isVerified: map['isVerified'] as dynamic,
      isSubscribed: map['isSubscribed'] as dynamic,
      isEnabled: map['isEnabled'] != null ? map['isEnabled'] as bool : null,
      gender: map['gender'] as dynamic,
      kycLevel: map['kycLevel'] != null ? map['kycLevel'] as int : null,
      categoryId: map['categoryId'] as dynamic,
      accountType: map['accountType'] != null ? map['accountType'] as String : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      preferredCurrency: map['preferredCurrency'] as dynamic,
      password: map['password'] != null ? map['password'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      address: map['address'] as dynamic,
      country: map['country'] != null ? map['country'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      dpLink: map['dpLink'] as dynamic,
      thirdPartyToken: map['thirdPartyToken'] as dynamic,
      authProvider: map['authProvider'] != null ? map['authProvider'] as String : null,
      location: map['location'] as dynamic,
      newsLetter: map['newsLetter'] as dynamic,
      lastLoginDate: map['lastLoginDate'] != null ? map['lastLoginDate'] as int : null,
      lastModifiedDate: map['lastModifiedDate'] != null ? map['lastModifiedDate'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}


// ignore_for_file: file_names

// import 'dart:convert';

// class User {
//   String? accountType;
//   String? name;
//   String? role;
//   String? email;
//   String? mobile;
//   String? idLink;
//   String? idType;
//   String? password;
//   String? businessCACLink;
//   String? businessNEPCLink;
//   String? businessName;
//   String? businessEmail;
//   String? businessMobile;
//   String? businessAddress;
//   String? country;
//   String? city;

//   User({
//     required this.accountType,
//     required this.name,
//     required this.role,
//     required this.email,
//     required this.mobile,
//     required this.idLink,
//     required this.idType,
//     required this.password,
//     required this.businessCACLink,
//     required this.businessNEPCLink,
//     required this.businessName,
//     required this.businessEmail,
//     required this.businessMobile,
//     required this.businessAddress,
//     required this.country,
//     required this.city,
//   });
//   factory User.fromMap(Map<String, dynamic>? map) {
//     return User(
//       accountType: map?['accountType'] ?? '',
//       name: map?['name'] ?? '',
//       role: map?['role'] ?? '',
//       email: map?['email'] ?? '',
//       mobile: map?['mobile'] ?? '',
//       idLink: map?['idLink'] ?? '',
//       idType: map?['idType'] ?? '',
//       password: map?['password'] ?? '',
//       businessCACLink: map?['businessCACLink'] ?? '',
//       businessNEPCLink: map?['businessNEPCLink'] ?? '',
//       businessName: map?['businessName'] ?? '',
//       businessEmail: map?['businessEmail'] ?? '',
//       businessMobile: map?['businessMobile'] ?? '',
//       businessAddress: map?['businessAddress'] ?? '',
//       country: map?['country'] ?? '',
//       city: map?['city'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'accountType': accountType,
//       'name': name,
//       'role': role,
//       'email': email,
//       'mobile': mobile,
//       'idLink': idLink,
//       'idType': idType,
//       'password': password,
//       'businessCACLink': businessCACLink,
//       'businessNEPCLink': businessNEPCLink,
//       'businessName': businessName,
//       'businessEmail': businessEmail,
//       'businessMobile': businessMobile,
//       'businessAddress': businessAddress,
//       'country': country,
//       'city': city,
//     };
//   }

// String toJson() => json.encode(toMap());

// factory User.fromJson(String source) => User.fromMap(json.decode(source));

//   User copyWith({
//     String? accountType,
//     String? name,
//     String? role,
//     String? email,
//     String? mobile,
//     String? idLink,
//     String? idType,
//     String? password,
//     String? businessCACLink,
//     String? businessNEPCLink,
//     String? businessName,
//     String? businessEmail,
//     String? businessMobile,
//     String? businessAddress,
//     String? country,
//     String? city,
//   }) {
//     return User(
//       accountType: accountType ?? this.accountType,
//       name: name ?? this.name,
//       role: role ?? this.role,
//       email: email ?? this.email,
//       mobile: mobile ?? this.mobile,
//       idLink: idLink ?? this.idLink,
//       idType: idType ?? this.idType,
//       password: password ?? this.password,
//       businessCACLink: businessCACLink ?? this.businessCACLink,
//       businessNEPCLink: businessNEPCLink ?? this.businessNEPCLink,
//       businessName: businessName ?? this.businessName,
//       businessEmail: businessEmail ?? this.businessEmail,
//       businessMobile: businessMobile ?? this.businessMobile,
//       businessAddress: businessAddress ?? this.businessAddress,
//       country: country ?? this.country,
//       city: city ?? this.city,
//     );
//   }
// }
