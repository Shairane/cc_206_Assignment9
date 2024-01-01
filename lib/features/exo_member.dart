import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExoMember extends StatelessWidget {
  const ExoMember ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exo Member'),
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
              'images/wp8367997.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Ready to dive into the fascinating world of EXO members? Dive in!',
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
                'Exo Members',
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
                exoProfile.name,
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
                exoProfile.birthday, 
                style: const TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
               const SizedBox(height: 8.0),
                    Text(
                      'Position: ${exoProfile.position}',
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
  final String name;
  final String birthday;
  final String position;
  final String imageAsset;

  ExoProfile({
    required this.name,
    required this.birthday,
    required this.position,
    required this.imageAsset,
  });
}


List<ExoProfile> exoProfiles = [
  ExoProfile(
    name: 'Name: Kim Jun Myeon (김준면)',
    birthday: 'Birthday: May 22, 1991',
    position: 'Position: Leader(Exo-K), Lead Vocalist, Visual',
    imageAsset: 'images/SUHO-1-533x800.jpg',
     ),
     ExoProfile(
    name: 'Name: Kim Min Seok (김민석)',
    birthday: 'Birthday: March 26, 1990',
    position: 'Position: Sub Vocalist, Sub Rapper',
    imageAsset: 'images/XIUMIN-1-533x800.jpg',
     ),
  ExoProfile(
      name: 'Name: Lu Han (鹿晗,루한)',
      birthday: 'Birthday: April 20, 1990',
      position: 'Lead Vocalist, Lead Dancer, Visual',
      imageAsset: 'images/375x375bb.jpg'),
  ExoProfile(
      name: 'Name: Wu Yi Fan (吴亦凡)',
      birthday: 'Birthday: November 6, 1990',
      position: 'Position: Leader(Exo-M), Dancer, Rapper ',
      imageAsset: 'images/mantan-personel-exo-kris-wu-dituduh-ghosting-pacar-sampai-bikin-depresi-wbz.jpg'),
  ExoProfile(
      name: 'Name: Zhang Yixing (张艺兴)',
      birthday: 'Birthday: October 7, 1991',
      position: 'Position: Main Dancer, Sub Vocalist, Sub Rapper',
      imageAsset: 'images/unnamed.jpg'),
  ExoProfile(
      name: 'Name: Oh Se Hun (오세훈)',
      birthday: 'Birthday: April 12, 1994',
      position: 'Position: Lead Dancer, Lead Rapper, Visual, Maknae',
      imageAsset: 'images/1649739171-sehun.jpg'),
  ExoProfile(
      name: 'Name: Do Kyung Soo (도경수)',
      birthday: 'Birthday: January 12, 1993',
      position: 'Position: Main Vocalist',
      imageAsset: 'images/20230802000515_0.jpg'),
  ExoProfile(
      name: 'Name: Byun Baek Hyun (변백현)',
      birthday: 'Birthday: May 6, 1992',
      position: 'Position: Main Vocalist',
      imageAsset: 'images/baekhyun-exo-exist-cream-soda.jpg'),
   ExoProfile(
      name: 'Name: Kim Jong Dae (김종대)',
      birthday: 'Birthday: September 21, 1992',
      position: 'Position: Main Vocalist',
      imageAsset: 'images/61127.jpeg'),
   ExoProfile(
      name: 'Name: Park Chan Yeol (박찬열)',
      birthday: 'Birthday: November 27, 1992',
      position: 'Position: Main Rapper, Sub Vocalist, Visual',
      imageAsset: 'images/Chanyeol_during_the_Exo_Planet_5_–_Exploration_concert_on_December_2019.jpg'),
   ExoProfile(   
      name: 'Name: Kim Jong In (김종인)',
      birthday: 'Birthday: January 14, 1994',
      position: 'Position: Main Dancer, Sub Rapper, Sub Vocalist, Center, Visual',
      imageAsset: 'images/Kai.jpg'),
   ExoProfile(   
      name: 'Name: Huang Zitao (黄子韬)',
      birthday: 'Birthday: May 2, 1993',
      position: 'Position: Lead Rapper',
      imageAsset: 'images/2bf04bc8b111fab5bdba5dfd4a31bb98.jpg'),
];


