import 'package:flutter/material.dart';
import 'iss_position_tracker_page.dart';
import 'resume_page.dart';
import '../constants.dart';

enum HomeDisplay {
  ISS_POSITION,
  RESUME,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  HomeDisplay _selectedIndex = HomeDisplay.ISS_POSITION;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = HomeDisplay.values[index];
    });
  }

  Widget _homeDisplay() {
    Widget response;
    switch (_selectedIndex) {
      case HomeDisplay.ISS_POSITION:
        response = const IssPositionPage();
        break;
      case HomeDisplay.RESUME:
        response = const ResumePage();
        break;
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeDisplay(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Posición ISS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Curriculum',
          ),
        ],
        currentIndex: _selectedIndex.index,
        selectedItemColor: LocalColors.primary,
        elevation: 0.0,
        onTap: _onItemTapped,
      ),
    );
  }
}

