import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom AppBar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.w),
                bottomRight: Radius.circular(4.w),
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Notification Toggle (Placed at the Top)
          _buildSettingsTile(
            icon: Icons.notifications,
            title: "Enable Notifications",
            trailing: Switch(
              value: isNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),
          ),

          // Profile Section - Centered
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 12.w,
                  backgroundImage: const NetworkImage("https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                ),
                SizedBox(height: 2.h),
                Text(
                  "John Doe",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "johndoe@example.com",
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
                SizedBox(height: 1.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, color: Colors.purple),
                    SizedBox(width: 2.w),
                    Text("Male", style: TextStyle(fontSize: 16.sp)),
                  ],
                ),
                SizedBox(height: 3.h),

                // About Button (Right After Profile)
                ElevatedButton(
                  onPressed: () {
                    print("User clicked About");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
                  ),
                  child: Text("About", style: TextStyle(fontSize: 16.sp)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Settings Tile
  Widget _buildSettingsTile({required IconData icon, required String title, required Widget trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple, size: 7.w),
      title: Text(title, style: TextStyle(fontSize: 16.sp)),
      trailing: trailing,
    );
  }
}
