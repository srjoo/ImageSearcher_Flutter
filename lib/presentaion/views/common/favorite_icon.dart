import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/presentaion/viewmodels/favorite_view_model.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.image});

  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(
      builder: (context, viewModel, child) {
        bool isFavorite = viewModel.isFavorite(image);
        return IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
            onPressed: () { viewModel.toggleFavorite(image); },
        );
      },
    );
  }
}