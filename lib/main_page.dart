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
          'QNow',
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
                    estimatedConsultationCost: '\$15',
                    estimatedMedicationCost: '\$20',
                    doctors: [
                      Doctor(name: 'Jennifer SY Yeong', description: 'Dr Yeong is a great doctor. He has been my family doctor for more than 15 years. Very approachable and down to earth doctor.'),
                      Doctor(name: 'Serene Neo', description: 'A humorous, friendly and experienced doctor!'),
                    ],
                  ),
                  ClinicCard(
                    clinicName: 'I-Health Medical Clinic',
                    address: '30 Bendemeer Rd, #01-833 S330030',
                    waitingTime: '35 mins',
                    reviews: '20 Reviews',
                    closingTime: 'Closes at 1pm',
                    estimatedConsultationCost: '\$20',
                    estimatedMedicationCost: '\$25',
                    doctors: [
                      Doctor(name: 'John Doe', description: 'An experienced doctor with a friendly demeanor.'),
                    ],
                  ),
                  ClinicCard(
                    clinicName: '338 Family Clinic',
                    address: '338 Ang Mo Kio Avenue 1, #01-1615 S560338',
                    waitingTime: '70 mins',
                    reviews: '100 Reviews',
                    closingTime: 'Closes at 12pm',
                    estimatedConsultationCost: '\$18',
                    estimatedMedicationCost: '\$22',
                    doctors: [
                      Doctor(name: 'Jane Smith', description: 'A dedicated doctor with a patient-centric approach.'),
                    ],
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
  final String estimatedConsultationCost;
  final String estimatedMedicationCost;
  final List<Doctor> doctors;

  const ClinicCard({
    Key? key,
    required this.clinicName,
    required this.address,
    required this.waitingTime,
    required this.reviews,
    required this.closingTime,
    required this.estimatedConsultationCost,
    required this.estimatedMedicationCost,
    required this.doctors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClinicDetailPage(
                clinicName: clinicName,
                address: address,
                estimatedConsultationCost: estimatedConsultationCost,
                estimatedMedicationCost: estimatedMedicationCost,
                doctors: doctors,
              ),
            ),
          );
        },
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

class Doctor {
  final String name;
  final String description;

  Doctor({required this.name, required this.description});
}

class ClinicDetailPage extends StatelessWidget {
  final String clinicName;
  final String address;
  final String estimatedConsultationCost;
  final String estimatedMedicationCost;
  final List<Doctor> doctors;

  const ClinicDetailPage({
    Key? key,
    required this.clinicName,
    required this.address,
    required this.estimatedConsultationCost,
    required this.estimatedMedicationCost,
    required this.doctors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clinicName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clinicName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(address),
            SizedBox(height: 8),
            Text('Estimated Consultation Cost: $estimatedConsultationCost'),
            Text('Estimated Medication Cost: $estimatedMedicationCost'),
            SizedBox(height: 16),
            Text(
              'Available Doctors:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return ListTile(
                    title: Text(doctor.name),
                    subtitle: Text(doctor.description),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
