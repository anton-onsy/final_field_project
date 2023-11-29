import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vector Operation App',
      home: VectorOperationScreen(),
    );
  }
}

class VectorOperationScreen extends StatefulWidget {
  @override
  _VectorOperationScreenState createState() => _VectorOperationScreenState();
}

class _VectorOperationScreenState extends State<VectorOperationScreen> {
  TextEditingController axController = TextEditingController();
  TextEditingController ayController = TextEditingController();
  TextEditingController azController = TextEditingController();
  TextEditingController bxController = TextEditingController();
  TextEditingController byController = TextEditingController();
  TextEditingController bzController = TextEditingController();

  String sumResult = '';
  String differenceResult = '';
  String dotProductResult = '';
  String crossProductResult = '';
  String unitVectorAResult = '';
  String unitVectorBResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vector Operations'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildVectorInput('Vector A', axController, ayController, azController),
            SizedBox(height: 20),
            buildVectorInput('Vector B', bxController, byController, bzController),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: calculateSum,
                  child: Text('Sum'),
                ),
                ElevatedButton(
                  onPressed:calculateDifference,
                  child: Text('Difference'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:calculateDotProduct,
                  child: Text('Dot Product'),
                ),
                ElevatedButton(
                  onPressed: calculateCrossProduct,
                  child: Text('Cross Product'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: calculateUnitVectorA,
                  child: Text('Unit Vector A'),
                ),
                ElevatedButton(
                  onPressed: calculateUnitVectorB,
                  child: Text('Unit Vector B'),
                ),
                ElevatedButton(
                  onPressed: clearData,
                  child: Text('ClearFields'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Sum: $sumResult',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Difference: $differenceResult',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Dot Product: $dotProductResult',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Cross Product: $crossProductResult',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Unit Vector A: $unitVectorAResult',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Unit Vector B: $unitVectorBResult',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVectorInput(String label, TextEditingController xController, TextEditingController yController, TextEditingController zController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
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
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void calculateSum() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double bx = double.tryParse(bxController.text) ?? 0;
    double by = double.tryParse(byController.text) ?? 0;
    double bz = double.tryParse(bzController.text) ?? 0;

    double resultX = ax + bx;
    double resultY = ay + by;
    double resultZ = az + bz;

    setState(() {
      sumResult = '($resultX i, $resultY j, $resultZ k)';
      differenceResult = '';
      dotProductResult = '';
      crossProductResult = '';
      unitVectorAResult = '';
      unitVectorBResult = '';
    });
  }

  void calculateDifference() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double bx = double.tryParse(bxController.text) ?? 0;
    double by = double.tryParse(byController.text) ?? 0;
    double bz = double.tryParse(bzController.text) ?? 0;

    double resultX = ax - bx;
    double resultY = ay - by;
    double resultZ = az - bz;

    setState(() {
      differenceResult = '($resultX i, $resultY j, $resultZ k)';
      sumResult = '';
      dotProductResult = '';
      crossProductResult = '';
      unitVectorAResult = '';
      unitVectorBResult = '';
    });
  }

  void calculateDotProduct() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double bx = double.tryParse(bxController.text) ?? 0;
    double by = double.tryParse(byController.text) ?? 0;
    double bz = double.tryParse(bzController.text) ?? 0;

    double dotProduct = (ax * bx) + (ay * by) + (az * bz);

    setState(() {
      dotProductResult = dotProduct.toString();
      sumResult = '';
      differenceResult = '';
      crossProductResult = '';
      unitVectorAResult = '';
      unitVectorBResult = '';
    });
  }

  void calculateCrossProduct() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double bx = double.tryParse(bxController.text) ?? 0;
    double by = double.tryParse(byController.text) ?? 0;
    double bz = double.tryParse(bzController.text) ?? 0;

    double resultX = (ay * bz) - (az * by);
    double resultY = (az * bx) - (ax * bz);
    double resultZ = (ax * by) - (ay * bx);

    setState(() {
      crossProductResult = '($resultX i, $resultY j, $resultZ k)';
      sumResult = '';
      differenceResult = '';
      dotProductResult = '';
      unitVectorAResult = '';
      unitVectorBResult = '';
    });
  }

  void calculateUnitVectorA() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double magnitude = sqrt(ax * ax + ay * ay + az * az);

    if (magnitude != 0) {
      double unitVectorAX = ax / magnitude;
      double unitVectorAY = ay / magnitude;
      double unitVectorAZ = az / magnitude;

      setState(() {
        unitVectorAResult = '($unitVectorAX i, $unitVectorAY j, $unitVectorAZ k)';
        sumResult = '';
        differenceResult = '';
        dotProductResult = '';
        crossProductResult = '';
        unitVectorBResult = '';
      });
    } else {
      // Handle division by zero or undefined result
      setState(() {
        unitVectorAResult = 'Undefined (magnitude is zero)';
        sumResult = '';
        differenceResult = '';
        dotProductResult = '';
        crossProductResult = '';
        unitVectorBResult = '';
      });
    }
  }

  void calculateUnitVectorB() {
    double bx = double.tryParse(bxController.text) ?? 0;
    double by = double.tryParse(byController.text) ?? 0;
    double bz = double.tryParse(bzController.text) ?? 0;

    double magnitude = sqrt(bx * bx + by * by + bz * bz);

    if (magnitude != 0) {
      double unitVectorBX = bx / magnitude;
      double unitVectorBY = by / magnitude;
      double unitVectorBZ = bz / magnitude;

      setState(() {
        unitVectorBResult = '($unitVectorBX i, $unitVectorBY j, $unitVectorBZ k)';
        sumResult = '';
        differenceResult = '';
        dotProductResult = '';
        crossProductResult = '';
        unitVectorAResult = '';
      });
    } else {
      // Handle division by zero or undefined result
      setState(() {
        unitVectorBResult = 'Undefined (magnitude is zero)';
        sumResult = '';
        differenceResult = '';
        dotProductResult = '';
        crossProductResult = '';
        unitVectorAResult = '';
      });
    }
  }

  void clearData() {
    axController.clear();
    ayController.clear();
    azController.clear();
    bxController.clear();
    byController.clear();
    bzController.clear();

    setState(() {
      sumResult = '';
      differenceResult = '';
      dotProductResult = '';
      crossProductResult = '';
      unitVectorAResult = '';
      unitVectorBResult = '';
    });
  }
}