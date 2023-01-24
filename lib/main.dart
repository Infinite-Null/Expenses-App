import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/widgets/Bottom.dart';
import 'package:flutter_complete_guide/widgets/Header.dart';
import 'package:flutter_complete_guide/widgets/Trasec.dart';
import 'package:flutter_complete_guide/models/transection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/Input_transection.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';

void main() {
  runApp(Expenses());
}

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Transection> userTransection = [];
  void _addnew(String txtitle, double txamount, DateTime dat) {
    if (txtitle.isEmpty || txamount <= 0) {
      return;
    }
    if (dat == null) {
      dat = DateTime.now();
    }
    final newTx = Transection(
        title: txtitle,
        amount: txamount,
        date: dat,
        id: DateTime.now().toString());
    setState(() {
      userTransection.add(newTx);
    });
  }

  bool press = false;
  void mer() {
    setState(() {
      press = false;
    });
  }

  List<Transection> get recent {
    return userTransection.where((element) {
      return element.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void inp() {
    setState(() {
      press = true;
    });
    // showModalBottomSheet(
    //     context: context,
    //     builder: (_) {
    //       return NewTransection(_addnew);
    //     });
  }

  void deleteTrn(String id) {
    setState(() {
      userTransection.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 42, 40, 44),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              "Expenses",
              style: TextStyle(
                  color: Colors.grey, fontSize: 40, fontFamily: 'Stq'),
            ),
          ),
          actions: [
            IconButton(
                onPressed: inp,
                icon: Icon(
                  CupertinoIcons.add_circled,
                  size: 35,
                  color: Colors.grey,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // UserTransection(),

            Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 40, 44),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(70))),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 671,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bottom(userTransection.length),
                    (userTransection.length == 0)
                        ? Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 42, 40, 44),
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            height: 500,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Empty...",
                                      style: TextStyle(
                                          fontSize: 45,
                                          fontFamily: 'Stq',
                                          color: Colors.white)),
                                  Image.asset(
                                    'assets/Images/download-removebg-preview.png',
                                    scale: 5,
                                  )
                                ]),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.amber),
                                color: Color.fromARGB(255, 42, 40, 44),
                                borderRadius: BorderRadius.circular(12)),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                            height: 400,
                            child: ListView.builder(
                              itemCount: userTransection.length,
                              itemBuilder: (context, index) {
                                return Trans(
                                    userTransection[index].title,
                                    userTransection[index].amount,
                                    userTransection[index].date,
                                    userTransection[index].id,
                                    deleteTrn);
                              },
                            )),
                    Chart(recent),
                  ],
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.add),
          onPressed: inp,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        bottomSheet: press ? NewTransection(_addnew, mer) : Text(""),
      ),
    );
  }
}
