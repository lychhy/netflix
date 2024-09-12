import "package:carousel_slider/carousel_slider.dart";
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import "../model/movie_model.dart";
import 'movie_detailed_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> popularMovies;
  // todo: create variables for upcomingMovies and topRatedMovies
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    popularMovies = Api().getPopularMovies();
    // todo: initialize upcomingMovie and topRatedMOvies
    upcomingMovies = Api().getUpcomingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: set background color with Colors.black12
      backgroundColor: Colors.black12,
      /// todo: create appbar for netflix logo and user icon. you can put your own picture for your user icon if you want :)
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Image.asset(
          'assets/logo.png',
          width: 120,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:const Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// todo: create upcoming movie section. use 'CarouselSlider.builder' instead of 'ListView.builder'. Use backDropPath as url of network image. refer below Popular section!!
              const Text(
                "Upcoming",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;
                    return CarouselSlider.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index, realIndex) {
                        final movie = movies[index];
                        return InkWell(
                          onTap: () {
                            // todo: you should understand it. it gives movie data to MovieDetailScreen.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  movie: movies[index],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                width: 400,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                    height: 250,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                child: Text(
                                  movie.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: true,
                      ),
                    );
                  },
                ),
              ),
              /// Popular Movies
              const Text(
                "Popular",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context,index){
                        final movie = movies[index];
                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movies[index],
                              ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network("https://image.tmdb.org/t/p/original/${movie.posterPath}",
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                    );
                  }
                ),
              ),
              //// todo: creaate Top Rated movie section. use posterPath as url of network image. refer popular section!!
              const Text(
                "Top Rated",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,
                child: FutureBuilder(
                  future: topRatedMovies, //must be toprate here
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return InkWell(
                          onTap: () {
                            // todo: you should understand it. it gives movie data to MovieDetailScreen.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  movie: movies[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}