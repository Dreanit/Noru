import 'package:flutter/material.dart';
import 'package:noru/Widgets/customtextfieldtype2.dart';

import '../../../helpers/harcodedData/myvehicles.dart';
import '../../../helpers/models/myvehiclesmodel.dart';

class MyVehiclesScreen extends StatefulWidget {
  const MyVehiclesScreen({Key? key}) : super(key: key);

  @override
  State<MyVehiclesScreen> createState() => _MyVehiclesScreenState();
}

class _MyVehiclesScreenState extends State<MyVehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return addVehicle(context);
                  });
            },
          ),
        ),
      ),
      appBar: AppBar(title: Text('My Vehicles')),
      body: ListView.builder(
          itemCount: myVehicleDataList.length,
          itemBuilder: (context, index) {
            return MyVehicleCard(
              data: myVehicleDataList[index],
            );
          }),
    );
  }
}


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
                          imagePath: 'assets/CarImage/dzire.jpg'));
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

TextStyle keyStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 18);

class MyVehicleCard extends StatelessWidget {
  MyVehicleCard({Key? key, required this.data}) : super(key: key);
  MyVehicles data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset(
                  data.imagePath,
                  fit: BoxFit.fitHeight,
                  scale: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              SizedBox(
                height: 10,
              ),
              TitleAndValueWidget(title: "Car Name:", data: data.name),
              SizedBox(
                height: 10,
              ),
              TitleAndValueWidget(title: 'Car Type:', data: data.type),
              SizedBox(
                height: 10,
              ),
              TitleAndValueWidget(title: 'Car Number:', data: data.plateNumber),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleAndValueWidget extends StatelessWidget {
  const TitleAndValueWidget({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Car Name:',
          style: keyStyle,
        ),
        Text(data),
      ],
    );
  }
}
