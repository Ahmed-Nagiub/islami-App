import 'package:flutter/material.dart';
import 'package:islami_c7_fri/my_theme.dart';
import 'package:islami_c7_fri/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme();
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Light',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(
                        color: provider.themeMode == ThemeMode.light
                            ? MyThemeData.colorGold
                            : MyThemeData.colorBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                      Icons.done,
                      size: 30,
                      color: provider.themeMode == ThemeMode.light
                          ? MyThemeData.colorGold
                          : MyThemeData.colorBlack),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme();
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Dark',
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(
                        color: provider.themeMode == ThemeMode.dark
                            ? MyThemeData.colorGold
                            : MyThemeData.colorBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: provider.themeMode == ThemeMode.dark
                        ? MyThemeData.colorGold
                        : MyThemeData.colorBlack,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}