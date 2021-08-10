import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproj2/ChangeNotifiers/InputNotifier.dart';
import 'package:testproj2/config.dart';
import '../constants.dart';



/// Returns true if the passed child is the last child of it's parent
bool checkIfLastChild( Map<String,dynamic> objects, Map<String,dynamic> widgets, String name){

  String parent = objects[name].parent;
  int siblings = 0;
  bool isLast = false;

  if(parent != ""){
    siblings = widgets[parent].length - 1 ;
    List<dynamic> children = widgets[parent];


    if (siblings == children.indexOf(name)){
      isLast = true;
    }

  }

  return isLast;

}


/// Set Selected and Trip Expand on Tap
void onTap(BuildContext context, int depth,String name, bool hasChildren){
  if(hasChildren){
    Provider.of<InputNotifier>(context, listen : false).expandToggle(context,depth,name);
  }else{
    Provider.of<InputNotifier>(context, listen : false).setSelectedChild(name);
  }
}





Widget node(BuildContext context ,String name, int depth){

    List<Widget> line  = [];

    return  Consumer<InputNotifier>(

        key: Key(name),

        builder: (key, o, child){

          line = [];
          bool isLastChild = checkIfLastChild(o.objects, o.widgets, name);
          bool hasChildren = o.objects.keys.length == 1 ? false : o.objects[name].hasChildren;
          String parent = name;
          List<bool> isParentLastChild = [false] ;


          for(int i = 0; i< depth - 1; i ++){

            parent = o.objects[parent].parent;

            if(parent != ""){
              isParentLastChild.add(checkIfLastChild(o.objects, o.widgets, parent));
            }

          }

          /// Create Tree Lines for current Node
          /// ++++++++++++++++++++++++++++++++++
          for(int i = 0; i <  depth ; i ++){

            line.add(

              Row(children: [

                  SizedBox(width:  i == 0 ?  0 : 20),

                  ( isParentLastChild.reversed.toList()[i] && i != depth ) ?

                  Container() :

                  Column(children: [

                      Container(
                        width: 1,
                        height: 15,
                        color: kPrimary.withOpacity(.2),
                      ),


                      Container(
                        width: 1,
                        height: 15,
                        color: i==depth -1 ? isLastChild ? Colors.transparent : kPrimary.withOpacity(.2) :  kPrimary.withOpacity(.2)  ,
                      ),

                  ],),

              ],),

            );

          }




        /// Node Widget to be added to the Tree
        /// +++++++++++++++++++++++++++++++++++

        return Container(

          padding: EdgeInsets.only(left: depth > 0 ?  25 : 11),

          child: InkWell(

            /// ON PRESS
            onTap: ()=> onTap(context, depth, name, hasChildren),

            child: Row(children: [

                Row(children: line,),

                Container(

                  child: Row(children: [



                        /// Display Tree  Line horizontal
                        o.objects[name].depth > 0 ?

                        Row(
                          children: [

                            Container(
                              width: 11,
                              height: 1,
                              color: kPrimary.withOpacity(.2),
                            ),
                          ],
                        ) : Container(),


                        /// Display Expand/ Collapse Icons
                        o.objects[name].depth > 0 ?

                        hasChildren ?


                        Icon(
                            o.objects[name].isExpanded ?
                            Icons.arrow_drop_down:
                            Icons.arrow_right, color: kPrimary, size: 18,

                        ) : Container()  :


                        /// Parent NODE ICON
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(kPadding/5),
                          decoration: circularEdges(5, 5, 5, 5, kPrimary.withOpacity(.1)),
                          child: Image.asset("assets/images/stack.png")
                        ),

                        SizedBox(width: kPadding/4, ),


                        /// Returns Animated Text on Expand and on Another Node selected
                        /// else Return grey Node, Turns Selected Node Blue
                        o.objects[name].depth > 0 ?

                        o.selectedNode != name ?

                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(name ,
                              textStyle: TextStyle(
                                  color: hasChildren ? Colors.white : kPrimary.withOpacity(.7)
                              )
                            ),
                          ],
                          totalRepeatCount: 1,
                          onTap: () => onTap(context, depth, name, hasChildren),
                        ) :

                        Text(name, style: TextStyle(color:Colors.blueAccent ),)


                        /// First/ Root Node of the Tree
                        : Text(name, style: TextStyle(
                            color: o.selectedNode == name ? Colors.blueAccent : Colors.white,fontSize: SizeConfig.height * 2.8),
                        )

                  ],),
                ),
              ],
            ),
          ),
        );
      },
    );

}
