import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  const Music ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exo Song List'),
          leading: const Icon(
            Icons.menu,
          ),
          elevation: 50.0,
          shadowColor: const Color.fromARGB(255, 15, 15, 15),       
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          actions: <Widget>[
            IconButton(icon:const Icon(Icons.search), onPressed: () => {},
            iconSize: 30.0,
 ),
        
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              'images/desktop-wallpaper-exo-background-exo-aesthetic.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Immerse yourself in the musical brilliance of EXO!',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 253, 253, 253),
                    ),
                  ),
                ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Exo Song List',
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                  backgroundColor: Color.fromARGB(255, 253, 251, 253),
                ),
              )
            ),
            ExoSearchBar(),
            Expanded(
              child: ExoProfileGrid(),
            ),
          ],
        ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(   
          unselectedItemColor: Colors.black38,     
          unselectedFontSize: 14.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedIconTheme: const IconThemeData(color: Colors.black, size: 18.0) , 
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          selectedFontSize: 14.0,
          selectedIconTheme: const IconThemeData(color: Colors.black, size: 18.0),
          selectedItemColor: Colors.black38,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          onTap: (index) {
            
            if (index == 0) {
              Navigator.pushNamed(context, '/'); 
            }else if(index == 1){
              Navigator.pushNamed(context, '/ExoMember');
            }else if(index == 2){
              Navigator.pushNamed(context, '/music');
            }else if(index == 3){
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
          ]
        ),
      ),
    );
  }
}

class ExoSearchBar extends StatefulWidget {
  const ExoSearchBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExoSearchBarState createState() => _ExoSearchBarState();
}

class _ExoSearchBarState extends State<ExoSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        onChanged: (query) {
          
          if (kDebugMode) {
            print('Search Query: $query');
          }
        },
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class ExoProfileGrid extends StatelessWidget {
  const ExoProfileGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: exoProfiles.length,
      itemBuilder: (context, index) {
        return ExoProfileCard(exoProfile: exoProfiles[index]);
      },
    );
  }
}

class ExoProfileCard extends StatelessWidget {
  final ExoProfile exoProfile;

  const ExoProfileCard({super.key, required this.exoProfile});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 221, 220, 221),
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
             
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                exoProfile.imageAsset,
                height: 300.0,
                width: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          Expanded(
            child: ListTile(
              title: Text(
                exoProfile.title,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                exoProfile.date, 
                style: const TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
               const SizedBox(height: 8.0),
                    Text(
                      'Album: ${exoProfile.album}',
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                ],
              ),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    )
    );
  }
}

class ExoProfile {
  final String title;
  final String date;
  final String album;
  final String imageAsset;

  ExoProfile({
    required this.title,
    required this.date,
    required this.album,
    required this.imageAsset,
  });
}


List<ExoProfile> exoProfiles = [
  ExoProfile(
    title: 'Title: Love Shot',
    date: 'Date Released: December 13, 2018',
    album: 'Dont Mess Up My Tempo',
    imageAsset: 'images/artworks-000469789350-6y8uw2-t500x500.jpg',
     ),
     ExoProfile(
    title: 'Title: Ko Ko Bop',
    date: 'Released Date: July 18, 2017',
    album: 'The War',
    imageAsset: 'images/dbgqz7v-d411de08-d993-45ab-81f6-ed2e4c8844ce.jpg',
     ),
  ExoProfile(
      title: 'Title: Growl',
      date: 'Released Date: August 5, 2013',
      album: 'XOXO',
      imageAsset: 'images/artworks-000053430493-dhx3vu-t500x500.jpg'),
  ExoProfile(
      title: 'Title: Call Me Baby',
      date: 'Released Date: March 27, 2015',
      album: 'Exodus',
      imageAsset: 'images/exo_call_me_baby_by_diyeah9tee4_d8v3eva-fullview.jpg'),
  ExoProfile(
      title: 'Title: Love Me Right',
      date: 'Released Date: June 3, 2015',
      album: 'Exodus',
      imageAsset: 'images/ab67616d0000b273aab7f1de2a5fccba3b095574.jpg'),
  ExoProfile(
      title: 'Title: Monster',
      date: 'Released Date: June 9, 2016',
      album: 'Ex act',
      imageAsset: 'images/ddce9648a93cca7b2c66517d6528c711.png'),
  ExoProfile(
      title: 'Title: Cream Soda',
      date: 'Released Date: July 10, 2023',
      album: 'EXIST',
      imageAsset: 'images/exo___cream_soda_by_kultofpegasus_dg2c1t1-pre.jpg'),
  ExoProfile(
      title: 'Title: The Eve',
      date: 'Released Date: July 18, 2017',
      album: 'The War',
      imageAsset: 'images/ab67616d0000b273aab7f1de2a5fccba3b095574.jpg'),
   ExoProfile(
      title: 'Title: Dont Go',
      date: 'Released Date: June 3, 2013',
      album: 'XOXO',
      imageAsset: 'images/artworks-000053430493-dhx3vu-t500x500.jpg'),
];