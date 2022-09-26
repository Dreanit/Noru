import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noru/Widgets/customtextfieldtype2.dart';
import 'package:flutter_switch/flutter_switch.dart';
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
      backgroundColor: Colors.grey[350],
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
      appBar: AppBar(
        title: Text('My Vehicles'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
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

class MyVehicleCard extends StatefulWidget {
  MyVehicleCard({Key? key, required this.data}) : super(key: key);
  MyVehicles data;

  @override
  State<MyVehicleCard> createState() => _MyVehicleCardState();
}

class _MyVehicleCardState extends State<MyVehicleCard> {
  @override
  bool value = true;
  Color _textColor = Colors.black;
  Color _appBarColor = Color.fromRGBO(36, 41, 46, 1);
  Color _scaffoldBgcolor = Colors.white;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.verified_user,
                      color: Colors.grey,
                    ),
                    Spacer(),
                    Text(
                      widget.data.nickName,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontFamily: "Caecilia"),
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.data.imagePath,
                  fit: BoxFit.fitHeight,
                  scale: 3,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.data.name,
                style: TextStyle(fontSize: 18, fontFamily: "Caecilia"),
              ),
              Text(
                widget.data.plateNumber,
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: "Caecilia"),
              ),
              SizedBox(
                height: 30,
              ),
              // Row(
              //   children: const [Spacer(), Icon(Icons.wifi), Spacer()],
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text("Active Vehicle",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "Caecilia")),
                  Icon(Icons.info),
                  Spacer(),
                ],
              )
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
