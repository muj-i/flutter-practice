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
      debugShowCheckedModeBanner: false,
    );
  }
}

mySnackBar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: (Text(message))));
}

class PhotoHomePage extends StatelessWidget {
  const PhotoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo Gallery',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: const Color.fromARGB(206, 114, 87, 223),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Search Photos',
                    style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  hintText: 'Enter keywords...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Material(
                    color: const Color.fromARGB(206, 114, 87, 223),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () =>
                          mySnackBar("Clicked on photo leaves!", context),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'leaves',
                                style: TextStyle(
                                  color: Colors.white,
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
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Material(
                    color: const Color.fromARGB(206, 114, 87, 223),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () =>
                          mySnackBar("Clicked on photo nachos!", context),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/10621653/pexels-photo-10621653.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'nachos',
                                style: TextStyle(
                                  color: Colors.white,
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
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Material(
                    color: const Color.fromARGB(206, 114, 87, 223),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () =>
                          mySnackBar("Clicked on photo roses!", context),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/10863553/pexels-photo-10863553.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'roses',
                                style: TextStyle(
                                  color: Colors.white,
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
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Material(
                    color: const Color.fromARGB(206, 114, 87, 223),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () =>
                          mySnackBar("Clicked on photo dessert!", context),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/5945565/pexels-photo-5945565.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'dessert',
                                style: TextStyle(
                                  color: Colors.white,
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
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Material(
                    color: const Color.fromARGB(206, 114, 87, 223),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () =>
                          mySnackBar("Clicked on photo letters!", context),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/7784602/pexels-photo-7784602.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'letters',
                                style: TextStyle(
                                  color: Colors.white,
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
                SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Material(
                    color: const Color.fromARGB(206, 114, 87, 223),
                    borderRadius: BorderRadius.circular(5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () =>
                          mySnackBar("Clicked on photo oranges!", context),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/7235666/pexels-photo-7235666.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            fit: BoxFit.fill,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                'oranges',
                                style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  fontSize: 18,
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
                  leading: Icon(Icons.photo_library_rounded,
                      color: Color.fromARGB(206, 114, 87, 223), size: 40),
                  title: Text(
                    'Camera',
                    style: TextStyle(fontSize: 19),
                  ),
                  subtitle: Text(
                    '2,298 photos',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library_rounded,
                      color: Color.fromARGB(206, 114, 87, 223), size: 40),
                  title: Text(
                    'Favourites',
                    style: TextStyle(fontSize: 19),
                  ),
                  subtitle: Text(
                    '182 photos',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library_rounded,
                      color: Color.fromARGB(206, 114, 87, 223), size: 40),
                  title: Text(
                    'Selfies',
                    style: TextStyle(fontSize: 19),
                  ),
                  subtitle: Text(
                    '690 photos',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library_rounded,
                      color: Color.fromARGB(206, 114, 87, 223), size: 40),
                  title: Text(
                    'Videos',
                    style: TextStyle(fontSize: 19),
                  ),
                  subtitle: Text(
                    '83 photos',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(206, 114, 87, 223),
        onPressed: () => mySnackBar("Photos Uploaded Successfully!", context),
        child: const Icon(Icons.cloud_upload_rounded),
      ),
    );
  }
}
