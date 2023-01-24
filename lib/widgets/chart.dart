import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart_bar.dart';
import '../models/transection.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transection> recentOne;
  Chart(this.recentOne);
  List<Map<String, Object>> get grouped {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double total = 0.0;
      for (var i = 0; i < recentOne.length; i++) {
        if (recentOne[i].date.day == weekDay.day &&
            recentOne[i].date.month == weekDay.month &&
            recentOne[i].date.year == weekDay.year) {
          total += recentOne[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 3),
        "amount": total
      };
    }).reversed.toList();
  }

  double get max {
    return grouped.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 2, 2, 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 42, 40, 44),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(198, 24, 24, 24),
              offset: Offset(-4.0, -4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Color.fromARGB(172, 28, 27, 27),
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: grouped.map((data) {
          return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  max == 0.0 ? 0.0 : data['amount'],
                  max == 0.0 ? 0.0 : (data['amount'] as double) / max,
                  data['day']));
        }).toList(),
      ),
    );
  }
}
