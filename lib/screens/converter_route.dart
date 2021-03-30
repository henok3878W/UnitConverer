// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_02_category_widget/models/unit.dart';
import 'package:task_02_category_widget/widgets/input_form.dart';
import 'package:task_02_category_widget/widgets/out_put_form.dart';



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
  Unit fromUnit;
  Unit toUnit;
  String convertedValue;
  double inputValue;

  @override
  void initState() {
    this.units = widget.units;
    fromUnit = units[0];
    toUnit = units[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildInputOutputForm(units);
  }

  Widget _buildInputOutputForm(List<Unit> units) {
    var inputForm = InputForm(
      inputValue: this.inputValue.toString(),
      selectedUnit: this.fromUnit,
      units: units,
      onChanged: (Unit selectedUnit, String inputValue){
        setState(() {
          if (selectedUnit != null) {
            this.fromUnit = selectedUnit;
          }
          if (inputValue.isNotEmpty) {
            this.inputValue = double.parse(inputValue);
            convertedValue = _format(_calculateConversion());
          }
          else{
            convertedValue = '';
          }


        });
      },
    );
    var outputForm = OutputForm(
      convertedValue: convertedValue == null ? "": convertedValue,
      units: units,
      selectedUnit: toUnit,
      onChanged: (Unit selectedUnit) {
        setState(() {
            this.toUnit = selectedUnit;
            convertedValue = _format(_calculateConversion());
        });
      },
    );

    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [inputForm, conversionIcon, outputForm],
        ),
      ),
    ]);
  }

  _calculateConversion(){
    if(this.inputValue != null){
     return (toUnit.conversion/fromUnit.conversion)*this.inputValue;
    }

  }

  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  var conversionIcon =
      new RotatedBox(quarterTurns: 1, child: Icon(Icons.compare_arrows,size: 40,));
}
