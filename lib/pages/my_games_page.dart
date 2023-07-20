import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bloc/matches_bloc.dart';
import '../models/boxing_mathes.dart';
import '../res/styles.dart';
import '../widgets/back_btn.dart';
import '../widgets/bet_container.dart';
import '../widgets/fight_card.dart';
import '../widgets/input_container.dart';
import '../widgets/lose_contaner.dart';
import '../widgets/win_container.dart';

class MyGamesPage extends StatefulWidget {
  const MyGamesPage({super.key});

  @override
  State<MyGamesPage> createState() => _MyGamesPageState();
}

class _MyGamesPageState extends State<MyGamesPage> {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: Styles.boxWithGradient,
        child: SafeArea(
            child: isLoading
                ? Container(
                    decoration: Styles.boxWithGradient,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BackBtn(),
                          SizedBox(height: 20),
                          Text(
                            'The Game',
                            style: Styles.h1Green,
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          FightCard(
                            star: true,
                            name1: matches?.matches[4].team1 ?? '',
                            name2: matches?.matches[4].team2 ?? '',
                            isComp: false,
                            firstWin: true,
                            date: false
                                ? DateFormat('dd.MM.yyyy').format(
                                    DateTime.now().subtract(Duration(days: 2)))
                                : DateFormat('dd.MM.yyyy').format(
                                    DateTime.now().add(Duration(days: 2))),
                          ),
                          WinContainer(
                            win1: matches?.matches[4].odds1 ?? '',
                            win2: matches?.matches[4].odds2 ?? '',
                          ),
                          SizedBox(height: 20),
                          FightCard(
                            star: false,
                            name1: matches?.matches[5].team1 ?? '',
                            name2: matches?.matches[5].team2 ?? '',
                            isComp: false,
                            firstWin: true,
                            date: false
                                ? DateFormat('dd.MM.yyyy').format(
                                    DateTime.now().subtract(Duration(days: 2)))
                                : DateFormat('dd.MM.yyyy').format(
                                    DateTime.now().add(Duration(days: 2))),
                          ),
                          LoseContainer(
                            win1: matches?.matches[5].odds1 ?? '',
                            win2: matches?.matches[5].odds2 ?? '',
                          )
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }
}
