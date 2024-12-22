import 'package:flutter/material.dart';
import 'package:paynowuz/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeUI(),
    const SendScreen(),
    const RequestScreen(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _BottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const _BottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      height: 102,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: isDarkMode
                ? Colors.white.withOpacity(0.8)
                : Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color.fromRGBO(44, 44, 46, 1)
              : const Color.fromRGBO(243, 244, 245, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(Assets.iconsHomeIcon, "home".tr(), 0),
            _bottomNavItem(Assets.iconsSendIcon, "send".tr(), 1),
            _bottomNavItem(Assets.iconsRequestIcon, "request".tr(), 2),
            _bottomNavItem(Assets.iconsProfileIcon, "profile".tr(), 3),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(String img, String title, int index) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(25),
      splashColor: Colors.grey.withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            img,
            color: isSelected
                ? Colors.blueAccent
                : const Color.fromRGBO(190, 188, 188, 1),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? Colors.blueAccent
                  : const Color.fromRGBO(190, 188, 188, 1),
            ),
          ),
        ],
      ),
    );
  }
}
