import 'dart:math';

import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  TextEditingController axController = TextEditingController();
  TextEditingController ayController = TextEditingController();
  TextEditingController azController = TextEditingController();

  String sphericalCoordinate = '';
  String cylindricalCoordinate = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coordinate Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            buildVectorInput(
                'Vector A', axController, ayController, azController),
            SizedBox(height: 25,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateCylindricalCoordinates();
                      },
                      child: const Text(
                          'Convert TO Cylindrical',
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    color: Colors.white,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateSphericalCoordinates();
                      },
                      child: const Text(
                          'Convert TO spherical',
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                  ),
                ),
                ),
                SizedBox(width: 75,),
                Container(
                  color: Colors.white,
                  child: ElevatedButton(
                    onPressed: () {
                      clearData();
                    },
                    child: const Text(
                        'Clear',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              'Cylindrical:$cylindricalCoordinate',
              style: const TextStyle(fontSize: 18),
            ),
            SizedBox(height: 15,),
            Text(
              'Spherical:$sphericalCoordinate',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVectorInput(String label, TextEditingController xController,
      TextEditingController yController, TextEditingController zController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            buildTextField('X:', xController),
            buildTextField('Y:', yController),
            buildTextField('Z:', zController),
          ],
        ),
      ],
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void calculateCylindricalCoordinates() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double ro = double.parse(sqrt(ax * ax + ay * ay).toStringAsFixed(2));
    double ph = double.parse((atan2(ay, ax) * (180 / pi)).toStringAsFixed(2));
    if(ax!=0 || ay!=0 || az!=0) {
      setState(() {
        cylindricalCoordinate = '($ro ρ, $ph φ, $az z)';
        sphericalCoordinate = '';
      });
    }
  }
  void calculateSphericalCoordinates() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double r = double.parse(sqrt(ax * ax + ay * ay + az * az).toStringAsFixed(2));
    double phi = double.parse((atan2(ay, ax) * (180 / pi)).toStringAsFixed(2));
    double degreesPerRadian = 180.0 / pi;
    double theta = acos(az / sqrt(ax * ax + ay * ay + az * az)) * degreesPerRadian;
    String thetaString = theta.toStringAsFixed(2);
    if(ax!=0 || ay!=0 || az!=0) {
      setState(() {
        cylindricalCoordinate = '';
        sphericalCoordinate = '($r r, $thetaString θ, $phi φ)';
      });
    }
  }

  void clearData() {
    axController.clear();
    ayController.clear();
    azController.clear();

    setState(() {
      cylindricalCoordinate= '';
      sphericalCoordinate='';
    });
  }
}
