import 'package:flutter/material.dart';
import 'package:khatabook_yarsalab_task/source/routes.dart';
import 'package:khatabook_yarsalab_task/source/screens/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        toggleableActiveColor: const Color(0xff92278F),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.pinkAccent,
        ),
        buttonColor: const Color(0xff92278F),
        hoverColor: const Color(0xA1FFD1A4),
        highlightColor: const Color(0x15FFD1A4),
        splashColor: const Color(0xA1FFD1A4),
        brightness: Brightness.light,
        primaryColor: const Color(0xff92278F),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              overlayColor: MaterialStateProperty.all<Color>(
                const Color(0x60FFD1A4),
              )),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(const Color(0x60FFD1A4)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(const Color(0x60FFD1A4)),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff92278F)),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xff92278F),
          splashColor: Color(0x45FFD1A4),
        ),
      ),
      initialRoute: HomePage.routeName,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
