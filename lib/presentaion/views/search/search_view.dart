import 'package:flutter/material.dart';
import 'package:image_searcher/presentaion/views/common/image_list_view.dart';
import 'package:image_searcher/presentaion/views/search/search_text_field.dart';
import 'package:image_searcher/presentaion/viewmodels/search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SearchTextField(),
        ),
        Expanded(child:
          ImageListView<SearchViewModel>(
            keyName: "view/search/list",
          ),
        ),
      ],
    );
  }
}