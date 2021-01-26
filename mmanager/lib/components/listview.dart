import "package:flutter/material.dart";
import 'package:mmanager/models/transaction.dart';



class ListViewer extends StatelessWidget
{
    
    final List<Transaction> transactions;

    final void Function(String) onRemove;
    
    ListViewer(this.transactions, this.onRemove);

    @override    
    Widget build(BuildContext context)
    {

    }

}
