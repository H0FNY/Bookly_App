import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeaturedBookListView(),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
