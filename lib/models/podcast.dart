
import 'package:scoped_model_example/models/episode.dart';

class Podcast {
  String name;
  List<Episode> episodes;

  Podcast(this.name);

  static List<Podcast> fetchAll(){
    var p1 = Podcast("Podcast 1");
    p1.episodes = [
      Episode(p1, "Episode 1 from this podcast"),
      Episode(p1, "Episode 2 from this podcast"),
      Episode(p1, "Episode 3 from this podcast"),
    ];

    var p2 = Podcast("Podcast 2");
    p2.episodes = [
      Episode(p2, "Episode 1 from this podcast"),
      Episode(p2, "Episode 2 from this podcast"),
      Episode(p2, "Episode 3 from this podcast"),
    ];

    var p3 = Podcast("Podcast 3");
    p3.episodes = [
      Episode(p3, "Episode 1 from this podcast"),
      Episode(p3, "Episode 2 from this podcast"),
      Episode(p3, "Episode 3 from this podcast"),
    ];

    return [p1, p2, p3];
  }
}