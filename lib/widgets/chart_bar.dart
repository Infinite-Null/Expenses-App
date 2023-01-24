import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double amountPercentage;
  ChartBar(this.amount, this.amountPercentage, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: Text(
          '\$${amount.toStringAsFixed(0)}',
          style: TextStyle(color: Colors.white),
        )),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 70,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: amountPercentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red[300],
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label, style: TextStyle(color: Colors.white))
      ],
    );
  }
}
