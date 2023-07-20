import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../res/styles.dart';

class FightCard extends StatefulWidget {
  FightCard({
    super.key,
    required this.name1,
    required this.name2,
    required this.isComp,
    required this.firstWin,
    required this.date,
    required this.star,
  });
  String name1;
  String name2;
  String date;
  bool isComp;
  bool firstWin;
  bool star;
  @override
  State<FightCard> createState() => _FightCardState();
}

class _FightCardState extends State<FightCard> {
  bool initFlag = true;
  bool oldComp = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text(widget.date, style: Styles.small15),
        SizedBox(height: 5),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400, minWidth: 200),
          child: Container(
            alignment: Alignment.center,
            height: 130,
            decoration: BoxDecoration(
                color: Styles.darkBlue,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/box_l.png'),
                      Text(
                        widget.name1,
                        style: Styles.small15,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(widget.isComp
                        ? 'assets/images/vs_comp.png'
                        : 'assets/images/vs.png'),
                    if (widget.isComp)
                      Container(
                        color: Styles.darkBlue.withOpacity(0.5),
                        child: widget.firstWin
                            ? Row(
                                children: [
                                  Text(
                                    ' W ',
                                    style: Styles.h1Green,
                                  ),
                                  Text(
                                    ' L ',
                                    style: Styles.h1Red,
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    ' L ',
                                    style: Styles.h1Red,
                                  ),
                                  Text(
                                    ' W ',
                                    style: Styles.h1Green,
                                  ),
                                ],
                              ),
                      )
                  ],
                ),
                Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/box_r.png'),
                      Text(
                        widget.name2,
                        style: Styles.small15,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Icon(
                    Icons.star,
                    color: widget.star ? Styles.green : Styles.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
