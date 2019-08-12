import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/scoped_models/scoped_playlist.dart';

class Player extends StatelessWidget {
  final height = 200.0;
  final textStyle = TextStyle(color: Colors.white, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      height: height,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: ScopedModelDescendant<ScopedPlaylist>(
        builder: (context, child, scopedModel) => _playerPanel(scopedModel),
      ),
    );
  }

  Widget _playerPanel(ScopedPlaylist scopedModel) {
    var label1 = "";
    var label2 = "";
    var label3 = "";

    if (scopedModel.selectedEpisode != null) {
      label1 = 'Now playing...';
      label2 = scopedModel.selectedEpisode.podcast.name;
      label3 = scopedModel.selectedEpisode.title;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _textLabel(label1),
        _textLabel(label2),
        _textLabel(label3)
      ],
    );
  }

  Widget _textLabel(String text) {
    return Text(text, style: textStyle);
  }
}
