import 'package:flutter/material.dart';

class DashboardTitleWidget extends StatelessWidget {
  const DashboardTitleWidget({
    super.key,
    required this.title,
    required this.addFunction,
  });

  /// The title of the grid widget
  final String title;

  /// The function that gets called when the add button is pressed
  final Function addFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                        style: const TextStyle(color: Colors.white)),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    addFunction();
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
