import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversisuhu_aisyah4/widgets/convertion.dart';
import 'package:konversisuhu_aisyah4/widgets/dropdown.dart';
import 'package:konversisuhu_aisyah4/widgets/input.dart';
import 'package:konversisuhu_aisyah4/widgets/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _result = 0;
  // double _reamur = 0;
  String _selectedDropdown = "Pilh Suhu";
  final _listSatuanSuhu = ["Kelvin", "Reamur"];
  List<String> _listHasil = [];

  TextEditingController etInput = TextEditingController();

  _onChangedDropdown(String value) {
    setState(() {
      _selectedDropdown = value;
    });
  }

  _convertHandler() {
    setState(() {
      if (etInput.text.isNotEmpty) {
        _inputUser = double.parse(etInput.text);
        switch (_selectedDropdown) {
          case "Kelvin":
            _result = _inputUser + 273;
            _listHasil
                .add("Hasil Konversi: $_inputUser °C ke °K adalah $_result °K");
            break;
          case "Reamur":
            _result = _inputUser * 0.8;
            _listHasil
                .add("Hasil Konversi: $_inputUser °C ke °R adalah $_result °R");
            // _listHasil.add("Hasil Konversi: $_inputUser ke $_result Reamur");
            break;
          default:
            _listHasil.add("Silahkan pilih suhu yang akan dikonversi!");
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu - 2031710026_Aisyah',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              Dropdown(
                  selectedDropdown: _selectedDropdown,
                  listSatuanSuhu: _listSatuanSuhu,
                  onChangedDropdown: _onChangedDropdown),
              Convertion(convertHandler: _convertHandler),
              Result(listHasil: _listHasil),
            ],
          ),
        ),
      ),
    );
  }
}
