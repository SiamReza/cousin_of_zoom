import 'dart:math';

import 'package:cousin_of_zoom/resources/jitsi_meet_methods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();

    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                onPressed: createNewMeeting,
                text: 'New Meeting',
                icon: Icons.videocam,
              ),
              HomeMeetingButton(
                onPressed: () {
                  joinMeeting(context);
                },
                text: 'Join Meeting',
                icon: Icons.add_box_rounded,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Lottie.asset('animations/meeting.json',
              height: 330, width: 330, repeat: true, reverse: true),
          const SizedBox(height: 10),
          Text(
            'Create/ Join Meeting with just a click!',
            style: GoogleFonts.merriweather(
              textStyle: const TextStyle(
                fontSize: 16,
                letterSpacing: .5,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
