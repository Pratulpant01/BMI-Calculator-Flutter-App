import 'package:bmi_calculator_flutter/widgets/left_bar.dart';
import 'package:bmi_calculator_flutter/widgets/right_bar.dart';

import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _weightcontroller = TextEditingController();
  double _bmiresult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: HexColor("#FCC91C"), fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 138,
                  child: TextField(
                    controller: _heightcontroller,
                    style: TextStyle(
                        color: accentHexColor,
                        fontSize: 42,
                        fontWeight: FontWeight.w300),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
                Container(
                  width: 138,
                  child: TextField(
                    controller: _weightcontroller,
                    style: TextStyle(
                        color: accentHexColor,
                        fontSize: 42,
                        fontWeight: FontWeight.w300),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onDoubleTap: () {
                double _h = double.parse(_heightcontroller.text);
                double _w = double.parse(_weightcontroller.text);
                setState(() {
                  _bmiresult = _w / (_h * _h);
                  if (_bmiresult > 25) {
                    _textResult = "You\'r e Overweight!";
                  } else if (_bmiresult >= 18.5 && _bmiresult <= 25) {
                    _textResult = "You have Normal Weight!";
                  } else {
                    _textResult = "You\'re Under weight!";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      color: accentHexColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                _bmiresult.toStringAsFixed(2),
                style: TextStyle(
                    color: accentHexColor,
                    fontSize: 90,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      color: accentHexColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 50,
            ),
            RightBar(barWidth: 70)
          ],
        ),
      ),
    );
  }
}
