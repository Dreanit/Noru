import 'package:flutter/material.dart';
import 'package:noru/Widgets/customtextfieldtype2.dart';

import '../../../../helpers/harcodedData/myvehicles.dart';
import '../../../../helpers/models/myvehiclesmodel.dart';
import '../Widget/addVehiclePopUp.dart';

class MyVehiclesScreen extends StatefulWidget {
  const MyVehiclesScreen({Key? key}) : super(key: key);

  @override
  State<MyVehiclesScreen> createState() => _MyVehiclesScreenState();
}

class _MyVehiclesScreenState extends State<MyVehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
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
