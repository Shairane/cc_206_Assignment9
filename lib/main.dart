import 'package:flutter/material.dart';
import 'package:exo_planet/features/home.dart';
import 'package:exo_planet/features/exo_member.dart';  
import 'package:exo_planet/features/exo_music.dart';
import 'package:exo_planet/features/exo_profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exo Planet',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext ctx) => const Home(),
        '/ExoMember': (BuildContext ctx) => const ExoMember(),
        '/ExoProfile': (BuildContext ctx) => const ExoOne(),    
        '/music': (BuildContext ctx) => const Music(),   
        },      
    );
  }
}
