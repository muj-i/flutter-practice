import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mod14asgmt/widgets/images_urls.dart';

class FootballMatch3 extends StatelessWidget {
  const FootballMatch3({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: Container(
        height: 370,
        color: Colors.grey[100],
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('football')
              .doc('football_match_3')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return Text('!!!!!!Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final score = snapshot.data!;
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          img3,
                          height: 40,
                        )),
                    const Text(
                      'Match Name',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        FontAwesomeIcons.squareXmark,
                        size: 28,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                Text(
                  score.get('match_name'),
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.grey[300],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Score',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  score.get('team_a_goal').toString(),
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                const Text(':',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  score.get('team_b_goal').toString(),
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Time: ',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                                Text(score.get('time'),
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Total time: ',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                                Text(score.get('total_time'),
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
