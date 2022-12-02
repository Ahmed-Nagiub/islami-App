import 'package:flutter/material.dart';

import 'home/tabs/ahadeth.dart';


class HadethDetails extends StatelessWidget {
  static const String routeName = 'HadethDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
              args.title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: ListView.builder(
            itemCount: args.content.length,
            itemBuilder: (context, index) {
              return Text(
                args.content[index],
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ],
    );
  }
}
