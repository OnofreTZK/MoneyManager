import 'package:flutter/material.dart';
import 'package:mmanager/models/transaction.dart';
import 'package:intl/intl.dart';


class ExpensesApp extends StatelessWidget
{

    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            home: MyHomePage()
        ); // MaterialApp
    }
}


class MyHomePage extends StatelessWidget
{

    final titleController = TextEditingController();
    final valueController = TextEditingController();

    //String title;
    //String value;

    final _transactions = [
        Transaction(
                id: 't1',
                title: 'Escova',
                value: 400.00,
                date: DateTime.now(),
        ), // Transaction
        Transaction(
                id: 't2',
                title: 'Corte e Escova',
                value: 600.00,
                date: DateTime.now(),
        ), // Transaction
    ];


    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            
            appBar: AppBar(
                title: Text('Despesas'),
            ), // AppBar
            
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    Card(
                        color: Colors.blue,
                        child: Text('Gráficos'),
                        elevation: 5,
                    ), // Card
                    Column(
                        children: _transactions.map((tr) {
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
                                                        'R\$ ${tr.value}',
                                                        //'R\$ ${tr.value.toStringAsFixed(2)}'
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
                        }).toList(),
                    ), // Column
                    Card(
                        elevation: 5,
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                                children: <Widget>[
                                    TextField(
                                        controller: titleController,
                                        decoration: InputDecoration(
                                            labelText: 'Título'
                                        ), // InputDecoration        
                                    ), // TextField
                                    TextField(
                                        controller: valueController,
                                        decoration: InputDecoration(
                                            labelText: 'Valor (R\$)',
                                        ), // InputDecoration
                                    ), // TextField
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment
                                        .end,
                                        children: <Widget>[
                                            FlatButton(
                                                child: Text('Nova Transaćão'),
                                                textColor: Colors.purple,
                                                onPressed: () {},
                                            ), // FlatButton
                                        ] // <Widget>
                                    ), // Row
                                ] // <Widget>
                            ), // Column
                        ), // Container
                    ), // Card
                ], // <Widget>[]
            ), // Column
        );// Scaffold
    }
}



main() => runApp(ExpensesApp());
