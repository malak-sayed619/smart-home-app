import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/appbarbottom.dart';
import 'package:smart_home_app/features/bedroomscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        backgroundColor: const Color(0xff214D3D),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 241, 235, 47),
            ),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Malk Sayed",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Wednesday, June 20",
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                ),

                const SizedBox(height: 4),

                const Text(
                  "Good Evening Malak",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                const Text(
                  "You have 3 rooms active and 12 devices running right now",
                  style: TextStyle(fontSize: 13, color: Colors.blueGrey),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: InfoCard(
                        icon: Icons.thermostat,
                        iconColor: Colors.redAccent,
                        value: "22°C",
                        label: "Inside",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InfoCard(
                        icon: Icons.wb_sunny,
                        iconColor: Colors.orange,
                        value: "18°C",
                        label: "Outside",
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InfoCard(
                        icon: Icons.water_drop,
                        iconColor: Colors.blue,
                        value: "58%",
                        label: "Humidity",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Row(
                  children: [
                    const Text(
                      "Rooms",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 104, 51),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                const RoomCard(
                  imagePath:
                      "https://images.unsplash.com/photo-1505693314120-0d443867891c?auto=format&fit=crop&w=800&q=60",
                  roomName: "Bedroom",
                  devices: "2 Devices",
                ),

                const SizedBox(height: 10),

                const RoomCard(
                  imagePath:
                      "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=800&q=60",
                  roomName: "Living Room",
                  devices: "5 Devices",
                ),

                const SizedBox(height: 10),

                const RoomCard(
                  imagePath:
                      "https://images.unsplash.com/photo-1556911220-bff31c812dba?auto=format&fit=crop&w=800&q=60",
                  roomName: "Kitchen",
                  devices: "3 Devices",
                ),

                const SizedBox(height: 25),

                const Text(
                  "Devices",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                  children: const [
                    DeviceCard(
                      title: "Main Light",
                      icon: Icons.lightbulb_outline,
                    ),
                    DeviceCard(title: "Thermostat", icon: Icons.thermostat),
                    DeviceCard(title: "AC Unit", icon: Icons.air),
                    DeviceCard(title: "Front Door", icon: Icons.lock_outline),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const Appbarbottom(),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const InfoCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String imagePath;
  final String roomName;
  final String devices;

  const RoomCard({
    super.key,
    required this.imagePath,
    required this.roomName,
    required this.devices,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.network(imagePath),
        title: Text(roomName),
        subtitle: Text(devices),
        trailing: const Icon(Icons.arrow_forward_ios),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BedroomScreen()),
          );
        },
      ),
    );
  }
}

class DeviceCard extends StatefulWidget {
  final String title;
  final IconData icon;

  const DeviceCard({super.key, required this.title, required this.icon});

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
      child: Card(
        color: isOn ? Colors.green.shade900 : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                size: 35,
                color: isOn ? Colors.white : Colors.black,
              ),
              const Spacer(),
              Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isOn ? Colors.white : Colors.black,
                ),
              ),
              Text(
                isOn ? "ON" : "OFF",
                style: TextStyle(color: isOn ? Colors.white70 : Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
