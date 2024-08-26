import '../entities.dart';
import '../models/ice_cream_model.dart';

/// [IceCreamShopReceiver] is a concrete receiver class that handles the logic
/// for ordering and canceling ice creams.
///
/// It maintains a list of orders and provides methods to add, remove, and display them.
///
/// Example:
/// ```dart
/// final IceCreamShopReceiver shopReceiver = IceCreamShopReceiver();
///
/// final Command vanillaOrder = OrderIceCreamCommand(
///   iceCreamModel: IceCreamModel('Vanilla', 'Large'),
///   receiver: shopReceiver,
/// );
///
/// vanillaOrder.execute();
/// print('--- Current Orders ---');
/// shopReceiver.showOrders();
///
/// vanillaOrder.undo();
/// print('--- Orders after Undo ---');
/// shopReceiver.showOrders();
/// ```.
class IceCreamShopReceiver implements Receiver {
  IceCreamShopReceiver();
  final List<IceCreamModel> orders = <IceCreamModel>[];

  void orderIceCream(IceCreamModel iceCream) {
    orders.add(iceCream);
    print('Ordered: $iceCream');
  }

  void cancelIceCreamOrder(IceCreamModel iceCream) {
    orders.remove(iceCream);
    print('Cancelled: $iceCream');
  }

  List<IceCreamModel> showOrders() {
    orders.forEach((IceCreamModel order) => print(order));
    return orders;
  }
}
