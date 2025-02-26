sealed class Payment {
  String pay(double amount);
}

class CashPayment implements Payment {
  @override
  String pay(double amount) => "Paid ${amount.ceil()} via Cash.";
}

class CreditPayment implements Payment {
  @override
  String pay(double amount) => "Paid ${amount.ceil()} via Credit Card.";
}
