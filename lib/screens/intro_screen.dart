import 'package:flutter/material.dart';
import 'package:global_fitness/shared/menu_drawer.dart';

import '../shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Globo Fitness')),
      drawer: MenuDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/run_sport.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
            child:
            Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70
                ),
                child: Text(
                  'Commit to be fit, dare to be great \nwith Globo fitness',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      shadows: [
                        Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 2.0,
                            color: Colors.grey
                        )
                      ]
                  ),
                ))),
      ),
      bottomNavigationBar: MenuButtom(),
    );
  }
}
