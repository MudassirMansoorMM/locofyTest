import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproj2/ChangeNotifiers/InputNotifier.dart';
import '../../../config.dart';
import '../../../constants.dart';




class leftSection extends StatelessWidget{

  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Consumer<InputNotifier>(

      builder: (context, notifier , child) {

        return Expanded(
            flex: 4,
            child: Container(
               height: SizeConfig.height * 100,
              color: kText,
              child: Column(
                children: [

                  /// Search Bar
                  Expanded(
                    flex:1,
                    child: Container(
                      padding: EdgeInsets.all(kPadding/2),
                      margin: EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding/2),
                      decoration:circularEdges(10, 10, 10, 10, kPrimary.withOpacity(.1)),
                      child: TextField(
                        style: TextStyle(color: kPrimary),
                        controller: controller,
                        onChanged: (val){
                          Provider.of<InputNotifier>(context,listen: false).searchNode(val, context);
                        },
                        decoration: InputDecoration(
                          hintText: "Search Node",
                          hintStyle: TextStyle(color:kPrimary.withOpacity(.4))
                        )
                      ),
                    ),
                  ),



                  /// Message Pannel
                  Expanded(
                    flex:1,
                    child: Container(
                      padding: EdgeInsets.all(kPadding/2),
                      margin: EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding/2),
                      child: Text(notifier.message,style: TextStyle(color: kPrimary.withOpacity(.7)),),
                    ),
                  ),


                  /// Tree Panel
                  Expanded(
                    flex:9,
                    child: Padding(
                      padding: EdgeInsets.only(left:kPadding),
                      child: SingleChildScrollView(


                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children:

                            notifier.rows

                        )


                      ),
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );


  }




}