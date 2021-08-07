

class TreeItem{

  String name,parent;
  bool isExpanded, hasChildren;
  List<String> children;
  int depth;


  TreeItem({
    required this.name,
    required this.parent,
    required this.isExpanded,
    required this.hasChildren,
    required this.children,
    required this.depth

  });



}