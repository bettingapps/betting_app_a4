import 'package:flutter/material.dart';

import '../res/styles.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 300,
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(color: Styles.darkBlue),
        cursorColor: Styles.darkBlue,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'your prediction',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
