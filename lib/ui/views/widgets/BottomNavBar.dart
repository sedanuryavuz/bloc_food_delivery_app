import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
   BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  Color _itemColor(int index) =>
      selectedIndex == index ? AppColors.navbarItemColor : Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      elevation: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, "Anasayfa", 0),
            _buildIconOnly(Icons.favorite, 1),
            _buildIconOnly(Icons.person, 2),
            const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: _itemColor(index)),
          Text(
            label,
            style: TextStyle(
              color: _itemColor(index),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconOnly(IconData icon, int index) {
    return IconButton(
      icon: Icon(icon, size: 30, color: _itemColor(index)),
      onPressed: () => onItemTapped(index),
    );
  }
}
