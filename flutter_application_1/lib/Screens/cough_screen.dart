import 'package:flutter/material.dart';
import 'drug_item.dart';
import 'checkout_screen.dart'; // Import your CheckoutScreen

class CoughScreen extends StatefulWidget {
  const CoughScreen({super.key, required List cartItems});

  @override
  _CoughScreenState createState() => _CoughScreenState();
}

class _CoughScreenState extends State<CoughScreen> {
  List<Map<String, dynamic>> cartItems = [];

  void addToCart(String name, double price) {
    setState(() {
      final existingItem = cartItems.firstWhere(
        (item) => item['name'] == name,
        orElse: () => {'name': name, 'price': price, 'quantity': 0},
      );

      if (existingItem['quantity'] > 0) {
        existingItem['quantity']++;
      } else {
        cartItems.add({'name': name, 'price': price, 'quantity': 1});
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$name added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cough Medicines'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Counter.jpeg'), // Background image
            fit: BoxFit.cover, // Fit the image to cover the entire container
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrugItem(
                name: 'Ambroxol (Mucosolvan) 24HRS Capsule',
                imagePath: 'assets/ambroxol.jpg',
                price: 45.00,
                details:
                    'is a medication indicated for airway secretion clearance therapy. Ambroxol is a secretolytic agent used in the treatment of respiratory diseases associated with viscid or excessive mucus. It is the active ingredient of Mucosolvan, Lasolvan or Mucoangin.',
                onAddToCart: () {
                  addToCart('Ambroxol (Mucosolvan) 24HRS Capsule', 45.00);
                },
              ),
              DrugItem(
                name: 'Carbocisteine (Solmux) Capsule',
                imagePath: 'assets/Solmux.png',
                price: 151.50,
                details:
                    'is used to treat cough with phlegm and scientifically proven to: Melt phlegm, making it less thick and sticky. Expel phlegm with bacteria, and. Stop excess production of phlegm.',
                onAddToCart: () {
                  addToCart('Carbocisteine (Solmux) Capsule', 151.50);
                },
              ),
              DrugItem(
                name: 'Butamirate Citrate (Sinecod Forte) SR Tablet',
                imagePath: 'assets/sinecod.jpg',
                price: 22.25,
                details:
                    'Sinecod Forte is used for symptomatic treatment of cough of various origins.',
                onAddToCart: () {
                  addToCart(
                      'Butamirate Citrate (Sinecod Forte) SR Tablet', 22.25);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: cartItems.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CheckoutScreen(cartItems: cartItems),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
