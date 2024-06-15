import 'package:flutter/material.dart';
import 'package:socialapp/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //drawer header
                DrawerHeader(child: Icon(Icons.favorite)),

                //home tile
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('H O M E'),
                  onTap: () => Navigator.pop(context),
                ),

                //user tile
                ListTile(
                    leading: Icon(Icons.people_alt),
                    title: Text('U S E R S'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/users');
                    }),

                //Profile
                ListTile(
                    leading: Icon(Icons.person),
                    title: Text('P R O F I L E'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/profile');
                    }),

                //settings tile
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('S E T T I N G S'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/settings');
                    }),
              ],
            ),

            //logout tile
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('L O G O U T'),
              onTap: () => AuthService().signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
