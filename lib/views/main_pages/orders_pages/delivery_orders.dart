import 'package:flutter/cupertino.dart';

class DeliveryOrders extends StatefulWidget {
  const DeliveryOrders({super.key});

  @override
  State<DeliveryOrders> createState() => _DeliveryOrdersState();
}

class _DeliveryOrdersState extends State<DeliveryOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("DeliveryOrder")
    );
  }
}