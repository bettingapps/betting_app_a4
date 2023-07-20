import 'package:flutter/material.dart';

import '../res/styles.dart';

class UpCompButton extends StatelessWidget {
  UpCompButton({
    super.key,
    required this.title,
    required this.isActive,
  });
  String title;
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: isActive
              ? Border.all(
                  width: 0.5,
                  color: Styles.green,
                )
              : null,
        ),
        child: Text(title, style: Styles.h2White),
      ),
    );
  }
}
