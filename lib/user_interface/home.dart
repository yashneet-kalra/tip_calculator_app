// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
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

  Color _purple = HexColor("6908D6");
  Color _green = HexColor("90E1BA");
  Color _darkGreen = HexColor("4CBE72");
  Color _textGreen = HexColor("00523C");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
        alignment: Alignment.center,
        color: _green.withOpacity(0.15), //Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
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
                    Text(
                      "Total Per Person :",
                      style: TextStyle(
                        color: Colors.purple.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "\$123",
                      style: TextStyle(
                        fontSize: 34.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: _textGreen, //Colors.grey,
                    ),
                    decoration: InputDecoration(
                      //prefix: Text("Bill Amount : "),
                      labelText: "Bill Amount : ",
                      prefixIcon: Icon(Icons.monetization_on_sharp),
                    ),
                    onChanged: (String amount) {
                      try {
                        _billAmount = double.parse(amount);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
