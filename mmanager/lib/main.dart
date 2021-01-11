import 'package:flutter/material.dart';
import 'package:mmanager/components/transaction_user.dart';

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



    //String title;
    //String value;


    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            
            appBar: AppBar(
                title: Text('Despesas'),
            ), // AppBar
            
            body: SingleChildScrollView(
                child :Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Card(
                            color: Colors.blue,
                            child: Text('Gráficos'),
                            elevation: 5,
                        ), // Card
                        TransactionUser()
                    ], // <Widget>[]
                ), // Column
            ), // SingleChildScrollView
        );// Scaffold
    }
}



main() => runApp(ExpensesApp());
