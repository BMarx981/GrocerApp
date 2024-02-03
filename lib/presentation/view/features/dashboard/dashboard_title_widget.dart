import 'package:flutter/material.dart';

class DashboardTitleWidget extends StatelessWidget {
  const DashboardTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
