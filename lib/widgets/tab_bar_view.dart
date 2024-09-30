// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'transaction_list.dart';

class TypeTabBar extends StatelessWidget {
  const TypeTabBar({super.key, required this.category, required this.monthYear});
  final String category;
  final String monthYear;
 

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
      length: 2,
      child: Column(children: [
        TabBar(tabs: [
          Tab(
            text: "Credit",
          ),
          Tab(
            text: "Debit",
          ),
        ]),
        Expanded(
            child: TabBarView(children: [
          TransectionList(
            category: category,
            type: 'credit',
            monthYear: monthYear,
          ),
           TransectionList(
            category: category,
            type: 'debit',
            monthYear: monthYear,
          ),
        ]))
      ]),
    ));
  }
}
