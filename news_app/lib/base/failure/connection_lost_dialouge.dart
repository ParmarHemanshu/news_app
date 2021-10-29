import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectionLostDialogBuilder extends StatelessWidget {
  final BuildContext context;

  ConnectionLostDialogBuilder(this.context);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Oops!!"),
      content: Text("You are not connected to internet."),
      actions: [
        TextButton(onPressed: (){}, child: Text("Cancel")),
        TextButton(onPressed: (){}, child: Text("Ok")),
      ],

    );
  }
}