import 'package:flutter/material.dart';
import 'drug_item.dart';
import 'checkout_screen.dart';

class AntiAllergyScreen extends StatefulWidget {
  const AntiAllergyScreen({super.key, required List cartItems});

  @override
  _AntiAllergyScreenState createState() => _AntiAllergyScreenState();
}

class _AntiAllergyScreenState extends State<AntiAllergyScreen> {
  List<Map<String, dynamic>> cartItems = []; // Local cart items

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
      SnackBar(
        content: Text('$name added to cart!'),
        duration: const Duration(seconds: 1), // 1 second duration
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anti Allergy Medicines'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Counter.jpeg'),
            fit: BoxFit.cover, // Fit the image to cover the entire container
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrugItem(
                name: 'Cetirizine (Alnix) Tablet',
                imagePath: 'assets/Cetirizine.jpg',
                price: 31.00,
                details:
                    'Cetirizine Dihydrochloride (Alnix®) is a doctor prescribed anti-allergy medicine for adults that provides lasting relief and works in as fast as 20 minutes in relieving symptoms such as sneezing, runny nose, itchy nose and itchy watery eyes; and skin allergy symptoms such as itch and rashes.',
                onAddToCart: () {
                  addToCart('Cetirizine (Alnix) Tablet', 31.00);
                },
              ),
              DrugItem(
                name: 'Loratadine (Claritin) Tablet',
                imagePath: 'assets/claritin.jpg',
                price: 151.50,
                details:
                    'Loratadine (Claritin) is an antihistamine. It blocks histamine, a natural chemical in your body that can cause allergy symptoms like itchy eyes, runny nose, and sneezing. In doing so, loratadine (Claritin) helps relieve allergy symptoms.',
                onAddToCart: () {
                  addToCart('Loratadine (Claritin) Tablet', 151.50);
                },
              ),
              DrugItem(
                name: 'Diphenhydramine HCl (Benadryl) Syrup',
                imagePath: 'assets/benadryl.png',
                price: 177.00,
                details:
                    'Diphenhydramine Syrup or Elixir. Benadryl® (diphenhydramine) is a liquid medication that treats the symptoms of allergies and allergic reactions. It may also prevent and treat motion sickness or the symptoms of Parkinson\'s disease. It\'s a type of antihistamine medication.',
                onAddToCart: () {
                  addToCart('Diphenhydramine HCl (Benadryl) Syrup', 177.00);
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
