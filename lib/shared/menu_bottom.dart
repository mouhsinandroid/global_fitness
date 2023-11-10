import 'package:flutter/material.dart';

class MenuButtom extends StatelessWidget {
  const MenuButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch(index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/bmi');
            break;
          default:
        }
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight),
            label: 'BMI'
        )
      ],
    );
  }
}
