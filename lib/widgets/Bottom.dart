import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  int x;
  Bottom(this.x);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(17),
      padding: EdgeInsets.all(5),
      child: Text(
        "TOTAL EXPENSES: ${x}",
        style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'mer'),
      ),
    );
  }
}
