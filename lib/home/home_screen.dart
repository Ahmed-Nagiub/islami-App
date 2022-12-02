import 'package:flutter/material.dart';

import '../my_theme.dart';
import 'tabs/ahadeth.dart';
import 'tabs/quran.dart';
import 'tabs/radio.dart';
import 'tabs/sebha.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background.png',
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'islami',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index){
              currentIndex=index;
              setState(() {});
            },
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/radio.png'),
                  size: 30,
                ),
                label: 'radio',
                backgroundColor: MyThemeData.colorGold,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/sebha.png'),
                  size: 30,
                ),
                label: 'sebha',
                backgroundColor: MyThemeData.colorGold,
              ),BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                  size: 30,
                ),
                label: 'Ahadeth',
                backgroundColor: MyThemeData.colorGold,
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/moshaf.png'),
                  size: 30,
                ),
                label: 'Quran',
                backgroundColor: MyThemeData.colorGold,
              )
            ],
          ),
        ),
      ],
    );
  }
  List<Widget> tabs=[
    RadioScreen(),
    SebhaScreen(),
    AhadethScreen(),
    QuranScreen(),
  ];
}
