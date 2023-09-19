import 'package:bookly/core/utils/function/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key, this.downloadLink});
  final String? downloadLink;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        IconButton(
          onPressed: () {
            if (downloadLink != null) {
              launchCustomUrl(context: context, url: downloadLink);
            }
          },
          icon: Icon(
            downloadLink ==null ? Icons.file_download_off_outlined:Icons.file_download_outlined,
          ),
        ),
      ],
    );
  }
}
