// ignore_for_file: deprecated_member_use

import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/src/provider/user_provider.dart';
import 'package:bella_banga/src/services/auth_services.dart';
import 'package:bella_banga/src/view/screen/account_setting.dart';
import 'package:bella_banga/src/view/screen/my_account_screen.dart';
import 'package:bella_banga/src/view/screen/my_orders_screen.dart';
import 'package:bella_banga/src/view/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/Profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final AuthService authService = AuthService();

  void logOut() async {
    authService.signOutUser(context);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.lightOrange,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child){
          final user = userProvider.user;
      return  Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/images/logo002.png"),
          ),

          // Positioned(
          //   right: -16,
          //   bottom: 0,
          //   child: SizedBox(
          //     height: 46,
          //     width: 46,
          //     child: TextButton(
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.white, shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(50),
          //           side: BorderSide(color: Colors.white),
          //         ),
          //         backgroundColor: Color(0xFFF5F6F9),
          //       ),
          //       onPressed: () {},
          //       child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
          //     ),
          //   ),
          // )
       
        ],
      ),
    ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Hi ${user.name}",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, MyAccountScreen.routeName);
                      },
                      leading: SvgPicture.asset(
                        "assets/icons/User.svg",
                        height: 22,
                        width: 22,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Personal info",
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
                        Navigator.pushNamed(context, MyOrderScreen.routeName, arguments: user.id);
                      },
                      leading: SvgPicture.asset(
                        "assets/icons/shopping-bag.svg",
                        height: 24,
                        width: 24,
                        color: Colors.black,
                      ),
                      title: Text(
                        "My Order",
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
                  // const SizedBox(height: 5),
                  // ListTile(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, MyAdressScreen.routeName);
                  //     },
                  //     leading: SvgPicture.asset(
                  //       "assets/icons/Shop Icon.svg",
                  //       height: 22,
                  //       width: 22,
                  //       color: Colors.black,
                  //     ),
                  //     title: Text(
                  //       "My Address",
                  //       style: Theme.of(context).textTheme.displaySmall,
                  //     ),
                  //     trailing: const Icon(
                  //       Icons.arrow_forward_ios,
                  //       size: 20,
                  //       color: Colors.black,
                  //     ),
                  //     tileColor: AppColor.lightOrange.withOpacity(0.1),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     )),
                  const SizedBox(height: 5),
                  ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, WishlistScreen.routeName);
                      },
                      leading: SvgPicture.asset(
                        "assets/icons/Heart Icon.svg",
                        height: 22,
                        width: 22,
                        color: Colors.black,
                      ),
                      title: Text(
                        "My Wishlist",
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
                        Navigator.pushNamed(
                            context, AccountSettingScreen.routeName);
                      },
                      leading: SvgPicture.asset(
                        "assets/icons/Settings.svg",
                        height: 22,
                        width: 22,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Settings",
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
                      onTap: () async {
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.remove('user_data');
                       logOut();
                      },
                      leading: SvgPicture.asset(
                        "assets/icons/Logout.svg",
                        height: 22,
                        width: 22,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Log out",
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      
        },

      ),
    );
  }
}
