import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_fri/providers/sura_provider.dart';
import '../my_theme.dart';
import 'package:provider/provider.dart';
import 'package:islami_c7_fri/providers/my_provider.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = 'SuraDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    return ChangeNotifierProvider(
      create: (context) => SuraProvider()..loadFile(args.index),
      builder: (context, child) {
        var pro = Provider.of<SuraProvider>(context);
        var provider = Provider.of<MyProvider>(context);
        return Stack(
          children: [
            Image.asset(
              provider.getBackground(),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Scaffold(
              appBar: AppBar(
                title: Text(
                  args.suraName,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              body: pro.verses.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: MyThemeData.colorGold,
                            indent: 30,
                            endIndent: 30,
                          ),
                      itemCount: pro.verses.length,
                      itemBuilder: (c, index) {
                        return Text(
                          pro.verses[index],
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: provider.themeMode == ThemeMode.light
                                      ? MyThemeData.colorBlack
                                      : MyThemeData.colorGold,
                                  letterSpacing: .45),
                          textAlign: TextAlign.center,
                        );
                      }),
            ),
          ],
        );
      },
    );
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
