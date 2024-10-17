import 'package:flutter/material.dart';
import 'purchase_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const CheckoutScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalCost = 0.0;
    num totalItems = 0;

    // Calculate the total cost and item count
    for (var item in cartItems) {
      totalCost += item['price'] * item['quantity'];
      totalItems += item['quantity'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MY CART'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/pharmacytablep2.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black54,
          ),
          SingleChildScrollView(
            // Wrapping the content in SingleChildScrollView
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      shrinkWrap:
                          true, // Added to let the list view take only the space it needs
                      physics:
                          NeverScrollableScrollPhysics(), // Disable scrolling for the inner list view
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 1.5),
                            ),
                            child: ListTile(
                              title: Text(
                                '${item['name']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '₱ ${item['price']} x ${item['quantity']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              trailing: Text(
                                '₱ ${item['price'] * item['quantity']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Total Items with stylish UI
                        Text(
                          'Total Items: $totalItems',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Total Cost with bigger text and green color
                        Text(
                          'Total: ₱$totalCost',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.green, // Keep total color green
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Proceed to Purchase Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PurchaseScreen(totalCost: totalCost),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue, // Changed button color to blue
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32),
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 8,
                          ),
                          child: const Text(
                            'Proceed to Purchase',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
