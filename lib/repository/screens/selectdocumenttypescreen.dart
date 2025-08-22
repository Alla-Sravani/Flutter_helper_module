import 'package:flutter/material.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';

class SelectDocumentTypeScreen extends StatefulWidget {
  final String selected;
  final Function(String) onSelected;

  SelectDocumentTypeScreen({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<SelectDocumentTypeScreen> createState() =>
      _SelectDocumentTypeScreenState();
}

class _SelectDocumentTypeScreenState extends State<SelectDocumentTypeScreen> {
  final List<String> documents = [
    'Aadhaar Card',
    'Voter ID',
    'Driving License',
    'PAN Card',
    'Passport',
  ];

  String tempSelection = "None";
  String org = "None";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Uihelper.CustomFont(
          text: "Document Type",
          color: Colors.white,
          fontweight: FontWeight.w800,
          fontsize: 24,
          fontfamily: 'Nunito_SansBold',
        ),
        backgroundColor: Appcolors.scaffoldBackground,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Uihelper.CustomFont(
                    text: documents[index],
                    color: Colors.black,
                    fontweight: FontWeight.w400,
                    fontsize: 16,
                  ),
                  trailing: tempSelection == documents[index]
                      ? Icon(
                          Icons.check_circle,
                          color: Appcolors.primaryColor,
                          size: 20,
                        )
                      : null,
                  onTap: () {
                    setState(() {
                      tempSelection = documents[index];
                    });
                    widget.onSelected(documents[index]);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 5, thickness: 1);
              },
              itemCount: documents.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, widget.selected);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.scaffoldBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Uihelper.CustomFont(
                    text: 'Done',
                    color: Colors.white,
                    fontweight: FontWeight.w600,
                    fontsize: 16,
                    fontfamily: 'Nunito_SansBold',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
