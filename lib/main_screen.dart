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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Text('3D Model'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: O3D(
        src: 'assets/disney_style_character.glb',
        controller: o3dController,
        autoPlay: true,
        ar: false,
        autoRotate: false,
        cameraTarget: CameraTarget(0, 2, 1),
        cameraOrbit: CameraOrbit(0, 90, 10),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;

            if (index == 0) {
              o3dController.cameraTarget(0, 2, 1);
              o3dController.cameraOrbit(0, 90, 10);
            } else if (index == 1) {
              o3dController.cameraTarget(0, 1.8, 0);
              o3dController.cameraOrbit(-90, 90, 10);
            } else {
              o3dController.cameraTarget(0, 3, 0);
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
