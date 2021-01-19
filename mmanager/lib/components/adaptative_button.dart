import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "dart:io"

class AdaptativeButton extends StatelessWidgets
{
    final String label;
    final Function onPressed;

    AdaptativeButton({
        this.label,
        this.onPressed,
    });

    @override
    Widget build(BuildContext context)
    {
        return Platform.isIOS
            ? CupertinoButton(
                child: Text(label),
                onPressed: onPressed,
            )
            : RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: Text(label),
                onPressed: onPressed,
            );//
    }

    
}
