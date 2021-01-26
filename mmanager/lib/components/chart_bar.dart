import 'package:flutter/material.dart';


class ChartBar extends StatelessWidget
{
   
    final String label;
    final double value;
    final double percentage;

    const ChartBar({ 
        this.label, 
        this.value, 
        this.percentage,
    });


    @override
    Widget build(BuildContext context)
    {
        return LayoutBuilder(
            builder: (ctx, constraints) 
            {
                return Column(
                    children: <Widget>[
                        Container(
                            height: constraints.maxHeight * 0.15,
                            child: FittedBox(
                                child: Text('${value.toStringAsFixed(2)}'),
                            ), // FittedBox
                        ), // Container
                        SizedBox(height: constraints.maxHeight * 0.05),
                        Container(
                            height: constraints.maxHeight * 0.6,
                            width: 10,
                            child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey,
                                                width: 1.0
                                            ), // Border.all
                                            color: Color.fromRGBO(220, 220, 220, 1),
                                            borderRadius: BorderRadius.circular(5),
                                        ), // BoxDecoration
                                    ), // Container
                                    FractionallySizedBox(
                                        heightFactor: percentage,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context).primaryColor,
                                                borderRadius: BorderRadius.circular(5),
                                            ), // BoxDecoration
                                        ), // Container
                                    ), // FractionallySizedBox
                                ], // Stack
                            ), // Stack
                        ), // Container
                        SizedBox(height: constraints.maxHeight * 0.05),
                        Text(label),
                    ], // <Widget>
                ); // Column
            },
        ); // LayoutBuilder
    }
}
