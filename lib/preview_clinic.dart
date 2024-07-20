import 'package:flutter/material.dart';

class PreviewClinicPage extends StatelessWidget {
  final String clinicName;
  final String address;
  final String bookingNumber;
  final String waitingTime;
  final int queueCount;

  const PreviewClinicPage({
    Key? key,
    required this.clinicName,
    required this.address,
    required this.bookingNumber,
    required this.waitingTime,
    required this.queueCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone, color: Colors.pink),
            onPressed: () {
              // Handle phone icon press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/clinic_image.png'), // Replace with actual clinic image path
                    ),
                    SizedBox(height: 16),
                    Text(
                      clinicName,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      address,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Booking Confirmed #$bookingNumber',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InfoCard(
                          title: 'Current waiting time',
                          value: waitingTime,
                          unit: 'min',
                        ),
                        InfoCard(
                          title: 'Person in queue',
                          value: queueCount.toString(),
                          unit: '',
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Schedule a ride?',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RideOption(
                          imageUrl: 'assets/images/grab_logo.png', // Replace with actual Grab logo path
                          price: '\$8-\$10',
                        ),
                        RideOption(
                          imageUrl: 'assets/images/gojek_logo.png', // Replace with actual Gojek logo path
                          price: '\$9-\$9.50',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              onPressed: () {
                // Handle button press
              },
              child: Text('Next', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const InfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            unit,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class RideOption extends StatelessWidget {
  final String imageUrl;
  final String price;

  const RideOption({
    Key? key,
    required this.imageUrl,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          height: 50,
          width: 50,
        ),
        SizedBox(height: 8),
        Text(
          price,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
