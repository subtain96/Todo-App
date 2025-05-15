import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSaved,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        //Get user Input
        TextField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText: "Add a new task"
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //save button
          MyButton(text: "Save", onPressed: onSaved),
            const SizedBox(width: 8,),
            MyButton(text: "Cancel", onPressed: onCancel),
            //cancel button
          ],
        ),

        // Save button and also cancel button

      ],),
      ),

    );
  }
}
