import 'package:flutter/material.dart';

import '../../../../Widgets/customtextfieldtype2.dart';
import '../../../../helpers/harcodedData/myvehicles.dart';
import '../../../../helpers/models/myvehiclesmodel.dart';
import '../View/myvehicles.dart';

addVehicle(BuildContext context) {
  List carFuelTypes = [
    "Petrol",
    "Diesel",
    "CNG",
  ];
  List carSeatType = [
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
  ];
  TextEditingController carNameController = TextEditingController();
  TextEditingController carConditionController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();
  String fuelTypeValue = 'Petrol';
  String seatTypeValue = '2';
  return StatefulBuilder(
    builder: (context, setState) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        title: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add Vehicle',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'PT Serif'),
            ),
          ),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFieldType2(
                  editingController: carNameController,
                  maxLines: 1,
                  fieldTitle: 'Car Name',
                  validator: null,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Text('Car Seat Type:'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),

                      // dropdown below..
                      child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 32,
                          underline: SizedBox(),
                          value: seatTypeValue,
                          items: carSeatType
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              seatTypeValue = newValue!;
                            });
                          })),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Text('Car Fuel Type:'),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),

                      // dropdown below..
                      child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 32,
                          underline: SizedBox(),
                          value: fuelTypeValue,
                          items: carFuelTypes
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              fuelTypeValue = newValue!;
                            });
                          })),
                ]),
                SizedBox(
                  height: 10,
                ),
                CustomTextFieldType2(
                  editingController: carNumberController,
                  maxLines: 1,
                  fieldTitle: 'Car Number',
                  validator: null,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextFieldType2(
                  editingController: carConditionController,
                  maxLines: 1,
                  fieldTitle: 'Car Condition',
                  validator: null,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      myVehicleDataList.add(MyVehicles(
                          name: carNameController.text,
                          type: seatTypeValue,
                          plateNumber: carNumberController.text.toUpperCase(),
                          condition: carConditionController.text,
                          fuelType: fuelTypeValue,
                          imagePath: 'assets/CarImage/dzire.jpg',nickName: ""));
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return MyVehiclesScreen();
                      }), (route) => route.isFirst);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
