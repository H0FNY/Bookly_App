import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presention/views/widgets/custom_book_image.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView,extra: book);
      },
      child: Row(
        children: [
          SizedBox(
            height: height / 5.5,
            child:
                CustomBookImage(image: book.volumeInfo.imageLinks?.thumbnail ?? ""),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 1.8,
                  child: Text(
                    book.volumeInfo.title ?? "without name",
                    maxLines: 2,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGtSectraFine,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: width / 1.8,
                  child: Text(
                    book.volumeInfo.authors?[0] ?? "unknown",
                    maxLines: 1,
                    style: Styles.textStyle14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "Free",
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    BookRating(
                      count: book.volumeInfo.ratingsCount ?? 0,
                      rating: book.volumeInfo.averageRating?.round() ?? 0,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
