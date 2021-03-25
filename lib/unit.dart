import 'package:flutter/cupertino.dart';

class Unit {
  String name;
  double conversion;
  Unit({@required this.name, @required this.conversion});

  Unit.fromJson(Map json){
    this.conversion = json['conversion'].toDouble();
    this.name = json['name'];

  }

}