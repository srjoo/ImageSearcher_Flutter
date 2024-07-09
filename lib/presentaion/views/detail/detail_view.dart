import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/presentaion/views/common/favorite_icon.dart';
import 'package:image_searcher/presentaion/views/common/open_url_icon.dart';

class DetailView extends StatelessWidget {
  final ImageModel image;

  const DetailView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                imageUrl: image.imageUrl,
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error, size: 100.0, color: Colors.red,),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: FavoriteIcon(image: image,),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: OpenUrlIcon(url: image.imageUrl, color: Colors.white,),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: OpenUrlIcon(url: image.docUrl, icon: Icons.home, color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}