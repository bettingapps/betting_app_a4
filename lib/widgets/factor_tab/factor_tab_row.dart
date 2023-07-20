import 'package:flutter/material.dart';

import '../../res/styles.dart';

class FactorTabRow extends StatelessWidget {
  FactorTabRow({
    super.key,
    required this.name1,
    required this.name2,
    required this.win1,
    required this.win2,
  });
  String name1;
  String name2;
  String win1;
  String win2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
              top: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
              right: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/box_l.png',
                      scale: 1.9,
                    ),
                    Text(
                      name1,
                      style: Styles.small15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                width: 20,
                child: Image.asset(
                  'assets/images/vs.png',
                  scale: 2.2,
                ),
              ),
              Container(
                width: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/box_r.png',
                      scale: 1.9,
                    ),
                    Text(
                      name2,
                      style: Styles.small15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
              top: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
              right: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
            ),
          ),
          width: 60,
          height: 80,
          child: Text(
            win1,
            style: Styles.small15Green,
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
              top: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
              right: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
            ),
          ),
          width: 60,
          height: 80,
          child: Text(
            '-',
            style: Styles.small15Green,
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
              top: BorderSide(
                color: Styles.grey,
                width: .5,
              ),
            ),
          ),
          width: 60,
          height: 80,
          child: Text(
            win2,
            style: Styles.small15Green,
          ),
        ),
      ],
    );
  }
}
