import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:helper_module_frontend/repository/widgets/uihelper.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:helper_module_frontend/constants/appcolors.dart';
import 'package:helper_module_frontend/repository/widgets/VehicleSelectionResult.dart';

class SelectVehicleTypeScreen extends StatefulWidget {
  const SelectVehicleTypeScreen({
    super.key,
    required this.selectedVehicle,
    required this.VehicleNumber,
    required this.onselected,
  });
  final Map<String, dynamic> selectedVehicle;
  final String VehicleNumber;
  final Function(Map<String, dynamic>) onselected;
  @override
  State<SelectVehicleTypeScreen> createState() =>
      _SelectVehicleTypeScreenState();
}

class _SelectVehicleTypeScreenState extends State<SelectVehicleTypeScreen> {
  final List<Map<String, dynamic>> iconList = [
    {'name': 'Bike', 'icon': PhosphorIconsRegular.moped},
    {'name': 'Auto', 'icon': PhosphorIconsRegular.van},
    {'name': 'Car', 'icon': PhosphorIconsRegular.carProfile},
    {'name': 'Heavy', 'icon': PhosphorIconsRegular.truck},
  ];
  TextEditingController VehicleController = TextEditingController();
  Map<String, dynamic> selectedVehicle = {
    'name': 'Bike',
    'icon': PhosphorIconsRegular.moped,
  };
  @override
  Widget build(BuildContext context) {
    return //Expanded(
    Padding(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Uihelper.CustomFont(
            text: 'Vehicle Details',
            color: Colors.black,
            fontweight: FontWeight.bold,
            fontsize: 20,
            fontfamily: 'Nunito_SansBold',
          ),
          SizedBox(height: 10),
          Container(height: 1, color: Colors.grey),
          SizedBox(height: 20),
          Uihelper.CustomFont(
            text: 'Vehicle Number',
            color: Colors.black,
            fontweight: FontWeight.w600,
            fontsize: 14,
            fontfamily: 'Nunito_SansBold',
          ),
          SizedBox(height: 3),
          SizedBox(
            height: 45,
            child: TextFormField(
              controller: VehicleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'TS 08 AB 1234',
                labelStyle: TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Nunito_SansBold",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFD0D5DD), width: 1),
                ),
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: iconList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8, // control item shape
              ),
              itemBuilder: (context, index) {
                final item = iconList[index];
                final isSelected = selectedVehicle == item;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedVehicle = item;
                    });
                    widget.onselected(selectedVehicle);
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
                                ? Appcolors.primaryColor
                                : Color.fromARGB(255, 208, 209, 211),
                            child: PhosphorIcon(
                              item['icon'],
                              size: 30,
                              color: isSelected ? Colors.white : Colors.black,
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
                  Navigator.pop(
                    context,
                    VehicleSelectionResult(
                      vehicle: selectedVehicle,
                      vehicleNumber: VehicleController.text,
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.primaryColor,
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
      // ),
    );
  }
}
