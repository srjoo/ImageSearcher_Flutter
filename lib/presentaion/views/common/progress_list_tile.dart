import 'package:flutter/material.dart';

class ProgressListTile extends StatelessWidget {
  const ProgressListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}