import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/domain/models/image_result_model.dart';
import 'package:image_searcher/domain/usecases/get_paging_images_usecase.dart';
import 'package:image_searcher/presentaion/viewmodels/image_list_view_model.dart';

class SearchViewModel extends ImageListViewModel {
  final GetPagingImagesUsecase _pagingImagesUsecase;

  final List<ImageModel> _images = [];

  bool _isLoading = false;
  bool _canLoadMore = false;

  int _currentPage = 1;

  String _query = '';
  String get query => _query;

  SearchViewModel(this._pagingImagesUsecase);

  @override
  ImageModel get(int index) {
    return _images[index];
  }

  @override
  int size() {
    return _images.length;
  }

  @override
  bool isLoading() {
    return _isLoading;
  }

  @override
  bool canLoadMore() {
    return _canLoadMore;
  }

  @override
  void loadMore() {
    if(_isLoading) return;
    if(_canLoadMore) {
      _search(query, _currentPage+1);
    }
  }

  void _changeQuery(String query) {
    _query = query.trim();
    _images.clear();
    _canLoadMore = false;
    _currentPage = 1;
    notifyListeners();
  }

  void _searchCallback(ImageResultModel? response, int requestPage) {
    if(response != null) {
      _images.addAll(response.images);
      _canLoadMore = !response.isEnd && response.images.isNotEmpty;
      _currentPage = requestPage;
    }
    _isLoading = false;
    notifyListeners();
  }

  void _search(String query, int page) {
    if(query.isEmpty) return;
    _isLoading = true;
    _pagingImagesUsecase.execute(query, page: page, size: 80)
        .then((value) {
          _searchCallback(value, page);
    })
        .catchError((e) {
      print('search error : $e');
      _searchCallback(null, page);
    });
  }

  void search(String query) {
    if(_isLoading) return;
    _changeQuery(query);
    _search(query, 1);
  }
}