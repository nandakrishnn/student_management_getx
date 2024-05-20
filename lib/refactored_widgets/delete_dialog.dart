import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;
  DeleteDialog({super.key, required this.onCancel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Delete Student',
        style: TextStyle(
            color: Colors.white, wordSpacing: 4, fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'Are you sure you want to delete this student?',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
          TextButton(
          onPressed: onCancel,
          child: const Text(
            'Cancel',
            style: TextStyle(

                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: onDelete,
          child: const Text(
            'Delete',
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
         backgroundColor: const Color.fromARGB(255, 51, 50, 50),
    );
  }
}
