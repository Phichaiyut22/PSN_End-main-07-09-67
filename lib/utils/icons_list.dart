// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  final List<Map<String, dynamic>> homeExpensesCategories = [
    {
      "name": "Gas Filling",
      "icon": FontAwesomeIcons.gasPump,
    },
    {
      "name": "Grocery",
      "icon": FontAwesomeIcons.cartShopping,
    },
    {
      "name": "Milk",
      "icon": FontAwesomeIcons.mugHot,
    },
    {
      "name": "Internet",
      "icon": FontAwesomeIcons.wifi,
    },
    {
      "name": "Clothing",
      "icon": FontAwesomeIcons.shirt,
    },
    {
      "name": "Insurance",
      "icon": FontAwesomeIcons.shieldHalved,
    },
    {
      "name": "Education",
      "icon": FontAwesomeIcons.graduationCap,
    },
    {
      "name": "Transportation",
      "icon": FontAwesomeIcons.bus,
    },
    {
      "name": "Healthcare",
      "icon": FontAwesomeIcons.suitcaseMedical,
    },
    {
      "name": "Enteraiment",
      "icon": FontAwesomeIcons.film,
    },
    {
      "name": "Dining Out",
      "icon": FontAwesomeIcons.utensils,
    },
    {
      "name": "Phone Bill",
      "icon": FontAwesomeIcons.phone,
    },
    {
      "name": "Rent",
      "icon": FontAwesomeIcons.house,
    },
    {
      "name": "Water",
      "icon": FontAwesomeIcons.water,
    },
    {
      "name": "Electricity",
      "icon": FontAwesomeIcons.bolt,
    },
    {
      "name": "Others",
      "icon": FontAwesomeIcons.cartPlus,
    },
  ];



     IconData getExpenseCategoryIcons(String categoryName){
    final category = homeExpensesCategories.firstWhere(
      (category)=> category['name'] == categoryName,
    orElse: ()=> {"icon" :FontAwesomeIcons.cartShopping});
    return category['icon'];
  }

}
