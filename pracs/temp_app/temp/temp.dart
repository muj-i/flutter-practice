import 'package:flutter/material.dart';

void main() {
  runApp(const PhotoApp());
}

class PhotoApp extends StatelessWidget {
  const PhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Photo Gallery',
      home: PhotoHomePage(),
    );
  }
}

MySnackBar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: (Text(message))));
}

class PhotoHomePage extends StatelessWidget {
  const PhotoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  label: Text('Search Photos'),
                  hintText: 'Enter keywords...',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNxdWFyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60', // Replace with your own image path
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Beautiful sunset', // Replace with your caption text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Image.network(
                  'https://images.unsplash.com/photo-1525351326368-efbb5cb6814d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNxdWFyZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60', // Replace with your own image path
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Beautiful sunset', // Replace with your caption text
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
                // Image.network(
                //     'https://lh3.googleusercontent.com/a/AAcHTtfvI2iKEfPIpw5-xPUTSCEfD5fHLMtfM4fB6NejOw=s96-c-rg-br100'),
              ],
            ),
            const SizedBox(height: 16),
            ListView(
              shrinkWrap: true,


              children: const [
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('data'),
                  subtitle: Text('data'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('data'),
                  subtitle: Text('data'),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => MySnackBar("Photos Uploaded Successfully!", context),
        child: Icon(Icons.cloud_upload_rounded),),
    );
  }
}
