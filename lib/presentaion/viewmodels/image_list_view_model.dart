import 'package:flutter/material.dart';
import 'package:image_searcher/domain/models/image_model.dart';

abstract class ImageListViewModel with ChangeNotifier {
  ImageModel get(int index);

  int size();

  bool isEmpty() {
    return size() < 1;
  }

  bool isLoading() {
    return false;
  }

  bool canLoadMore() {
    return false;
  }

  void loadMore() {

  }
}