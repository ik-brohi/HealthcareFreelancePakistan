import 'package:ecom/myOrderpage.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  void _processPayment() {
    // Here, you would implement the logic to process the payment using a payment gateway or API
    String cardNumber = cardNumberController.text;
    String expiryDate = expiryDateController.text;
    String cvv = cvvController.text;

    // Implement your payment processing logic here
    // Example: Call a payment API with the card details
    // Once the payment is successful, you can navigate to a success screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: expiryDateController,
              decoration: InputDecoration(
                labelText: 'Expiry Date',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: cvvController,
              decoration: InputDecoration(
                labelText: 'CVV',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (cardNumberController != null && expiryDateController != null && cvvController != null) {
                  // Perform action to confirm the hiring, e.g., make an API call or navigate to the next screen.
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Payment Done'),
                        content: Text('Payment completed! Kndly wait until the doctor accept your request!  '),
                        actions: [
                          TextButton(
                            Widget: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => MyOrders()),
                              );

                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Incomplete Information'),
                        content: Text('One or more information is incorrect.'),
                        actions: [
                          TextButton(
                            Widget: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
