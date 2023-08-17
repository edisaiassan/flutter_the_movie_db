import 'package:flutter/material.dart';
import 'package:simple_the_movie_db/config/constants/enviroment.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(Enviroment.theMovieDBKey),
      ),
    );
  }
}