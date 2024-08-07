// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
part 'address_model.g.dart';

@HiveType(typeId: 3)
class AddressModel {
  @HiveField(0)
  final String street;
  @HiveField(1)
  final String city;
  @HiveField(2)
  final String state;
  @HiveField(3)
  final String zipCode;
  AddressModel({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
  });
}
