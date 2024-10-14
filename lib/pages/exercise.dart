import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0AC174),
        title: Text("กายภาพบำบัด"),
        centerTitle: true,
      ),
       body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.asset('assets/exercise_image.png'),
            title: Text('ท่าที่ 1'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
