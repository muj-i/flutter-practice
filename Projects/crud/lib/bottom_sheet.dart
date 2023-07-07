import 'package:flutter/material.dart';

Widget buildBottomSheetContent(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Task Details',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          children: [
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('edit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ],
    ),
  );
}
