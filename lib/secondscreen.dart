import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

const operatorcolor = Colors.blueGrey;
const buttonColor = Colors.black;
const whitecolor = Colors.white;
const orangecolor = Color(0xff548ae8);

class Calculator_App extends StatefulWidget {
  const Calculator_App({super.key});

  @override
  State<Calculator_App> createState() => _Calculator_AppState();
}

class _Calculator_AppState extends State<Calculator_App> {
  //Variables
  double firstnumber = 0.0;
  double secondnumber = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    //if value is AC
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('X', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52.0;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Kalkulator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          //Input and output area
          Expanded(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hideInput ? '' : input,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '= $output',
                        style: TextStyle(
                          fontSize: outputSize,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ))),
          Row(children: [
            button(
                text: 'AC', buttonBGcolor: operatorcolor, tColor: whitecolor),
            button(text: '<', buttonBGcolor: operatorcolor, tColor: whitecolor),
            // button(text: '', buttonBGcolor: Colors.transparent,),
            button(text: '/', buttonBGcolor: operatorcolor, tColor: whitecolor),
          ]),
          Row(children: [
            button(text: '7'),
            button(text: '8'),
            button(text: '9'),
            button(text: 'X', tColor: whitecolor, buttonBGcolor: operatorcolor),
          ]),
          Row(children: [
            button(text: '4'),
            button(text: '5'),
            button(text: '6'),
            button(text: '-', tColor: whitecolor, buttonBGcolor: operatorcolor),
          ]),
          Row(children: [
            button(text: '1'),
            button(text: '2'),
            button(text: '3'),
            button(text: '+', tColor: whitecolor, buttonBGcolor: operatorcolor),
          ]),
          Row(children: [
            button(text: '%', tColor: whitecolor, buttonBGcolor: operatorcolor),
            button(text: '0'),
            button(text: '.'),
            button(text: '=', buttonBGcolor: orangecolor),
          ]),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBGcolor = buttonColor}) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(22),
            primary: buttonBGcolor,
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          )),
    ));
  }
}
