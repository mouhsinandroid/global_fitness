import 'package:flutter/material.dart';
import 'package:global_fitness/shared/menu_bottom.dart';

import '../shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  final txtHeight  = TextEditingController();
  final txtWeight  = TextEditingController();
  final fontSize = 18.0;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;

  late List<bool> isSelected;
  String heightMessage = '';
  String weigthMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    heightMessage = 'Please insert your height in ' +((isMetric) ? 'meters' : 'inches');
    weigthMessage = 'Please insert your weigth in ' +((isMetric) ? 'kilos' : 'pounds');

    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ToggleButtons(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Matric', style: TextStyle(fontSize: fontSize),),
                ),

                Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Imeprial', style: TextStyle(fontSize: fontSize),),
                ),
              ],
              isSelected: isSelected,
              onPressed: (value) {
                toggleMeasure(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtHeight, keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: heightMessage
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: txtWeight, keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: weigthMessage
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ElevatedButton(
                  onPressed: findBMI,
                  child: Text('Calculate BMI', style: TextStyle(
                      fontSize: fontSize
                  ),)
              ),
            ),
            Text(result, style: TextStyle(fontSize: fontSize),)
          ],
        ),
      ),
      bottomNavigationBar: MenuButtom(),
    );
  }

  void toggleMeasure(int value) {
    if(value == 0) {
      isMetric = true;
      isImperial = false;
    }
    else {
      isMetric = false;
      isImperial = true;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi  = 0;
    double height = double.tryParse(txtHeight.text) ?? 0 ;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if(isMetric) {
      bmi = weight / (height * height);
    }
    else {
      bmi = weight * 703 / (height * height);
    }
    
    setState(() {
      result = 'Your BMI is' + bmi.toStringAsFixed(2);
    });
  }
}
