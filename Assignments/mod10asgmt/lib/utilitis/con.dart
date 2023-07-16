import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String imageUrl;
  final String labelText;

  const CustomWidget({
    required this.imageUrl,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                imageUrl,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withAlpha(150),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    labelText,
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
    );
  }
}
