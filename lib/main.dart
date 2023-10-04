import 'package:books/screens/Announcements/Announcements.dart';
import 'package:books/screens/Books/books_screen.dart';
import 'package:books/screens/Books/search_book.dart';
import 'package:books/screens/auth/login_screen.dart';
import 'package:books/screens/auth/register.dart';
import 'package:books/screens/forum/forum.dart';
import 'package:books/screens/home/main_screen.dart';
import 'package:books/screens/problem/problem.dart';
import 'package:books/screens/problem/problemlist.dart';
import 'package:books/screens/solution/soutionlist.dart';
import 'package:books/screens/video/video.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        'register': (context) => const RegisterScreen(),
        'mainscreen': (context) => const MainScreen(),
        'homescreen': (context) => const BooksScreen(),
        'problem': (context) => const ProblemScreen(),
        'problemlist': (context) => const Problemlist(),
        'searchbook': (context) => const SearchBook(),
        'solutionlist': (context) => const Solutionlist(),
        'video': (context) => const VideoScreen(),
        'forum': (context) => const ForumScreen(),
        'Annousment': (context) => const Announcements(),
      },
    );
  }
}
