import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'selectservicescreen.dart';
import 'organizationselectionscreen.dart';
import 'languageselectionscreen.dart';

class AddhelperScreen extends StatefulWidget {
  const AddhelperScreen({super.key});

  @override
  State<AddhelperScreen> createState() => AddhelperScreenState();
}

class AddhelperScreenState extends State<AddhelperScreen> {
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  String selectedOrganization = "None";
  String? _selectedGender;
  List<String> selectedLanguages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.scaffoldBackground,
        title: Uihelper.CustomFont(
          text: 'Add Helpers',
          color: Colors.white,
          fontweight: FontWeight.w600,
          fontsize: 24,
          fontfamily: "Nunito_SansBold",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        // child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SizedBox(height: 24),
            Center(
              child: DottedBorder(
                color: Appcolors.primaryColor,
                strokeWidth: 2,
                dashPattern: [6, 3],
                borderType: BorderType.Circle,
                child: Container(
                  //margin: EdgeInsets.only(top: 20, bottom: 20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Appcolors.secondaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 34,
                        color: Appcolors.primaryColor,
                      ),
                      Uihelper.CustomFont(
                        text: 'Add Photo',
                        color: Appcolors.primaryColor,
                        fontweight: FontWeight.w600,
                        fontsize: 16,
                        fontfamily: "Nunito_SansBold",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Form(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Uihelper.CustomFont(
                      text: "Type of service",
                      color: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
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
                              builder: (context) => SelectServiceScreen(),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.keyboard_arrow_down, size: 25),
                          labelText: 'Select Type of Service',
                          labelStyle: TextStyle(
                            color: Color(0xFF667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                    SizedBox(height: 20),
                    Uihelper.CustomFont(
                      text: "Organization",
                      color: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
                    ),
                    SizedBox(height: 3),
                    SizedBox(
                      height: 44,
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) => OrganizationSelectionScreen(
                              selected: selectedOrganization,
                              onSelected: (org) {
                                setState(() => selectedOrganization = org);
                              },
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.keyboard_arrow_down, size: 25),
                          hintText: selectedOrganization == "None"
                              ? 'None'
                              : selectedOrganization,
                          labelStyle: TextStyle(
                            color: Color(0xFF667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                    SizedBox(height: 20),
                    Uihelper.CustomFont(
                      text: 'Name',
                      color: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
                    ),
                    SizedBox(height: 3),
                    SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: NameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Name',
                          labelStyle: TextStyle(
                            color: Color(0xFF667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 20),
                    Uihelper.CustomFont(
                      text: 'Gender',
                      color: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
                    ),
                    //SizedBox(height: 3),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: "Male",
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            const Text("Male"),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            Radio<String>(
                              value: "Female",
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            const Text("Female"),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            Radio<String>(
                              value: "Other",
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            const Text("Other"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Uihelper.CustomFont(
                      text: 'Languages',
                      color: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
                    ),
                    SizedBox(height: 3),
                    SizedBox(
                      height: 44,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () async {
                          final result =
                              await showModalBottomSheet<List<String>>(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) =>
                                    const LanguageSelectionScreen(),
                              );

                          if (result != null) {
                            setState(() {
                              selectedLanguages =
                                  result; // <-- update state here
                            });
                          }
                        },

                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.keyboard_arrow_down, size: 25),
                          hintText: selectedLanguages.isEmpty
                              ? 'None'
                              : selectedLanguages.join(", "),

                          labelStyle: TextStyle(
                            color: Color(0xFF667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                    SizedBox(height: 2),
                    Uihelper.CustomFont(
                      text: 'Select at least 1',
                      color: Color(0xFF667085),
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
                    ),
                    SizedBox(height: 20),
                    Uihelper.CustomFont(
                      text: 'Email',
                      color: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
                    ),
                    SizedBox(height: 3),
                    SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: EmailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter email',
                          labelStyle: TextStyle(
                            color: Color(0xFF667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 20),
                    Uihelper.CustomFont(
                      text: 'Phone Number',
                      color: Colors.black,
                      fontweight: FontWeight.w600,
                      fontsize: 14,
                      fontfamily: "Nunito_SansBold",
                    ),
                    SizedBox(height: 3),
                    SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: PhoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Phone Number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Phone Number',
                          labelStyle: TextStyle(
                            color: Color(0xFF667085),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Nunito_SansBold",
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFFD0D5DD),
                              width: 1,
                            ),
                          ),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 10),
                              Uihelper.CustomFont(
                                text: '+91',
                                color: Colors.black,
                                fontweight: FontWeight.w400,
                                fontsize: 16,
                                fontfamily: "Nunito_SansBold",
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 25),
                            ],
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //),
    );
  }
}
