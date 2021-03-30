import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_02_category_widget/models/unit.dart';



class OutputForm extends StatelessWidget {

  final EdgeInsets _padding = EdgeInsets.all(16.0);
  final List<Unit> units;
  final Function(Unit selectedUnit) onChanged;
  final Unit selectedUnit;
  final String convertedValue;


  OutputForm({@required this.convertedValue,@required this.selectedUnit, @required this.units,@required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputDecorator(
            child: Text(convertedValue,
              style: Theme.of(context).textTheme.display1,
            ),
            decoration: InputDecoration(
              labelText: 'Output',
              labelStyle: Theme.of(context).textTheme.display1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          _createDropdown(context),
        ],
      ),
    );
  }

  _createDropdown(BuildContext context) {
    return DropdownButton<Unit>(
      style: Theme.of(context).textTheme.title,
      value: selectedUnit,
      onChanged: (unit){
        onChanged(unit);
      },
      items: units.map((unit) {
      return DropdownMenuItem(
        child: Text(unit.name),
        value: unit,
      );
    }).toList());
  }


}
