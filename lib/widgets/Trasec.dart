import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Trans extends StatelessWidget {
  String title;
  double amount;
  DateTime date;
  String id;
  void Function(String x) fa;
  Trans(this.title, this.amount, this.date, this.id, this.fa);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(color: Color.fromARGB(255, 60, 60, 60)))),
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  Icons.explicit_outlined,
                  size: 45,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${title}",
                          style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 30,
                              fontFamily: 'Stq',
                              color: Colors.white)),
                      Text(DateFormat.MMMMd().format(date),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 70,
            child: FittedBox(
              child: Text("-₹${amount}",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'OpenSans',
                      color: Colors.red[200])),
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(164, 65, 65, 65)),
            onPressed: () {
              return fa(id);
            },
            child: Icon(Icons.delete_outline,
                color: Color.fromARGB(255, 254, 254, 254)),
          ),
        ],
      ),
    );
  }
}
