import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transaction_form.dart';
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
    ];

    
    @override
    Widget build(BuildContext context)
    {
        return Column(
            children: <Widget>[
                TransactionList(_transactions),
                TransactionForm(),
            ] // <Widget>
        ); // Column
    }
    
}




class TransactionUser extends StatefulWidget
{
    @override
    _TransactionUserState createState() => _TransactionUserState();
}

