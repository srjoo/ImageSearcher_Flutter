import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_searcher/data/apis/image_search_api.dart';
import 'package:image_searcher/data/models/image_search_meta.dart';
import 'package:image_searcher/data/models/image_search_response.dart';
import 'package:image_searcher/domain/repositories/image_repository.dart';

class ImageSearchApiKakao implements ImageSearchApi {
  static const String _baseURL = 'https://dapi.kakao.com';
  static const String _apiKey = '8858e18747d8c61f20538a9e066d4ca4';

  static const int _maxPage = 50;
  static const int _maxSize = 80;

  @override
  Future<ImageSearchResponse> search(String query, {int page = 1, int size = 20, ImageSearchSort sort = ImageSearchSort.accuracy}) async {
    String q = query.trim();
    if(q.isEmpty) throw Exception('query must be not empty');
    if(page < 1) throw Exception('page must be greater than 0, input : $page');
    if(page > _maxPage) throw Exception('page must be less or equal than $_maxPage, input : $page');
    if(size < 1) throw Exception('size must be greater than 0, input : $size');
    if(size > _maxSize) throw Exception('size must be less than $_maxSize, input : $size');

    final queryParameters = {
      'query': q,
      'page': page.toString(),
      'size': size.toString(),
      'sort': sort.name
    };

    final headers = {
      'Authorization': 'KakaoAK $_apiKey',
    };

    final url = Uri.parse('$_baseURL/v2/search/image')
        .replace(queryParameters: queryParameters);

    final response = await http.get(url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var result = ImageSearchResponse.fromJson(jsonDecode(response.body));
      if(page == _maxPage) {
        result = ImageSearchResponse(meta: ImageSearchMeta(isEnd: true, pageCount: result.meta.pageCount, totalCount: result.meta.totalCount), documents: result.documents);
      }
      return result;
    } else {
      throw Exception('wrong response code : ${response.statusCode}');
    }
  }
}