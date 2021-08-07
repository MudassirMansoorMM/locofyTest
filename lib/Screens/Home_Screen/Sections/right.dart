import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproj2/ChangeNotifiers/InputNotifier.dart';

import '../../../config.dart';
import '../../../constants.dart';

class RightSection extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    return Expanded(
      flex: 3,
      child: Consumer<InputNotifier>(
        builder: (key, notifier, child){

          return Container(
            padding: EdgeInsets.all(kPadding),
            color: kText,
            height: SizeConfig.height * 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

              /// Selected Node
              Row(children: [

                Text("Selected Node: ",style: TextStyle(color: kPrimary)),
                Text(notifier.selectedNode, style: TextStyle(color: Colors.blueAccent),),

              ],),


              SizedBox(height:kPadding),

              /// Depth
              Row(children: [

                Text("Depth: ",style: TextStyle(color: kPrimary)),
                Text(notifier.selectedNode == "" ? "" : notifier.objects[notifier.selectedNode].depth.toString(), style: TextStyle(color: Colors.blueAccent),),

              ],)


            ],),
          );
        }
      ),
    );



  }




}
