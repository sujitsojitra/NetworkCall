import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color AppBAr_BAR_END = Color(0xFF85C1E9);


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