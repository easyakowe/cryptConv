import 'package:bitcoin_ticker/welcome.dart';
import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFf44336),
          scaffoldBackgroundColor: Color(0xFFF2F2F2),
      ),
      home: WelcomeScreen(),
    );
  }
}
