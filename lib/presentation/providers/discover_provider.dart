import 'package:flutter/material.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider  extends ChangeNotifier{

  //TODO: Repositor, DataSource

  bool initialLoading = true;
  List<VideoPost> videos = [];


  Future<void> loadNextPage() async {

    //await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map(
       ( video ) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity()
    
    ).toList();


    videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }

}