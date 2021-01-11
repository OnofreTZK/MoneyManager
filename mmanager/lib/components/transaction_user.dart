import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';
import 'dart:math';
import 'package:mmanager/models/transaction.dart';

class _TransactionUserState extends State<TransactionUser>
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
        Transaction(
                id: 't2',
                title: 'Corte e Escova',
                value: 600.00,
                date: DateTime.now(),
        ), // Transaction
        Transaction(
                id: 't2',
                title: 'Corte e Escova',
                value: 600.00,
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

    }
    
    
    @override
    Widget build(BuildContext context)
    {
        return Column(
            children: <Widget>[
                TransactionForm(_addTransaction),
                TransactionList(_transactions),
            ] // <Widget>
        ); // Column
    }
    
}




class TransactionUser extends StatefulWidget
{
    @override
    _TransactionUserState createState() => _TransactionUserState();
}

