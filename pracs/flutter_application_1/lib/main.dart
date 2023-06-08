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
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: .6,
            ),
          ),
        ),
        textTheme: const TextTheme(
            // by default there are several default text styles like titleLarge
            // you can access all of these by Theme.of(context).textTheme.yourDesireStyle
            // even you can customize a previous style
            ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: .6,
            ),
          ),
        ),
    ),
    home: HomeAct(),
    );
  }
}

MySnackBar(message, context) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: (Text(message))));
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

      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
              //Image.network('http://img.alicdn.com/imgextra/i2/2210708939978/O1CN01HbReKK2NZylhg9O5M_!!2210708939978.jpg'),
              InkWell(
                splashColor: Colors.amber,
                onTap: () => MySnackBar("vvbvv", context),
                child: Image.network('https://img.alicdn.com/imgextra/i1/2210708939978/O1CN01ONijSX2NZylj6Ux8Z_!!2210708939978.jpg_100x100q90.jpg')),
             Image.network('https://img.alicdn.com/imgextra/i4/2211895365080/O1CN01ufXL3g1nOgpC22AMU_!!0-item_pic.jpg')
              ]),
              Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
              InkWell(child: 
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
              )
            ]),
      ),
          
    );
  }
}
