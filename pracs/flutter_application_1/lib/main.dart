import 'package:flutter/material.dart';

void main() {
  runApp(dApp(
    appName: 'The TI App',
  ));
}

class dApp extends StatelessWidget {
  final String appName;

  const dApp({super.key, required this.appName});
  @override
  Widget build(Object context) {
    return MaterialApp(
      home: HomeAct(),
      theme: ThemeData.dark(),
    );
  }
}

class HomeAct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kelkok"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.screen_search_desktop_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_applications_sharp),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.security_sharp),
          )
        ],
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text('muj'),
                  accountEmail: Text('mio'),
                  currentAccountPicture: Image.asset('images/td.png'),
                )),
            ListTile(
              leading: Icon(Icons.person_2_sharp),
              title: Text('Profile'),
            )
          ],
        ),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 9, 17, 237),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 37.5000, vertical: 20),
                  child: Text(
                    "New !",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 9, 176, 242),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "New App!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 162, 30),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "New App!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 30, 196),
                borderRadius: BorderRadius.circular(50),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Text(
                "New App!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 30, 233, 50),
                borderRadius: BorderRadius.circular(50),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Text(
                "New App!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
    );
  }
}
