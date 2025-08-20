import 'package:flutter/material.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  final List<String> languages = [
    'English',
    'Hindi',
    'Kannada',
    'Malayalam',
    'Marathi',
    'Tamil',
    'Telugu',
    'Bengali',
  ];

  // Now it's a list instead of a single string
  List<String> selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Select Languages",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              fontFamily: 'Nunito_SansBold',
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final lang = languages[index];
              final isSelected = selectedLanguages.contains(lang);

              return ListTile(
                title: Uihelper.CustomFont(
                  text: lang,
                  color: Colors.black,
                  fontweight: FontWeight.w400,
                  fontsize: 12,
                ),
                trailing: isSelected
                    ? Icon(
                        Icons.check_circle,
                        color: Appcolors.primaryColor,
                        size: 20,
                      )
                    : null,
                onTap: () {
                  setState(() {
                    if (selectedLanguages.contains(languages[index])) {
                      selectedLanguages.remove(languages[index]);
                    } else {
                      selectedLanguages.add(languages[index]);
                    }
                  });
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(height: 5, thickness: 1);
            },
            itemCount: languages.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, selectedLanguages);
                // You can return selectedLanguages to previous screen if needed
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
