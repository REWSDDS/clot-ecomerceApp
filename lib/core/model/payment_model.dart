import 'package:hive/hive.dart';

part 'payment_model.g.dart';

@HiveType(typeId: 4)
class PaymentModel {
  @HiveField(0)
  final String cardNuber;
  @HiveField(1)
  final int ccv;
  @HiveField(2)
  final int expDate;
  @HiveField(3)
  final String cardHolderName;
  @HiveField(4)
  final Karta karta;

  PaymentModel(
      {required this.cardHolderName,
      required this.karta,
      required this.cardNuber,
      required this.ccv,
      required this.expDate});
}

@HiveType(typeId: 5)
enum Karta {
  @HiveField(0)
  humo,
  @HiveField(1)
  uzcard
}
