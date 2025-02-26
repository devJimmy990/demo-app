import 'package:demo_app/model/payment.dart';
import 'package:demo_app/model/payment_processor.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentProcessor payment;
  double _price = 100.0;
  bool _isCash = true;

  @override
  void initState() {
    payment = PaymentProcessor(CashPayment());
    super.initState();
  }

  void _togglePaymentMethod() {
    setState(() {
      _isCash = !_isCash;
      _price = _isCash ? 100 : 125;
      payment = PaymentProcessor(_isCash ? CashPayment() : CreditPayment());
    });
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total Price: \$${_price.ceil()}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Payment Method:"),
                Switch(
                  value: _isCash,
                  onChanged: (value) {
                    _togglePaymentMethod();
                  },
                ),
                Text(_isCash ? "Cash" : "Credit"),
              ],
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar(payment.process(_price)),
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}
