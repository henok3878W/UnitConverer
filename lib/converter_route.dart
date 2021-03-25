// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'unit.dart';

/// Converter screen where users can input amounts to convert.
///
/// Currently, it just displays a list of mock units.
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  final Color color;
  final List<Unit> units;
  ConverterRoute({@required this.color, @required this.units});

  @override
  _ConverterRouteState createState() => _ConverterRouteState();

}
class _ConverterRouteState extends State<ConverterRoute> {
  List<Unit> units;
  @override
  void initState() {
    this.units = widget.units;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildConversionsList(units);
  }

  ListView _buildConversionsList(List<Unit> units){
    return ListView.builder(itemBuilder:(context,index){
      return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        color: widget.color,
        child: Column(
          children: [
            Text(units[index].name + " Unit $index",
            style: Theme.of(context).textTheme.headline,),
            Text("Conversion: " + units[index].conversion.toString(),
              style: Theme.of(context).textTheme.subhead
              ,
            ),
          ],
        ),

      );
    },itemCount: units.length,);

  }
}
