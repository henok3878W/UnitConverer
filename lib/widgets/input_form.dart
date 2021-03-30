import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_02_category_widget/models/unit.dart';



class InputForm extends StatelessWidget {
  final List<Unit> units;
  final void Function(Unit selectedUnit , String inputValue) onChanged;
  final Unit selectedUnit;
  final String inputValue;
  InputForm(
      {
        @required this.inputValue,
        @required this.selectedUnit,
      @required this.units,
      @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          TextField(
            onChanged: (String value){
                onChanged(selectedUnit,value);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.display1,
              labelText: "Input",
              border: OutlineInputBorder(),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: (_createMenuItems(context)))
        ]));
  }

  _createMenuItems(BuildContext context) {
    return DropdownButton(
        value: selectedUnit,
        icon: Icon(Icons.arrow_drop_down),
        style: Theme.of(context).textTheme.title,
        onChanged: (Unit unit) {
          onChanged(unit,inputValue);
        },
        items: units.map<DropdownMenuItem<Unit>>((unit) {
          return DropdownMenuItem<Unit>(
            child: Text(
              unit.name,
              softWrap: true,
            ),
            value: unit,
          );
        }).toList());
  }
}
