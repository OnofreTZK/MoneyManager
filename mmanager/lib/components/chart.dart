import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';


class Chart extends StatelessWidget 
{

    final List<Transaction> lastTransaction;

    Chart(this.lastTransaction);

    List<Map<String, Object>> get groupedTransactions
    {
        return List.generate(7, (index)
        {
            final weekDay = DateTime.now().subtract(
                Duration(days: index),
            );

            
            double totalSum = 0.0;

            //transaction.reduce(totalSum, element);

            for(var i = 0; i < lastTransaction.length; i++)
            {
                bool sameDay = lastTransaction[i].date.day == weekDay.day;
                bool sameMonth = lastTransaction[i].date.month == weekDay.month;
                bool sameYear = lastTransaction[i].date.year == weekDay.year;

                if( sameDay && sameMonth && sameYear )
                {
                    totalSum += lastTransaction[i].value; 
                }                    

            }
            

            return { 
                // format return a string tha represents the week day name
                // We'll just need the first letter([0]).
                'day': DateFormat.E().format(weekDay)[0], 
                'value': totalSum, 
            };

        }); //List.generate
    }
    
    
    double get _weekTotalValue
    {
        return groupedTransactions.fold(0.0, (sum, tr)
        {
            return sum + tr['value'];
        });
    }


    @override
    Widget build(BuildContext context)  
    {
        return Card(
            elevation: 6,
            margin: EdgeInsets.all(20),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupedTransactions.map((tr) {
                    return Flexible(
                        fit: FlexFit.tight,
                        child: ChartBar(
                            label: tr['day'],
                            value: tr['value'],
                            percentage: _weekTotalValue > 0.0 ?
                                (tr['value'] as double) / _weekTotalValue
                                : 0.0,
                        ), // ChartBar
                    ); // Flexible
                }).toList(),
            ), // Row
            ), // Padding
        ); // Card
 
    }

}
