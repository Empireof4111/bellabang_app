// ignore_for_file: deprecated_member_use

import 'package:bella_banga/core/app_color.dart';
import 'package:bella_banga/src/view/screen/account_setting.dart';
import 'package:bella_banga/src/view/screen/login_screen.dart';
import 'package:bella_banga/src/view/screen/my_account_screen.dart';
import 'package:bella_banga/src/view/screen/my_address-Screen.dart';
import 'package:bella_banga/src/view/screen/my_orders_screen.dart';
import 'package:bella_banga/src/view/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = "/Profile";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Center(
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
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  // child: Image.asset('assets/images/profile_pic.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Hello, Basiru Yusif",
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
                      "My Account",
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
                      Navigator.pushNamed(context, MyOrderScreen.routeName);
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
                const SizedBox(height: 5),
                ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MyAdressScreen.routeName);
                    },
                    leading: SvgPicture.asset(
                      "assets/icons/Shop Icon.svg",
                      height: 22,
                      width: 22,
                      color: Colors.black,
                    ),
                    title: Text(
                      "My Address",
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
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.routeName, (route) => false);
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
      ),
    );
  }
}
