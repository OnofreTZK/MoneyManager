import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatelessWidget
{
    
    final titleController = TextEditingController();
    final valueController = TextEditingController();
    
    @override
    Widget build(BuildContext context)
    {
            
        return Card(
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
        ); // Card
    }

}
