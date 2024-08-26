import 'package:flutter/material.dart';

import '../commands/order_ice_cream_action.dart';
import '../commands/order_ice_cream_intent.dart';
import '../models/ice_cream_model.dart';
import '../widgets/orders_widget.dart';

/// [ClientActionPage] es un `StatefulWidget` que permite a los usuarios pedir helados
/// y deshacer la última orden usando la clase `Action` de Flutter.
///
/// El widget muestra botones para pedir helado de vainilla o chocolate, y muestra las órdenes actuales en una lista.
///
/// Example:
/// ```dart
/// runApp(MaterialApp(
///   home: ClientActionPage(),
/// ));
/// ```.
class ClientActionPage extends StatefulWidget {
  const ClientActionPage({super.key});

  @override
  State<ClientActionPage> createState() => _ClientActionPageState();
}

class _ClientActionPageState extends State<ClientActionPage> {
  final List<IceCreamModel> _orders = <IceCreamModel>[];

  void _handleOrder(IceCreamModel flavor) {
    setState(() {
      _orders.add(flavor);
    });
  }

  void _undoLastOrder() {
    if (_orders.isNotEmpty) {
      setState(() {
        _orders.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ice Cream Shop - Action Example'),
      ),
      body: Actions(
        actions: <Type, Action<Intent>>{
          OrderIceCreamIntent: OrderIceCreamAction(onOrder: _handleOrder),
        },
        child: Builder(
          builder: (BuildContext innerContext) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OrdersWidget(orders: _orders),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Actions.invoke<OrderIceCreamIntent>(
                            innerContext,
                            const OrderIceCreamIntent(
                              IceCreamModel('Vanilla', 'Large'),
                            ),
                          );
                        },
                        child: const Text('Order Vanilla'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          Actions.invoke<OrderIceCreamIntent>(
                            innerContext,
                            const OrderIceCreamIntent(
                              IceCreamModel('Chocolate', 'Medium'),
                            ),
                          );
                        },
                        child: const Text('Order Chocolate'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _undoLastOrder,
                        child: const Text('Undo Last Order'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
