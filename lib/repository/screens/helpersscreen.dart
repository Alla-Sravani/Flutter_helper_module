import 'package:flutter/material.dart';
import 'package:helper_module_frontend/repository/screens/addhelperscreen.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';

class HelpersScreen extends StatefulWidget {
  const HelpersScreen({super.key});

  @override
  State<HelpersScreen> createState() => HelpersScreenState();
}

class HelpersScreenState extends State<HelpersScreen> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, String>> data = [
    {'name': 'John Doe', 'description': 'Plumber'},
    {'name': 'Jane Smith', 'description': 'cleaner'},
    {'name': 'Mike Johnson', 'description': 'Carpentor'},
    {'name': 'John Doe', 'description': 'Plumber'},
    {'name': 'Jane Smith', 'description': 'cleaner'},
    {'name': 'Mike Johnson', 'description': 'Carpentor'},
    {'name': 'John Doe', 'description': 'Plumber'},
    {'name': 'Jane Smith', 'description': 'cleaner'},
    {'name': 'Mike Johnson', 'description': 'Carpentor'},
  ];

  final arrImages = [
    'profile.jpeg',
    'profile2.png',
    'ProfileF.webp',
    'profileF2.jpeg',
    'profile.jpeg',
    'profile2.png',
    'profile.jpeg',
    'profile2.png',
    'ProfileF.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.scaffoldBackground,
        title: Uihelper.CustomFont(
          text: 'Helpers',
          color: Colors.white,
          fontweight: FontWeight.w600,
          fontsize: 24,
          fontfamily: "Nunito_SansBold",
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 20),
            child: SizedBox(
              height: 44,

              child: TextField(
                controller: searchController,

                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color.fromARGB(255, 104, 102, 102),
                    size: 25,
                  ),
                  labelText: 'Search For Helpers',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 104, 102, 102),
                    fontSize: 18,
                    fontFamily: "Nunito_SansBold",
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: Uihelper.CustomImage(
                      img: arrImages[index],
                    ).image,
                  ),
                  title: Uihelper.CustomFont(
                    text: data[index]['name']!,
                    color: Colors.black,
                    fontweight: FontWeight.w700,
                    fontsize: 16,
                    fontfamily: "Nunito_SansBold",
                  ),
                  subtitle: Text(data[index]['description']!),
                  trailing: CircleAvatar(
                    radius: 25,
                    backgroundColor: Appcolors.secondaryColor,

                    child: Icon(
                      Icons.call,
                      color: Appcolors.primaryColor,
                      size: 25,
                    ),
                  ),
                );
              },
              itemCount: arrImages.length,
              separatorBuilder: (context, index) {
                return Divider(height: 30, thickness: 1);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30, top: 20, left: 30, right: 30),

            child: Container(
              height: 50,

              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddhelperScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.scaffoldBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Uihelper.CustomFont(
                        text: 'Add Helper',
                        color: Colors.white,
                        fontweight: FontWeight.w900,
                        fontsize: 14,
                        fontfamily: "Nunito_SansBold",
                      ),
                    ],
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
