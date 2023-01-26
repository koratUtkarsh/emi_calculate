import 'dart:math';

import 'package:flutter/material.dart';

class EMI extends StatefulWidget {
  const EMI({Key? key}) : super(key: key);

  @override
  State<EMI> createState() => _EMIState();
}

class _EMIState extends State<EMI> {
  double loanAmount = 100000;
  double loanInterest = 5;
  double loanYears = 5;

  double totalInterest = 0;
  double perMonthEMI = 0;
  double perMonthInterest = 0;

  int interestPerMonth = 0;
  int emiPerMonth = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("EMI CALC",
              style: TextStyle(color: Color(0xFFE7F6F2), letterSpacing: 2),),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 5, spreadRadius: 5),
                ],
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              "Your EMI is",
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "\$ $emiPerMonth",
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),

                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 200,
                        child: Column(
                          children: [
                            Text(
                              "Your Interest",
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "\$ $interestPerMonth",
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 40, right: 40, bottom: 25, top: 100),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 5,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      color: Colors.blueAccent.shade100,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text(
                                "Loan Amount",
                                style:
                                    TextStyle(letterSpacing: 2, fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 180, top: 20),
                              child: Text(
                                "\$ $loanAmount",
                                style:
                                    TextStyle(letterSpacing: 2, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          max: 1000000,
                          divisions: 10,
                          activeColor: Colors.indigoAccent.shade700,
                          inactiveColor: Colors.indigoAccent.shade200,
                          value: loanAmount,
                          onChanged: (value) {
                            setState(() {
                              loanAmount = value;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text(
                                "Loan Interest",
                                style:
                                    TextStyle(letterSpacing: 2, fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 225, top: 20),
                              child: Text(
                                "$loanInterest%",
                                style:
                                    TextStyle(letterSpacing: 2, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          max: 15,
                          divisions: 15,
                          activeColor: Colors.indigoAccent.shade700,
                          inactiveColor: Colors.indigoAccent.shade200,
                          value: loanInterest,
                          onChanged: (value) {
                            setState(() {
                              loanInterest = value;
                            });
                          },
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 25, top: 20),
                              child: Text("Total Years",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 200, top: 20),
                              child: Text("$loanYears Years",
                                  style: TextStyle(
                                      letterSpacing: 2, fontSize: 15)),
                            ),
                          ],
                        ),
                        Slider(
                          max: 10,
                          divisions: 10,
                          activeColor: Colors.indigoAccent.shade700,
                          inactiveColor: Colors.indigoAccent.shade200,
                          value: loanYears,
                          onChanged: (value) {
                            setState(() {
                              loanYears = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // clear container
                            InkWell(
                              onTap: () {
                                setState(() {
                                  loanAmount = 0;
                                  loanInterest = 0;
                                  loanYears = 0;
                                });
                              },
                              child: Container(
                                height: 55,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.black54,borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text("Clear",
                                      style: TextStyle(
                                        color: Color(0xFFE7F6F2),
                                        fontSize: 25,
                                        letterSpacing: 2,
                                      )),
                                ),
                              ),
                            ),

                            SizedBox(
                              width: 50,
                            ),

                            InkWell(
                              onTap: () {
                                setState(() {
                                  totalInterest =
                                      (loanAmount * loanInterest) / 100;
                                  perMonthEMI = (loanAmount + totalInterest) /
                                      (loanYears * 12);
                                  perMonthInterest =
                                      totalInterest / (loanYears * 12);

                                  interestPerMonth = perMonthInterest.toInt();
                                  emiPerMonth = perMonthEMI.toInt();
                                });
                              },
                              child: Container(
                                height: 55,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black54,
                                ),
                                child: Center(
                                  child: Text(
                                    "Count",
                                    style: TextStyle(
                                      color: Color(0xFFE7F6F2),
                                      fontSize: 25,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
