import 'package:books/screens/Frames/frame24.dart';
import 'package:books/screens/auth/login_screen.dart';
import 'package:books/screens/auth/register.dart';
import 'package:books/screens/home/home_screen.dart';
import 'package:books/screens/home/main_screen.dart';
import 'package:books/screens/problem/problem.dart';
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
        initialRoute: 'frame24',
        routes: {
          'login': (context) => const LoginScreen(),
          'register': (context) => const RegisterScreen(),
          'mainscreen': (context) => const MainScreen(),
          'homescreen': (context) => const HomeScreen(),
          'frame24': (context) => const Frame24Screen(),
          'problem': (context) => const ProblemScreen(),
        },
      ),
    );
  }
}
