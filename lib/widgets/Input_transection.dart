import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/widgets/Trasec.dart';
import 'package:flutter_complete_guide/models/transection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransection extends StatelessWidget {
  void Function() fun;
  void Function(String x, double y, DateTime z) fam;
  NewTransection(this.fam, this.fun);
  @override
  Widget build(BuildContext context) {
    final amountInp = TextEditingController();
    final titleInp = TextEditingController();
    DateTime date;
    void _presentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        date = pickedDate;
      });
    }

    return Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(0, 0, 0, 0),
                blurRadius: 15,
                offset: Offset(5, 5),
                spreadRadius: 1),
            BoxShadow(
                color: Color.fromARGB(77, 0, 0, 0),
                blurRadius: 15,
                offset: Offset(0, -5),
                spreadRadius: 0),
          ]),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close_rounded),
                      onPressed: () => {titleInp.clear()},
                    ),
                    border: OutlineInputBorder(),
                    label: Text("TITLE"),
                    icon: Icon(Icons.title)),
                controller: titleInp,
              ),
              TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    label: Text("AMOUNT"),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close_rounded),
                      onPressed: () => {amountInp.clear()},
                    ),
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.currency_rupee_outlined)),
                controller: amountInp,
              ),
              // TextField(
              //   keyboardType: TextInputType.datetime,
              //   controller: date,
              //   style: TextStyle(color: Colors.black),
              //   decoration: InputDecoration(
              //       label: Text("Date"),
              //       border: OutlineInputBorder(),
              //       icon: Icon(Icons.date_range_outlined)),
              // ),

              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                  onPressed: fun,
                  child: Container(
                      width: 90,
                      margin: EdgeInsets.all(5),
                      child:
                          Column(children: [Icon(Icons.close), Text("Close")])),
                ),
                ElevatedButton(
                  onPressed: () {
                    fam(titleInp.text, double.parse(amountInp.text), date);
                  },
                  child: Container(
                      width: 90,
                      margin: EdgeInsets.all(5),
                      child: Column(children: [
                        Icon(CupertinoIcons.add_circled),
                        Text("Add")
                      ])),
                ),
              ])
            ],
          )),
    );
  }
}
