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
        padding: const EdgeInsets.all(10.0), // Reduced padding
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20.0), // Reduced padding
            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(0.9), // Slightly more opaque for better contrast
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Colors.blueAccent, width: 3), // Thicker border
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to start
              children: [
                // Total Amount
                Text(
                  'Total Amount: ₱${widget.totalCost}',
                  style: const TextStyle(
                    fontSize: 28, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Changed color to green
                  ),
                ),
                const SizedBox(height: 10),

                // ONLINE PAYMENT
                const Text(
                  'ONLINE PAYMENT:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ), // Adjusted font size
                ),
                const SizedBox(height: 10),

                // GCash payment section
                Center(
                  // Centering the GCash section
                  child: Column(
                    children: [
                      TextField(
                        controller: gcashController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Mobile Number for GCash',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          String mobileNumber = gcashController.text;
                          if (mobileNumber.isNotEmpty) {
                            _showPaymentNotification(
                                context, 'GCash', mobileNumber);
                          } else {
                            _showErrorNotification(
                                context, 'Please enter a mobile number.');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 40.0), // Increased button padding
                        ),
                        child: const Text(
                          'Pay with GCash',
                          style: TextStyle(
                              color: Colors.white), // Button text color
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // PayMaya payment section
                Center(
                  // Centering the PayMaya section
                  child: Column(
                    children: [
                      TextField(
                        controller: payMayaController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Mobile Number for PayMaya',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          String mobileNumber = payMayaController.text;
                          if (mobileNumber.isNotEmpty) {
                            _showPaymentNotification(
                                context, 'PayMaya', mobileNumber);
                          } else {
                            _showErrorNotification(
                                context, 'Please enter a mobile number.');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 40.0), // Increased button padding
                        ),
                        child: const Text(
                          'Pay with PayMaya',
                          style: TextStyle(
                              color: Colors.white), // Button text color
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Debit Card payment section
                Center(
                  // Centering the Debit Card section
                  child: Column(
                    children: [
                      TextField(
                        controller: debitCardController,
                        decoration: const InputDecoration(
                          labelText: 'Enter Debit Card Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          String cardNumber = debitCardController.text;
                          if (cardNumber.isNotEmpty) {
                            _showPaymentNotification(
                                context, 'Debit Card', cardNumber);
                          } else {
                            _showErrorNotification(
                                context, 'Please enter a debit card number.');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 40.0), // Increased button padding
                        ),
                        child: const Text(
                          'Pay with Debit Card',
                          style: TextStyle(
                              color: Colors.white), // Button text color
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // COUNTER PAYMENT
                const Text(
                  'COUNTER PAYMENT:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ), // Adjusted font size
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _showPaymentNotification(context, 'Counter Payment', '');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87, // Dark color
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, // Increased button height
                        horizontal: 60.0), // Increased button width
                  ),
                  child: const Text(
                    'Print and Save Receipt',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20), // Increased button text size
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPaymentNotification(
      BuildContext context, String method, String input) {
    String message = input.isNotEmpty
        ? 'You have paid using $method with input: $input. Please wait for the receipt.'
        : 'You have paid using $method. Please wait for the receipt.';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: const TextStyle(
                color: Colors.green)), // Change text color to green
      ),
    );
  }

  void _showErrorNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: const TextStyle(
                color: Colors.red)), // Error notification text color
      ),
    );
  }
}
