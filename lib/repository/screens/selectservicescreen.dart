import 'package:flutter/material.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({
    super.key,
    required this.selected,
    required this.onselected,
  });
  final String selected;
  final Function(String) onselected;
  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> iconList = [
    {'name': 'Maid', 'icon': PhosphorIconsRegular.broom},
    {'name': 'Cook', 'icon': PhosphorIconsRegular.cookingPot},
    {'name': 'Nurse', 'icon': PhosphorIconsRegular.firstAidKit},
    {'name': 'Driver', 'icon': PhosphorIconsRegular.steeringWheel},
    {'name': 'Plumber', 'icon': PhosphorIconsRegular.pipeWrench},
    {'name': 'Electrician', 'icon': PhosphorIconsRegular.lightbulbFilament},
    {'name': 'Mechanic', 'icon': PhosphorIconsRegular.wrench},
    {'name': 'Laundry', 'icon': PhosphorIconsRegular.tShirt},
    {'name': 'Gardener', 'icon': PhosphorIconsRegular.tree},
    {'name': 'Tutor', 'icon': PhosphorIconsRegular.student},
    {'name': 'Rent/Sell', 'icon': PhosphorIconsRegular.tag},
    {'name': 'Wifi', 'icon': PhosphorIconsRegular.wifiHigh},
    {'name': 'AC', 'icon': PhosphorIconsRegular.snowflake},
    {'name': 'Cleaning', 'icon': PhosphorIconsRegular.sprayBottle},
    {'name': 'Water Supply', 'icon': PhosphorIconsRegular.drop},
    {'name': 'Gym Trainer', 'icon': PhosphorIconsRegular.barbell},
    {'name': 'Swimming instructor', 'icon': PhosphorIconsRegular.swimmingPool},
    {'name': 'Music Coach', 'icon': PhosphorIconsRegular.musicNotes},
    {'name': 'Sports Coach', 'icon': PhosphorIconsRegular.tennisBall},
    {'name': 'Milk', 'icon': PhosphorIconsRegular.cow},
    {'name': 'Newspaper', 'icon': PhosphorIconsRegular.newspaper},
    {'name': 'flowers', 'icon': PhosphorIconsRegular.flowerTulip},
    {'name': 'Packers', 'icon': PhosphorIconsRegular.couch},
  ];
  String selectedService = 'None';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.scaffoldBackground,
        centerTitle: false,
        title: Uihelper.CustomFont(
          text: 'Select Type of Service',
          color: Colors.white,
          fontweight: FontWeight.w600,
          fontsize: 24,
          fontfamily: "Nunito_SansBold",
        ),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 104, 102, 102),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
            child: GridView.builder(
              itemCount: iconList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 3 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8, // control item shape
              ),
              itemBuilder: (context, index) {
                final item = iconList[index];
                final isSelected = selectedService == iconList[index]['name'];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedService = iconList[index]['name'];
                    });
                    widget.onselected(iconList[index]['name']);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Appcolors.secondaryColor : null,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2), // border thickness
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Appcolors.primaryColor
                                : null, // border color
                            shape: BoxShape.circle,
                          ),

                          child: CircleAvatar(
                            radius: 30,

                            backgroundColor: isSelected
                                ? Appcolors.secondaryColor
                                : Color(0xFFF2F4F7),
                            child: PhosphorIcon(
                              item['icon'],
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: isSelected ? Appcolors.primaryColor : null,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pop(context, selectedService); // send data back on Done
          //   },
          //   child: Text("Done"),
          // ),
        ],
      ),
    );
  }
}
