import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:helper_module_frontend/repository/screens/discardchangesscreen.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';
import 'selectdocumenttypescreen.dart';

class AddDocumentScreen extends StatefulWidget {
  const AddDocumentScreen({super.key});

  @override
  State<AddDocumentScreen> createState() => _AddDocumentScreenState();
}

class _AddDocumentScreenState extends State<AddDocumentScreen> {
  String selectedDocument = "None";
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default pop — handle manually
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          // Show modal when back is pressed
          await showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) =>
                SizedBox(height: 300, child: const DiscardChangesScreen()),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Uihelper.CustomFont(
            text: "KYC Document",
            color: Colors.white,
            fontweight: FontWeight.w800,
            fontsize: 24,
            fontfamily: 'Nunito_SansBold',
          ),
          backgroundColor: Appcolors.scaffoldBackground,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Uihelper.CustomFont(
                text: "Document Type",
                color: Colors.black,
                fontweight: FontWeight.w700,
                fontsize: 14,
                fontfamily: 'Nunito_SansBold',
              ),
              SizedBox(height: 3),
              SizedBox(
                height: 44,
                child: TextField(
                  readOnly: true, // Prevent keyboard from showing
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectDocumentTypeScreen(
                          selected: selectedDocument,
                          onSelected: (org) {
                            setState(() => selectedDocument = org);
                          },
                        ),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.keyboard_arrow_down, size: 25),
                    hintText: selectedDocument == "None"
                        ? 'None'
                        : selectedDocument,
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Nunito_SansBold",
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xFFD0D5DD),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Uihelper.CustomFont(
                text: "Please upload both sides of the document.",
                color: Colors.black,
                fontweight: FontWeight.bold,
                fontsize: 14,
                fontfamily: 'Nunito_SansBold',
              ),
              SizedBox(height: 3),
              DottedBorder(
                color: Appcolors.primaryColor,
                strokeWidth: 1.5,
                dashPattern: [8, 4],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    // Handle image upload
                  },
                  child: Container(
                    width: 350,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Appcolors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 40,
                            color: Appcolors.primaryColor,
                          ),
                          SizedBox(height: 10),
                          Uihelper.CustomFont(
                            text: 'Upload Document',
                            color: Appcolors.primaryColor,
                            fontweight: FontWeight.w600,
                            fontsize: 16,
                            fontfamily: 'Nunito_SansBold',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
