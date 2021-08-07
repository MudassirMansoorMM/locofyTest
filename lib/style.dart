import 'package:flutter/material.dart';
import 'constants.dart';
import 'config.dart';


class AppTheme{
  AppTheme._();


  static final ThemeData lightTheme = ThemeData(

      iconTheme: IconThemeData(color: Colors.white),
      primaryColor: kPrimary,
      primaryColorLight: kPrimary,
      scaffoldBackgroundColor: kBgLight,
      brightness: Brightness.light,
      primarySwatch: kAccentMaterial


  );


  static final TextTheme lightTextTheme = TextTheme(

    headline1: _heading1,
    headline2: _heading2,
    headline3: _heading3,
    headline4: _heading4,
    headline5: _heading5,
    headline6: _heading6,
    subtitle1: heading1Bold,
    subtitle2: heading4Bold,

  );

  static final TextStyle heading1Bold = TextStyle(
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
    color: kText,
    fontSize: 3.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle heading4Bold = TextStyle(
    fontFamily: 'Nunito',
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 3.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _heading1 = TextStyle(
    fontFamily: 'Nunito',
    color: kText,
    fontWeight: FontWeight.w800,
    fontSize: 3.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _heading2 = TextStyle(
    fontFamily: 'Nunito',
    color: kText,
    fontSize: 2.2 * SizeConfig.textMultiplier ,

  );

  static final TextStyle _heading3 = TextStyle(
    fontFamily: 'Nunito',
    color: kText,
    fontSize: 1.8 * SizeConfig.textMultiplier ,

  );

  static final TextStyle _heading4 = TextStyle(
    fontFamily: 'Nunito',
    color: Colors.white,
    fontWeight: FontWeight.w100,
    fontSize: 3.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _heading5 = TextStyle(
    fontFamily: 'Nunito',
    color: Colors.white,
    fontSize: 2.2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _heading6 = TextStyle(
      fontFamily: 'Nunito',
      color: Colors.white,
      fontSize: 1.8 * SizeConfig.textMultiplier,
      fontWeight: FontWeight.bold
  );




}