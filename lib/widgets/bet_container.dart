import 'package:flutter/material.dart';

import '../res/styles.dart';

class BetContainer extends StatelessWidget {
  const BetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 25,
                    color: Styles.darkBlue,
                    child: Text(
                      '1',
                      style: Styles.small15,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 25,
                    color: Styles.green,
                    child: Text(
                      '1.1',
                      style: Styles.small15,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 25,
                    color: Styles.darkBlue,
                    child: Text(
                      'x',
                      style: Styles.small15,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 25,
                    color: Styles.green,
                    child: Text(
                      '',
                      style: Styles.small15,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 25,
                    color: Styles.darkBlue,
                    child: Text(
                      '2',
                      style: Styles.small15,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 25,
                    color: Styles.green,
                    child: Text(
                      '2.1',
                      style: Styles.small15,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
