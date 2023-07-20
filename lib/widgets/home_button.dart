import 'package:flutter/material.dart';

import '../res/styles.dart';

class HomeButton extends StatelessWidget {
  HomeButton({super.key, required this.title, required this.function});
  String title;
  Function function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.3,
      height: 60,
      child: ElevatedButton(
        onPressed: () => function(),
        child: Text(title, style: Styles.h1Green),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Styles.darkBlue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white,
                  width: 0.1,
                )),
          ),
        ),
      ),
    );
  }
}
