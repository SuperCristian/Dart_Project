import 'package:flutter/material.dart';

void main() {
  runApp(ConverterApp());
}

class ConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConverterScreen(),
    );
  }
}

class ConverterScreen extends StatefulWidget {
  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  TextEditingController _inputController = TextEditingController();
  String _result = '';
  String _fromUnit = 'Fahrenheit';
  String _toUnit = 'Celsius';

  void _convertTemperature() {
    double inputValue = double.tryParse(_inputController.text) ?? 0;
    double? result;
    if (_fromUnit == 'Fahrenheit') {
      if (_toUnit == 'Celsius') {
        result = (inputValue - 32) * 5 / 9;
      } else if (_toUnit == 'Kelvin') {
        result = (inputValue - 32) * 5 / 9 + 273.15;
      }
    } else if (_fromUnit == 'Celsius') {
      if (_toUnit == 'Fahrenheit') {
        result = (inputValue * 9 / 5) + 32;
      } else if (_toUnit == 'Kelvin') {
        result = inputValue + 273.15;
      }
    } else if (_fromUnit == 'Kelvin') {
      if (_toUnit == 'Fahrenheit') {
        result = (inputValue - 273.15) * 9 / 5 + 32;
      } else if (_toUnit == 'Celsius') {
        result = inputValue - 273.15;
      }
    }
    setState(() {
      _result = result != null ? '$_fromUnit: $inputValue\n$_toUnit: ${result.toStringAsFixed(2)}' : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Temperature',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _fromUnit,
                    onChanged: (value) {
                      setState(() {
                        _fromUnit = value!;
                      });
                    },
                    items: ['Fahrenheit', 'Celsius', 'Kelvin']
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _toUnit,
                    onChanged: (value) {
                      setState(() {
                        _toUnit = value!;
                      });
                    },
                    items: ['Fahrenheit', 'Celsius', 'Kelvin']
                        .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(value: value, child: Text(value)))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text(
              _result,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
