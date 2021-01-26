import 'package:flutter/material.dart';
import 'package:mmanager/models/transaction.dart';
import 'package:mmanager/components/transaction_card.dart';



class TransactionList extends StatelessWidget
{
    final List<Transaction> transactions;

    final void Function(String) onRemove;

    TransactionList(this.transactions, this.onRemove);

    @override
    Widget build(BuildContext context)
    {
        
        return Container(
            child: transactions.isEmpty 
            ? LayoutBuilder(
                builder: (ctx, constraints)
                {
                    return Column(
                        children: <Widget>[
                            SizedBox(height: 20),
                            Text(
                                'Nenhuma Transação Cadastrada.',
                                style: TextStyle(
                                        fontFamily: 'MerriweatherSans',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                ), // TextStyle
                            ), // Text
                            SizedBox(height: 20),
                            Container(
                                height: constraints.maxHeight * 0.6,
                                child: Image.asset(
                                    'assets/images/waiting.png',
                                    fit: BoxFit.cover,
                                    ), // Image
                            ), // Container
                        ], // <widget>
                    ); // Column
                },
            ) // LayoutBuilder
            : ListView(
                children: transactions.map((tr) {
                    return TransactionItem(
                        key: ValueKey(tr.id),
                        tr: tr,
                        onRemove: onRemove,
                    ); // TransactionItem
                }).toList(),
            ),
              //ListView.builder(
              //  itemCount: transactions.length,
              //  itemBuilder: (ctx, index)
              //  {
              //      final tr = transactions[index];
              //      return TransactionItem(
              //          tr: tr, 
              //          onRemove: onRemove,
              //      ); // TransactionItem
              //  },
              //), // ListView 
        ); // Container
    }
}
