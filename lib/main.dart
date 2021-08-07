import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproj2/style.dart';
import 'ChangeNotifiers/InputNotifier.dart';
import 'Screens/Home_Screen/Home_Screen.dart';
import 'config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (context,constraints){

          return OrientationBuilder(


              builder: (context, orientation){


                SizeConfig().init(constraints,orientation);

                return MultiProvider(

                    providers: [
                      ChangeNotifierProvider(create: (_) => InputNotifier()),
                    ],


                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: AppTheme.lightTheme,
                    home: HomeScreen(),
                  ),

                );
              });
        });
  }
}
