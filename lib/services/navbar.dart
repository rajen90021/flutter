import 'package:dspuiproject/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, there!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Login to start your healthy journey',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    // Add your image here if needed
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: yellowColor,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.subscriptions), // Add icon for My Subscription
            title: Text('My Subscription'),
            onTap: () {
              // Handle tap on My Subscription
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag), // Add icon for My Order
            title: Text('My Order'),
            onTap: () {
              // Handle tap on My Order
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital), // Add icon for Wellness
            title: Text('Wellness'),
            onTap: () {
              // Handle tap on Wellness
            },
          ),
          ListTile(
            leading: Icon(Icons.settings), // Add icon for Settings
            title: Text('Settings'),
            onTap: () {
              // Handle tap on Settings
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet), // Add icon for Wallet
            title: Text('Wallet'),
            onTap: () {
              // Handle tap on Wallet
            },
          ),
          ListTile(
            leading: Icon(Icons.video_library), // Add icon for Vlog Preference
            title: Text('Vlog Preference'),
            onTap: () {
              // Handle tap on Vlog Preference
            },
          ),
          ListTile(
            leading: Icon(Icons.report), // Add icon for Report an Issue
            title: Text('Report an Issue'),
            onTap: () {
              // Handle tap on Report an Issue
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline), // Add icon for FAQ
            title: Text('FAQ'),
            onTap: () {
              // Handle tap on FAQ
            },
          ),
          Divider(),
          Center(
            child: Container(
              height: 40,
              width: 100,
              child: Center(
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Center(child: Text('Login', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),)),
                  ), // Add login button
                   onTap: () {
                  // Handle tap on Login
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },


            ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color:textColor), // Add border color
                borderRadius: BorderRadius.circular(10), // Add border radius
                color:redColor.withOpacity(0.2), // Add background color
              ),
              margin: EdgeInsets.all(2),
            ),
          ),
          ListTile(
            title: Center(
              child: Row(
                children: [
                  Text('Privacy Policy  ' ,  style: TextStyle(fontSize: 12)),
                   Text('Terms and Conditions',  style: TextStyle(fontSize: 12)),
                ],
              ),
            ), // Add Privacy Policy

          ),

        ],


      ),

    );
  }
}
