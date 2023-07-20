import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bloc/matches_bloc.dart';
import '../models/boxing_mathes.dart';
import '../res/styles.dart';
import '../widgets/back_btn.dart';
import '../widgets/bet_container.dart';
import '../widgets/fight_card.dart';
import '../widgets/input_container.dart';
import 'favorites_page.dart';
import 'fights_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  BoxingMatches? matches;
  bool isLoading = true;
  bool isUp = true;
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
                        'The Game',
                        style: Styles.h1Green,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      FightCard(
                        star: false,
                        name1: isUp
                            ? matches?.matches[0].team1 ?? ''
                            : matches?.matches[3].team1 ?? '',
                        name2: isUp
                            ? matches?.matches[0].team2 ?? ''
                            : matches?.matches[3].team2 ?? '',
                        isComp: false,
                        firstWin: true,
                        date: false
                            ? DateFormat('dd.MM.yyyy').format(
                                DateTime.now().subtract(Duration(days: 2)))
                            : DateFormat('dd.MM.yyyy')
                                .format(DateTime.now().add(Duration(days: 2))),
                      ),
                      SizedBox(height: 20),
                      BetContainer(),
                      SizedBox(height: 20),
                      InputContainer(),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () => Get.to(FightsPage()),
                        child: Container(
                          width: 250,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Styles.green,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            '            MAKE A BET           ',
                            style: TextStyle(
                                color: Styles.darkBlue,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}
