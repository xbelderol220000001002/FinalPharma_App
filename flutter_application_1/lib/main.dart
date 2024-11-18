import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/otc_screen.dart';
import 'package:flutter_application_1/Screens/rx_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Example cart items (use a Map instead of String)
    final List<Map<String, dynamic>> cartItems = [
      {"name": "Paracetamol", "price": 50, "quantity": 2},
      {"name": "Cough Syrup", "price": 120, "quantity": 1},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/posters.png'), // Background image
            fit: BoxFit.fill, // Ensures the image fills the screen
          ),
        ),
        child: Column(
          children: [
            // Content (if any) at the top can go here
            const Spacer(), // This will push everything below to the bottom

            // Buttons Section (moved to the very bottom)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // RX Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RXScreen(cartItems: cartItems),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(255, 152, 0, 1),
                      minimumSize:
                          Size(screenWidth * 0.35, screenHeight * 0.07),
                      textStyle: TextStyle(fontSize: screenHeight * 0.025),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('RX'),
                  ),
                  // OTC Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTCScreen(cartItems: cartItems),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 57, 175, 140),
                      minimumSize:
                          Size(screenWidth * 0.35, screenHeight * 0.07),
                      textStyle: TextStyle(fontSize: screenHeight * 0.025),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('OTC'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Optional extra spacing
          ],
        ),
      ),
    );
  }
}
