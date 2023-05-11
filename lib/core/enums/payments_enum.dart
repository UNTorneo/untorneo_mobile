enum PaymentMethod {
  cash(title: 'Efectivo', paymentValue: 'cash'),
  card(title: 'Tarjeta crédito/débito', paymentValue: 'card'),
  nequiTransfer(title: 'Transferencia Nequi', paymentValue: 'nequiTransfer'),
  daviplataTransfer(title: 'Transferencia Daviplata', paymentValue: 'daviplataTransfer'),
  pse(title: 'PSE', paymentValue: 'pse');

  const PaymentMethod({required this.title, required this.paymentValue});

  final String title;
  final String paymentValue;

  static PaymentMethod fromString(String value) {
    return values.firstWhere((e) => e.paymentValue == value);
  }
}

enum PaymentWay {
  all(title: 'Pago total', paymentValue: 'all'),
  split(title: 'Pago individual', paymentValue: 'split');

  const PaymentWay({required this.title, required this.paymentValue});

  final String paymentValue;
  final String title;

  static PaymentWay fromString(String value) {
    return values.firstWhere((e) => e.paymentValue == value);
  }
}

enum PaymentTip {
  fiveteen(title: '15%', value: 15),
  ten(title: '10%', value: 10),
  five(title: '5%', value: 5),
  none(title: 'Sin propina', value: 0);

  const PaymentTip({required this.title, required this.value});

  num calculateTip(num total) => total * (value / 100);

  final String title;
  final int value;
}
