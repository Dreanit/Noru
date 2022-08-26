import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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

  String totalTillDate = 'Total Till Date';
  double totalTillDateAmount = 4206.9;
  String lastMonth = 'Last Month';
  double lastMonthAmount = 1210;
  String thisMonth = 'This Month';
  double thisMonthAmount = 1050.9;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              leading: Icon(Icons.verified_user),
              title: Text(''),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "NORU",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Theme.of(context).primaryColor,
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
            HeadingWithDivider(headingTitle: 'Vehicle List'),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                height: 106,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    VehicleDetailCard(
                        vehicleName: "Swift Dzire",
                        vehicleNumber: 'MH 02 AB 438',
                        vehicleType: '5 Seater'),
                    VehicleDetailCard(
                        vehicleName: "Hyundai Creta",
                        vehicleNumber: 'MH 02 AB 420',
                        vehicleType: '5 Seater'),
                    VehicleDetailCard(
                        vehicleName: "Honda City",
                        vehicleNumber: 'MH 02 CD 121',
                        vehicleType: '5 Seater'),
                  ],
                ),
              ),
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
            SizedBox(
              height: 10,
            ),
            HeadingWithDivider(headingTitle: 'KarPool'),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class EarningAmountWidget extends StatelessWidget {
  const EarningAmountWidget(
      {Key? key,
      required this.titleString,
      required this.amount,
      required this.onPressed})
      : super(key: key);

  final String titleString;
  final double amount;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  titleString,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'PT Serif'),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '\u{20B9}$amount',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Row(
              children: [
                Text('info'),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_right_alt_outlined))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeadingWithDivider extends StatelessWidget {
  const HeadingWithDivider({Key? key, required this.headingTitle})
      : super(key: key);
  final String headingTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Text(
            headingTitle,
            style: TextStyle(
              fontFamily: "PT Serif",
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Divider(
              indent: 5.0,
              thickness: 2,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleDetailCard extends StatelessWidget {
  const VehicleDetailCard(
      {Key? key,
      required this.vehicleName,
      required this.vehicleNumber,
      required this.vehicleType})
      : super(key: key);
  final String vehicleName;
  final String vehicleNumber;
  final String vehicleType;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                vehicleName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  vehicleNumber,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  vehicleType,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
