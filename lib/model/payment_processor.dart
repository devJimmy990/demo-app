import 'package:demo_app/model/payment.dart';

class PaymentProcessor {
  final Payment payment;

  PaymentProcessor(this.payment);

  String process(double amount) => payment.pay(amount);
}
