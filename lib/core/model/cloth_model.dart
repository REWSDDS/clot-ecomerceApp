import 'package:hive_flutter/hive_flutter.dart';

part 'cloth_model.g.dart';

@HiveType(typeId: 1)
class ClothModel {
  @HiveField(0)
  final String image;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final num price;
  @HiveField(3)
  final List<ClothSize> size;
  @HiveField(4)
  final List<int> color;
  @HiveField(5)
  final List<String> colorName;
  @HiveField(6)
  final bool disCount;
  @HiveField(7)
  final double oldPrice;
  @HiveField(8)
  final int? pickedColor;
  @HiveField(9)
  final ClothSize? pickedSize;

  ClothModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.colorName,
      this.oldPrice = 0,
      this.disCount = false,
      required this.color,
      this.pickedColor,
      this.pickedSize,
      required this.size});
}

@HiveType(typeId: 2)
enum ClothSize {
  @HiveField(0)
  xs,
  @HiveField(1)
  s,
  @HiveField(2)
  m,
  @HiveField(3)
  l,
  @HiveField(4)
  xl,
  @HiveField(5)
  xxl
}
