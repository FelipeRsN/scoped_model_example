import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/models/episode.dart';
import 'package:scoped_model_example/scoped_models/scoped_playlist.dart';

typedef EpisodeListTapCallback = void Function(Episode e);

class EpisodeList extends StatelessWidget {
  
  final EpisodeListTapCallback onItemTap;

  EpisodeList(this.onItemTap);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedPlaylist>(
      builder: (context, child, scopedModel) => Expanded(
        child: ListView(
          children:
              scopedModel.episodes.map((e) => _playerListViewItem(e)).toList(),
        ),
      ),
    );
  }

  Widget _playerListViewItem(Episode e) {
    return GestureDetector(
      onTap: () => onItemTap(e),
      child: _playerListViewItemTitle(e),
    );
  }

  Widget _playerListViewItemTitle(Episode e) {
    final subTitle = (e.isPlaying ? '[PLAYING] ' : '') + '${e.podcast.name}: "${e.title}"';

    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 25.0, 25.0),
      child: Text(
        subTitle,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
