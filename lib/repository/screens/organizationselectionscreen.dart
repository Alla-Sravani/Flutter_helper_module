import 'package:flutter/material.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';

class OrganizationSelectionScreen extends StatefulWidget {
  final String selected;
  final Function(String) onSelected;

  OrganizationSelectionScreen({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  State<OrganizationSelectionScreen> createState() =>
      _OrganizationSelectionScreenState();
}

class _OrganizationSelectionScreenState
    extends State<OrganizationSelectionScreen> {
  final List<String> organizations = [
    'None',
    'Sonic Services',
    'Inncircles',
    'Servico',
    'Dr.House',
  ];
  String tempSelection = "None";
  String org = "None";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Uihelper.CustomFont(
            text: "Select Organization",
            color: Colors.black,
            fontweight: FontWeight.w600,
            fontsize: 24,
            fontfamily: 'Nunito_SansBold',
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Uihelper.CustomFont(
                  text: organizations[index],
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                  fontsize: 12,
                ),
                trailing: tempSelection == organizations[index]
                    ? Icon(
                        Icons.check_circle,
                        color: Appcolors.primaryColor,
                        size: 20,
                      )
                    : null,
                onTap: () {
                  setState(() {
                    tempSelection =
                        organizations[index]; // update modal state instantly
                  });
                  widget.onSelected(organizations[index]);
                },
              );
            },
            separatorBuilder: (context, index) {
              return Divider(height: 5, thickness: 1);
            },
            itemCount: organizations.length,
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
    );
  }
}
