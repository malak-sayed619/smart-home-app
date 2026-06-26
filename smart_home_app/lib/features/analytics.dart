import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/consumercard.dart';
import 'package:smart_home_app/widgets/appbarbottom.dart';
import 'package:smart_home_app/widgets/widgetdrawer.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F4EF),
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F4EF),
        elevation: 0,
        centerTitle: true,
        title: const Text("Analytics", style: TextStyle(color: Colors.black)),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Color(0xff4E8B72),
              child: Text("RB"),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              "This week",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),

            const SizedBox(height: 10),

            const Text(
              "Energy Usage",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            // Energy Card
            Container(
              width: 1000,
              height: 250,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: const Color(0xff214D3D),
                borderRadius: BorderRadius.circular(35),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    "Total this month",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "48.2 kWh",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: const Text(
                      "  ↓ 12% vs last month",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Daily Breakdown",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            buildDay("Mon", "5.2 kWh", .52),
            buildDay("Tue", "6.8 kWh", .68),
            buildDay("Wed", "7.1 kWh", .71),
            buildDay("Thu", "4.9 kWh", .49),
            buildDay("Fri", "6.3 kWh", .63),
            buildDay("Sat", "8.1 kWh", .81),
            buildDay("Sun", "5.5 kWh", .55),

            const SizedBox(height: 30),

            const Text(
              "Top Consumers",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const ConsumerCard(
              icon: Icons.air,
              title: "AC Unit",
              room: "Bedroom",
              usage: "12.4 kWh",
              progress: .85,
            ),

            const ConsumerCard(
              icon: Icons.power_settings_new,
              title: "Refrigerator",
              room: "Kitchen",
              usage: "9.8 kWh",
              progress: .70,
            ),

            const ConsumerCard(
              icon: Icons.lightbulb_outline,
              title: "Lighting",
              room: "All rooms",
              usage: "7.2 kWh",
              progress: .50,
            ),

            const ConsumerCard(
              icon: Icons.thermostat,
              title: "Thermostat",
              room: "Living Room",
              usage: "5.1 kWh",
              progress: .35,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Appbarbottom(),
    );
  }

  Widget buildDay(String day, String value, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(day, style: const TextStyle(fontSize: 20)),
          ),

          Expanded(
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.grey.shade300,
              color: const Color(0xff4E8B72),
            ),
          ),

          const SizedBox(width: 15),

          SizedBox(width: 70, child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
