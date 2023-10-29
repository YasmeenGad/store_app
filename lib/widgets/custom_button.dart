import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.txt, required this.ontap});
  String txt;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        )),
      ),
    );
  }
}
