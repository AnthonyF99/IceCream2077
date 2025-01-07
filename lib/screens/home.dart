import 'package:flutter/material.dart';
import 'package:icecream/widgets/navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return const NavigationExample(); // Utilise directement le widget
  }
}
