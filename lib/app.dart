import 'package:flutter/material.dart';
import 'package:scoped_model_example/models/episode.dart';
import 'package:scoped_model_example/models/podcast.dart';
import 'package:scoped_model_example/scoped_models/scoped_playlist.dart';
import 'package:scoped_model_example/screens/playlist/playlist.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final playlistManager = ScopedPlaylist();
    final podcasts = Podcast.fetchAll();
    for (Podcast p in podcasts){
      for(Episode e in p.episodes){
        playlistManager.addEpisode(e);
      }
    }

    return MaterialApp(
      home: Playlist(playlistManager),
    );
  }
}