import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_example/models/episode.dart';

class ScopedPlaylist extends Model{
  List<Episode> episodes = [];
  Episode selectedEpisode;

  addEpisode(Episode episode){
    episodes.add(episode);
    notifyListeners();
  }

  setSelectedEpisode(Episode e){
    if(selectedEpisode != null){
      selectedEpisode.isPlaying = false;
    }

    selectedEpisode = e;
    selectedEpisode.isPlaying = true;

    notifyListeners();
  }
}