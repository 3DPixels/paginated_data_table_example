class DataModel {
  final int id;
  final String name;
  final String email;

  DataModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class Order {
  Order({
    required this.salesOrder,
    required this.soldToParty,
    required this.soldToPartyName,
    required this.overallSDProcessStatus,
    required this.transactionCurrency,
    required this.totalNetAmount,
    required this.salesOrderType,
    required this.creationDate,
  });

  String? salesOrder,
      soldToParty,
      soldToPartyName,
      overallSDProcessStatus,
      transactionCurrency,
      salesOrderType;
  DateTime? creationDate;
  double? totalNetAmount;
}
