import 'package:flutter/material.dart';

import 'container_items.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ContainerItems(
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
