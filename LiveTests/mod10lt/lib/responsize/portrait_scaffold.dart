import 'package:flutter/material.dart';
import 'package:mod10lt/utilitis/container_items.dart';

class PortraitScaffold extends StatelessWidget {
  const PortraitScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ContainerItems(
            imageLocation: 'https://storage-asset.msi.com/global/picture/image/feature/PC-Case/MEG-Trident-X2/images/processor-img-xs.jpg', // Replace with your image URL
            labelText: 'Item $index', 
          );
        },
      ),
    );
  }
}
