import 'package:flutter/material.dart';
import 'ahadeth_details.dart';
import 'home/home_screen.dart';
import 'sura_details.dart';
import 'my_theme.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName:(context)=> HadethDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
    ),
  );
}
