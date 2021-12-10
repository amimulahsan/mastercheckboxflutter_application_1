import 'package:flutter/material.dart';
import 'package:mastercheckboxflutter_application_1/checknotification.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Mycheckbox(),
  ));
}

class Mycheckbox extends StatefulWidget {
  const Mycheckbox({Key? key}) : super(key: key);

  @override
  _MycheckboxState createState() => _MycheckboxState();
}

class _MycheckboxState extends State<Mycheckbox> {
  bool value = false;

  Checkboxnotification _checkboxnotification =
      Checkboxnotification(title: 'Click All');

  final CheckboxList = [
    Checkboxnotification(title: 'Rikta 1'),
    Checkboxnotification(title: 'Sompod 2'),
    Checkboxnotification(title: 'Maruf 3'),
    Checkboxnotification(title: 'Nupur 4'),
    Checkboxnotification(title: 'Fatema 5'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New checkbox'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildMasterCheckbox(_checkboxnotification),
          ...CheckboxList.map(buildSingleCheckbox).toList(),
        ],
      ),
    );
  }

  Widget buildMasterCheckbox(Checkboxnotification _checkboxnotification) =>
      buildCheckbox(
          checkboxnotification: _checkboxnotification,
          voidCallback: () {
            setState(() {
              final newValue = !_checkboxnotification.value;
              _checkboxnotification.value = newValue;
              CheckboxList.forEach((_checkboxnotification) {
                _checkboxnotification.value = newValue;
              });
            });
          });

  Widget buildSingleCheckbox(Checkboxnotification checkboxnotification) =>
      buildCheckbox(
          checkboxnotification: checkboxnotification,
          voidCallback: () {
            setState(() {
              final newValue = !checkboxnotification.value;
              checkboxnotification.value = newValue;

              CheckboxList.forEach((_checkboxnotification) {
                checkboxnotification.value = newValue;
              });
            });
          });

  Widget buildCheckbox({
    required Checkboxnotification checkboxnotification,
    required VoidCallback voidCallback,
  }) =>
      ListTile(
        onTap: voidCallback,
        leading: Checkbox(
          value: checkboxnotification.value,
          onChanged: (value) => voidCallback(),
        ),
        title: Text(checkboxnotification.title, style: TextStyle(fontSize: 32)),
      );
}
