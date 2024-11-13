import 'package:flutter/material.dart';
import 'package:unique_admin_application/features/homepage/presentation/widgets/review_table.dart';

class ReviewTab extends StatefulWidget {
  const ReviewTab({super.key});

  @override
  State<ReviewTab> createState() => _ReviewTabState();
}

class _ReviewTabState extends State<ReviewTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ReviewTable()
        ],
      ),
    );
  }
}
