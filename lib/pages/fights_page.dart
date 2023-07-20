import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/matches_bloc.dart';
import '../models/boxing_mathes.dart';
import '../res/styles.dart';
import '../widgets/back_btn.dart';
import '../widgets/fight_card.dart';
import '../widgets/up_comp_button.dart';

class FightsPage extends StatefulWidget {
  const FightsPage({super.key});

  @override
  State<FightsPage> createState() => _FightsPageState();
}

bool isUp = true;

class _FightsPageState extends State<FightsPage> {
  BoxingMatches? matches;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    context.watch<MatchesBloc>().state.when(
          error: () {},
          loading: () {
            isLoading = true;
          },
          loaded: (m) {
            setState(() {
              isLoading = false;
              matches = m;
            });
            print(matches?.matches.length);
          },
        );
    return Scaffold(
      body: isLoading
          ? Container(
              decoration: Styles.boxWithGradient,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              decoration: Styles.boxWithGradient,
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BackBtn(),
                      SizedBox(height: 20),
                      Text(
                        'Fights',
                        style: Styles.h1Green,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 350),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              child: UpCompButton(
                                  title: 'Upcoming', isActive: isUp),
                              onTap: () => setState(() {
                                isUp = true;
                              }),
                            ),
                            InkWell(
                              child: UpCompButton(
                                  title: 'Completed', isActive: !isUp),
                              onTap: () => setState(() {
                                isUp = false;
                              }),
                            ),
                          ],
                        ),
                      ),
                      FightCard(
                        star: false,
                        name1: isUp
                            ? matches?.matches[0].team1 ?? ''
                            : matches?.matches[3].team1 ?? '',
                        name2: isUp
                            ? matches?.matches[0].team2 ?? ''
                            : matches?.matches[3].team2 ?? '',
                        isComp: !isUp,
                        firstWin: true,
                        date: isUp
                            ? DateFormat('dd.MM.yyyy').format(
                                DateTime.now().subtract(Duration(days: 1)))
                            : DateFormat('dd.MM.yyyy')
                                .format(DateTime.now().add(Duration(days: 1))),
                      ),
                      FightCard(
                        star: false,
                        name1: isUp
                            ? matches?.matches[1].team1 ?? ''
                            : matches?.matches[4].team1 ?? '',
                        name2: isUp
                            ? matches?.matches[1].team2 ?? ''
                            : matches?.matches[4].team2 ?? '',
                        isComp: !isUp,
                        firstWin: true,
                        date: isUp
                            ? DateFormat('dd.MM.yyyy').format(
                                DateTime.now().subtract(Duration(days: 2)))
                            : DateFormat('dd.MM.yyyy')
                                .format(DateTime.now().add(Duration(days: 2))),
                      ),
                      FightCard(
                        star: true,
                        name1: isUp
                            ? matches?.matches[2].team1 ?? ''
                            : matches?.matches[5].team1 ?? '',
                        name2: isUp
                            ? matches?.matches[2].team2 ?? ''
                            : matches?.matches[5].team2 ?? '',
                        isComp: !isUp,
                        firstWin: true,
                        date: isUp
                            ? DateFormat('dd.MM.yyyy').format(
                                DateTime.now().subtract(Duration(days: 2)))
                            : DateFormat('dd.MM.yyyy')
                                .format(DateTime.now().add(Duration(days: 3))),
                      ),
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}
