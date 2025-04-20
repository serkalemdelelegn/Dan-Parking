import 'package:flutter/material.dart';
import 'package:danparking/homescreen.dart';
import 'package:danparking/login_and_signup.dart';
import 'book.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const HomeScreen(),
      '': (context) => const Login_page(),
      'verify': ((context) => const Verify()),
      "/book": (context) => const BookingPage(),
    },
  ));
}
