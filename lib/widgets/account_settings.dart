import 'package:flutter/material.dart';
import 'package:icecream/screens/loginscreen.dart';
import 'package:provider/provider.dart';
import 'package:icecream/model/auth_provider.dart';

class AccountSettings extends StatelessWidget {
  final bool isConnected;

  const AccountSettings({super.key, required this.isConnected});

  @override
  Widget build(BuildContext context) {
    bool isConnected = Provider.of<AuthProvider>(context).isConnected;

    return Column(
      children: [
        if (isConnected)
          Column(
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Submitted successfully!"),
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          )
        else
          Column(
            children: [
              const Text(
                'You are not connected. Please log in first.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: const Text('Log In'),
              ),
            ],
          ),
      ],
    );
  }
}
