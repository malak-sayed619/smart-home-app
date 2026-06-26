import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff23473D),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xff4F7A6D),
                    child: Text(
                      "RB",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rebecca",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Barbara",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              drawerItem(icon: Icons.home_outlined, title: "Home"),

              drawerItem(icon: Icons.person_outline, title: "Profile"),

              drawerItem(
                icon: Icons.notifications_none,
                title: "Notifications",
              ),

              /// Selected Item
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: drawerItem(
                  icon: Icons.bar_chart,
                  title: "Stats",
                  selected: true,
                ),
              ),

              drawerItem(
                icon: Icons.calendar_month_outlined,
                title: "Schedule",
              ),

              drawerItem(icon: Icons.settings_outlined, title: "Settings"),

              const Spacer(),

              const Divider(color: Colors.white24),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Logged in as",
                  style: TextStyle(color: Colors.white60),
                ),
              ),

              const SizedBox(height: 8),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "rebecca@smarthome.io",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItem({
    required IconData icon,
    required String title,
    bool selected = false,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.white70,
          fontSize: 18,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {},
    );
  }
}
