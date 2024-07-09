import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_searcher/presentaion/viewmodels/image_list_view_model.dart';
import 'package:image_searcher/presentaion/views/common/image_item_list_tile.dart';
import 'package:image_searcher/presentaion/views/common/progress_list_tile.dart';
import 'package:image_searcher/presentaion/views/detail/detail_view.dart';

class ImageListView<T extends ImageListViewModel> extends StatefulWidget {
  ImageListView({super.key, required this.keyName});

  final String keyName;
  final ScrollController scrollController = ScrollController();

  @override
  State<StatefulWidget> createState() {
    return _ImageListViewState<T>();
  }
}

class _ImageListViewState<T extends ImageListViewModel> extends State<ImageListView> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
  return Consumer<T>(
    builder: (context, vm, child) {
      if(vm.canLoadMore()) {
        widget.scrollController.addListener(() {
          if(widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent) {
            vm.loadMore();
          }
        });
      }
      return _createListView(vm);
    },
  );
  }

  ListView _createListView(T vm) {
    bool showProgressIndicator = vm.canLoadMore() || (vm.isLoading() && vm.isEmpty());

    return ListView.builder(
      key: PageStorageKey(widget.keyName),
      controller: widget.scrollController,
      itemExtent: 100.0,
      itemCount: vm.size() + (showProgressIndicator ? 1 : 0),
      itemBuilder: (context, index) {
        if(index >= vm.size()) {
          return const ProgressListTile();
        } else {
          var image = vm.get(index);
          return ImageItemListTile(image: image,
            onItemTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(image: image),
                  )
              );
            },
          );
        }
      },
    );
  }
}