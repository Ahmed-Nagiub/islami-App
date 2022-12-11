import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:islami_c7_fri/home/hadeth/ahadeth.dart';

class HadethProvider extends ChangeNotifier {
  List<Hadeth> Ahadeth = [];

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
    notifyListeners();
  }
}
