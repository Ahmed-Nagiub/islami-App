import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c7_fri/my_theme.dart';
import 'package:islami_c7_fri/settings/settings.dart';
import 'hadeth/ahadeth.dart';
import 'quran/quran.dart';
import 'radio/radio.dart';
import 'sebha/sebha.dart';
import 'package:provider/provider.dart';
import 'package:islami_c7_fri/providers/my_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=4;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getBackground(),
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islami,
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
            items:  [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings,size: 25),
                label: 'settings',
                backgroundColor: MyThemeData.colorGold,
              ),
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
              ),
              BottomNavigationBarItem(
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
    settingsScreen(),
    RadioScreen(),
    SebhaScreen(),
    AhadethScreen(),
    QuranScreen(),

  ];
}
