import 'package:flutter/material.dart';

import '../../Widgets/customdrawer.dart';
import '../../helpers/harcodedData/myvehicles.dart';
import '../../helpers/harcodedData/nearbycarsdata.dart';
import '../dashboard.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String totalTillDate = 'Total Till Date';
  double totalTillDateAmount = 4206.9;
  String lastMonth = 'Last Month';
  double lastMonthAmount = 1210;
  String thisMonth = 'This Month';
  double thisMonthAmount = 1050.9;
  timeOfDay() {
    var hr = DateTime.now().hour;
    // before 12:00 pm
    if (hr < 12) {
      return 'Good Morning';
    }
    // before 5:00 pm
    if (hr < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: CustomDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: Text("NORU"),
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Color(0xff6ab8ee),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 1.05,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello User!',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PT Serif"),
                        ),
                        Text(
                          "${timeOfDay()}",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PT Serif"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            HeadingWithDivider(headingTitle: 'KarPool'),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return NearByCarCard(
                  data: nearByCarData[index],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            HeadingWithDivider(headingTitle: 'Earnings'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: EarningAmountWidget(
                      titleString: totalTillDate,
                      amount: totalTillDateAmount,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: EarningAmountWidget(
                      titleString: lastMonth,
                      amount: lastMonthAmount,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: EarningAmountWidget(
                titleString: thisMonth,
                amount: thisMonthAmount,
                onPressed: () {},
              ),
            ),
            HeadingWithDivider(headingTitle: 'Vehicle List'),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myVehicleDataList.length,
                  itemBuilder: (context, index) {
                    return VehicleDetailCard(
                        vehicleName: myVehicleDataList[index].name,
                        vehicleNumber: myVehicleDataList[index].plateNumber,
                        vehicleType: myVehicleDataList[index].type);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
