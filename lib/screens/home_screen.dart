import 'package:cousin_of_zoom/resources/auth_methods.dart';
import 'package:cousin_of_zoom/screens/history_meeting_screen.dart';
import 'package:cousin_of_zoom/screens/meeting_screen.dart';
import 'package:cousin_of_zoom/utils/colors.dart';
import 'package:cousin_of_zoom/widgets/custom_button.dart';
import 'package:cousin_of_zoom/widgets/home_meeting_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final AuthMethods _authMethods = AuthMethods();

  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    CustomButton(
        text: 'Log Out',
        onPressed: () {
          AuthMethods().signOut();
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Meet & Chat',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        //type: BottomNavigationBarType.shifting,
        onTap: onPageChanged,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank_outlined), label: 'Meet & Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Meetings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
