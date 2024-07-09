import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_searcher/presentaion/viewmodels/search_view_model.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});

  final TextEditingController _controller = TextEditingController();
  final _textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(
        builder: (context, vm, child) {
          _controller.text = vm.query;
          bool enable = !vm.isLoading();

          return Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _textFieldFocusNode,
                  enabled: enable,
                  onSubmitted: (_) {
                    _search(vm);
                  },
                  decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      hintText: '검색어를 입력해주세요'
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                  onPressed: enable ? () {
                    _removeTextFieldFocus();
                    _search(vm);
                  } : null,
                  child: const Icon(Icons.search)
              )
            ],
          );
        }
    );
  }

  void _removeTextFieldFocus() {
    if(_textFieldFocusNode.hasFocus) {
      _textFieldFocusNode.unfocus();
    }
  }

  void _search(SearchViewModel vm) {
    vm.search(_controller.text);
  }
}