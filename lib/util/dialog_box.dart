import 'package:flutter/material.dart';
class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(height: 200,
      child: Column(children: [
        //Get user Input
        TextField(
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText: "Add a new task"
          ),
        ),
        Row(
          children: [
            //save button

            //cancel button
          ],
        )

        // Save button and also cancel button

      ],),
      ),

    );
  }
}
