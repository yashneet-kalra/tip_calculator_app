// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tip_calculator_app/money_icon_icons.dart';
import '/utils/hexcolor.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  //final Color _purple = HexColor("6908D6");
  final Color _green = HexColor("90E1BA");
  final Color _darkGreen = HexColor("4CBE72");
  final Color _textGreen = HexColor("00523C");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green.shade50,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
        alignment: Alignment.center,
        color: _green.withOpacity(0.15), //Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _darkGreen.withOpacity(
                    0.5), //_purple.withOpacity(0.19), //Colors.purple.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Total Per Person :",
                        style: TextStyle(
                          color: Colors.purple.shade700,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MoneyIcon.rupee,
                          color: Colors.black54,
                        ),
                        Text(
                          "${calculateTotalPerPerson(_billAmount, _tipPercentage, _personCounter)}",
                          style: TextStyle(
                            fontSize: 36.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                //color: Colors.white,
                color: Colors.transparent,
                /*boxShadow: [
                  BoxShadow(
                      color: Colors.lightGreen,
                      blurRadius: 10.0,
                      spreadRadius: 2.0)
                ],*/
                border: Border.all(
                  color: Colors.blueGrey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  //TextField
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: _textGreen, //Colors.grey,
                    ),
                    decoration: InputDecoration(
                      //prefix: Text("Bill Amount : "),
                      labelText: "Bill Amount : ",
                      prefixIcon: Icon(
                          MoneyIcon.rupee), //Icon(Icons.monetization_on_sharp),
                    ),
                    onChanged: (String amount) {
                      try {
                        _billAmount = double.parse(amount);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    },
                  ),

                  //Split Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17.0),
                        child: Text(
                          "Split",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Row(children: [
                        // Minus Button
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_personCounter > 1) {
                                _personCounter--;
                              } else {
                                //do nothing
                              }
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: _darkGreen.withOpacity(0.35),
                            ),
                            child: Center(
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //Person Counter Text
                        Text(
                          "$_personCounter",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.green[900],
                          ),
                        ),

                        //Add Button
                        InkWell(
                          onTap: () {
                            setState(() {
                              _personCounter++;
                            });
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: _darkGreen.withOpacity(0.35),
                            ),
                            child: Center(
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),

                  //Tip Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17.0),
                        child: Text(
                          "Tip",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            Icon(
                              MoneyIcon.rupee,
                              color: Colors.green[900],
                              size: 17.0,
                            ),
                            Text(
                              "${calculateTotalTip(_billAmount, _tipPercentage)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //Slider Column
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Slider(
                          value: _tipPercentage.toDouble(),
                          min: 0,
                          max: 100,
                          divisions: 20,
                          activeColor: Colors.greenAccent[400],
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentage = newValue.round();
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //function to calculate the Total Tip
  calculateTotalTip(double billAmount, int tipPercentage) {
    double totalTip = 0.00;

    if (billAmount == 0 ||
        billAmount.toString().isEmpty ||
        billAmount == null) {
      totalTip = 0.00;
      return totalTip;
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip;
  }

  //function to calculate the Total Per Person
  calculateTotalPerPerson(double billAmount, int tipPercentage, int splitBy) {
    if (billAmount == 0 ||
        billAmount.toString().isEmpty ||
        billAmount == null) {
      return 0.00;
    } else {
      var totalPerPerson =
          ((calculateTotalTip(billAmount, tipPercentage)) + billAmount) /
              splitBy;

      return totalPerPerson.toStringAsFixed(2);
      //return totalPerPerson;
    }
  }
}
