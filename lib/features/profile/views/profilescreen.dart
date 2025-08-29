import 'package:flutter/material.dart';
import 'package:food_delivery/constants/colors.dart';
import 'package:food_delivery/constants/images.dart';
import 'package:food_delivery/features/profile/views/address_listcreen.dart';
import 'package:food_delivery/features/profile/views/editprofile.dart';
import 'package:food_delivery/features/profile/views/privacyscreen.dart';

bool _showOverlay = false;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: "Geetto",
  );
  final TextEditingController _mobileController = TextEditingController(
    text: "7382562105",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "geetto@example.com",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Orange Header Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 50, 24, 26),
                child: Row(
                  children: [
                    // Profile Avatar
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showOverlay = true;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 6,
                          bottom: 8,
                          right: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(51),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppImages.edituser,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    // Profile Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _nameController.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                          // const SizedBox(height: 4),
                          Text(
                            '+91 ${_mobileController.text}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'HSR Layout, Bangalore • 10km radius',
                            style: TextStyle(
                              color: Colors.white,

                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Menu Items Section
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),

                        // Delivery Addresses
                        _buildMenuTile(
                          icon: Icons.location_on,
                          title: 'Delivery Addresses',
                          subtitle: '2 saved addresses',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddressList(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        // Recent Orders
                        _buildMenuTile(
                          icon: Icons.inventory_2_outlined,
                          title: 'Recent Orders',
                          onTap: () {},
                        ),

                        const SizedBox(height: 20),

                        // Privacy Policy
                        _buildMenuTile(
                          icon: Icons.lock_outline,
                          title: 'Privacy Policy',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Privacy(),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        // Cancellation & Refund
                        _buildMenuTile(
                          icon: Icons.credit_card,
                          title: 'Cancellation & Refund',
                          onTap: () {},
                        ),

                        const SizedBox(height: 20),

                        // Support
                        _buildMenuTile(
                          icon: Icons.headset_mic_outlined,
                          title: 'Support',
                          onTap: () {},
                        ),
                        const SizedBox(height: 20),

                        // Log Out Button
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 16,
                          ),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: Colors.grey[300]!),
                              ),
                              backgroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Log Out',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_showOverlay)
            EditProfileOverlay(
              nameController: _nameController,
              mobileController: _mobileController,
              emailController: _emailController,
              onCancel: () => setState(() => _showOverlay = false),
              onSave: () {
                // save logic here
                setState(() => _showOverlay = false);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 0.1),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.orange,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        subtitle:
            subtitle != null
                ? Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                )
                : null,
        trailing: Icon(Icons.chevron_right, size: 34),
      ),
    );
  }
}
