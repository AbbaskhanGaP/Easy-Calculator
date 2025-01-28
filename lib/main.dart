import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_controller.dart';
import 'drawer_widget.dart';


void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  Widget buildButton(String buttonText, Color color) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.all(20),
            backgroundColor: color,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          onPressed: () => controller.buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Easy Calculator',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),

        ),
        backgroundColor: Colors.lightBlue[500], // Set AppBar color to lightBlue[100]
        iconTheme: IconThemeData(color: Colors.white), // Set drawer icon color to white
      ),

      drawer: DrawerWidget(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Obx(() => Text(
                controller.displayOutput.value,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
            ),
            Expanded(child: Divider()),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.indigoAccent),
                    buildButton("8", Colors.indigoAccent),
                    buildButton("9", Colors.indigoAccent),
                    buildButton("÷", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.indigoAccent),
                    buildButton("5", Colors.indigoAccent),
                    buildButton("6", Colors.indigoAccent),
                    buildButton("×", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.indigoAccent),
                    buildButton("2", Colors.indigoAccent),
                    buildButton("3", Colors.indigoAccent),
                    buildButton("-", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.indigoAccent),
                    buildButton("0", Colors.indigoAccent),
                    buildButton("C", Colors.redAccent),
                    buildButton("+", Colors.orangeAccent),
                  ],
                ),
                Row(
                  children: [
                    buildButton("%", Colors.orangeAccent),
                    buildButton("=", Colors.green),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
