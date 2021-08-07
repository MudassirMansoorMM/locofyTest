import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'Sections/left.dart';
import 'Sections/middle.dart';
import 'Sections/right.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(
        backgroundColor: kBlue,
        elevation: 0,
        centerTitle: false,
        title: Text("CodingChallenge",style: TextStyle(color: kPrimary),),
      ),

      body: Container(

        child: Row(children: [


          LeftSection(),

          MiddleSection(),

          RightSection(),


        ],),
      ),


    );


  }



}
