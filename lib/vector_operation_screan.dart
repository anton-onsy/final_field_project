import 'dart:math';

import 'package:final_field_project/converter_screan.dart';
import 'package:flutter/material.dart';

class VectorOperationScreen extends StatefulWidget {
  const VectorOperationScreen({super.key});

  @override
  VectorOperationScreenState createState() => VectorOperationScreenState();
}

class VectorOperationScreenState extends State<VectorOperationScreen> {
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
        title: const Text('Vector Operations'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildVectorInput('Vector A', axController, ayController, azController),
                const SizedBox(height: 20),
                buildVectorInput('Vector B', bxController, byController, bzController),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: calculateSum,
                      child: const Text('Sum'),
                    ),
                    ElevatedButton(
                      onPressed:calculateDifference,
                      child: const Text('Difference'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed:calculateDotProduct,
                      child: const Text('Dot Product'),
                    ),
                    ElevatedButton(
                      onPressed: calculateCrossProduct,
                      child: const Text('Cross Product'),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: calculateUnitVectorA,
                        child: const Text('Unit Vector A'),
                      ),
                      ElevatedButton(
                        onPressed: calculateUnitVectorB,
                        child: const Text('Unit Vector B'),
                      ),
                      ElevatedButton(
                        onPressed: clearData,
                        child: const Text('ClearFields'),
                      ),
                    ],
                  ),


                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConverterScreen()),
                    );
                  } ,
                  child: const Text('Coordinate Converter'),
                ),

                const SizedBox(height: 20),
                Text(
                  'Sum: $sumResult',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Difference: $differenceResult',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Dot Product: $dotProductResult',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Cross Product: $crossProductResult',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Unit Vector A: $unitVectorAResult',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Unit Vector B: $unitVectorBResult',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
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

  void calculateSum() {
    double ax = double.tryParse(axController.text) ?? 0;
    double ay = double.tryParse(ayController.text) ?? 0;
    double az = double.tryParse(azController.text) ?? 0;

    double bx = double.tryParse(bxController.text) ?? 0;
    double by = double.tryParse(byController.text) ?? 0;
    double bz = double.tryParse(bzController.text) ?? 0;

    double resultX = double.parse((ax + bx).toStringAsFixed(2));
    double resultY = double.parse((ay + by).toStringAsFixed(2));
    double resultZ = double.parse((az + bz).toStringAsFixed(2));

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

    double resultX = double.parse((ax - bx).toStringAsFixed(2));
    double resultY = double.parse((ay - by).toStringAsFixed(2));
    double resultZ = double.parse((az - bz).toStringAsFixed(2));

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

    double dotProduct = double.parse(((ax * bx) + (ay * by) + (az * bz)).toStringAsFixed(2));

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

    double resultX = double.parse(((ay * bz) - (az * by)).toStringAsFixed(2));
    double resultY = double.parse(((az * bx) - (ax * bz)).toStringAsFixed(2));
    double resultZ = double.parse(((ax * by) - (ay * bx)).toStringAsFixed(2));

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
      double unitVectorAX = double.parse((ax / magnitude).toStringAsFixed(2));
      double unitVectorAY = double.parse((ay / magnitude).toStringAsFixed(2));
      double unitVectorAZ = double.parse((az / magnitude).toStringAsFixed(2));

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
      double unitVectorBX =double.parse((bx / magnitude).toStringAsFixed(2));
      double unitVectorBY = double.parse((by / magnitude).toStringAsFixed(2));
      double unitVectorBZ = double.parse((bz / magnitude).toStringAsFixed(2));

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