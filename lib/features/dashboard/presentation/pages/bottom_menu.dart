import 'dart:ui';

import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final int currentIndex;
  const BottomMenu({
    required this.onChanged,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              currentIndex: currentIndex,
              onTap: (index) {
                onChanged(index);
              },

              iconSize: 36,

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  label: '',
                  activeIcon: Icon(Icons.home_rounded, color: Colors.blue),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history, color: Colors.white),
                  label: '',
                  activeIcon: Icon(Icons.history_rounded, color: Colors.blue),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color: Colors.white),
                  label: '',
                  activeIcon: Icon(Icons.settings_rounded, color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
