import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../my_theme.dart';
import '../hadeth_number_item.dart';


class AhadethScreen extends StatefulWidget {
  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<Hadeth> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) {
      loadHadethFiles();
    }
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
                  child: Ahadeth.isEmpty
                      ? CircularProgressIndicator()
                      : ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            endIndent: 30,
                            indent: 30,
                            thickness: 1,
                            color: MyThemeData.colorGold,
                          ),
                          itemCount: Ahadeth.length,
                          itemBuilder: (context, index) {
                            return HadethNumberItem(Ahadeth[index].title,Ahadeth[index]);
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void loadHadethFiles() async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> AllAhadeth = content.trim().split('#');

    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      List<String> Hadethlines = hadeth.trim().split('\n');
      String title = Hadethlines[0];
      Hadethlines.removeAt(0);
      Hadeth hadethdata = Hadeth(title, Hadethlines);
      Ahadeth.add(hadethdata);
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth(this.title, this.content);
}
