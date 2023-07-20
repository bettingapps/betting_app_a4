import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/styles.dart';

class LoseContainer extends StatelessWidget {
  LoseContainer({super.key, required this.win1, required this.win2});
  String win1;
  String win2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 300,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Styles.grey,
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
                    height: 150,
                    color: Styles.darkBlue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Styles.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total win',
                                style: Styles.small10,
                              ),
                              Text(
                                '1500',
                                style: Styles.small15,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total lose',
                                style: Styles.small10,
                              ),
                              Text(
                                '200',
                                style: Styles.small15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 140,
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
            top: 175,
            child: Text(
              '-100',
              style: Styles.h2Red,
            ),
          )
        ],
      ),
    );
  }
}
