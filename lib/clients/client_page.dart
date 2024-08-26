import 'package:flutter/material.dart';

import '../commands/order_ice_cream_command.dart';
import '../invokers/waiter_invoker.dart';
import '../models/ice_cream_model.dart';
import '../receivers/ice_cream_receiver.dart';
import '../widgets/orders_widget.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final IceCreamShopReceiver _shopReceiver = IceCreamShopReceiver();
  final WaiterInvoker _waiterInvoker = WaiterInvoker();

  void _orderVanilla() {
    final OrderIceCreamCommand vanillaOrder = OrderIceCreamCommand(
      iceCreamModel: const IceCreamModel('Vanilla', 'Large'),
      receiver: _shopReceiver,
    );
    _waiterInvoker.takeOrder(vanillaOrder);
    setState(() {});
  }

  void _orderChocolate() {
    final OrderIceCreamCommand chocolateOrder = OrderIceCreamCommand(
      iceCreamModel: const IceCreamModel('Chocolate', 'Medium'),
      receiver: _shopReceiver,
    );
    _waiterInvoker.takeOrder(chocolateOrder);
    setState(() {});
  }

  void _undoLastOrder() {
    _waiterInvoker.undoLastOrder();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ice Cream Shop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${_shopReceiver.orders.length} Ordenes pendientes'),
            const Divider(),
            OrdersWidget(orders: _shopReceiver.showOrders()),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _orderVanilla,
                  tooltip: 'Order Vanilla',
                  child: const Icon(Icons.icecream),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _orderChocolate,
                  tooltip: 'Order Chocolate',
                  child: const Icon(
                    Icons.icecream,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _undoLastOrder,
                  tooltip: 'Undo Last Order',
                  child: const Icon(Icons.undo),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
