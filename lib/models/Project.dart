import 'package:portfolio_website/models/video_model.dart';

class Project {
  String title, description, imgPath, extendedDescription, githubLink;
  List<String> techTags;
  List<Map<String, String>> videoRefs;
  List<VideoModel> videoModels;

  Project(
      {this.title,
      this.description,
      this.imgPath,
      this.techTags,
      this.videoModels,
      this.extendedDescription,
      this.githubLink});
}
