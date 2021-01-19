import 'package:flutter/material.dart';
import 'package:mmanager/models/transaction.dart';
import 'package:intl/intl.dart';


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
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index)
                {
                    final tr = transactions[index];
                    return Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 5,
                        ), // EdgeInsets.symmetric
                        child: ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: FittedBox(
                                        child: Text('R\$${tr.value}'),
                                    ), // FittedBox
                                ), // Padding
                            ), // CircleAvatar
                            title: Text(
                                tr.title,
                                style: TextStyle(
                                    fontFamily: "MerriweatherSans",
                                    fontWeight: FontWeight.bold,
                                ), // TextStyle
                            ), // Text
                            subtitle: Text(
                                DateFormat('d MMM y').format(tr.date),
                            ), // Text
                            trailing: MediaQuery.of(context).size.width > 480
                            ? FlatButton.icon(
                                icon: Icon(Icons.delete),
                                onPressed: () => onRemove(tr.id),
                                label: Text('Excluir'),
                                textColor: Colors.redAccent,
                            ) // FlatButton 
                            : IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.redAccent,
                                onPressed: () => onRemove(tr.id),
                            ) // IconButton
                        ), // ListTile
                    ); // Card
                },
            ), // ListView 
        ); // Container
    }
}
