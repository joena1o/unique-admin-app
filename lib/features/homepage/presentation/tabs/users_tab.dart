import 'package:flutter/material.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/customers_table.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({super.key});

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        CustomersTable()
      ],
    ));
  }
}
