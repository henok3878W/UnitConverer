// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'category.dart';
import 'unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatefulWidget {



  @override
  _CategoryRouteState createState() => _CategoryRouteState();
}

class _CategoryRouteState extends State<CategoryRoute> {

  List<Category> categories = <Category>[];

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < _categoryNames.length;i++){
      categories.add(
          Category(
       name: _categoryNames[i],
        units: _retrieveCategoryUnits(_categoryNames[i]),
        color: _baseColors[i],
        iconLocation: Icons.cake,
      ));

    }
  }

  List<Unit> _retrieveCategoryUnits(String categoryName){
    return List.generate(10, (index) => new Unit(name: categoryName,conversion: index.toDouble()));
  }

  ListView _buildCategoryLists(List<Widget> categories){
    return ListView.builder(itemBuilder: (context,index){
      return categories[index];
    },itemCount: categories.length,);

  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: _backgroundColor,
      child: _buildCategoryLists(categories),
    );

    final appBar = AppBar(
      elevation: 0,
      title: Text('Unit converter',
        style: TextStyle(color: Colors.black, fontSize: 30
        ),),
      backgroundColor: _backgroundColor,
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
