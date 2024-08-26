import '../entities.dart';
import '../models/ice_cream_model.dart';
import '../receivers/ice_cream_receiver.dart';

class OrderIceCreamCommand implements Command {
  const OrderIceCreamCommand({
    required this.receiver,
    required this.iceCreamModel,
  });

  final IceCreamModel iceCreamModel;
  final IceCreamShopReceiver receiver;

  @override
  void execute() {
    receiver.orderIceCream(iceCreamModel);
  }

  @override
  void undo() {
    receiver.cancelIceCreamOrder(iceCreamModel);
  }
}
