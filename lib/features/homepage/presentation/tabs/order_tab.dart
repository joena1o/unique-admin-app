import 'package:flutter/material.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/orders_table.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          OrderTable()
        ],
      ),
    );
  }
}
