import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:week_planner/screens/addPlan_screen.dart';
import 'package:provider/provider.dart';
import 'package:week_planner/widgets/my_provider.dart';

class WeekDayCard extends StatefulWidget {
  WeekDayCard({@required this.text, this.name});
  final String name;
  final String text;

  @override
  _WeekDayCardState createState() => _WeekDayCardState();
}

class _WeekDayCardState extends State<WeekDayCard> {
  @override


  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context, myProvider, child) {
      return Card(
        color: Color(0xFFFEEFCD),
        elevation: 10,
        child: Column(
          children: [
            Text(widget.text),
            Text(Provider.of<MyProvider>(context).name(widget.text) ?? ''
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Color(0xFFFEEFCD),
                    context: context,
                    builder: (context) => AddPlanScreen(weekdayName: widget.text),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

// child: StreamBuilder(
// stream: FirebaseFirestore.instance
//     .collection('Users')
// .doc(FirebaseAuth.instance.currentUser.uid)
// .collection('Coins')
// .snapshots(),
// builder:
// (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (!snapshot.hasData) {
// return Center(
// child: CircularProgressIndicator(),
// );
// }
// return StreamBuilder(
// stream: Firestore.instance
//     .collection('users/')
// .where('uid', isEqualTo: _userUID)
// .snapshots(),
// builder: (BuildContext context, userSnapshot) {
// if (!userSnapshot.hasData) return WidgetFunctions().loadingWidget();
// return StreamBuilder(
// stream: Firestore.instance
//     .collection('products')
//     .where('latest', isEqualTo: true)
//     .snapshots(),
// builder: (cuserSnapshotontext, snapshot) {
// if (!snapshot.hasData) return WidgetFunctions().loadingWidget();
// if (snapshot.data.documents.length == 0)
// return const Center(
// child: Text(
// "Not Available",
// style: TextStyle(fontSize: 30.0, color: Colors.grey),
// ),
// );
//
// if (!userSnapshot.data.documents[0]['productViewPermission']) {
// print('place6');
// return const Center(
// child: Text(
// 'You dont have permission to view products \n please contect us',
// style: TextStyle(
// fontSize: 18.0,
// color: Colors.red,
// fontWeight: FontWeight.bold),
// ));
// }
// return GridView.builder(
