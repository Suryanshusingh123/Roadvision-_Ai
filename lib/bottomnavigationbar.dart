import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  final int _currentIndex;
  const BottomBar(this._currentIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
      ),
      child: Container(
        decoration:  const BoxDecoration(

          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.transparent,
             // Colors.white,
              // Color.fromRGBO(40, 40, 40, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (val) {
            if (val == 0) {
             // Navigator.of(context).popAndPushNamed('homepage');
            } else if (val == 1) {
             // Navigator.of(context).popAndPushNamed('SplashScreen()');
            } else if (val == 2) {
             // Navigator.of(context).popAndPushNamed('/library');
            } else if (val == 3) {
             // Navigator.of(context).popAndPushNamed('/premium');
            }
          },
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blueAccent.shade700,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
                size: 30,
              ),
              label: 'Capture',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.emergency_recording,
                size: 30,
              ),
              label: 'Recordings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account_rounded, size: 30),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

