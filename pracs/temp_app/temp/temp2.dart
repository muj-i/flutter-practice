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
                InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Clicked on photo!'),
                      ),
                    );
                  },
                  child: Column(
                    ///crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                            image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1544376936-e15fd353d311?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
                                ),
                                fit: BoxFit.fill)),
                        child:

                        Text(
                          textAlign: TextAlign.justify,'test',
                        ),
                      ),
                      // Card(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(8.0),
                      //   ),
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                      //     child: Image.network(
                      //       'https://images.unsplash.com/photo-1544376936-e15fd353d311?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
                      //       fit: BoxFit.scaleDown,
                      //       height: 120.0,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Photo 1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Clicked on photo!'),
                      ),
                    );
                  },
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.network(

                        'https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNxdWFyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60', // Replace with your own image path
                        // Replace with your own image path
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 16,
                        left: 16,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: Colors.black54,
                          child: Text(
                            'Sample Text', // Replace with your desired text
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Repeat the above code for the remaining photos...
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
}
