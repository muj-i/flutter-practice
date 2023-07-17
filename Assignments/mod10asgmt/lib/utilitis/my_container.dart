import 'package:flutter/material.dart';

import 'container_items.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            // spacing: 12,
            // runSpacing: 12,
            children: [
              ContainerItems(
                imageLocation:
                    'assets/images/processor.jpg',
                labelText: 'new',
                onTap: () {
                   _showBottomSheet(context,'nw Sheet Title',
                    'Bottom frgv fxbfgbgnfgbdfbgdfbdfbdfbdfbdfbdfbdfgbdfbdfbdfbdfbdf Content');
                },
              ),
              ContainerItems(
                imageLocation:
                    'assets/images/ram.jpg',
                labelText: 'new',
              ),
              ContainerItems(
                imageLocation:
                    'assets/images/graphics.jpg',
                labelText: 'new',
              ),ContainerItems(
                imageLocation:
                    'assets/images/processor.jpg',
                labelText: 'new',
              ),
              ContainerItems(
                imageLocation:
                    'assets/images/ram.jpg',
                labelText: 'new',
              ),
              ContainerItems(
                imageLocation:
                    'assets/images/graphics.jpg',
                labelText: 'new',
              ),ContainerItems(
                imageLocation:
                    'assets/images/processor.jpg',
                labelText: 'new',
              ),
              ContainerItems(
                imageLocation:
                    'assets/images/ram.jpg',
                labelText: 'new',
              ),
              ContainerItems(
                imageLocation:
                    'assets/images/graphics.jpg',
                labelText: 'new',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
void _showBottomSheet(BuildContext context,
  String title,
  String content,) {
  showModalBottomSheet(

    context: context,
    builder: (BuildContext context) {
      
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                content,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      );
    },
  );
}
