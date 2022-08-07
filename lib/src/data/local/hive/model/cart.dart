import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  Cart({required this.id, required this.name});
}
