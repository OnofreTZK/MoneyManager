import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mmanager/components/transaction_list.dart';
import 'package:mmanager/components/transaction_form.dart';
import 'package:mmanager/components/chart.dart';
import 'dart:math';
import 'dart:io';
import 'package:mmanager/components/adaptative_button.dart';
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


    bool _showChart = false;


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
        final mediaQuery = MediaQuery.of(context);

        bool isLandscape = mediaQuery.orientation == Orientation.landscape;

        
        final iconList = Platform.isIOS ? CupertinoIcons.news : Icons.list;
        final chartList = Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;


        Widget _getIconButton(IconData icon, Function fn)
        {
            return Platform.isIOS
                ? GestureDetector(
                    onTap: fn,
                    child: Icon(icon)
                    )
                : IconButton(
                    icon: Icon(icon),
                    onPressed: fn
                ); // IconButton
        }


        // Action widgets in appBar/navigationBar.
        final actions =  <Widget>[
            if(isLandscape && Platform.isIOS)
                _getIconButton(
                    _showChart ? iconList : chartList,
                    () 
                    {
                        setState( ()
                        {
                            _showChart = !_showChart;
                        });   
                    },
                ), // IconButton
            _getIconButton(
                Platform.isIOS ? CupertinoIcons.add : Icons.add,
                () => _openTransactionFormModal(context),
            ), // IconButton
        ]; // <Widget>

        
        // appBar/navigationBar
        final PreferredSizeWidget appBar = Platform.isIOS 
        ? CupertinoNavigationBar(
            middle: Text('Despesas'),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
            ),
            // Row
        ) // CupertinoNavigationBar
        : AppBar(
            title: Text(
                'Despesas',
                style: TextStyle(
                    fontSize: 20 * mediaQuery.textScaleFactor,
                ), // TextStyle
            ), // Text
            actions: actions,
        ); // AppBar 
       
        // Available area without appbar. 
        final availableHeight = mediaQuery.size.height -
            appBar.preferredSize.height - 
            mediaQuery.padding.top;

        // Main body page
        final bodyPage =
            SafeArea(
                child: SingleChildScrollView(
                    child :Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            if(isLandscape)
                                Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: <Widget>[
                                       Text(
                                           'Exibir Gráfico',
                                           style: TextStyle(
                                                fontSize: 18,
                                                ) // TextStyle
                                           ), // Text 
                                       Switch.adaptive(
                                           activeColor: Colors.greenAccent,
                                           value: _showChart, 
                                           onChanged: (value) {
                                               setState(() {
                                                   _showChart = value;
                                               });
                                           },
                                       ), // Switch
                                   ], // Widget
                                ), // Row
                            if(_showChart || !isLandscape) 
                                Container(
                                    height: availableHeight * (isLandscape ? 0.65 
                                            : 0.3),
                                    child: Chart(_recentTransactions),
                                ), // Container
                            if(!_showChart || !isLandscape)
                                Container(
                                    height: availableHeight * (isLandscape ? 1.0
                                            : 0.65),
                                    child: TransactionList(_transactions, _deleteTransaction),
                                ), // Container
                        ], // <Widget>[]
                    ), // Column
                ), // SingleChildScrollView
            ); // SafeArea

        
        return Platform.isIOS 
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: bodyPage,
        ) // CupertinoPageScaffold
        : Scaffold( 
            appBar: appBar,       
            body: bodyPage,
            floatingActionButton: Platform.isIOS 
            ? Container()
            : FloatingActionButton(
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
