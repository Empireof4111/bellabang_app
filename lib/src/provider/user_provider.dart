import 'dart:convert';
import 'package:bella_banga/src/model/userModel.dart';
import 'package:flutter/material.dart'; // Import necessary dependencies

class UserProvider extends ChangeNotifier {
  User _user = User(
    // initialize with default values or empty strings
        id: null, 
        role: '', 
        uuid: '', 
        name: '', 
        businessName: '',
        businessEmail: '', 
        businessMobile: '', 
        businessAddress: '', 
        businessCacLink: '', 
        businessNepcLink: '', 
        description: '', 
        handle: '',
        idType: '', 
        idLink: '', 
        personalEmail: '', 
        email: '', 
        isVerified: '', 
        isSubscribed: '', 
        isEnabled: false, 
        gender: '', 
        kycLevel: null, 
        categoryId: '', 
        accountType: '',
        mobile: '', 
        preferredCurrency: '', 
        password: '', 
        status: '', 
        address: '', 
        country: '', 
        city: '', 
        dpLink: '', 
        thirdPartyToken: '', 
        authProvider: '', 
        location: '', 
        newsLetter: '', 
        lastLoginDate: null, 
        lastModifiedDate: null,
  );

  User get user => _user;

  void setUser(String jsonResponse) {
  try {
    final Map<String, dynamic> jsonData = jsonDecode(jsonResponse);

    if (jsonData.containsKey('user')) {
      final Map<String, dynamic> userData = jsonData['user'];
      _user = User.fromMap(userData);
      notifyListeners();
    } else {
      throw ArgumentError('Invalid JSON structure: "user" key not found');
    }
  } catch (e) {
    rethrow; // Re-throw the error to propagate it further if needed
  }
}

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
