import 'package:flutter/material.dart';
import 'package:icecream/screens/cartscreen.dart';
import 'package:icecream/widgets/product_card.dart';
import 'package:icecream/widgets/account_settings.dart';
import 'package:icecream/widgets/home.dart';
import 'package:icecream/model/cart.dart';
import 'package:provider/provider.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const NavigationExample(),
      ),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Badge(child: Icon(Icons.search)),
            label: 'Menu',
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.shopping_cart),
            icon: Consumer<Cart>(
              builder: (context, cart, child) => Badge(
                label: Text(cart.getUserCart().length.toString()),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        HomeWidget(),

        /// Menu page
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                Text(
                  'Ice Cream Shop',
                  style: theme.textTheme.titleLarge,
                ),
                IconButton(
                  icon: Consumer<Cart>(
                    builder: (context, cart, child) => Badge(
                      label: Text(cart.getUserCart().length.toString()),
                      child: Icon(Icons.shopping_cart_outlined),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                ),
              ]),

              ProductCard(), // Affichage de ProductCard
            ],
          ),
        ),

        /// Cart page
        const CartPage(),

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Setttings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              AccountSettings(isConnected: false)
            ],
          ),
        ),
      ][currentPageIndex],
    );
  }
}
