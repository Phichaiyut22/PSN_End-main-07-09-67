import 'package:budget_tracker_application_2/widgets/category_list.dart';
import 'package:budget_tracker_application_2/widgets/tab_bar_view.dart';
import 'package:budget_tracker_application_2/widgets/time_line_month.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // เพิ่มเพื่อใช้งาน DateFormat

class TransactionScreenUI extends StatefulWidget {
  const TransactionScreenUI({super.key});

  @override
  _TransactionScreenUIState createState() => _TransactionScreenUIState();
}

class _TransactionScreenUIState extends State<TransactionScreenUI> {
  var category = 'All'; // ตัวแปรสำหรับเก็บหมวดหมู่ที่เลือก
  var monthYear = ''; // ตัวแปรสำหรับเก็บค่าเดือนที่เลือก

  @override
  void initState() {
    super.initState();
    // กำหนดค่าเดือน/ปีเริ่มต้นจากวันที่ปัจจุบัน
    DateTime now = DateTime.now();
    monthYear = DateFormat('MMM y')
        .format(now); // ไม่จำเป็นต้องใช้ setState ใน initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansive"), // เพิ่ม const เพื่อเพิ่มประสิทธิภาพ
      ),
      body: Column(
        children: [
          // Widget สำหรับเลือก Timeline Month
          TimeLineMonth(
            onChange: (String? value) {
              if (value != null) {
                setState(() {
                  monthYear =
                      value; // อัปเดตค่า monthYear เมื่อผู้ใช้เลือกเดือน/ปีใหม่
                });
              }
            },
          ),

          // Widget สำหรับเลือก Category
          CategoryList(
            onChange: (String? value) {
              if (value != null) {
                setState(() {
                  category =
                      value; // อัปเดตหมวดหมู่ที่เลือกเมื่อผู้ใช้เลือกใหม่
                });
              }
            },
          ),

          // Widget สำหรับแสดงข้อมูลตามหมวดหมู่และเดือน/ปีที่เลือก
          TypeTabBar(
            category: category, // ส่งหมวดหมู่ที่เลือก
            monthYear: monthYear, // ส่งเดือน/ปีที่เลือก
          ),
        ],
      ),
    );
  }
}
