import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presention/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presention/views/widgets/custom_book_image.dart';
import 'package:bookly/Features/home/presention/views/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'book_action.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                CustomBookDetailsAppBar(downloadLink: book.accessInfo!.pdf?.acsTokenLink,),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 4.8),
                  child: CustomBookImage(
                    image: book.volumeInfo.imageLinks?.thumbnail ?? "",
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: height / 40,
                  ),
                ),
                Text(
                  book.volumeInfo.title!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle30.copyWith(
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    book.volumeInfo.authors![0],
                    style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  rating: book.volumeInfo.averageRating ?? 0,
                  count: book.volumeInfo.ratingsCount ?? 0,
                ),
                Expanded(
                  child: SizedBox(
                    height: height / 50,
                  ),
                ),
                BookAction(
                  book: book,
                ),
                Expanded(
                  child: SizedBox(
                    height: height / 35,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SimilarBookListView(),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
