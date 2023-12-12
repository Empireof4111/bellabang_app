import 'package:bella_banga/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static String routeName = "/wishlist";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wishlist',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        leading: GestureDetector(
          onTap: () => {
            Navigator.pop(
              context,
            )
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 130,
          ),
          SvgPicture.asset(
            'assets/icons/Online wishes list-bro.svg',
            height: 250,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Add Item to Wishlist',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColor.darkOrange,
            ),
          ),
          const Text(
            'You have no whishlist yet.....',
          ),
        ],
      )),
    );
  }
}
