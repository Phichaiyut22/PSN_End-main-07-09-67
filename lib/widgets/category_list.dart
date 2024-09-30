import 'package:budget_tracker_application_2/utils/icons_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.onChange});
  final ValueChanged<String?> onChange;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String currenCategory = "";
  List<Map<String, dynamic>> categorylist = [];

  final scrollController = ScrollController();
  var appIcons = AppIcons();
  var addCat = {
    "name": "All",
    "icon": FontAwesomeIcons.cartPlus,
  };
  @override
  void initState() {
    super.initState();
    setState(() {
      categorylist = appIcons.homeExpensesCategories;
      categorylist.insert(0, addCat);
    });
  }

  // scrollToSelectedMonth() {
  //   final selectedMonthIndex = months.indexOf(currentMonth);
  //   if (selectedMonthIndex != -1) {
  //     final scrollOffset = (selectedMonthIndex * 100.0) - 170;
  //     scrollController.animateTo(scrollOffset,
  //         duration: Duration(milliseconds: 500), curve: Curves.ease);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 45.00,
        child: ListView.builder(
            controller: scrollController,
            itemCount: categorylist.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (contex, index) {
              var data = categorylist[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currenCategory = data['name'];
                    widget.onChange(data['name']);
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: currenCategory == data['name']
                          ? Colors.blue.shade900
                          : Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Row(
                    children: [
                      Icon(
                        data['icon'],
                        size: 15.0,
                        color: currenCategory == data['name']
                            ? Colors.white
                            : Colors.blue.shade900,
                      ),
                      SizedBox(width: 10.00),
                      Text(
                        data['name'],
                        style: TextStyle(
                          color: currenCategory == data['name']
                              ? Colors.white
                              : Colors.blue.shade900,
                        ),
                      ),
                    ],
                  )),
                ),
              );
            }),
      ),
    );
  }
}
