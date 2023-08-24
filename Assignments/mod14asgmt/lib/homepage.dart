import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mod14asgmt/matches_sheets/match1.dart';
import 'package:mod14asgmt/matches_sheets/match2.dart';
import 'package:mod14asgmt/matches_sheets/match3.dart';
import 'package:mod14asgmt/matches_sheets/match4.dart';
import 'package:mod14asgmt/matches_sheets/match5.dart';
import 'package:mod14asgmt/matches_sheets/match6.dart';
import 'package:mod14asgmt/matches_sheets/match7.dart';
import 'package:mod14asgmt/matches_sheets/match8.dart';
import 'package:mod14asgmt/widgets/images_urls.dart';
import 'package:mod14asgmt/widgets/match_name.dart';
import 'package:mod14asgmt/widgets/stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 222, 222, 226),
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            backgroundColor: Colors.black,
            leading: Text(
              'FOOTBAL',
              style: TextStyle(
                  fontSize: 30, letterSpacing: 5, color: Colors.white),
            ),
            largeTitle: Text(
              'MATCHES \n',
              style: TextStyle(
                  fontSize: 30, letterSpacing: 5, color: Colors.white),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomImageTile(
                    text: match1,
                    imageUrl: img1,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch1();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageTile(
                    text: match2,
                    imageUrl: img2,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch2();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageTile(
                    text: match3,
                    imageUrl: img3,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch3();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageTile(
                    text: match4,
                    imageUrl: img4,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch4();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageTile(
                    text: match5,
                    imageUrl: img5,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch5();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageTile(
                    text: match6,
                    imageUrl: img6,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch6();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageTile(
                    text: match7,
                    imageUrl: img7,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch7();
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomImageTile(
                    text: match8,
                    imageUrl: img8,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const FootballMatch8();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
