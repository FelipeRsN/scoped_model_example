import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/models/episode.dart';
import 'package:scoped_model_example/scoped_models/scoped_playlist.dart';
import 'package:scoped_model_example/screens/playlist/widgets/episode_list.dart';
import 'package:scoped_model_example/screens/playlist/widgets/player.dart';

class Playlist extends StatelessWidget {
  final playlistManager;

  Playlist(this.playlistManager);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: ScopedModel<ScopedPlaylist>(
        model: playlistManager,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            EpisodeList(_handleEpisodeListViewItemTap),
            Player(),
          ],
        ),
      ),
    );
  }

  _handleEpisodeListViewItemTap(Episode e){
    playlistManager.setSelectedEpisode(e);
  }
}
