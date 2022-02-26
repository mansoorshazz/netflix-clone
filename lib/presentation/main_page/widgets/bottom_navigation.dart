import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';



ValueNotifier<int> indexChange = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChange,
      builder: (BuildContext context, int newIndex, Widget? _) =>
          BottomNavigationBar(
        currentIndex: newIndex,
        showUnselectedLabels: true,
        selectedFontSize: 8,
        elevation: 0,
        unselectedFontSize: 8,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Elusive.home,
              size: 18,
            ),
            label: 'Home',
          ),
          // buildBottomNavigationBarItem(icon: Elusive.ho, label: 'Home'),
          buildBottomNavigationBarItem(
              icon: Icons.sports_esports, label: 'Games'),
          buildBottomNavigationBarItem(
              icon: Icons.upcoming_rounded, label: 'Coming Soon'),
          buildBottomNavigationBarItem(
              icon: Icons.tag_faces_outlined, label: 'Fast Laughs'),
          buildBottomNavigationBarItem(
              icon: Icons.download_outlined, label: 'Downloads'),
        ],
        onTap: (index) {
          indexChange.value = index;
        },
      ),
    );
  }

// ==================================================================================
// This widget used to show the bottom navigation bar items.

  BottomNavigationBarItem buildBottomNavigationBarItem(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
