import 'package:flutter/material.dart';
import 'package:icecream/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
            style: TextStyle(
              color: Colors.white,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network(
                'https://images.stockcake.com/public/8/2/1/8218586c-99a7-4e47-b95f-572378c12e39/ice-cream-delight-stockcake.jpg',
                height: 350,
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
                        return HomePage();
                      },
                    ),
                  );
                },
                child: const Text('Get Started'))
          ],
        ),
      ),
    );
  }
}
