import '../entities.dart';

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
