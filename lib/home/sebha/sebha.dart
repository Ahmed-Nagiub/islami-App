import 'package:flutter/material.dart';

import '../../my_theme.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  String botton = 'سبحان الله';

  double doubleAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                      doubleAngle += 10.0;
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Center(
                          child: Image.asset('assets/images/head_seb7a.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 75),
                        child: Center(
                          child: Transform(
                            transform: Matrix4.identity()..rotateZ((doubleAngle*5.5)*3.14/180),
                            alignment: FractionalOffset.center,
                            transformHitTests: true,
                            child: Image.asset(
                              'assets/images/body_seb7a.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'عدد التسبيحات',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 20),
                ),
                Container(
                  width: 69,
                  height: 81,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: Color.fromRGBO(183, 147, 95, 0.80),
                  ),
                  child: Text(
                    '$counter',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    onBtnClicked();
                  },
                  child: Text('$botton'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyThemeData.colorGold,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    minimumSize: Size(130, 60),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  int counter = 0;
  int counter2 = 0;
  List<String> tsbeh = ['استغفر الله', 'الله اكبر', 'سبحان الله'];

  void onBtnClicked() {
    counter++;
    if (counter == 33) {
      if (counter2 == 2) {
        counter2 = 0;
      } else {
        counter2++;
      }
      botton = tsbeh[counter2];
      counter = 0;
    }
    doubleAngle += 10.0;
    setState(() {});
  }
}
