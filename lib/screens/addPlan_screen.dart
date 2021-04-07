import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_planner/widgets/my_provider.dart';

class AddPlanScreen extends StatefulWidget {
  final String weekdayName;
  const AddPlanScreen({Key key, this.weekdayName}) : super(key: key);

  @override
  _AddPlanScreenState createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (text) {
              name = text;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            minLines: 10,
            maxLines: 30,
            autocorrect: false,
          ),
        ),
        FlatButton(
          onPressed: () {
            Provider.of<MyProvider>(context, listen: false)
                .setName(widget.weekdayName, name);
            Navigator.pop(context);
          },
          color: Colors.blue,
        ),
      ],
    );
  }
}

