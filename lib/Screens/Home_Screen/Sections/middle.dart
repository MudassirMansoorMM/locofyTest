import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproj2/ChangeNotifiers/InputNotifier.dart';
import '../../../constants.dart';




class MiddleSection extends StatelessWidget {


  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Expanded(
        flex: 10,
        child: Container(
          padding: EdgeInsets.all(kPadding * 2),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text( "Enter valid json below : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )),
              ),



              Expanded(

                child: Stack(
                  children: [

                    Container(
                      decoration: circularEdges(10, 10, 10, 10, kTextLight.withOpacity(.5)),
                    ),

                    Container(
                      padding: EdgeInsets.all(kPadding/2),

                      child: TextFormField(

                        onChanged: (input){
                          Provider.of<InputNotifier>(context,listen: false).updateInput(input,context);
                        },
                        controller: controller,
                        expands: true,
                        maxLines: null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none
                        ),

                      ),
                    ),
                  ],
                ),
              )


            ],),
        )
    );


  }
}
