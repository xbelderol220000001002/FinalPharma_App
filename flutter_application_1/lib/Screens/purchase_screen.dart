import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  final double totalCost;

  const PurchaseScreen({super.key, required this.totalCost});

  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final TextEditingController gcashController = TextEditingController();
  final TextEditingController payMayaController = TextEditingController();
  final TextEditingController debitCardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/counterr.png'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        padding:
            const EdgeInsets.all(15.0), // Reduced padding for smaller screen
        child: Center(
          child: SingleChildScrollView(
            // Allow scrolling for smaller screens
            child: Container(
              padding: const EdgeInsets.all(20.0), // Reduced padding
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(
                    0.9), // Slightly more opaque for better contrast
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.blueAccent, width: 3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Total Amount
                  Text(
                    'Total Amount: ₱${widget.totalCost}',
                    style: const TextStyle(
                      fontSize: 24, // Adjusted font size for smaller screens
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // ONLINE PAYMENT
                  const Text(
                    'ONLINE PAYMENT:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // GCash payment section
                  _buildPaymentSection(
                    controller: gcashController,
                    label: 'Enter Mobile Number for GCash',
                    buttonText: 'Pay with GCash (Print)',
                    buttonColor: Colors.green,
                    onPressed: () => _processPayment('GCash', gcashController),
                  ),
                  const SizedBox(height: 10),

                  // PayMaya payment section
                  _buildPaymentSection(
                    controller: payMayaController,
                    label: 'Enter Mobile Number for PayMaya',
                    buttonText: 'Pay with PayMaya (Print)',
                    buttonColor: Colors.blue,
                    onPressed: () =>
                        _processPayment('PayMaya', payMayaController),
                  ),
                  const SizedBox(height: 10),

                  // Debit Card payment section
                  _buildPaymentSection(
                    controller: debitCardController,
                    label: 'Enter Debit Card Number',
                    buttonText: 'Pay with Debit Card (Print)',
                    buttonColor: Colors.orange,
                    onPressed: () =>
                        _processPayment('Debit Card', debitCardController),
                  ),
                  const SizedBox(height: 20),

                  // COUNTER PAYMENT
                  const Text(
                    'COUNTER PAYMENT:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _showPaymentNotification(context, 'Counter Payment', '');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 25.0), // Reduced button size
                    ),
                    child: const Text(
                      'Print and Save Receipt',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentSection({
    required TextEditingController controller,
    required String label,
    required String buttonText,
    required Color buttonColor,
    required Function onPressed,
  }) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 25.0), // Smaller padding for buttons
          ),
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _processPayment(String method, TextEditingController controller) {
    String input = controller.text;
    if (input.isNotEmpty) {
      _showPaymentNotification(context, method, input);
    } else {
      _showErrorNotification(context, 'Please enter a valid number.');
    }
  }

  void _showPaymentNotification(
      BuildContext context, String method, String input) {
    String message = input.isNotEmpty
        ? 'You have paid using $method with input: $input. Please wait for the receipt.'
        : 'You have paid using $method. Please wait for the receipt.';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.green),
        ),
      ),
    );
  }

  void _showErrorNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
