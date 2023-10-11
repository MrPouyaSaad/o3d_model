import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  O3DController o3dController = O3DController();
  PageController textController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text('3D Model'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          O3D(
            src: 'assets/disney_style_character.glb',
            controller: o3dController,
            autoPlay: true,
            ar: false,
            autoRotate: false,
            cameraTarget: CameraTarget(-0.25, 2, 1),
            cameraOrbit: CameraOrbit(0, 90, 10),
          ),
          Container(
            width: 120,
            height: double.infinity,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: PageView(
              controller: textController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Daily goals'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('87'),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text('%'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Daily goals'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('87'),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text('%'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text('Daily goals'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text('87'),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: const Text('%'),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;

            textController.animateToPage(value,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
            if (index == 0) {
              o3dController.cameraTarget(-.25, 2, 1);
              o3dController.cameraOrbit(0, 90, 10);
            } else if (index == 1) {
              o3dController.cameraTarget(-0.25, 1.8, 0);
              o3dController.cameraOrbit(-90, 90, 10);
            } else {
              o3dController.cameraTarget(-0.25, 3, 0);
              o3dController.cameraOrbit(0, 90, 0);
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined), label: 'Timer'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined), label: 'Analytics'),
        ],
      ),
    );
  }
}
