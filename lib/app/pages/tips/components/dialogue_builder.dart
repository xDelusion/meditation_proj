import 'package:explained_full/app/pages/tips/provider/tips_provider.dart';
import 'package:explained_full/app/shared/colorful_prints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> dialogBuilder(BuildContext context) {
  final TextEditingController _textEditingController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      try {
        return AlertDialog(
          title: Text('Add Tips'),
          content: TextField(
            controller: _textEditingController,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: null,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Share your tips...',
              labelStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                context
                    .read<TipsProvider>()
                    .addTip(_textEditingController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      } catch (error) {
        printError("Error in dialogBuilder: $error");
        // You can also log or print more specific details about the error if needed
        return Center(
          child: Text('Error adding tip: $error'),
        );
      }
    },
  );
}
