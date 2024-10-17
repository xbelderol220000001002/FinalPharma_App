import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/otc_screen.dart';
import 'package:flutter_application_1/Screens/rx_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy Mobile System'),
      ),
      body: Stack(
        children: [
          // Updated Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/X (2).jpg', // Updated path
              fit: BoxFit.cover,
            ),
          ),
          // Centered Column for Buttons
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // RX Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RXScreen(cartItems: []),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      minimumSize: const Size(150, 60),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                    ),
                    child: const Text('RX'),
                  ),
                  const SizedBox(width: 20),
                  // OTC Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTCScreen(cartItems: []),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(150, 60),
                      textStyle: const TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                    ),
                    child: const Text('OTC'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
