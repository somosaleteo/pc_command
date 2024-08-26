import 'package:flutter/material.dart';

import '../models/ice_cream_model.dart';

/// [OrderIceCreamIntent] es una clase que representa la intención de pedir un helado.
///
/// Esta clase extiende de `Intent` y encapsula el tipo de helado que se desea ordenar.
///
/// Example:
/// ```dart
/// final intent = OrderIceCreamIntent(IceCreamModel('Vanilla', 'Large'));
/// ```.
class OrderIceCreamIntent extends Intent {
  const OrderIceCreamIntent(this.flavor);

  final IceCreamModel flavor;
}
