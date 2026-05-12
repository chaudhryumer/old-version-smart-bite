import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E14), // Matches the dark UI theme
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            child: const Icon(Icons.flash_on, color: Colors.white, size: 20),
          ),
        ),
        title: const Text(
          'SMARTBITE',
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.grey)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined, color: Colors.grey)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Main Status Card
            _buildStatusCard(),

            const SizedBox(height: 30),
            _buildSectionHeader("SYSTEM DASHBOARD", Colors.deepOrange),
            const SizedBox(height: 15),

            // Interactive Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.9,
              children: [
                // Pass the title, icon, color, button text, and the GetX route name
                _buildDashCard("User Dashboard", Icons.restaurant_menu, Colors.cyan, "OPEN →", '/user'),
                _buildDashCard("Admin Dashboard", Icons.local_offer, Colors.orangeAccent, "OPEN →", '/Admin'),
                _buildDashCard("Deal DashBoard", Icons.soup_kitchen_outlined, Colors.greenAccent, "OPEN →", '/AddDish'),
                _buildDashCard("Home Dashboard", Icons.inventory_2_outlined, Colors.orangeAccent, "OPEN →", '/home'),
              ],
            ),

            const SizedBox(height: 30),
            _buildSectionHeader("OPERATIONS", Colors.cyanAccent),
            const SizedBox(height: 15),

            _buildActionCard("NEW PROJECT", "Deploy new instance", Icons.add_shopping_cart, Colors.cyanAccent, '/newProject'),
            const SizedBox(height: 15),
            _buildProjectCard(), // COMSATS Sahiwal Campus branding
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed('/AiExpert'), // Navigate to AI Expert
        backgroundColor: Colors.orangeAccent,
        label: const Text("AI EXPERT", style: TextStyle(fontWeight: FontWeight.bold)),
        icon: const Icon(Icons.psychology),
      ),
    );
  }

  // Helper to build the main Gradient Status Card
  Widget _buildStatusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF6229FF), Color(0xFF00E5FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("HELLO, UMADA Team 👋",
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text("SYSTEM STATUS:\nACTIVE",
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.1)),
          const SizedBox(height: 12),
          Text("AI layouts and cost estimation engine ready.",
              style: TextStyle(color: Colors.white.withOpacity(0.7))),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Get.toNamed('/InitializeSession'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.4),
                shape: const StadiumBorder(),
                side: BorderSide(color: Colors.cyanAccent.withOpacity(0.5)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)
            ),
            child: const Text("INITIALIZE SESSION →", style: TextStyle(color: Colors.cyanAccent)),
          )
        ],
      ),
    );
  }

  // Updated DashCard with Navigation
  Widget _buildDashCard(String title, IconData icon, Color color, String action, String routeName) {
    return InkWell(
      onTap: () => Get.toNamed(routeName), // Navigation target
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D26),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 35),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(action, style: TextStyle(color: color.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color accent) {
    return Row(
      children: [
        Container(width: 4, height: 20, color: accent),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
      ],
    );
  }

  Widget _buildActionCard(String title, String sub, IconData icon, Color color, String routeName) {
    return InkWell(
      onTap: () => Get.toNamed(routeName),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1D26),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const Spacer(),
            CircleAvatar(backgroundColor: color, radius: 15, child: const Icon(Icons.arrow_forward, color: Colors.black, size: 18)),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [Colors.orange, Colors.deepOrangeAccent]),
      ),
      child: Row(
        children: [
          const Icon(Icons.school, color: Colors.white, size: 40),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("COMSATS UNIVERSITY PROJECT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text("BSSE 2023-2027 | SAHIWAL CAMPUS", style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}