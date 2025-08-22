import 'package:flutter/material.dart';
import 'package:helper_module_frontend/repository/screens/addhelperscreen.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';

class DiscardChangesScreen extends StatelessWidget {
  const DiscardChangesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning_outlined, color: Color(0xFFF79009), size: 30),
          SizedBox(height: 10),

          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Discard ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF79009),
                  ),
                ),
                TextSpan(
                  text: 'Changes?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 40,
            width: 322,
            child: Center(
              child: Uihelper.CustomFont(
                text: ' Going back without saving will not keep the changes.',
                color: Colors.black,
                fontweight: FontWeight.w400,
                fontsize: 14,
                fontfamily: 'Nunito_SansBold',
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Uihelper.CustomFont(
                    text: 'Cancel',
                    color: Colors.black,
                    fontweight: FontWeight.w600,
                    fontsize: 16,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  onPressed: () {
                    // First pop the modal
                    Navigator.pop(context);

                    // Then pop KYCScreen after modal is closed
                    Future.delayed(Duration(milliseconds: 100), () {
                      Navigator.pop(context);
                    });
                  },
                  child: Uihelper.CustomFont(
                    text: 'Discard',
                    color: Colors.white,
                    fontweight: FontWeight.w600,
                    fontsize: 16,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF79009),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
