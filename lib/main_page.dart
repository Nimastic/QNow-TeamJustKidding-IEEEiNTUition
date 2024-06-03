import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.pink[100],
            child: Icon(
              Icons.local_hospital,
              color: Colors.pink,
            ),
          ),
        ),
        title: Text(
          'QuickQuack',
          style: TextStyle(color: Colors.pink),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your filters',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChipWidget(label: 'Popular', isSelected: false),
                FilterChipWidget(label: 'Waiting time', isSelected: true),
                FilterChipWidget(label: 'Distance', isSelected: false),
                FilterChipWidget(label: 'Costs', isSelected: false),
              ],
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('See More'),
            ),
            SizedBox(height: 20),
            Text(
              'Clinics (3)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: [
                  ClinicCard(
                    clinicName: 'HK Family Clinic & Surgery',
                    address: '410 Ang Mo Kio Avenue 10, #01-817 S560410',
                    waitingTime: '15 mins',
                    reviews: '220 Reviews',
                    closingTime: 'Closes at 12pm',
                    onTap: () {
                      // Handle clinic tap
                    },
                  ),
                  ClinicCard(
                    clinicName: 'I-Health Medical Clinic',
                    address: '30 Bendemeer Rd, #01-833 S330030',
                    waitingTime: '35 mins',
                    reviews: '20 Reviews',
                    closingTime: 'Closes at 1pm',
                    onTap: () {
                      // Handle clinic tap
                    },
                  ),
                  ClinicCard(
                    clinicName: '338 Family Clinic',
                    address: '338 Ang Mo Kio Avenue 1, #01-1615 S560338',
                    waitingTime: '70 mins',
                    reviews: '100 Reviews',
                    closingTime: 'Closes at 12pm',
                    onTap: () {
                      // Handle clinic tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChipWidget({
    Key? key,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {},
      selectedColor: Colors.pink[100],
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
    );
  }
}

class ClinicCard extends StatelessWidget {
  final String clinicName;
  final String address;
  final String waitingTime;
  final String reviews;
  final String closingTime;
  final VoidCallback onTap;

  const ClinicCard({
    Key? key,
    required this.clinicName,
    required this.address,
    required this.waitingTime,
    required this.reviews,
    required this.closingTime,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/clinic_image.png'), // Replace with actual clinic image path
        ),
        title: Text(clinicName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.orange),
                SizedBox(width: 4),
                Text(reviews),
                SizedBox(width: 10),
                Text(closingTime),
              ],
            ),
          ],
        ),
        trailing: Text(waitingTime),
      ),
    );
  }
}
