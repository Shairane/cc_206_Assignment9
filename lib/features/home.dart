import 'package:flutter/material.dart';
//import 'package:logger/logger.dart';

//final Logger _logger = Logger();
class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: const Text("EXO PLANET",
        style: TextStyle(
          fontWeight: FontWeight.w100,
          color: Color.fromARGB(255, 15, 15, 15), 
        ),),  
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wp8367997.jpg'), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 150,
                height: 150,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'We are One, We are Exo!',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 10, 10, 10),
                      ),
                    ),
                    SizedBox(height: 8.0), 
                   Center(
                    child: Text(
                      'We walk long this exciting path together. '
                      'Covered in stars shining white. -EXO',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 250, 251, 252),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20, width: 60),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/ExoMember'),
                child: const Text('Travel to Exo Planet', style: TextStyle(
      color: Color.fromARGB(255, 15, 15, 15),
      fontSize: 25.0,
      fontWeight: FontWeight.bold,),
                
              ),
            
          ),
            ]
        ),
      ),
      )
    );
  }
}