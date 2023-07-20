import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/styles.dart';

class FactorContainer extends StatelessWidget {
  FactorContainer({super.key, required this.isActive, required this.title});
  String title;
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Styles.darkBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/g1.svg'),
          Text(title, style: Styles.h2White),
          Icon(
            isActive ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            color: isActive ? Styles.green : Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
