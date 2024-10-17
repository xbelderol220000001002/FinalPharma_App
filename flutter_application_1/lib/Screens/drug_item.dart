import 'package:flutter/material.dart';

class DrugItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final double price;
  final String details;
  final Function onAddToCart;

  const DrugItem({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.details,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(imagePath, height: 150), // Increased image height
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold), // Increased font size
                  textAlign: TextAlign.center, // Center the title
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, color: Colors.green), // Increased font size
                  textAlign: TextAlign.center, // Center the price
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    details,
                    style: const TextStyle(fontSize: 18), // Increased font size
                    textAlign: TextAlign.center, // Center the details
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    onAddToCart(); // Call the provided onAddToCart function
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 30.0), // Larger padding for the button
                    textStyle: const TextStyle(
                        fontSize: 18), // Increased button text size
                  ),
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
