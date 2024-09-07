import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  const Navbar(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected});

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      indicatorColor: const Color.fromARGB(255, 169, 149, 201),
      onDestinationSelected: onDestinationSelected,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 60.00,
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(FontAwesomeIcons.house),
          selectedIcon: Icon(
            FontAwesomeIcons.house,
            color: Colors.white,
          ),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            FontAwesomeIcons.moneyBillTransfer,
            color: Colors.white,
          ),
          icon: Icon(FontAwesomeIcons.moneyBillTransfer),
          label: 'Transaction',
        ),
      ],
    );
  }
}
