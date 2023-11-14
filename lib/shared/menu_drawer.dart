import 'package:flutter/material.dart';
import 'package:global_fitness/screens/bmi_screen.dart';
import 'package:global_fitness/screens/intro_screen.dart';
import 'package:global_fitness/screens/session_screen.dart';
import 'package:global_fitness/screens/weather_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Bmi Calculator',
      'Weather',
      'Training'
    ];

    List<Widget> menuItems = [];

    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text(
        'Globo Fitness',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    ));

    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element, style: TextStyle(fontSize: 18)),
        onTap: () {
          switch (element) {
            case'Home':
              screen = IntroScreen();
              break;
            case 'Bmi Calculator':
              screen = BmiScreen();
                  break;
            case 'Weather':
              screen = WeatherScreen();
              break;
            case 'Training':
              screen = SessionScreen();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen)
          );
        },
      ));
    });

    return menuItems;
  }
}
