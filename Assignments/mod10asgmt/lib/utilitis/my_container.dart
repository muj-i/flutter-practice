import 'package:flutter/material.dart';

import 'container_items.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            // spacing: 12,
            // runSpacing: 12,
            children: [
              ContainerItems(
                imageLocation: 'assets/images/processor.jpg',
                labelText: 'Processor',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/processor.jpg',
                      '13TH GEN INTEL® CORE™ i9 PROCESSOR',
                      'The Intel® Core™ i9 processor is equipped with 8 performance cores (P-core) and 8 efficiency cores (E-core), which can simultaneously help with the multitasking needs of gamers and provide a smooth gaming experience.');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/ram.jpg',
                labelText: 'Memory',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/ram.jpg',
                      'STRONGER AND FASTER DDR4-3200',
                      'Get the mighty performance out of your desktop with support of the latest DDR4-3200 memory. Enjoy the faster system speed and responsiveness, the new standard will take your gaming experience to the next level.');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/graphics.jpg',
                labelText: 'Graphics',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/graphics.jpg',
                      'GEFORCE RTX 40 SERIES BEYOND FAST',
                      'NVIDIA® GeForce® RTX 40 Series GPUs are beyond fast for gamers and creators. Experience lifelike virtual worlds, ultra-high FPS gaming, revolutionary new ways to create, and unprecedented workflow acceleration');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/mb.png',
                labelText: 'Motherboard',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/mb.png',
                      'MEG Z790 GODLIKE',
                      'Supports 12th/ 13th Gen Intel® Core™ Processors, Pentium® Gold and Celeron® Processors');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/ssd.png',
                labelText: 'Storage',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/ssd.png',
                      'SPATIUM M480 PRO PCIe 4.0 NVMe M.2',
                      'Delivering the ultimate PRO performance for PCIe 4.0, the M480 PRO boasts up to 60% faster random read/write speeds, enabling a supremely responsive experience in gameplay and productivity under heavy workloads.');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/pc.png',
                labelText: 'Case',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/pc.png',
                      'MPG Trident AS',
                      'The MPG Trident AS takes charge by being the most compact gaming desktop. Packed in a 10 liters volume case, it has components that are typically found in full tower cases, including the latest Intel® Core™ processors and NVIDIA® GeForce RTX™ graphics cards. In essence, the MPG Trident AS can only be surpassed by itself.');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/cooling.png',
                labelText: 'Cooling',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/cooling.png',
                      'MPG CORELIQUID K360',
                      'Mighty with a purpose, the MPG CORELIQUID K Series descends. The MPG CORELIQUID K Series washes away your traditional image of a liquid cooler and blows it into a whole new reality. Stacked with powerful features and sculpted with eye-catching appearances, the MPG CORELIQUID K Series is here to set the benchmark, one game at a time.');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/ps.png',
                labelText: 'PS',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/ps.png',
                      'MPG A750G PCIE5',
                      'The MPG series brings out fashionable products by showing extremely unique styles and expressing a conceited attitude towards the challenge of the gaming world. With extraordinary performance and style, the MPG series defines the future of gaming fashion.');
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/km.png',
                labelText: 'Keyb. & Mice',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/km.png',
                      'VIGOR GK30 COMBO',
                      "Mechanical-like plunger switches with 3-part construction provides a crisp typing experience with over 12 million life span.\nConvenient lighting control allows you to change speed, direction, or mode with ease.");
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/monitor.png',
                labelText: 'Monitor',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/monitor.png',
                      'MPG ARTYMIS 343CQR',
                      "MSI ARTYMIS Series adopts the new 1000R curved surface technology, creating the perfect curvature that's closer to the viewing angle of the human eye and reducing the eye fatigue caused by long-term use of the screen. At the same time, it enhances the sense of coverage and immersion, bringing a higher level of gaming experience to you.");
                },
              ),
              ContainerItems(
                imageLocation: 'assets/images/thunderbolt.png',
                labelText: 'Thunderbolt',
                onTap: () {
                  _showBottomSheet(
                      context,
                      'assets/images/thunderbolt.png',
                      'MSI THUNDERBOLTM4 8K',
                      'Thunderbolt™ 4 has become a savior that offers multiple functions in one port and is now commonly seen in premium laptops and desktops. MSI THUNDERBOLTM4 8K PCI-e add-on card offers the latest and fastest Thunderbolt™ 4 connectivity without needing to upgrade to a whole new system, supporting up to a full 8K video experience.');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    String bottomSheetImageLocation,
    String title,
    String content,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    bottomSheetImageLocation,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  content,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
