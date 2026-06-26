import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/appbarbottom.dart';
import 'package:smart_home_app/widgets/widgetdrawer.dart';

class AppColors {
  static const Color bg = Color(0xFFF5F3ED);
  static const Color cardGreen = Color(0xFF3D5A4C);
  static const Color iconBg = Color(0xFFEFEDE5);
  static const Color dangerBg = Color(0xFFFBE3E1);
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  bool _soundEffects = true;
  bool _locationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),

      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: AppColors.cardGreen,
              child: const Text('RB', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeaderCard(
              name: 'Rebecca Barbara',
              email: 'rebecca@smarthome.io',
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQQpQnDtdMdJATjnWk6P60d_z-xBnxhIVTfA&s",
            ),
            SizedBox(height: 24),

            SettingsSectionTitle(title: 'ACCOUNT'),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  subtitle: 'Rebecca Barbara',
                ),
                Divider(height: 1, indent: 70),
                SettingsTile(
                  icon: Icons.visibility_outlined,
                  title: 'Privacy',
                  subtitle: 'Manage your data',
                ),
                Divider(height: 1, indent: 70),
                SettingsTile(
                  icon: Icons.shield_outlined,
                  title: 'Security',
                  subtitle: 'Password · 2FA enabled',
                ),
              ],
            ),
            SizedBox(height: 24),

            SettingsSectionTitle(title: 'PREFERENCES'),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Alerts & reminders',
                ),
                Divider(height: 1, indent: 70),
                SettingsSwitchTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  subtitle: 'Switch appearance',
                  value: _darkMode,
                  onChanged: (v) => setState(() => _darkMode = v),
                ),
                Divider(height: 1, indent: 70),
                SettingsSwitchTile(
                  icon: Icons.volume_up_outlined,
                  title: 'Sound Effects',
                  subtitle: 'Device feedback tones',
                  value: _soundEffects,
                  onChanged: (v) => setState(() => _soundEffects = v),
                ),
                const Divider(height: 1, indent: 70),
                SettingsSwitchTile(
                  icon: Icons.public_outlined,
                  title: 'Location',
                  subtitle: 'Used for automations',
                  value: _locationEnabled,
                  onChanged: (v) => setState(() => _locationEnabled = v),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const SettingsSectionTitle(title: 'SYSTEM'),
            SettingsCard(
              children: const [
                SettingsTile(
                  icon: Icons.smartphone_outlined,
                  title: 'Connected Devices',
                  subtitle: '12 devices paired',
                ),
                Divider(height: 1, indent: 70),
                SettingsTile(
                  icon: Icons.wifi,
                  title: 'Wi-Fi & Network',
                  subtitle: 'HomeNet_5G',
                ),
                Divider(height: 1, indent: 70),
                SettingsTile(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  subtitle: 'FAQs and contact',
                ),
                Divider(height: 1, indent: 70),
                SettingsTile(
                  icon: Icons.info_outline,
                  title: 'About',
                  subtitle: 'Version 2.4.1',
                ),
              ],
            ),
            const SizedBox(height: 24),

            const SignOutTile(name: 'Rebecca Barbara'),
            const SizedBox(height: 16),
          ],
        ),
      ),

      bottomNavigationBar: const Appbarbottom(),
    );
  }
}

// =======================================================
// Custom Widget — ProfileHeaderCard
// =======================================================
class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const SizedBox(width: 14),
              CircleAvatar(radius: 28, backgroundImage: NetworkImage(imageUrl)),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    color: CupertinoColors.activeGreen,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}

// =======================================================
// Custom Widget — SettingsSectionTitle
// =======================================================
class SettingsSectionTitle extends StatelessWidget {
  final String title;

  const SettingsSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// =======================================================
// Custom Widget — SettingsCard
// =======================================================
class SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const SettingsCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}

// =======================================================
// Custom Widget — SettingsTile (navigation row with chevron)
// =======================================================
class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.iconBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap ?? () {},
    );
  }
}

// =======================================================
// Custom Widget — SettingsSwitchTile (row with a Switch)
// =======================================================
class SettingsSwitchTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.iconBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.cardGreen,
      ),
    );
  }
}

// =======================================================
// Custom Widget — SignOutTile
// =======================================================
class SignOutTile extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;

  const SignOutTile({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.dangerBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.logout, color: Colors.red),
        ),
        title: const Text(
          'Sign Out',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(name, style: TextStyle(color: Colors.grey[600])),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap ?? () {},
      ),
    );
  }
}
