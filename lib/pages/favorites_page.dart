import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bloc/matches_bloc.dart';
import '../models/boxing_mathes.dart';
import '../res/styles.dart';
import '../widgets/back_btn.dart';
import '../widgets/fight_card.dart';
import '../widgets/up_comp_button.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

bool isUp = true;

class _FavoritesPageState extends State<FavoritesPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
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
                        'Favorites',
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
                        star: true,
                        name1: matches!.matches[6].team1,
                        name2: matches!.matches[6].team2,
                        isComp: !isUp,
                        firstWin: true,
                        date: isUp
                            ? DateFormat('dd.MM.yyyy').format(
                                DateTime.now().subtract(Duration(days: 1)))
                            : DateFormat('dd.MM.yyyy')
                                .format(DateTime.now().add(Duration(days: 1))),
                      ),
                      FightCard(
                        name1: matches!.matches[5].team1,
                        name2: matches!.matches[5].team2,
                        isComp: !isUp,
                        firstWin: false,
                        date: isUp
                            ? DateFormat('dd.MM.yyyy').format(
                                DateTime.now().subtract(Duration(days: 2)))
                            : DateFormat('dd.MM.yyyy')
                                .format(DateTime.now().add(Duration(days: 2))),
                        star: true,
                      ),
                      SizedBox(height: 30),
                      TableCalendar(
                        calendarFormat: CalendarFormat.twoWeeks,
                        headerVisible: false,
                        calendarStyle: CalendarStyle(
                            outsideTextStyle: TextStyle(color: Colors.white),
                            weekendTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            holidayTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            defaultTextStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                        daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay =
                                focusedDay; // update `_focusedDay` here as well
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}
