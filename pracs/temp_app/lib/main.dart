import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Photos',
                  hintText: 'Enter keywords...',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),

Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
Image.network('https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),

              ],
            ),
            SizedBox(height: 16.0),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 1'),
                  subtitle: Text('Description 1'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 2'),
                  subtitle: Text('Description 2'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Sample Photo 3'),
                  subtitle: Text('Description 3'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Photos Uploaded Successfully!'),
            ),
          );
        },
        child: Icon(Icons.cloud_upload),
      ),
    );
  }
Widget _buildPhotoButton(BuildContext context, String caption, String imageUrl) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Clicked on photo!'),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              height: 120.0,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              caption,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  
