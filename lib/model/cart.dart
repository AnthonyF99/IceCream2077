import 'package:flutter/material.dart';
import 'package:icecream/model/ice_cream.dart';

class Cart extends ChangeNotifier {
  // List of iceCream for sale
  List<IceCream> iceCreamShop = [
    IceCream(
      name: "Chocolat Intense",
      price: "2",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Rich and creamy dark chocolate delight.",
      categories: ["Classic", "Chocolate", "Hot Deals"],
    ),
    IceCream(
      name: "Cyber Vanilla",
      price: "3",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Vanilla ice cream with a futuristic twist.",
      categories: ["Classic", "Vanilla", "Hot Deals", "New"],
    ),
    IceCream(
      name: "Neon Raspberry",
      price: "5",
      imagePath: "assets/images/iceCream_logo.png",
      description: "A zesty mix of raspberries and neon-colored swirls.",
      categories: ["Seasonal", "Fruity", "New"],
    ),
    IceCream(
      name: "Pixel Pistachio",
      price: "6",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Crunchy pistachios blended into creamy heaven.",
      categories: ["Classic", "Nuts", "Hot Deals"],
    ),
    IceCream(
      name: "Galaxy Swirl",
      price: "9",
      imagePath: "assets/images/iceCream_logo.png",
      description: "A cosmic mix of blueberry and cotton candy flavors.",
      categories: ["Seasonal", "Fruity", "New"],
    ),
    IceCream(
      name: "Oreo Ultra Max",
      price: "8",
      imagePath: "assets/images/iceCream_logo.png",
      description: "The ultimate Oreo experience in every bite.",
      categories: ["Classic", "Oreo", "New"],
    ),
    IceCream(
      name: "Lagoon Breeze",
      price: "5",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Refreshing tropical flavors for sunny days.",
      categories: ["Seasonal", "Tropical", "Dairy Free"],
    ),
    IceCream(
      name: "Lunar Lemon",
      price: "7",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Tangy lemon cream that’s out of this world.",
      categories: ["New", "Fruity", "Hot Deals"],
    ),
    IceCream(
      name: "Aurora Matcha",
      price: "10",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Premium matcha infused with aurora colors.",
      categories: ["New", "Green Tea", "Premium"],
    ),
    IceCream(
      name: "Cyber Cookie Crunch",
      price: "11",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Crunchy cookie bits meet a cyber-cool experience.",
      categories: ["Hot Deals", "Cookies", "Classic"],
    ),
    IceCream(
      name: "Shadow Mint",
      price: "6",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Refreshing mint with a dark chocolate twist.",
      categories: ["Classic", "Mint", "New"],
    ),
    IceCream(
      name: "Caramel Nexus",
      price: "8",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Rich caramel swirled with exotic flavors.",
      categories: ["Seasonal", "Caramel", "Premium"],
    ),
    IceCream(
      name: "Turbo Strawberry",
      price: "4",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Juicy strawberries blended with a turbo twist.",
      categories: ["Fruity", "Hot Deals", "New"],
    ),
    IceCream(
      name: "Nitro Coconut",
      price: "6",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Chilled coconut with a nitro-cool effect.",
      categories: ["Tropical", "Dairy Free", "Hot Deals"],
    ),
    IceCream(
      name: "Quantum Fudge",
      price: "12",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Decadent fudge powered by quantum flavors.",
      categories: ["Chocolate", "Premium", "New"],
    ),
    IceCream(
      name: "Solar Mango",
      price: "5",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Bright mango flavors powered by solar vibes.",
      categories: ["Fruity", "Tropical", "Hot Deals"],
    ),
    IceCream(
      name: "Eclipse Coffee",
      price: "15",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Bold espresso ice cream with a rich mocha swirl.",
      categories: ["Coffee", "Premium", "New"],
    ),
    IceCream(
      name: "Holographic Berry",
      price: "7",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Mixed berries with a holographic finish.",
      categories: ["Fruity", "Seasonal", "New"],
    ),
    IceCream(
      name: "Prism Cheesecake",
      price: "18",
      imagePath: "assets/images/iceCream_logo.png",
      description: "Cheesecake-inspired ice cream with a prism glaze.",
      categories: ["Premium", "Hot Deals", "New"],
    ),
    IceCream(
      name: "Infinity Swirl",
      price: "20",
      imagePath: "assets/images/iceCream_logo.png",
      description: "An endless swirl of exotic flavors and creamy bliss.",
      categories: ["Premium", "Exotic", "Hot Deals", "New"],
    ),
  ];

  //List of items in user cart
  List<IceCream> userCart = [];

  //Get list of items for sale
  List<IceCream> getIceCreamList() {
    return iceCreamShop;
  }

  // get cart
  List<IceCream> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(IceCream icecream) {
    userCart.add(icecream);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(IceCream icecream) {
    userCart.remove(icecream);
    notifyListeners();
  }
}
