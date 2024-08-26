import '../entities.dart';

/// [IceCreamModel] is a simple model class representing an ice cream with a flavor and size.
///
/// Example:
/// ```dart
/// final IceCreamModel vanillaIceCream = IceCreamModel('Vanilla', 'Large');
/// print(vanillaIceCream);
///
/// final IceCreamModel chocolateIceCream = IceCreamModel('Chocolate', 'Medium');
/// print(chocolateIceCream);
/// ```.
class IceCreamModel implements Model {
  const IceCreamModel(
    this.flavor,
    this.size,
  );
  final String flavor;
  final String size;

  @override
  String toString() {
    return 'Ice Cream: { Flavor: $flavor, Size: $size }';
  }
}
