import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uplift/screens/appbar.dart';
import 'package:uplift/screens/drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(
        0,
        0,
        0,
        1,
      ), // 🎯 BlackHat Background
      appBar: MetaAppBar(),
      drawer: CyberpunkDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // 🎯 Welcome Text
            Text(
              "WELCOME TO THE MATRIX",
              style: GoogleFonts.orbitron(
                fontSize: 20,
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.cyanAccent, blurRadius: 5),
                  Shadow(color: Colors.blueAccent, blurRadius: 8),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🎯 Hacker-Themed Cards
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return _buildNeonCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🎯 Build Card with Hacker Style
  Widget _buildNeonCard(int index) {
    List<String> titles = [
      "DDoS Attack",
      "SQL Injection",
      "Network Scan",
      "Phishing Detector",
      "Exploit Database",
      "Brute Force",
    ];
    List<IconData> icons = [
      Icons.bolt,
      Icons.security,
      Icons.wifi_tethering,
      Icons.bug_report,
      Icons.cloud_download,
      Icons.vpn_key,
    ];

    return GestureDetector(
      onTap: () {
        print("${titles[index]} Tapped!"); // ✅ Action Placeholder
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.cyanAccent, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.6),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons[index], size: 40, color: Colors.greenAccent),
            const SizedBox(height: 10),
            Text(
              titles[index],
              style: GoogleFonts.orbitron(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
                shadows: [Shadow(color: Colors.cyanAccent, blurRadius: 10)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
