import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_web3/flutter_web3.dart';

class MetaAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MetaAppBar({Key? key}) : super(key: key);

  @override
  _MetaAppBarState createState() => _MetaAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60); // 📏 Set AppBar Height
}

class _MetaAppBarState extends State<MetaAppBar> {
  String? account; // ✅ Wallet Address Placeholder

  // 🎯 Connect MetaMask
  Future<void> connectMetaMask() async {
    if (ethereum != null) {
      try {
        final accounts = await ethereum!.requestAccount();
        setState(() {
          account = accounts.isNotEmpty ? accounts.first : null;
        });
      } catch (e) {
        print('Error connecting MetaMask: $e');
      }
    } else {
      print('MetaMask not found. Please install it.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 10,
      shadowColor: Colors.greenAccent.withOpacity(0.5),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🎯 App Title
          Text(
            "BLACKHAT TERMINAL",
            style: GoogleFonts.orbitron(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
              shadows: [
                Shadow(
                  color: Colors.greenAccent.withOpacity(0.8),
                  blurRadius: 8,
                ),
                Shadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  blurRadius: 12,
                ),
              ],
            ),
          ),

          // 🎯 MetaMask Button or Connected Address
          account != null ? _buildConnectedAddress() : _buildConnectButton(),
        ],
      ),
    );
  }

  // 🎯 Build MetaMask Connected Widget
  Widget _buildConnectedAddress() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.greenAccent, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.5),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.account_balance_wallet, color: Colors.greenAccent),
          const SizedBox(width: 5),
          Text(
            _formatAddress(account!),
            style: GoogleFonts.orbitron(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }

  // 🎯 Build Connect Button
  Widget _buildConnectButton() {
    return GestureDetector(
      onTap: connectMetaMask,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.cyanAccent, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.cyanAccent.withOpacity(0.5),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.link, color: Colors.black, size: 18),
            const SizedBox(width: 5),
            Text(
              "Connect MetaMask",
              style: GoogleFonts.orbitron(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🎯 Format Wallet Address
  String _formatAddress(String address) {
    return "${address.substring(0, 6)}...${address.substring(address.length - 4)}";
  }
}
