import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:icecream/screens/loginscreen.dart';
import 'package:icecream/model/auth_provider.dart';
import 'package:icecream/model/cart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()), // Fournisseur to manage user state
        ChangeNotifierProvider(
            create: (_) => Cart()), // Fournisseur to manage cart
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Color buttonBackgroundColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            'IceCream 2077',
            style: TextStyle(color: Colors.white, fontFamily: 'CyberPunk'),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network(
                'https://images.stockcake.com/public/8/2/1/8218586c-99a7-4e47-b95f-572378c12e39/ice-cream-delight-stockcake.jpg',
                height: 500,
                width: double.infinity,
              ),
            ),
            const Text(
              'Welcome to The Ice Cream 2077',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
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
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  backgroundColor: Colors.cyan,
                  shadowColor: Colors.cyanAccent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.cyanAccent)),
                ),
                child: const Text('Get Started',
                    style: TextStyle(
                      color: Colors.white, // Couleur du texte
                      fontSize: 16,
                    )))
          ],
        ),
      ),
    );
  }
}
