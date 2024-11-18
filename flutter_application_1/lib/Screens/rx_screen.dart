import 'package:flutter/material.dart';

class RXScreen extends StatefulWidget {
  const RXScreen({super.key, required List cartItems});

  @override
  _RXScreenState createState() => _RXScreenState();
}

class _RXScreenState extends State<RXScreen> {
  int queueNumber = 0; // State variable to hold the queue number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RX Medications'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/pharmacycounter.jpeg', // Set the background image
              fit:
                  BoxFit.cover, // Ensure the image covers the entire background
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Container for the text with padding and border
                Container(
                  padding: const EdgeInsets.all(12.0), // Adjusted padding
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    border: Border.all(color: Colors.blueAccent, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'BY TAPPING THE QUEUE BUTTON, THE SYSTEM WILL NOTIFY IF YOU ARE THE NEXT TO CATER.',
                    style: TextStyle(
                      fontSize: 14, // Slightly smaller font size
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Button Row with swapped positions
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Back Button (now first)
                    buildCustomButton(
                      context,
                      'BACK',
                      Colors.red,
                      Colors.redAccent,
                      () {
                        Navigator.pop(context); // Back to previous screen
                      },
                    ),
                    const SizedBox(width: 10), // Space between buttons
                    // Queue for RX Button (now second)
                    buildCustomButton(
                      context,
                      'QUEUE',
                      Colors.blue,
                      Colors.blueAccent,
                      () {
                        setState(() {
                          queueNumber++; // Increment the queue number
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'You are now queued as number $queueNumber in the system.',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 88, 231, 107),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a custom button with padding and border
  Widget buildCustomButton(BuildContext context, String text,
      Color backgroundColor, Color borderColor, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 14.0, vertical: 6.0), // Reduced padding
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5), // Thin border
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Text color
          backgroundColor: backgroundColor, // Button background color
          minimumSize: const Size(130, 50), // Smaller button size
          textStyle: const TextStyle(
            fontSize: 16, // Adjusted font size
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4, // Slightly lower shadow
        ),
        child: Text(text),
      ),
    );
  }
}
