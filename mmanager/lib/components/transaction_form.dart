import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class _TransactionFormState extends State<TransactionForm>
{
    
    final _titleController = TextEditingController();
    final _valueController = TextEditingController();
    DateTime _selectedDate;

    _submitForm()
    {
        final title = _titleController.text;
        final value = double.tryParse(_valueController.text) ?? 0.0;

        if( title.isEmpty || value <= 0 )
        {
            return;
        }

        // Inherited attribute --> widget
        widget.onSubmit(title, value);
        
    }


    _showDatePicker() 
    {
        // Async function --> will return Future<DateTime>
        showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime.now(),
        ).then((pickedDate){
            if( pickedDate == null )
            {
                return;
            }

            setState(() {
                _selectedDate = pickedDate;
            });
        
        });
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
                            controller: _titleController,
                            onSubmitted: (_) => _submitForm(),
                            decoration: InputDecoration(
                                labelText: 'Título'
                            ), // InputDecoration        
                        ), // TextField
                        TextField(
                            controller: _valueController,
                            //keyboardType: TextInputType.number, -> Only Android
                            keyboardType: TextInputType.numberWithOptions(
                                    decimal: true), // -> Android and IOS
                            onSubmitted: (_) => _submitForm(),
                            decoration: InputDecoration(
                                labelText: 'Valor (R\$)',
                            ), // InputDecoration
                        ), // TextField
                        Container(
                            height: 70,
                            child: Row(
                                children: <Widget>[
                                    Expanded(
                                        child: Text(
                                        _selectedDate == null ? 
                                        'Nenhuma data selecionada.'
                                        : ' Data Selecionada: ${DateFormat('d/M/y').format(_selectedDate)}'
                                        ), // Text
                                    ), // Expanded
                                    FlatButton(
                                        textColor: Theme.of(context).primaryColor,
                                        child: Text(
                                            'Selecione uma data.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                            ), // TextStyle
                                        ), // Text
                                        onPressed: _showDatePicker,
                                    ) // FlatButton
                                ] // <Widget
                            ), // Row
                        ), // Container
                        Row(
                            mainAxisAlignment: MainAxisAlignment
                            .end,
                            children: <Widget>[
                                RaisedButton(
                                    child: Text(
                                        'Nova Transacão',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                        ), // TextStyle
                                    ), // Text
                                    color: Colors.pinkAccent,
                                    textColor: Colors.white,
                                    onPressed: () {
                                        _submitForm();
                                    },
                                ), // RaisedButton
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


