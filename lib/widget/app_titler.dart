import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pokodex/constant/constants.dart';
import 'package:pokodex/constant/ui_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(children: [
        Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Constants.title,
              style: Constants.getTitleStyle(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            Constants.pokeballImageUrl,
            width: UIHelper.getAppTitleImageHeight(),
            fit: BoxFit.fitWidth,
          ),
        )
      ]),
    );
  }
}
