import 'package:flutter/material.dart';

class ContainerItems extends StatelessWidget {
  final String imageLocation;
  final String labelText;
  final VoidCallback? onTap;

  const ContainerItems({
    super.key,
    required this.imageLocation,
    required this.labelText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120.0,
        width: 120.0,
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap ?? () {},
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageLocation,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color:
                          const Color.fromARGB(255, 37, 35, 42).withAlpha(150),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      labelText,
                      style: const TextStyle(
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
    );
  }
}
