import 'package:flutter/material.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';

class Uihelper {
  // ignore: non_constant_identifier_names
  static CustomImage({required String img}) {
    return Image.asset("assets/images/$img");
  }

  // ignore: non_constant_identifier_names
  static CustomFont({
    required text,
    required Color color,
    required FontWeight fontweight,
    required double fontsize,
    String? fontfamily,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontFamily: fontfamily,
        fontWeight: fontweight,
      ),
    );
  }

  // static CustomButton({
  //   required Icon icon,
  //   required String text,
  //   required VoidCallback onPressed,
  // }) {
  //   return ElevatedButton.icon(
  //     onPressed: onPressed,
  //     icon: icon,
  //     label: Text(text, style: TextStyle(fontSize: 14, color: Colors.white)),
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: Appcolors.scaffoldBackground,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  //     ),
  //   );
  // }
}
