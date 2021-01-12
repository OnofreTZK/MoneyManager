import 'package:flutter/material.dart';
import 'package:mmanager/components/transaction_list.dart';
import 'package:mmanager/components/transaction_form.dart';
import 'dart:math';
import 'package:mmanager/models/transaction.dart';

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


class _MyHomePageState extends State<MyHomePage>
{

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


    _addTransaction( String title, double value )
    {
        final newTransaction = Transaction(
                id: Random().nextDouble().toString(),
                title: title,
                value: value,
                date: DateTime.now(),
        ); // Transaction

        setState( () {
            _transactions.add(newTransaction);
        });


        // Inherited widget comms
        Navigator.of(context).pop();

    }
    

    _openTransactionFormModal(BuildContext context)
    {
        showModalBottomSheet(
            context: context,
            builder: (_)
            {
                return TransactionForm(_addTransaction);
            }
        );
    }


    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            
            appBar: AppBar(
                title: Text('Despesas'),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _openTransactionFormModal(context),
                    ) // IconButton
                ] // <Widget>
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
                        TransactionList(_transactions),
                    ], // <Widget>[]
                ), // Column
            ), // SingleChildScrollView
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => _openTransactionFormModal(context),
            ), // FloatingActionButton
           floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ); // Scaffold
    }
}


class MyHomePage extends StatefulWidget
{
    
    @override
    _MyHomePageState createState() => _MyHomePageState();

}



main() => runApp(ExpensesApp());
