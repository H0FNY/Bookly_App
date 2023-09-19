import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key,
      this.mainAxisAlignment = MainAxisAlignment.start,
      required this.rating,
      required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xFFFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 6,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            "($count)",
            style: Styles.textStyle14,
          ),
        ),
      ],
    );
  }
}
