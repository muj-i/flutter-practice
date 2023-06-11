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
                Container(
                  height: 120.0,
                  width: 120.0,
                  child: Material(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () => MySnackBar("gtgrbrbgrbggrbvr", context),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.unsplash.com/photo-1544376936-e15fd353d311?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withAlpha(50),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '1111',
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
            const SizedBox(height: 16),
            ListView(
              shrinkWrap: true,
              children: const [
                ListTile(
                  leading: Icon(Icons.photo_library_rounded,color: Color.fromARGB(206, 164, 87, 223),size: 40),
                  title: Text('Camera',
                  style: TextStyle(fontSize: 19),),
                  subtitle: Text('5,298 photos',style: TextStyle(fontSize: 16),),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library_rounded,color: Color.fromARGB(206, 164, 87, 223),size: 40),
                  title: Text('Favourites'),
                  subtitle: Text('data'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library_rounded,color: Color.fromARGB(206, 164, 87, 223),size: 40),
                  title: Text('Selfies'),
                  subtitle: Text('data'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library_rounded,color: Color.fromARGB(206, 164, 87, 223),size: 40),
                  title: Text('Videos'),
                  subtitle: Text('data'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => MySnackBar("Photos Uploaded Successfully!", context),
        child: Icon(Icons.cloud_upload_rounded),
      ),
    );
  }
}
