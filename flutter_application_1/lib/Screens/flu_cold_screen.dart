import 'package:flutter/material.dart';
import 'drug_item.dart';
import 'checkout_screen.dart';

class FluColdScreen extends StatefulWidget {
  const FluColdScreen({super.key});

  @override
  _FluColdScreenState createState() => _FluColdScreenState();
}

class _FluColdScreenState extends State<FluColdScreen> {
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
        title: const Text('Flu Medicine'),
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
                name: 'Neozep Forte',
                imagePath: 'assets/neozep.png',
                price: 100.00,
                details:
                    'Neozep® Z+ Forte is used for the relief of clogged nose, post nasal drip, itchy and watery eyes, sneezing, headache, body aches, and fever associated with the common cold, allergic rhinitis, sinusitis, flu, and other minor respiratory tract infections.',
                onAddToCart: () {
                  addToCart('Neozep Forte', 100.00);
                },
              ),
              DrugItem(
                name: 'Ascof Forte',
                imagePath: 'assets/ASCOF FORTE.png',
                price: 120.00,
                details:
                    'Ascof Forte is for the relief of mild to moderate cough due to common colds, flu, and mild to moderate acute bronchitis, for relief of reversible mild to moderate bronchospasm.',
                onAddToCart: () {
                  addToCart('Ascof Forte', 120.00);
                },
              ),
              DrugItem(
                name: 'Bio Flu',
                imagePath: 'assets/bioflu.jpg',
                price: 90.00,
                details:
                    'Bio Flu is used for the relief of clogged nose, runny nose, postnasal drip, itchy and watery eyes, sneezing, headache, body aches, and fever associated with flu, common cold, allergic rhinitis, sinusitis, and other minor respiratory tract infections.',
                onAddToCart: () {
                  addToCart('Bio Flu', 90.00);
                },
              ),
              const SizedBox(height: 20),
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
