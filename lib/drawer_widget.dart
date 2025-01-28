import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_controller.dart';

class DrawerWidget extends StatelessWidget {
  final String developerName = "Muhammad Abbas";
  final String developerDetails = "Flutter Developer";
  final String developerContact = "Email: muhabbas732@gmail.com";
  final String developerWhatsApp = "WhatsApp: +923130933546";

  final CalculatorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.cyan,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: Text(developerName),
            accountEmail: Text(developerContact),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/abbas.jpg"),
            ),
          ),

          ListTile(
            title: Text("About Me"),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("About Me"),
                    content: Text("I am a Flutter Developer. You can contact me at $developerContact $developerWhatsApp."),
                    actions: [
                      TextButton(
                        child: Text("Close"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Operation History"),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Operation History"),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: controller.operationHistory
                            .map((operation) => Text(operation))
                            .toList(),
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("Close"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text("Clear History"),
            onTap: controller.clearHistory,
          ),
        ],
      ),
    );
  }
}
