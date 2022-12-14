import 'package:flutter/material.dart';

import '../../hadeth_details/ahadeth_details.dart';
import 'ahadeth.dart';


class HadethNumberItem extends StatelessWidget {
  String name;
  Hadeth hadeth;
  HadethNumberItem(this.name,this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetails.routeName,
          arguments: hadeth,
        );
      },
      child: Center(
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
