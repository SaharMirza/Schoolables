import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeliveryOrders extends StatefulWidget {
  const DeliveryOrders({super.key});

  @override
  State<DeliveryOrders> createState() => _DeliveryOrdersState();
}

class _DeliveryOrdersState extends State<DeliveryOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("DeliveryOrder")
    );
  }
}