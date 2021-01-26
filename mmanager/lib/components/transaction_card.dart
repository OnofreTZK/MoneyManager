import 'package:flutter/material.dart';
import 'package:mmanager/models/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';


class TransactionItem extends StatefulWidget
{
    final Transaction tr;

    final void Function(String) onRemove;

    TransactionItem({
        Key key,
        @required this.tr,
        @required this.onRemove
    }) : super(key: key);


    @override
    _TransactionItemState createState() => _TransactionItemState();
    
}





class _TransactionItemState extends State<TransactionItem>
{

    static const colors = [
        Colors.red,
        Colors.purple,
        Colors.orange,
        Colors.blue,
        Colors.black,
    ];

    
    Color _backgroundcolor;


    @override 
    void initState()
    {
        super.initState();
        int i = Random().nextInt(5);
        _backgroundcolor = colors[i];
    }


    Widget build(BuildContext context)
    {    
        return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
            ), // EdgeInsets.symmetric
            child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: _backgroundcolor,
                    radius: 30,
                    child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('R\$${widget.tr.value}'),
                        ), // FittedBox
                    ), // Padding
                ), // CircleAvatar
                title: Text(
                    widget.tr.title,
                    style: TextStyle(
                        fontFamily: "MerriweatherSans",
                        fontWeight: FontWeight.bold,
                    ), // TextStyle
                ), // Text
                subtitle: Text(
                    DateFormat('d MMM y').format(widget.tr.date),
                ), // Text
                trailing: MediaQuery.of(context).size.width > 480
                ? FlatButton.icon(
                    icon: const Icon(Icons.delete),
                    onPressed: () => widget.onRemove(widget.tr.id),
                    label: const Text('Excluir'),
                    textColor: Colors.redAccent,
                ) // FlatButton 
                : IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.redAccent,
                    onPressed: () => widget.onRemove(widget.tr.id),
                ) // IconButton
            ), // ListTile
        ); // Card
    }
}
