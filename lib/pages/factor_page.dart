import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/matches_bloc.dart';
import '../models/boxing_mathes.dart';
import '../res/styles.dart';
import '../widgets/back_btn.dart';
import '../widgets/factor_container.dart';
import '../widgets/factor_tab/factor_tab.dart';

class FactorPage extends StatefulWidget {
  const FactorPage({super.key});

  @override
  State<FactorPage> createState() => _FactorPageState();
}

class _FactorPageState extends State<FactorPage> {
  int activeIndex = 0;
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
                      SizedBox(height: 50),
                      //-----
                      InkWell(
                        onTap: () => setState(() {
                          activeIndex = 0;
                        }),
                        child: FactorContainer(
                          isActive: activeIndex == 0,
                          title: 'Golden',
                        ),
                      ),
                      SizedBox(height: 20),
                      if (activeIndex == 0)
                        FactorTab(
                          list: matches!.matches.take(2).toList(),
                        ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () => setState(() {
                          activeIndex = 1;
                        }),
                        child: FactorContainer(
                          isActive: activeIndex == 1,
                          title: 'Royal',
                        ),
                      ),
                      SizedBox(height: 20),
                      if (activeIndex == 1)
                        FactorTab(list: [
                          matches!.matches[2],
                          matches!.matches[3],
                        ]),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () => setState(() {
                          activeIndex = 2;
                        }),
                        child: FactorContainer(
                          isActive: activeIndex == 2,
                          title: 'Club',
                        ),
                      ),
                      SizedBox(height: 20),
                      if (activeIndex == 2)
                        FactorTab(list: [
                          matches!.matches[4],
                          matches!.matches[5],
                        ]),
                      SizedBox(height: 30),
                      //-----
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}
