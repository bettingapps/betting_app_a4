import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/styles.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: 60,
          height: 20,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Styles.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'back',
            style: TextStyle(color: Color(0xff2B7BC0)),
          ),
        ),
      ),
    );
  }
}
