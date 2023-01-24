import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Text(
        "Expenses",
        style: TextStyle(fontSize: 38, color: Colors.blue, fontFamily: 'Me'),
      ),
    );
  }
}
