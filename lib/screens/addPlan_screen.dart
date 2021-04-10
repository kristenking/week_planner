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
          child: SingleChildScrollView(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              onChanged: (text) {
                name = text;
              },
              decoration: InputDecoration(
                hintText: "What do you want to note.?",
                contentPadding: const EdgeInsets.all(30),
                border: InputBorder.none
              ),
              minLines: 1,
              maxLines: 3,
              autocorrect: false,
            ),
          ),
        ),
        ElevatedButton(
          child: Icon(Icons.add_outlined,
          color: Color(0xFFFEEFCD),),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(80,40
            ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    primary: Color(0xFFcf9e9f), // background
    ),
          onPressed: () {
            Provider.of<MyProvider>(context, listen: false)
                .setName(widget.weekdayName, name);

            Navigator.pop(context);
          },
        ),

      ],
    );
  }
}

