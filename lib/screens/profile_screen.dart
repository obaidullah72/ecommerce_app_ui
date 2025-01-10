import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_dp_app/theme/themes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _buildProfileInfoCard(),
              const SizedBox(height: 20),
              _buildSectionTitle("Account Settings"),
              _buildMenuItem(
                context,
                icon: Icons.shopping_bag_outlined,
                label: 'My Orders',
                onTap: () {
                  // Navigate to Orders Screen
                },
              ),
              _buildMenuItem(
                context,
                icon: Icons.favorite_outline,
                label: 'Wishlist',
                onTap: () {
                  // Navigate to Wishlist Screen
                },
              ),
              _buildMenuItem(
                context,
                icon: Icons.credit_card_outlined,
                label: 'Payment Methods',
                onTap: () {
                  // Navigate to Payment Methods Screen
                },
              ),
              const SizedBox(height: 20),
              _buildSectionTitle("App Settings"),
              _buildMenuItem(
                context,
                icon: Icons.settings_outlined,
                label: 'Settings',
                onTap: () {
                  // Navigate to Settings Screen
                },
              ),
              _buildMenuItem(
                context,
                icon: Icons.logout,
                label: 'Logout',
                onTap: () {
                  // Handle Logout
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 220.0,
      pinned: true,
      backgroundColor: AppTheme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        // titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
        // title: const Text(
        //   "Profile",
        //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // ),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: AppTheme.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // Replace with user's profile image URL
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "John Doe",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "johndoe@example.com",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: AppTheme.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.person,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "johndoe@example.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary,
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: ListTile(
          leading: Icon(icon, color: AppTheme.primaryColor, size: 28),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textPrimary,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
      ),
    );
  }
}
