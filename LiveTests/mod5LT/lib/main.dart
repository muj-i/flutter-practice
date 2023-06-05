import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 5 Live Test',
      home: HomeAct(),
    );
  }
}

class HomeAct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.indigo.withAlpha(2000),
       elevation: 6,
       title: Text('Module 5 Live Test'),
       centerTitle: true,
       actions: [
         IconButton(
           onPressed: () {
             ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text(
                     "Search",
                   ),
                 )
             );
           } ,
           icon: Icon(Icons.search),
         ),
         IconButton(
             onPressed: () {
               ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                     content: Text(
                       "Settings",
                     ),
                   )
               );
             } ,
             icon: Icon(Icons.settings),
         ),
       ],
     ),
     drawer: Drawer(
       child: ListView(
         children: [
           DrawerHeader(
             decoration: BoxDecoration(
               color: Colors.indigo.withAlpha(200),
             ),
             child: Column(
               children: [
                 Text(
                   'Module 5 Live Test',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 45,
                   ),
                 ),
               ],
             ),
           ),
           ListTile(
             leading: Icon(Icons.home),
             title: Text('Home'),
             onTap: () {
               // Navigate to home
             },
           ),
           ListTile(
             leading: Icon(Icons.people_alt),
             title: Text('Profile'),
             onTap: () {
               // Navigate to Profile
             },
           ),
         ],
       ),
     ),
     body: Center(
       child: Text(
         'Welcome to my app!',
         style: TextStyle(fontSize: 34),
       ),
     ),
     floatingActionButton: Container(
       child: FloatingActionButton(
         onPressed: () {
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                 content: Text(
                   "Add",
                 ),
               )
           );
         },
         backgroundColor: Colors.indigo.withAlpha(200),
         child: Icon(
           Icons.add,
           size: 40,
         ),
       ),
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
   );
  }
}