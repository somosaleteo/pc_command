import '../entities.dart';
import '../models/ice_cream_model.dart';

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
