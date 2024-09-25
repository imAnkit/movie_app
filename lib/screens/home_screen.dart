import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/movies_bloc/movies_bloc.dart';
import '../Bloc/movies_bloc/movies_state.dart';
import '../Bloc/search_bloc/search_bloc.dart';
import 'details_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MOVIEFLIX',
          style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor, fontSize: 28),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => SearchBloc(),
                          child: const SearchScreen(),
                        )),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoadedState) {
            final movies = state.movies;
            List<dynamic> comedyMovies = [];
            List<dynamic> dramaMovies = [];
            List<dynamic> sportsMovies = [];

            for (var movie in movies) {
              var genres = movie['show']['genres'] ?? [];

              if (genres.contains('Comedy')) {
                comedyMovies.add(movie);
              }
              if (genres.contains('Drama')) {
                dramaMovies.add(movie);
              }
              if (genres.contains('Sports')) {
                sportsMovies.add(movie);
              }
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieCategorySection(
                    title: 'All Movies',
                    movies: movies,
                  ),
                  if (comedyMovies.isNotEmpty)
                    MovieCategorySection(
                      title: 'Comedy',
                      movies: comedyMovies,
                    ),
                  if (dramaMovies.isNotEmpty)
                    MovieCategorySection(
                      title: 'Drama',
                      movies: dramaMovies,
                    ),
                  if (sportsMovies.isNotEmpty)
                    MovieCategorySection(
                      title: 'Sports',
                      movies: sportsMovies,
                    ),
                ],
              ),
            );
          } else if (state is MovieErrorState) {
            return Center(child: Text(state.error));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class MovieCategorySection extends StatelessWidget {
  final String title;
  final List<dynamic> movies;

  const MovieCategorySection(
      {super.key, required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index]['show'];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(movie: movie),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            movie['image'] != null
                                ? movie['image']['medium']
                                : '',
                            width: 120,
                            height: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 120,
                                height: 150,
                                color: Colors.grey,
                                child: const Icon(
                                  Icons
                                      .broken_image,
                                  size: 25,
                                  color: Color.fromARGB(255, 70, 69, 69),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 5),
                        SizedBox(
                          width: 120,
                          child: Text(
                            movie['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
