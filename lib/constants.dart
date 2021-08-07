import 'config.dart';
import 'package:flutter/material.dart';


/// Colors
const kPrimary = Color(0xFFFFFFFF);
const kBgLight = Color(0xFFF5F7F9);
const kAccent = Color(0xFF55E8C2);
const kText = Color(0xFF171D24);
const kTextLight = Color(0xFF969696);
const kRed = Color(0xFFE36767);
const kBlue = Color(0xFF17293E);


double kPadding = 20;



/// Rounded Container Properties
BoxDecoration circularEdges(double tl,double tr,double bl, double br, Color color){

  return BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(tl), topRight: Radius.circular(tr),bottomLeft: Radius.circular(bl),bottomRight: Radius.circular(br)),
    color: color,
  );


}


/// Accent Material Color
MaterialColor kAccentMaterial = MaterialColor(0xFF55E8C2, kAccentColor);

const Map<int, Color> kAccentColor =
{
  50: Color.fromRGBO(85,231,189, .1),
  100:Color.fromRGBO(85,231,189, .2),
  200:Color.fromRGBO(85,231,189, .3),
  300:Color.fromRGBO(85,231,189, .4),
  500:Color.fromRGBO(85,231,189, .6),
  400:Color.fromRGBO(85,231,189, .5),
  600:Color.fromRGBO(85,231,189, .7),
  700:Color.fromRGBO(85,231,189, .8),
  800:Color.fromRGBO(85,231,189, .9),
  900:Color.fromRGBO(85,231,189,  1),
};
