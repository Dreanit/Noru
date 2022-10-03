import 'package:flutter/material.dart';
import 'package:noru/UI/dashboardScreens/homescreen.dart';
import 'package:noru/UI/dashboardScreens/shareride/shareridescreen.dart';
import '../helpers/models/nearbycarsmodel.dart';
import 'dashboardScreens/inboxscreen.dart';
import 'dashboardScreens/post_ride/post_ride_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  void _onItemTapped(int? selectedIndex) {
//    if (selectedIndex == 2) {
//      return;
//    } else
    setState(() {
      _pageController!.jumpToPage(selectedIndex!);
    });
  }

  PageController? _pageController;
  int? _selectedIndex = 1;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    ShareRide(),
    HomeScreen(),
    PostRideScreen(),
    InboxScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade500,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex!,
          type: BottomNavigationBarType.fixed, // Fixed
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                label: 'Find Ride',
                icon: Icon(IconData(0xe1d7, fontFamily: 'MaterialIcons'))),
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Post Ride', icon: Icon(Icons.add_circle)),
            BottomNavigationBarItem(
                label: 'Inbox', icon: Icon(Icons.chat_bubble_outline)),
          ],
          onTap: (int ind) {
            _onItemTapped(ind);
            _selectedIndex = ind;
          },
          // type: BottomNavigationBarType.fixed,
        ),
        body: PageView(
            children: _screens,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: NeverScrollableScrollPhysics()));
  }
}

class NearByCarCard extends StatelessWidget {
  NearByCarCard({Key? key, required this.data}) : super(key: key);
  NearByCarsModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: Image.asset('${data.imagePath}'),
                    borderRadius: BorderRadius.circular(10),
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.carName),
                    Row(
                      children: [
                        Text(
                          'From: ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(data.fromLocation),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'To: ',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(data.toLocation),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star),
                            Text(data.rating.toString()),
                            Text(
                              ' (${data.reviewTotal} reviews)',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('info'),
                            Icon(Icons.arrow_right_alt_outlined)
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
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
      color: Colors.cyan,
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
      color: Color(0xdb52c3c9),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                vehicleName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  vehicleNumber,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  vehicleType,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
