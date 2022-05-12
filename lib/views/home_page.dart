import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  bool isHideBottomNavBar = false;

  late AnimationController animationController;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _revealNavBar(bool isIt) {
    setState(() {
      isHideBottomNavBar = !isHideBottomNavBar;
      isHideBottomNavBar
          ? animationController.forward()
          : animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _pages = [
      CallsPage(
        isHideBottomNavBar: (c) => _revealNavBar(c),
      ),
      const Center(
        child: Icon(
          Icons.call,
          size: 150,
        ),
      ),
      const Center(
        child: Icon(
          Icons.chat,
          size: 150,
        ),
      ),
      const Center(
        child: Icon(
          Icons.camera,
          size: 150,
        ),
      ),
      const Center(
        child: Icon(
          Icons.chat,
          size: 150,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Demo'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SizeTransition(
        sizeFactor: animationController,
        axisAlignment: -1.0,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Alarm',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: 'Timer',
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse),
              label: 'Stopwatch',
              backgroundColor: Colors.yellow,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          elevation: 0,
          selectedIconTheme:
              const IconThemeData(color: Colors.blueAccent, size: 40),
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class CallsPage extends StatelessWidget {
  final Function(bool) isHideBottomNavBar;

  const CallsPage({required this.isHideBottomNavBar, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The GestureDetector wraps the button.
    return GestureDetector(
      // When the child is tapped, show a snackbar.
      onTap: () {
        isHideBottomNavBar(true);
      },
      // The custom button
      child: const Center(
        child: Icon(
          Icons.call,
          size: 150,
        ),
      ),
    );
  }
}
