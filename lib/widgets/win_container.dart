import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/styles.dart';

class WinContainer extends StatelessWidget {
  WinContainer({super.key, required this.win1, required this.win2});
  String win1;
  String win2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        color: Styles.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 300,
                    height: 30,
                    color: Styles.darkBlue,
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 20,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                  width: 50,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    win1,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  width: 50,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    '-',
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  width: 50,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    win2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50,
            child: Text(
              '+100',
              style: Styles.h2White,
            ),
          )
        ],
      ),
    );
  }
}
