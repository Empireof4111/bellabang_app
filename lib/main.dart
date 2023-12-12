import 'dart:ui' show PointerDeviceKind;
import 'package:bella_banga/routes.dart';
import 'package:bella_banga/src/provider/user_provider.dart';
import 'package:bella_banga/src/services/auth_services.dart';
import 'package:bella_banga/src/view/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:bella_banga/core/app_theme.dart';
import 'package:provider/provider.dart';

// import 'package:bella_banga/src/view/screen/home_screen.dart';

void main() => runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp())
);

class MyApp extends StatefulWidget {
 const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightAppTheme,
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const OnBoardingScreen(),
        
        //  initialRoute: routes.Route(),
        //  routes: 
        //  routes: <String, WidgetBuilder>{
        //   SignUpScreen.routeName: (BuildContext context) =>
        //       const SignUpScreen(),
        //   HomeScreen.routeName: (context) => const HomeScreen(),
        //   OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        //   CartScreen.routName: (context) => const CartScreen(),
        //   LoginScreen.routeName: (context) => const LoginScreen(),
        //   ForgotPasswordScreen.routeName: (context) =>
        //       const ForgotPasswordScreen(),
        //   MyAccountScreen.routeName: (context) => const MyAccountScreen(),
        //   MyOrderScreen.routeName: (context) => const MyOrderScreen(),
        //   MyAdressScreen.routeName: (context) => const MyAdressScreen(),
        //   WishlistScreen.routeName: (context) => const WishlistScreen(),
        //   AccountSettingScreen.routeName: (context) => const AccountSettingScreen(),
        //   OtpScreen.routeName: (context) => const OtpScreen(email: '',),
        //   UpdatePasswordScreen.routName: (context) => const UpdatePasswordScreen(),
        //   CheckoutScreen.routeName: (context) => const CheckoutScreen(),
        //   TrackOrderScreen.routeName: (context)    => const TrackOrderScreen(),    
        //   }
          
          );
  }
}
