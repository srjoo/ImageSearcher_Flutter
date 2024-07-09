import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_searcher/domain/models/image_model.dart';
import 'package:image_searcher/presentaion/views/common/favorite_icon.dart';
import 'package:image_searcher/presentaion/views/common/open_url_icon.dart';

class ImageItemListTile extends StatelessWidget {
  const ImageItemListTile({super.key, required this.image, this.onItemTap});

  final ImageModel image;
  final void Function()? onItemTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        width: 72.0,
        height: 72.0,
        imageUrl: image.thumbnailUrl,
        placeholder: (context, url) => const Center(
          child: SizedBox(
            width: 30.0,
            height: 30.0,
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error, size: 30.0, color: Colors.red),
        fit: BoxFit.contain,
      ),
      title: Text(image.displaySiteName.isNotEmpty ? image.displaySiteName : image.docUrl,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: image.displaySiteName.isNotEmpty ?
          Text(image.docUrl,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OpenUrlIcon(url: image.docUrl, icon: Icons.home,),
          OpenUrlIcon(url: image.imageUrl,),
          FavoriteIcon(image:image),
        ],
      ),
      onTap: onItemTap,
      visualDensity: const VisualDensity(vertical: 4),
    );
  }
}
