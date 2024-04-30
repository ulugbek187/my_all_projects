class PaymentModel {
  final String title;
  final String code;
  final String cbPrice;
  final String nbuBuyPrice;
  final String nbuCellPrice;
  final String date;

  PaymentModel({
    required this.title,
    required this.code,
    required this.cbPrice,
    required this.nbuBuyPrice,
    required this.nbuCellPrice,
    required this.date,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      title: json['title'] as String? ?? '',
      code: json['code'] as String? ?? '',
      cbPrice: json['cb_price'] as String? ?? '',
      nbuBuyPrice: json['nbu_buy_price'] as String? ?? '',
      nbuCellPrice: json['nbu_cell_price'] as String? ?? '',
      date: json['date'] as String? ?? '',
    );
  }

  static Map<String, dynamic> toJson({required PaymentModel data}) {
    return {
      'title': data.title,
      'code': data.code,
      'cb_price': data.cbPrice,
      'nbu_buy_price': data.nbuBuyPrice,
      'nbu_cell_price': data.nbuCellPrice,
      'date': data.date,
    };
  }
}
