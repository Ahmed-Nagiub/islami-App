import 'package:flutter/material.dart';

import '../../my_theme.dart';


class RadioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/radio_bg.png'),
              Text(
                'إذاعة القرآن الكريم',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous_sharp),iconSize: 35,color: MyThemeData.colorGold),
                  IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_sharp),iconSize: 35,color: MyThemeData.colorGold),
                  IconButton(onPressed: (){}, icon: Icon(Icons.skip_next_sharp),iconSize: 35,color: MyThemeData.colorGold),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
