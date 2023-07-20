import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/styles.dart';
import '../widgets/home_button.dart';
import 'factor_page.dart';
import 'favorites_page.dart';
import 'fights_page.dart';
import 'game_page.dart';
import 'my_games_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: Styles.boxWithGradient,
        alignment: Alignment.center,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              // // Image.asset('assets/images/logo.png'),
              // SizedBox(height: 30),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 40),
                    HomeButton(
                        title: 'Fights', function: () => Get.to(FightsPage())),
                    HomeButton(
                        title: 'Factor', function: () => Get.to(FactorPage())),
                    HomeButton(
                        title: 'Favorites',
                        function: () => Get.to(FavoritesPage())),
                    HomeButton(
                        title: 'The game', function: () => Get.to(GamePage())),
                    HomeButton(
                        title: 'My games',
                        function: () => Get.to(MyGamesPage())),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
