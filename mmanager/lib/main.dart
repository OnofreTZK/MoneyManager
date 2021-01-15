import 'package:flutter/material.dart';
import 'package:mmanager/components/transaction_list.dart';
import 'package:mmanager/components/transaction_form.dart';
import 'package:mmanager/components/chart.dart';
import 'dart:math';
import 'package:mmanager/models/transaction.dart';

class ExpensesApp extends StatelessWidget
{

    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            home: MyHomePage(),
            theme: ThemeData(
                primarySwatch: Colors.pink,
                accentColor: Colors.pinkAccent[400],
                fontFamily: "Quicksand",
                appBarTheme: AppBarTheme(
                    textTheme: ThemeData.light().textTheme.copyWith(
                        title:TextStyle(
                            fontFamily: 'MerriweatherSans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                        ), // TextStyle
                    ), // copyWith
                ), // AppBartTheme
            ), // ThemeData 
        ); // MaterialApp
    }
}


class _MyHomePageState extends State<MyHomePage>
{

    final List<Transaction> _transactions = [
    ];


    List<Transaction> get _recentTransactions
    {
        // return values that are in a week time.
        return _transactions.where((tr) 
        {
            return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
        }).toList();
    }


    _addTransaction( String title, double value, DateTime date)
    {
        final newTransaction = Transaction(
                id: Random().nextDouble().toString(),
                title: title,
                value: value,
                date: date,
        ); // Transaction

        setState( () {
            _transactions.add(newTransaction);
        });


        // Inherited widget comms
        Navigator.of(context).pop();

    }


    _deleteTransaction( String id )
    {
        setState( () 
        {
            _transactions.removeWhere( (tr) => tr.id == id );
        });
          
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
        
        final appBar = AppBar(
            title: Text(
                'Despesas',
                style: TextStyle(
                    fontSize: 20 * MediaQuery.of(context).textScaleFactor,
                ), // TextStyle
            ), // Text
            actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _openTransactionFormModal(context),
                ) // IconButton
            ] // <Widget>
        ); // AppBar 
       
        // Available area without appbar. 
        final availableHeight = MediaQuery.of(context).size.height -
            appBar.preferredSize.height - 
            MediaQuery.of(context).padding.top;

        
        return Scaffold(
            
            appBar: appBar,       
            body: SingleChildScrollView(
                child :Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Container(
                            height: availableHeight * 0.3,
                            child: Chart(_recentTransactions),
                        ), // Container
                        Container(
                            height: availableHeight * 0.7,
                            child: TransactionList(_transactions, _deleteTransaction),
                        ), // Container
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
