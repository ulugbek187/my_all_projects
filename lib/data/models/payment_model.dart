// class PaymentModel {
//   final String transferDate;
//   final List<Data> data;
//
//   PaymentModel({
//     required this.transferDate,
//     required this.data,
//   });
//
//   factory PaymentModel.fromJson(Map<String, dynamic> json) {
//     return PaymentModel(
//       transferDate: json['transfer_date'],
//       data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
//     );
//   }
// }
//
// class Data {
//   final int transactionCode;
//   final String date;
//   final int incomeId;
//   final int amount;
//   final int cardId;
//   final Sender sender;
//
//   Data({
//     required this.transactionCode,
//     required this.date,
//     required this.incomeId,
//     required this.amount,
//     required this.cardId,
//     required this.sender,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       transactionCode: json['transaction_code'].toInt() as int? ?? 0,
//       date: json['date'] as String? ?? '',
//       incomeId: json['income_id'].toInt() as int? ?? 0,
//       amount: json['amount'].toInt() as int? ?? 0,
//       cardId: json['card_id'].toInt() as int? ?? 0,
//       sender: Sender.fromJson(json['sender']),
//     );
//   }
// }
//
// class Sender {
//   final String brandImage;
//   final String name;
//   final String location;
//
//   Sender({
//     required this.brandImage,
//     required this.name,
//     required this.location,
//   });
//
//   factory Sender.fromJson(Map<String, dynamic> json) {
//     return Sender(
//       brandImage: json['brand_image'] as String? ?? '',
//       name: json['name'] as String? ?? '',
//       location: json['location'] as String? ?? '',
//     );
//   }
// }

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
