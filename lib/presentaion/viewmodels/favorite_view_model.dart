import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/domain/usecases/get_favorites_usecase.dart';
import 'package:image_searcher/domain/usecases/insert_favorite_usecase.dart';
import 'package:image_searcher/domain/usecases/delete_favorite_usecase.dart';
import 'package:image_searcher/presentaion/viewmodels/image_list_view_model.dart';

class FavoriteViewModel extends ImageListViewModel {
  final GetFavoritesUsecase _favoritesUsecase;
  final InsertFavoriteUsecase _insertFavoriteUsecase;
  final DeleteFavoriteUsecase _deleteFavoriteUsecase;

  final List<ImageModel> _images = [];

  FavoriteViewModel(this._favoritesUsecase, this._insertFavoriteUsecase, this._deleteFavoriteUsecase) : super() {
    _loadFavorites();
  }

  @override
  ImageModel get(int index) {
    return _images[index];
  }

  @override
  int size() {
    return _images.length;
  }

  void _addFavorite(ImageModel image) {
    _insertFavoriteUsecase.execute(image)
        .then((value) {
      if(value) {
        if(!isFavorite(image)) {
          _images.add(image);
          notifyListeners();
        }
      }})
        .catchError((e) {
      print('addFavorite error : $e');
    });
  }
  void _removeFavorite(ImageModel image) {
    _deleteFavoriteUsecase.execute(image)
        .then((value) {
      if(value) {
        _images.remove(image);
        notifyListeners();
      }})
        .catchError((e) {
      print('deleteFavorite error : $e');
    });
  }

  void toggleFavorite(ImageModel image) {
    if(isFavorite(image)) {
      _removeFavorite(image);
    } else {
      _addFavorite(image);
    }
  }

  bool isFavorite(ImageModel image) => _images.contains(image);

  void _loadFavorites() {
    _favoritesUsecase.execute()
        .then((value) {
      _images.addAll(value);
      notifyListeners();
    })
        .catchError((e) {
      print('loadFavorites error : $e');
    });
  }
}