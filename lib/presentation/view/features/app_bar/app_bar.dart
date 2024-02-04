import 'package:flutter/material.dart';

class GrocerAppbar extends StatelessWidget implements PreferredSize {
  const GrocerAppbar({super.key, this.title = ""});

  ///The title of the appbar to be displayed
  ///at the top in the center of the scaffold
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      title: Text(title),
      shadowColor: Colors.black,
      elevation: 8,
      scrolledUnderElevation: null,
    );
  }

  @override
  Widget get child => const Spacer();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
