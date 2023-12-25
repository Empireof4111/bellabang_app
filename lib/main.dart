import 'dart:ui' show PointerDeviceKind;
import 'package:bella_banga/boxes.dart';
import 'package:bella_banga/routes.dart';
import 'package:bella_banga/src/model/local_storage_model/addtocartmodel.dart';
import 'package:bella_banga/src/provider/user_provider.dart';
import 'package:bella_banga/src/services/auth_services.dart';
import 'package:bella_banga/src/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bella_banga/core/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import 'package:bella_banga/src/view/screen/home_screen.dart';

void main() async{
   await Hive.initFlutter();
   WidgetsFlutterBinding.ensureInitialized();
   Hive.registerAdapter(AddtocartmodelAdapter());
  cartBox = await Hive.openBox<Addtocartmodel>('AddcartBox');
  // HiveBoxes.cartBox = await Hive.openBox<AddToCart>(Constants.cartBoxName);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp())
);
} 

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
        home: const HomeScreen(),
          );
  }
}
