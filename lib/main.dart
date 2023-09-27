// // ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

// import 'package:books/screens/auth/login_screen.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Books',
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(backgroundColor: Color(4278231372)),
//         fontFamily: 'Inter',
//         colorScheme: ColorScheme.fromSeed(seedColor: Color(4278231372)),
//         useMaterial3: true,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }

import 'package:books/screens/auth/login_screen.dart';
import 'package:books/values/colors.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  update() {
    setState(() {});
  }

  @override
  // void initState() {
  //   LoadingHelper.onChangeAbsorbClick = update;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      // absorbing: LoadingHelper.absorbClick,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: Styles.lightTheme,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: mainColor),
          fontFamily: 'Inter',
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          useMaterial3: true,
        ),
        title: "Speak Logic",
        initialRoute: 'login',
        routes: {
          'login': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
