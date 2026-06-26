import 'package:flutter/material.dart';

class BedroomScreen extends StatefulWidget {
  const BedroomScreen({super.key});

  @override
  State<BedroomScreen> createState() => _BedroomScreenState();
}

class _BedroomScreenState extends State<BedroomScreen> {
  bool lightOn = false;
  bool fanOn = true;
  bool acOn = true;
  bool lampOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bedroom')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1505693314120-0d443867891c?auto=format&fit=crop&w=800&q=60",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Text('4 devices · 20°C', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Column(
                  children: [
                    Icon(Icons.thermostat, color: Colors.red),
                    Text('20°C', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Temperature'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.water_drop,
                      color: Color.fromARGB(255, 7, 255, 247),
                    ),
                    Text('55%', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Humidity'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.air, color: Colors.blueGrey),
                    Text('Good', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Air Quality'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            'Devices',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lightOn ? Colors.green[800] : Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb,
                      color: lightOn ? Colors.white : Colors.black,
                    ),
                    const Spacer(),
                    Text(
                      'Ceiling Light',
                      style: TextStyle(
                        color: lightOn ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      lightOn ? 'On · 80%' : 'Off',
                      style: TextStyle(
                        color: lightOn ? Colors.white70 : Colors.grey,
                      ),
                    ),
                    Switch(
                      value: lightOn,
                      onChanged: (value) {
                        setState(() => lightOn = value);
                      },
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: fanOn ? Colors.green[800] : Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.air, color: fanOn ? Colors.white : Colors.black),
                    const Spacer(),
                    Text(
                      'Ceiling Fan',
                      style: TextStyle(
                        color: fanOn ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      fanOn ? 'On' : 'Off',
                      style: TextStyle(
                        color: fanOn ? Colors.white70 : Colors.grey,
                      ),
                    ),
                    Switch(
                      value: fanOn,
                      onChanged: (value) {
                        setState(() => fanOn = value);
                      },
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: acOn ? Colors.green[800] : Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.thermostat,
                      color: acOn ? Colors.white : Colors.black,
                    ),
                    const Spacer(),
                    Text(
                      'AC Unit',
                      style: TextStyle(
                        color: acOn ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      acOn ? 'Cool · 20°C' : 'Off',
                      style: TextStyle(
                        color: acOn ? Colors.white70 : Colors.grey,
                      ),
                    ),
                    Switch(
                      value: acOn,
                      onChanged: (value) {
                        setState(() => acOn = value);
                      },
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lampOn ? Colors.green[800] : Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: lampOn ? Colors.white : Colors.black,
                    ),
                    const Spacer(),
                    Text(
                      'Bedside Lamp',
                      style: TextStyle(
                        color: lampOn ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      lampOn ? 'On · 40%' : 'Off',
                      style: TextStyle(
                        color: lampOn ? Colors.white70 : Colors.grey,
                      ),
                    ),
                    Switch(
                      value: lampOn,
                      onChanged: (value) {
                        setState(() => lampOn = value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
