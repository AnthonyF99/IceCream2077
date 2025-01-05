import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter your name',
            hintText: 'Type something...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Change your email address',
            hintText: 'Type something...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Change your password',
            hintText: 'Type something...',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Affiche la valeur dans une boîte de dialogue
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog();
              },
            );
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
