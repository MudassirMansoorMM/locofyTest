import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproj2/CustomComponents/Node.dart';
import 'package:testproj2/Models/TreeItemModel.dart';



class InputNotifier extends ChangeNotifier{

  Map<String,dynamic> _rawValue = {};
  Map<String,dynamic> get rawValue =>  _rawValue;

  List<Widget> rows = [];

  Map<String,dynamic> objects = {};

  int depth = 0;

  Map<String,dynamic> widgets = {};

  String selectedNode = "";

  bool error = false;
  String message = "";






  /// Search Routine
  void searchNode(String val, BuildContext context){

    if(val == ""){

      message = "";

      if(widgets.length > 1 && !rows.isEmpty){
        rows.clear();
        makeWidget(context,0, widgets.keys.first);
      }else{
        notifyListeners();
      }


    } else if(objects.isEmpty){

      message = "Please make tree first";
      notifyListeners();

    }else if(objects.containsKey(val)){

      message = "";
      rows.clear();

      objects.forEach((key, value) {
        objects[key].isExpanded = false;
      });

      makeWidget(context, objects[val].depth, val);

    }else{
      message = "No Nodes found";
      notifyListeners();
    }

  }


  /// On Input Rerender the Tree
  void updateInput(String input, BuildContext context){



    depth = 0;
    objects = {};
    rows = [];
    widgets = {};

    depth = 0;
    selectedNode = "";

    try{

       _rawValue = jsonDecode(input);


    }on Exception catch (exception) {
      error = true;
      message = "Please Enter correct Json Value";
      notifyListeners();
    } catch (e) {
      error = true;
      message = "Please Enter correct Json Value";
      notifyListeners();
    }




    recursive(_rawValue,0,"");

    makeWidget(context,0, widgets.keys.first);


    message = "";
    notifyListeners();


  }


  /// On Contract Remove children Recursively
  void removeChild(List<dynamic> children){

    children.forEach((element) {

      if(widgets.containsKey(element)){
        objects[element].isExpanded = false;
        rows.removeWhere((widget) => widget.key == Key(element));
        return removeChild(widgets[element]);
      }else{
        objects[element].isExpanded = false;
        rows.removeWhere((widget) => widget.key == Key(element));
      }

    });

  }


  /// Expand toggle  + Add Nodes to the Tree
  void expandToggle(BuildContext context,int _depth,String name){

    selectedNode = name;
    int length = rows.length;

    if(objects[name].isExpanded){

      List<dynamic> _list = widgets[name];


      removeChild(_list);



    }else{

      int index  = rows.indexWhere((widget) => widget.key == Key(name));

      List<Widget> temp = [];

      if(rows.length == index + 1 ){

      }else{


          temp = rows.getRange(index + 1, length).toList();
          rows.removeRange(index +1, length);
          print(rows);


      }



      List<dynamic> _list = widgets[name];

      _list.forEach((element) {
        makeWidget(context,_depth + 1, element);
      });

      if(temp.length >= 1){
        temp.forEach((element) {
          rows.add(element);
        });
      }



    }

    objects[name].isExpanded = !objects[name].isExpanded;

    notifyListeners();

  }



  /// Set Selected if Node has no children
  void setSelectedChild(String name){
    selectedNode = name;
    notifyListeners();
  }


  /// Adds a node to the Tree
  makeWidget(BuildContext context,int _depth,String name){

    rows.add( node( context, name , _depth ) );

    notifyListeners();


  }



  /// Make Node Objects Map
  void recursive(Map<String,dynamic> map, int  _depth, String parent){


   if(map.length == 2){

      List<dynamic> list = map["children"];


      objects[map["name"]] = TreeItem(name:map["name"],hasChildren: true, depth: _depth, isExpanded: false,children: [],parent:parent);


      _depth = _depth + 1;

      if(widgets.keys.contains(parent)){

        List<dynamic> temp = widgets[parent];
        temp.add(map["name"]);
        widgets[parent] = temp;

      }else if(parent != ""){

        widgets[parent] = [map["name"]];

      }

      list.forEach((element) {


        return recursive(element,_depth,map["name"]);

      });

    }else{


      if(widgets.keys.contains(parent)){

        List<dynamic> temp = widgets[parent];
        temp.add(map["name"]);
        widgets[parent] = temp;

      }else{


        if(parent == ""){
          widgets[map["name"]] = "";
        }else{
          widgets[parent] = [map["name"]];
        }

      }



      depth = _depth;

      objects[map["name"]] = TreeItem(name:map["name"],hasChildren: false, depth: _depth, isExpanded: false,children: [], parent: parent);


      return map["name"];

    }



  }






}