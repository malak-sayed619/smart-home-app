import 'package:flutter/material.dart';

import 'package:smart_home_app/core/auth/login.dart';
import 'package:smart_home_app/features/analytics.dart';
import 'package:smart_home_app/features/homescreen.dart';
import 'package:smart_home_app/features/setting.dart';

class Appbarbottom extends StatelessWidget {
  const Appbarbottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 3,
      selectedItemColor: const Color.fromARGB(255, 2, 46, 3),
      unselectedItemColor: Colors.grey,

      onTap: (index) {
        Widget page;

        switch (index) {
          case 0:
            page = const Homescreen();
            break;
          case 1:
            page = const AnalyticsScreen();

          case 3:
            page = const SettingsScreen();
            break;

          default:
            return;
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: ''),
      ],
    );
  }
}
