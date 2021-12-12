import 'package:flok/components/bottom_navigation.dart';
import 'package:flok/components/scroll_list.dart';
import 'package:flok/model/top_film.dart';
import 'package:flok/request/request.dart';
import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder<List<Film>>(
              future: FilmsApi.getTopPopular(),
              builder: (context, snapshot)
              {
                if(!snapshot.hasData)
                {
                  return const Center(child: CircularProgressIndicator());
                }
                
                final films = snapshot.data;
          
                return ListView.builder(
                  itemCount: films!.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index)
                  {
                    final film = films[index];
                    return  ListFilm(film: film);
                  }
                );
              }
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Film>>(
              future: FilmsApi.getTopAwait(),
              builder: (context, snapshot)
              {
                final films = snapshot.data;
          
                return ListView.builder(
                  itemCount: films == null ? 0 : films.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index)
                  {
                    final film = films![index];
                    return ListFilm(film: film);
                  }
                );
              }
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Film>>(
              future: FilmsApi.getTopBest(),
              builder: (context, snapshot)
              {
                final films = snapshot.data;
          
                return ListView.builder(
                  itemCount: films == null ? 0 : films.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index)
                  {
                    final film = films![index];
                    return  ListFilm(film: film);
                  }
                );
              }
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}