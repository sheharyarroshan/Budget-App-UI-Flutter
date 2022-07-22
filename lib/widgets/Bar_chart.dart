import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach(
      (double price) {
        if (price > mostExpensive) {
          mostExpensive = price;
        }
      },
    );
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                ),
              ),
              Text(
                'Nov 10,2019 - Nov 16,2019',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward,
                  size: 30.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar('Su', expenses[0], mostExpensive),
              Bar('Mo', expenses[1], mostExpensive),
              Bar('Tu', expenses[2], mostExpensive),
              Bar('We', expenses[3], mostExpensive),
              Bar('Th', expenses[4], mostExpensive),
              Bar('Fr', expenses[5], mostExpensive),
              Bar('Sa', expenses[6], mostExpensive),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String lable;
  final double amountspent;
  final double mostexpense;
  final double _barMaxHeight = 150.0;
  Bar(this.lable, this.amountspent, this.mostexpense);

  @override
  Widget build(BuildContext context) {
    final double barheight = amountspent / mostexpense * _barMaxHeight;
    return Column(
      children: [
        Text(
          '\$${amountspent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6.0),
        Container(
          height: barheight,
          width: 18.0,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6.0)),
        ),
        SizedBox(height: 8.0),
        Text(
          lable,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
