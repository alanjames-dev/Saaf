import 'package:flutter/material.dart';

class NavDraw extends StatelessWidget {
  const NavDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Alex'),
            accountEmail: Text('alexwoods@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.asset(
                'assets/images/profile.jpg',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.summarize_outlined,
            ),
            title: Text('My Complaints'),
          ),
          ListTile(
            leading: Icon(
              Icons.location_city_outlined,
            ),
            title: Text('Your Neighbourhood'),
          ),
          ListTile(
            leading: Icon(
              Icons.local_library_outlined,
            ),
            title: Text('How To\'s'),
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer_outlined,
            ),
            title: Text('FAQ\'s'),
          ),
          ListTile(
            leading: Icon(
              Icons.bug_report_outlined,
            ),
            title: Text('Report a Bug'),
          ),
          ListTile(
            leading: Icon(
              Icons.policy_outlined,
            ),
            title: Text('Privacy Policy'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.share_outlined,
            ),
            title: Text('Share App'),
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
            ),
            title: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
