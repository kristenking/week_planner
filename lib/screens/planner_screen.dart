import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:week_planner/widgets/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:week_planner/widgets/weekday_card.dart';

class PlannerScreen extends StatefulWidget {
  static const String id = 'planner_screen';

  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {

  Widget build(BuildContext context) {
    Provider.of<MyProvider>(context, listen: false)
        .fetchData();
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Color(0xFFcf9e9f),
      body: Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (itemWidth / itemHeight),
          ),
          children: <Widget>[
            WeekDayCard(
              text: '',
            ),
            WeekDayCard(text: 'Monday' ),
            WeekDayCard(text: 'Tuesday'),
            WeekDayCard(text: 'Wednesday'),
            WeekDayCard(text: 'Thursday'),
            WeekDayCard(text: 'Friday'),
            WeekDayCard(text: 'Saturday'),
            WeekDayCard(text: 'Sunday'),
            WeekDayCard(text: 'Notes'),
          ],
        ),
      ),
    );
  }
}
