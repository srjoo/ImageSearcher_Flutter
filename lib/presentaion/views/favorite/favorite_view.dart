import 'package:flutter/material.dart';
import 'package:image_searcher/presentaion/viewmodels/favorite_view_model.dart';
import 'package:image_searcher/presentaion/views/common/image_list_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child:ImageListView<FavoriteViewModel>(
                keyName: "view/favorite/list"
            ),
        ),
      ],
    );
  }
}