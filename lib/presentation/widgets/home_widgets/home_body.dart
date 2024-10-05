import 'package:bookly_app/presentation/widgets/home_widgets/best_seller_listview.dart';
import 'package:bookly_app/presentation/widgets/home_widgets/featured_books_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/styels.dart';
import 'app_bar.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appbar(),
                FeaturedBooksListview(),
                SizedBox(height: 40,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Best Seller',style: Styles.textStyle18,),
                  ),
                SizedBox(height: 20,),
              ],
            ),
        ),
        SliverFillRemaining(
          //to avoid using shrinkwrap because it built all the listview
          //not only the screen items .
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BestSellerListview(),
        )),
      ],
    );
  }
}

