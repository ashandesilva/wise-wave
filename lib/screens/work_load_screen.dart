import 'package:flutter/material.dart';
import 'package:wisewave/components/theme/main_bg_gradient.dart';
import 'package:wisewave/pages/add_work_page.dart';

class WorkLoadScreen extends StatelessWidget {
  const WorkLoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: setMainBgGradient(),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(height: 100,
                color: const Color.fromARGB(255, 200, 114, 207),),
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 100,
                    color: const Color.fromARGB(255, 200, 114, 207),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 100,
                    color: const Color.fromARGB(255, 200, 114, 207),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddWorkPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  ),
                  child: const Text('Add Work', style: TextStyle(fontSize: 20),),
                )
              )
            ],
          ),
        ),
    );
  }
}