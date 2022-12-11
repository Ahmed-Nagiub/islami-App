import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_fri/providers/hadeth_provider.dart';
import 'package:islami_c7_fri/providers/my_provider.dart';
import 'package:islami_c7_fri/providers/sura_provider.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import 'hadeth_number_item.dart';

class AhadethScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethProvider()..loadHadethFiles(),
      builder: (context, child) {
        var pro = Provider.of<HadethProvider>(context);
        return Stack(
          children: [
            Scaffold(
              body: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset('assets/images/hadeth_main_bg.png'),
                    Divider(thickness: 2, color: MyThemeData.colorGold),
                    Text('الاحاديث',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: 18)),
                    Divider(thickness: 2, color: MyThemeData.colorGold),
                    Expanded(
                      child: pro.Ahadeth.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                endIndent: 30,
                                indent: 30,
                                thickness: 1,
                                color: MyThemeData.colorGold,
                              ),
                              itemCount: pro.Ahadeth.length,
                              itemBuilder: (context, index) {
                                return HadethNumberItem(
                                  pro.Ahadeth[index].title,
                                  pro.Ahadeth[index],
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth(this.title, this.content);
}
