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
      home: const FirstScreen(), // Navigate to the First Screen
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // Define cartItems here
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pharmacy App'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/X (2).jpg', // Updated background image path
              fit:
                  BoxFit.cover, // Ensure the image covers the entire background
            ),
          ),
          // Buttons Container
          Positioned(
            bottom: 80, // Positioning from the bottom of the screen
            left: MediaQuery.of(context).size.width *
                0.13, // Adjusted value to move left
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align buttons to the left
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
                    minimumSize: const Size(150, 60), // Set button size
                    textStyle: const TextStyle(fontSize: 20), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    elevation: 5, // Shadow effect
                  ),
                  child: const Text('RX'),
                ),
                const SizedBox(width: 20), // Space between buttons
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
                    minimumSize: const Size(150, 60), // Set button size
                    textStyle: const TextStyle(fontSize: 20), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    elevation: 5, // Shadow effect
                  ),
                  child: const Text('OTC'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
