import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/function/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              text: "Free",
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: (){
                launchCustomUrl(context: context, url: book.volumeInfo.previewLink);
              },
              fontSize: 16,
              backgroundColor: const Color(0xFFEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              text: book.volumeInfo.previewLink== null?"Not Avaliable":"Preview",
            ),
          ),
        ],
      ),
    );
  }
}
