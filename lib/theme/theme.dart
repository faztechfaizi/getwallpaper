

import 'package:flutter/material.dart';
import 'package:getwallpaper/theme/text_theme.dart';


class TAPPTheme{
static ThemeData mainTheme = ThemeData(
    primaryColor: Colors.yellow,
scaffoldBackgroundColor: Colors.black,

bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,

),
bottomAppBarColor: Colors.yellow,

floatingActionButtonTheme: FloatingActionButtonThemeData(),
elevatedButtonTheme: ElevatedButtonThemeData
(style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xfffFFD700),
    foregroundColor: Colors.black,
    elevation: 5,
    textStyle: TextStyle(
    fontFamily: 'SubFont',
        fontSize: 20
),

)),
textTheme: tTextTheme

);
}

