import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
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
        
        ],
      ),
    );
  }
}
