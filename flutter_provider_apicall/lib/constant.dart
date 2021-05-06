import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Color AppBAr_BAR_END = Color(0xFF85C1E9);
Color themeBlue = Color.fromRGBO(0x1D, 0x18, 0x4E, 1);//1D184E
Color themePink = Color.fromRGBO(0xD8, 0x29, 0x8F, 1);//D8298F
Color themeGreen = Color.fromRGBO(0x3A, 0xA1, 0x88, 1);//3AA188
Color themeWhite = Color.fromRGBO(0xFF, 0xFF, 0xFF, 1);
Color themeBlueLight = Color.fromRGBO(0x3E, 0x39, 0x71, 1);//3E3782

FontWeight semiBold = FontWeight.w600;
const MaterialColor PrimaryColorDARK_BLUE = const MaterialColor(
  0xFF0E7AC7,
  const <int, Color>{
    50: const Color(0xFF0E7AC7),
    100: const Color(0xFF0E7AC7),
    200: const Color(0xFF0E7AC7),
    300: const Color(0xFF0E7AC7),
    400: const Color(0xFF0E7AC7),
    500: const Color(0xFF0E7AC7),
    600: const Color(0xFF0E7AC7),
    700: const Color(0xFF0E7AC7),
    800: const Color(0xFF0E7AC7),
    900: const Color(0xFF0E7AC7),
  },
);

showToast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 17.0
  );
}

isValidEmail(String email){
  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  return emailValid;
}

Widget progress(){
  return Center(child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  CircularProgressIndicator(
  backgroundColor: Colors.orange,
  valueColor: new AlwaysStoppedAnimation<Color>(Colors.green)
  ),
  SizedBox(height: 5,),
  Text("Loading...",style: TextStyle(fontSize: 17),)
  ],
  )
  );
}