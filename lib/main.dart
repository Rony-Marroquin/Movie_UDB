import 'package:flutter/material.dart';
import 'package:udb_peliculas/api/movie_udb_service.dart';
import 'package:udb_peliculas/ui/spinnerwidget.dart';
import 'package:udb_peliculas/ui/cajapelicula.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:  Udb_movies(),
    );
  }
}


class Udb_movies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold (
      
      appBar: AppBar(
        title:Center(child: Text("TOP MOVIE")),
      ),
      body: FutureBuilder (
        //podría poner
        //initialData: [],
        future: movie_udb_service.getTopRatedMovies(),
        builder:
          (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder (
               
              
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var pelicula = snapshot.data![index];
                return CajaPelicula(peli: pelicula);
              },
            );
          } else {
            return SpinnerWidget();
          }

          },
      )
    );
  }
}