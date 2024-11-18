import 'package:flutter/material.dart';
import 'flu_cold_screen.dart';
import 'anti_allergy_screen.dart';
import 'cough_screen.dart';

class OTCScreen extends StatelessWidget {
  const OTCScreen({super.key, required List<Map<String, dynamic>> cartItems});

  @override
  Widget build(BuildContext context) {
    // Fetch the screen size
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('OTC Screen'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/pharmacycounter.jpeg', // Set the background image
              fit: BoxFit.cover,
            ),
          ),
          // Centered Column for Buttons
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title Text with Border and Padding
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(68, 138, 255, 1),
                          width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: const Text(
                      'SELECT WHAT ILLNESS YOU HAVE',
                      style: TextStyle(
                        fontSize:
                            16, // Adjusted font size for better visibility
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Bold black text
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20), // Space between title and buttons
                  // Vertical Column for Buttons
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Flu or Cold Button with Border and Padding
                      buildBlueButton(
                        context,
                        'FLU OR COLD',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FluColdScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15), // Space between buttons
                      // Cough Button with Border and Padding
                      buildBlueButton(
                        context,
                        'COUGH',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CoughScreen(cartItems: []),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 15), // Space between buttons
                      // Anti Allergy Button with Border and Padding
                      buildBlueButton(
                        context,
                        'ANTI ALLERGY',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AntiAllergyScreen(cartItems: []),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Back Button in the lower right corner
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildButton(
                context,
                'BACK',
                () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.red, // Set Back button color to red
                borderColor: Colors.red, // Set Back button border color to red
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a blue button
  Widget buildBlueButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return buildButton(
      context,
      text,
      onPressed,
      backgroundColor: const Color.fromRGBO(68, 138, 255, 1), // Blue color
      borderColor: Colors.blueAccent, // Border color for blue buttons
    );
  }

  // Helper method to create a button with customizable colors
  Widget buildButton(BuildContext context, String text, VoidCallback onPressed,
      {required Color backgroundColor, required Color borderColor}) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: backgroundColor, // Use the passed background color
          minimumSize: Size(screenWidth * 0.3, 50), // Adjusted button size
          textStyle: const TextStyle(
            fontSize: 16, // Adjusted font size for smaller buttons
            fontWeight: FontWeight.bold, // Bold text
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 8,
        ),
        child: Text(text),
      ),
    );
  }
}
