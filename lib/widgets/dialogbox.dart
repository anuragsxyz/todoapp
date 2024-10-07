import 'package:flutter/material.dart';
import 'package:fundamentals/widgets/mybutton.dart';

class dialogCheckbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  dialogCheckbox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amberAccent,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //save buttom
                Mybutton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 20,
                ),
                Mybutton(text: "Cancel", onPressed: onCancel)
                //cancel buttom
              ],
            )
          ],
        ),
      ),
    );
  }
}
