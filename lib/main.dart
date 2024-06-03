import 'package:flutter/material.dart';
import 'register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickQuack',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoadingPage(),
    );
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.pink[100],
                child: Icon(
                  Icons.local_hospital,
                  size: 50,
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'QuickQuack',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Compare and schedule your appointment within seconds',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Find out which clinic has the shortest waiting time and cheapest fees around you',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Spacer(),
              Image.asset('assets/images/medical_team.png'),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Get Started'),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
