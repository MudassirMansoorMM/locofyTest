import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproj2/ChangeNotifiers/InputNotifier.dart';
import '../constants.dart';


Widget node(BuildContext context ,String name, int depth){


    return  Consumer<InputNotifier>(

        key: Key(name),
        builder: (key, o, child){

        bool hasChildren = o.objects[name].hasChildren;

        return AnimatedContainer(

          duration: Duration(milliseconds: 1000),

          padding: EdgeInsets.only(left: depth * 23, bottom: kPadding/2),

          child: InkWell(

            onTap: (){
              if(hasChildren){
                Provider.of<InputNotifier>(context, listen : false).expandToggle(context,depth,name);
              }else{
                Provider.of<InputNotifier>(context, listen : false).setSelectedChild(name);
              }

            },
            child: Row(children: [

              hasChildren ? Icon(

                  o.objects[name].isExpanded ?
                  Icons.arrow_drop_down:
                  Icons.arrow_right, color: kPrimary

              ) : Container(),

              SizedBox(width: kPadding/4, ),

              Text(name, style: TextStyle(
                  color: o.selectedNode == name ? Colors.blueAccent : hasChildren ? Colors.white : kPrimary.withOpacity(.7)
              ),)

            ],),
          ),
        );

      },

    );

}
