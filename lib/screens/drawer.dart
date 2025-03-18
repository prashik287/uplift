import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CyberpunkDrawer extends StatelessWidget {
  const CyberpunkDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blueGrey.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ⚡ Drawer Header with Animation
            _buildDrawerHeader(),

            // ⚡ Drawer Options
            _buildNeonTile(Icons.dashboard, "Dashboard", context, "/"),
            _buildNeonTile(
              Icons.upload_file,
              "Upload File",
              context,
              "/upload",
            ),
            _buildNeonTile(
              Icons.account_circle,
              "Profile",
              context,
              "/profile",
            ),
            _buildNeonTile(Icons.settings, "Settings", context, "/settings"),
            _buildNeonTile(Icons.exit_to_app, "Logout", context, "/logout"),
          ],
        ),
      ),
    );
  }

  // 🎯 Drawer Header
  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyanAccent, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.cyanAccent.withOpacity(0.6),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.memory,
            size: 50,
            color: Colors.black, // ✅ Added missing color
          ),
          const SizedBox(height: 10),
          Text(
            "UPLIFT HUB",
            style: GoogleFonts.orbitron(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: [
                const Shadow(color: Colors.blueAccent, blurRadius: 12),
                Shadow(
                  color: Colors.cyanAccent.withOpacity(0.6),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Welcome, Hacker!",
            style: GoogleFonts.orbitron(
              fontSize: 14,
              color: Colors.black,
              shadows: [
                const Shadow(color: Colors.blueAccent, blurRadius: 8),
                Shadow(
                  color: Colors.cyanAccent.withOpacity(0.5),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🎯 Drawer Tile Builder
  Widget _buildNeonTile(
    IconData icon,
    String title,
    BuildContext context,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.cyanAccent),
      title: Text(
        title,
        style: GoogleFonts.orbitron(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [Shadow(color: Colors.cyanAccent, blurRadius: 10)],
        ),
      ),
      onTap: () {
        Navigator.pop(context); // ✅ Close Drawer
        Navigator.pushNamed(context, route); // ✅ Navigate to Route
      },
      hoverColor: Colors.cyanAccent.withOpacity(0.2),
      tileColor: Colors.black.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.cyanAccent, width: 1.5),
      ),
    );
  }
}
