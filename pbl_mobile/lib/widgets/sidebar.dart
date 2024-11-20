import 'package:flutter/material.dart';
import 'package:pbl_mobile/screens/activities_screen.dart';
import 'package:pbl_mobile/screens/documents_screen.dart';
import 'package:pbl_mobile/screens/statistics_screen.dart';
import 'package:pbl_mobile/screens/user_management_screen.dart';
import 'package:pbl_mobile/screens/user_profile_screen.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            decoration: BoxDecoration(color: Colors.blue), // Perbaikan di sini
          ),
          ListTile(
            title: Text('Kelola Pengguna'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserManagementScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Profil Pengguna'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Kegiatan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivitiesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Dokumen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DocumentsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Statistik'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Implement logout functionality here
            },
          ),
        ],
      ),
    );
  }
}