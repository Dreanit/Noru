import 'package:flutter/material.dart';
import 'package:noru/Widgets/customdrawer.dart';
import 'package:noru/helpers/harcodedData/inboxdata.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Inbox",
          style: TextStyle(color: Colors.black, fontFamily: "OpenSans" ),
        ),
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
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      drawer: CustomDrawer(),
      body: ListView.builder(
          itemCount: inboxDataList.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.supervised_user_circle_rounded),
                        Text(inboxDataList[index].sentBy,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontStyle: FontStyle.normal,
                                fontSize: 18)),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              inboxDataList[index].id.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconWithContent(
                      text: inboxDataList[index].body,
                      iconData: Icons.message,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconWithContent(
                      text: inboxDataList[index].time,
                      iconData: Icons.timer,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class IconWithContent extends StatelessWidget {
  const IconWithContent({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(iconData), Text(text,style: TextStyle(fontFamily: "OpenSans",fontStyle: FontStyle.normal,fontSize: 16),)],
    );
  }
}
