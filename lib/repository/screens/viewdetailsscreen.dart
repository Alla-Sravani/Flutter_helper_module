import 'dart:math';

import 'package:flutter/material.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';

class ViewDetailsScreen extends StatefulWidget {
  const ViewDetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.description,
  });
  final String image;
  final String name;
  final String description;

  @override
  State<ViewDetailsScreen> createState() => _ViewDetailsScreenState();
}

class _ViewDetailsScreenState extends State<ViewDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final String imagePath = 'assets/images/${widget.image}';
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.CustomFont(
          text: 'Helper Details',
          color: Colors.white,
          fontweight: FontWeight.w600,
          fontsize: 24,
          fontfamily: "Nunito_SansBold",
        ),
        backgroundColor: Appcolors.scaffoldBackground,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: Image.asset(
                          imagePath,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ), //child: Uihelper.CustomImage(img: widget.image),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Uihelper.CustomFont(
                        text: widget.name,
                        color: Colors.black,
                        fontweight: FontWeight.w600,
                        fontsize: 24,
                        fontfamily: 'Nunito_SansBold',
                      ),
                      SizedBox(height: 5),
                      Uihelper.CustomFont(
                        text: widget.description,
                        color: Colors.black,
                        fontweight: FontWeight.w300,
                        fontsize: 14,
                        fontfamily: 'Nunito_SansRegular',
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "EmployeeID",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Container(
                      width: 65,
                      child: Row(
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            color: Appcolors.primaryColor,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Uihelper.CustomFont(
                            text: "View",
                            color: Appcolors.primaryColor,
                            fontweight: FontWeight.w600,
                            fontsize: 14,
                            fontfamily: 'Nunito_SansRegular',
                          ),
                        ],
                      ),
                    ),
                  ),
                  //SizedBox(height: 10),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "Employee code",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Uihelper.CustomFont(
                      text: "42458",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                  ),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "Gender",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Uihelper.CustomFont(
                      text: "Male",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                  ),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "Organization",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Uihelper.CustomFont(
                      text: "Sonic Services",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                  ),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "Language(s)",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Uihelper.CustomFont(
                      text: "English,Hindi",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                  ),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "Phone Number",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Uihelper.CustomFont(
                      text: "4245812345",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                  ),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "Email",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Uihelper.CustomFont(
                      text: "NA",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                  ),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "Vehicle Number",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Uihelper.CustomFont(
                      text: "TS 05 FR 1789",
                      color: Colors.black,
                      fontweight: FontWeight.w500,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                  ),
                  ListTile(
                    title: Uihelper.CustomFont(
                      text: "KYC Document",
                      color: Colors.black,
                      fontweight: FontWeight.w300,
                      fontsize: 14,
                      fontfamily: 'Nunito_SansRegular',
                    ),
                    trailing: Container(
                      width: 130,
                      child: Row(
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            color: Appcolors.primaryColor,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Uihelper.CustomFont(
                            text: "Aadhaar Card",
                            color: Appcolors.primaryColor,
                            fontweight: FontWeight.w600,
                            fontsize: 14,
                            fontfamily: 'Nunito_SansRegular',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 20),
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.scaffoldBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_outlined, color: Colors.white, size: 20),
                    SizedBox(width: 5),
                    Uihelper.CustomFont(
                      text: 'Edit Details',
                      color: Colors.white,
                      fontweight: FontWeight.w600,
                      fontsize: 16,
                      fontfamily: "Nunito_SansBold",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
