import 'package:flutter/material.dart';

class ExoOne extends StatelessWidget {
  const ExoOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exo Profile'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage(
              'images/17021692.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage(
                          'images/375x375bb.jpg',
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Lu Han (鹿晗,루한)',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          IconButton(
                            icon: const Icon(Icons.message),
                            onPressed: () {
                              Navigator.pushNamed(context, '/music');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Lower Portion
              const Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileDetail(label: 'Name', value: 'Lu Han (鹿晗,루한)'),
                      UserProfileDetail(
                          label: 'Stage Name', value: 'Luhan'),
                      UserProfileDetail(
                          label: 'Position', value: 'Lead Vocalist, Lead Dancer, Visual'),
                      UserProfileDetail(
                          label: 'Date of Birth', value: 'April 20, 1990'),
                      UserProfileDetail(
                          label: 'Birthplace', value: 'Haidian, Beijing'),
                      UserProfileDetail(label: 'Sex', value: 'Male'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  // Handle edit button press
                },
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        unselectedFontSize: 14.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedIconTheme: const IconThemeData(color: Colors.black, size: 18.0),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        selectedFontSize: 14.0,
        selectedIconTheme: const IconThemeData(
            color: Colors.black, size: 18.0),
        selectedItemColor: Colors.black38,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/ExoMember');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/music');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/ExoProfile');
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class UserProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const UserProfileDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}