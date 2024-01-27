// ignore_for_file: deprecated_member_use

import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/src/view/screen/edit_passoword_screen.dart';
import 'package:bella_banga/src/view/screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});
  static const String routeName = "/My-Account";
  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.lightOrange,
        title: const Text( 'My Personal Info', style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, EditProfileScreen.routeName);
                },
                leading: SvgPicture.asset(
                  "assets/icons/edit-profile.svg",
                  height: 30,
                  width: 30,
                  color: Colors.black,
                ),
                title: Text(
                  "Edit Profile",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                tileColor: AppColor.lightOrange.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            const SizedBox(height: 5),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, EditPasswordScreen.routeName);
                },
                leading: SvgPicture.asset(
                  "assets/icons/change-password-icon.svg",
                  height: 24,
                  width: 24,
                  color: Colors.black,
                ),
                title: Text(
                  "Change Password",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                tileColor: AppColor.lightOrange.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ],
        ),
      ),
    );
  }
}
