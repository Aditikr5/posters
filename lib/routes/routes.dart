import 'package:flutter/widgets.dart';
import 'package:newfile/main.dart';
import 'package:newfile/screens/First_Screen.dart';
import 'package:newfile/screens/second_screen.dart';
Map<String, WidgetBuilder> routes ={
  '/': (BuildContext context) => MyHomePage(),
  '/First_screen':(BuildContext context) => FirstScreen(),
  '/Second_screen':(BuildContext context) => SecondScreen(),
};