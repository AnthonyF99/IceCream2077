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
            hintText: 'John Doe...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter your email address',
            hintText: 'abc@gmail.com...',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            labelText: 'Change your password',
            hintText: '******',
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
