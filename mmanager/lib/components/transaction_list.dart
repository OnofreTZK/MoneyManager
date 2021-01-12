import 'package:flutter/material.dart';
import 'package:mmanager/models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget
{
    final List<Transaction> transactions;


    TransactionList(this.transactions);

    @override
    Widget build(BuildContext context)
    {
        
        return Container(
            height: MediaQuery.of(context).size.height * 0.6, 
            child: transactions.isEmpty ? Column(
                children: <Widget>[
                    Text(
                        'Nenhuma Transaćão Cadastrada.',
                        style: TextStyle(
                                fontFamily: 'MerriweatherSans',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                        ), // TextStyle
                    ), // Text
                    SizedBox(height: 50),
                    Container(
                        height: 200,
                        child: Image.asset(
                            'assets/images/waiting.png',
                            fit: BoxFit.cover,
                            ), // Image
                    ), // Container
                ], // <widget>
            ) : // Column
            ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index)
                {
                    final tr = transactions[index];
                    return Card(
                        child: Row(
                                children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 10
                                        ), // EdgeInsets.symmetric
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.purple,
                                                width: 2,
                                            ) // Border.all
                                        ), // BoxDecoration
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                                //'R\$ ${tr.value}',
                                                'R\$ ${tr.value.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                    fontWeight: 
                                                        FontWeight.bold,
                                                    fontSize: 20,
                                                    color: 
                                                        Colors.purple,
                                                ), // TextStyle                                           
                                        ), // Text
                                    ), // Container
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                            Text(
                                                tr.title,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                ),
                                                ), // Text title
                                            Text(
                                                DateFormat('d MMM y')
                                                .format(tr.date),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey,
                                                ), // TextStyle
                                            ), // Text date
                                        ], // <Widget>
                                    ) // Column
                                ], // <Widget>
                        ) // Row
                    ); // Card
                    
                },
            ), // ListView 
        ); // Container
    }
}
