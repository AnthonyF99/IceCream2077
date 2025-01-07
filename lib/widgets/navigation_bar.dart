import 'package:flutter/material.dart';
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
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.search)),
            label: 'Menu',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_bag),
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.shopping_bag_outlined),
            ),
            label: 'Order',
          ),
          NavigationDestination(
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
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartRoute()),
                    );
                  },
                ),
              ]),

              ProductCard(), // Affichage de ProductCard
            ],
          ),
        ),

        /// Order page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Order 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Order 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),
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

class CartRoute extends StatelessWidget {
  const CartRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CART'),
      ),
      body: Wrap(
        children: [
          Card(
            child: ListTile(
              leading: IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () {},
              ),
              title: Text('Product Title 1'),
              subtitle: Text('Product Description 1'),
            ),
          ),
          Card(
            child: ListTile(
              leading: IconButton(
                icon: const Icon(Icons.cancel_outlined),
                onPressed: () {},
              ),
              title: Text('Ex: Vanilla Bean'),
              subtitle: Text('Vanilla bean, price: 1.00, chocolate topping'),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}
