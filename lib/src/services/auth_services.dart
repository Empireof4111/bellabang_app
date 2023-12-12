// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:bella_banga/error_handling.dart';
import 'package:bella_banga/src/model/userModel.dart';
import 'package:bella_banga/src/provider/user_provider.dart';
import 'package:bella_banga/src/utility.dart';
import 'package:bella_banga/src/view/screen/home_screen.dart';
import 'package:bella_banga/src/view/screen/login_screen.dart';
import 'package:bella_banga/src/view/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
//crreating the sign uo function
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String country,
    required String city,
  }) async {
    try {

      User user = User(
        id: null, 
        role: null, 
        uuid: null, 
        name: name, 
        businessName: null,
        businessEmail: null, 
        businessMobile: null, 
        businessAddress: null, 
        businessCacLink: null, 
        businessNepcLink: null, 
        description: null, 
        handle: null,
        idType: null, 
        idLink: null, 
        personalEmail: null, 
        email: email, 
        isVerified: null, 
        isSubscribed: null, 
        isEnabled: null, 
        gender: null, 
        kycLevel: null, 
        categoryId: null, 
        accountType: null,
        mobile: phoneNumber, 
        preferredCurrency: null, 
        password: password, 
        status: null, 
        address: null, 
        country: country, 
        city: city, 
        dpLink: null, 
        thirdPartyToken: null, 
        authProvider: null, 
        location: null, 
        newsLetter: null, 
        lastLoginDate: null, 
        lastModifiedDate: null,
        );
      http.Response res = await http.post(
        Uri.parse('https://service.phopis.com/bellabanga/api/user/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Register Successifull'); 
        String mailToVerify = (res.body);
        var outPut = jsonDecode(mailToVerify);
        print(outPut);
          Navigator.pushNamed(context, OtpScreen.routeName, arguments: outPut['payload']['email']!);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  //crreating the sign user function
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://service.phopis.com/bellabanga/api/user/signin'),
        body: jsonEncode({
          "username": email,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, 'Login Successifull');
          Provider.of<UserProvider>(context, listen: false).setUser((res.body)); ///Acccessing the main key User
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('Bearer', jsonDecode(res.body)['bearer']);
          Navigator.restorablePushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, 'Invalid Credential');
    }
  }
  
//Verify Account
void verifyUser({
    required BuildContext context,
    required String email,
    required String otp,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://service.phopis.com/bellabanga/api/user/verify'),
        body: jsonEncode({
          "username": email,
          "otp": otp,
        }),
        headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
         showSnackBar(context, "Your account verified");
          Navigator.restorablePushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


//Reset Password route
  void updatePassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://service.phopis.com/bellabanga/api/user/password-reset'),
        body: jsonEncode({
          "username": email,
          "password": password,
        }),
        headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
         showSnackBar(context, "Password Reset Successiful");
          Navigator.restorablePushNamedAndRemoveUntil(
              context, LoginScreen.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//Forgot password 
  void regenarateOtp({
    required BuildContext context,
    required String email,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://service.phopis.com/bellabanga/api/user/generate-otp'),
        body: jsonEncode({
          "username": email,
        }),
        headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
         showSnackBar(context, "Otp Sent");
          Navigator.pushNamed(context, OtpScreen.routeName, arguments: email);
        },
      );
    } catch (e) {
      print(e);
      // showSnackBar(context, e.toString());
    }
  }

  }



  