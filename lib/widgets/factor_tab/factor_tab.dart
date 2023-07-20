import 'package:flutter/material.dart';

import '../../models/boxing_mathes.dart';
import 'factor_tab_header.dart';
import 'factor_tab_row.dart';

class FactorTab extends StatelessWidget {
  FactorTab({super.key, required this.list});
  List<BoxingMatch> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FactorTabHeader(),
          FactorTabRow(
            name1: list[0].team1,
            name2: list[0].team2,
            win1: list[0].odds1,
            win2: list[0].odds2,
          ),
          FactorTabRow(
            name1: list[1].team1,
            name2: list[1].team2,
            win1: list[1].odds1,
            win2: list[1].odds2,
          ),
        ],
      ),
    );
  }
}
