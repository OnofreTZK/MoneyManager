import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class _TransactionFormState extends State<TransactionForm>
{
    
    final titleController = TextEditingController();
    final valueController = TextEditingController();


    _submitForm()
    {
        final title = titleController.text;
        final value = double.tryParse(valueController.text) ?? 0.0;

        if( title.isEmpty || value <= 0 )
        {
            return;
        }

        // Inherited attribute --> widget
        widget.onSubmit(title, value);
        
    }
    
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
                            onSubmitted: (_) => _submitForm(),
                            decoration: InputDecoration(
                                labelText: 'Título'
                            ), // InputDecoration        
                        ), // TextField
                        TextField(
                            controller: valueController,
                            //keyboardType: TextInputType.number, -> Only Android
                            keyboardType: TextInputType.numberWithOptions(
                                    decimal: true), // -> Android and IOS
                            onSubmitted: (_) => _submitForm(),
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
                                    onPressed: () {
                                        _submitForm();
                                    },
                                ), // FlatButton
                            ] // <Widget>
                        ), // Row
                    ] // <Widget>
                ), // Column
            ), // Container
        ); // Card
    }

}



class TransactionForm extends StatefulWidget
{
    // Form values to "father" widget.
    final void Function(String, double) onSubmit;

    TransactionForm(this.onSubmit);

    @override
    _TransactionFormState createState() =>  _TransactionFormState();
}


