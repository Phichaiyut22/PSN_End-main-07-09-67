// ignore_for_file: use_build_context_synchronously, unused_import

import 'package:budget_tracker_application_2/screens/home_screen.dart';
import 'package:budget_tracker_application_2/screens/login_screen.dart';
import 'package:budget_tracker_application_2/screens/transaction_screen.dart';
import 'package:budget_tracker_application_2/widgets/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  var isLogoutLoading = false;
  int currentIndex = 0;
  var pageViewList = [
    HomeScreenUI(),
    TransactionScreenUI(),
  ];

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    
      body: pageViewList[currentIndex],
    );
  }
}
