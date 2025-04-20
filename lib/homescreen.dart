import 'package:danparking/components/myAccount.dart';
import 'package:danparking/map.dart';
import 'package:danparking/pickBookPage.dart';
import 'package:danparking/profile.dart';
import 'package:flutter/material.dart';
import 'l10n/ln01.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'login_and_signup.dart';
import 'provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:danparking/components/hompage.dart';
import 'package:danparking/book.dart';
import 'package:danparking/history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: const MyHomePage(),
            routes: {
              '': (context) => Login_page(),
              'verify': ((context) => Verify()),
              "/book": (context) => BookingPage(),
              "/hist": (context) => ParkHistory(),
              "/account": (context) => MyAccount(),
              "/myprofile": (context) => Profile(),
              "/map": (context) => MapScreen(),
              "/pickbook": (context) => PickBookPage(),
            },
          );
        },
      );
}
