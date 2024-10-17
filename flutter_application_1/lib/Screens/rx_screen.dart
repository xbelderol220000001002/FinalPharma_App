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
                  padding: const EdgeInsets.all(
                      16.0), // Padding inside the container
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                        0.8), // Slight background color for readability
                    border: Border.all(
                        color: Colors.blueAccent,
                        width: 2), // Border color and width
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: const Text(
                    'BY TAPPING THE QUEUE BUTTON, THE SYSTEM WILL NOTIFY IF YOU ARE THE NEXT TO CATER.',
                    style: TextStyle(
                      fontSize: 18, // Font size
                      fontWeight: FontWeight.bold, // Bold text
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.center, // Center align the text
                  ),
                ),

                const SizedBox(height: 40), // Add some spacing

                // Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Queue for RX Button
                    buildCustomButton(
                      context,
                      'QUEUE',
                      Colors.blue, // Blue background color
                      Colors.blueAccent, // Blue border color
                      () {
                        setState(() {
                          queueNumber++; // Increment the queue number
                        });

                        // Show SnackBar with queue number in blue color
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'You are now queued as number $queueNumber in the system.',
                              style: const TextStyle(
                                color: Color.fromARGB(
                                    255, 88, 231, 107), // Blue text color
                                fontWeight: FontWeight.bold, // Bold text
                              ),
                            ),
                            duration: const Duration(
                                seconds: 2), // Duration of the SnackBar
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 20), // Space between buttons
                    // Back Button
                    buildCustomButton(
                      context,
                      'BACK',
                      Colors.red, // Red background color
                      Colors.redAccent, // Red border color
                      () {
                        Navigator.pop(context); // Back to previous screen
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
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border:
            Border.all(color: borderColor, width: 2), // Border color and width
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Text color
          backgroundColor: backgroundColor, // Button background color
          minimumSize: const Size(150, 60), // Button size
          textStyle: const TextStyle(
            fontSize: 20, // Font size
            fontWeight: FontWeight.bold, // Bold text
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded button shape
          ),
          elevation: 8, // Shadow effect
        ),
        child: Text(text),
      ),
    );
  }
}
