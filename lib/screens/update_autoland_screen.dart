import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:crew_portal_dev/services/validity_services.dart';
import 'package:crew_portal_dev/widgets/custom_drawer.dart';

class UpdateAutolandScreen extends StatefulWidget {
  const UpdateAutolandScreen({super.key});

  static const routeName = '/update-autoland';

  @override
  State<UpdateAutolandScreen> createState() => _UpdateAutolandScreenState();
}

class _UpdateAutolandScreenState extends State<UpdateAutolandScreen> {
  TextEditingController dateInput = TextEditingController();
  var autolandDate = 'Pick Date';
  var bottonText = 'Update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Autoland in Aircraft'),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 25)),
                label: Text(autolandDate),
                icon: const Icon(Icons.calendar_today),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now().add(const Duration(days: 365)));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd/MM/yy').format(pickedDate);
                    setState(() {
                      autolandDate = formattedDate;
                      bottonText = 'Update';
                    });
                  } else {
                    setState(() {
                      autolandDate =
                          'Pick Date'; //set output date to TextField value.
                    });
                  }
                },
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: autolandDate.contains('/')
                      ? () async {
                          await ValidityServices.updateAutoland(autolandDate);
                          setState(() {
                            autolandDate = 'Pick Date';
                            bottonText = 'Done';
                          });
                        }
                      : null,
                  child: Text(bottonText))
            ],
          ),
        ),
      ),
    );
  }
}
