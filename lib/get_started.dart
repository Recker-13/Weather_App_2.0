import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A00FF), // Dark purple color
              Color(0xFF9C00E5), // Light purple color
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Weather icon
              Image.asset(
                'assets/images/0.png', // Your custom weather icon
                width: 230,
                height: 230,
              ),
              SizedBox(height: 20),

              // Welcome text
              Column(
                children: [
                  Text(
                    'Weather',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Forecasts',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber, // Gold color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Get Started button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/weather');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Get Start',
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 6, 119),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
