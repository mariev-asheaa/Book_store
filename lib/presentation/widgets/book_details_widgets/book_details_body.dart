import 'package:bookly_app/core/helper/webview.dart';
import 'package:bookly_app/core/helper/styels.dart';
import 'package:bookly_app/presentation/widgets/book_details_widgets/also_like_books_listview.dart';
import 'package:bookly_app/presentation/widgets/book_details_widgets/button.dart';
import 'package:bookly_app/presentation/widgets/book_details_widgets/detailes_app_bar.dart';
import 'package:bookly_app/presentation/widgets/home_widgets/book_item.dart';
import 'package:bookly_app/presentation/widgets/home_widgets/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constant.dart';
import '../../../data/models/book_model/book_model.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const DetailesAppBar(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*.2),
                  child: Bookitem(
                    image: bookModel.volumeInfo.imageLinks?.thumbnail??'',),
                ),
                const SizedBox(height: 40,),
                Text(bookModel.volumeInfo.title??'',
                  style: koldStandardTt().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),textAlign: TextAlign.center,),
                const SizedBox(height: 6,),
                Opacity(
                  opacity: .7,
                  child: Text(bookModel.volumeInfo.authors?[0]??'',
                    style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                const SizedBox(height: 18,),
                 Rating(axisAlignment: MainAxisAlignment.center,
                  rating:bookModel.volumeInfo.averageRating??0,
                  count:bookModel.volumeInfo.ratingsCount??0,
                ),

                const SizedBox(height: 37,),

                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(children: [
                    const Button(
                      text: 'Free',
                      backgroundcolor: Colors.white,textcolor: Colors.black
                      ,borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(12) ,
                        bottomLeft: Radius.circular(12)
                    ),
                    ),
                    Button(
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => MyWebView(url: bookModel.volumeInfo.previewLink!,),));
                      },
                      text: getText(bookModel),
                      backgroundcolor: const Color(0xff434099),textcolor: Colors.white
                      ,borderRadius: const BorderRadius.only(
                        topRight:Radius.circular(16) ,
                        bottomRight: Radius.circular(16)),),

                  ],),
                ),
                const Expanded(child: SizedBox(height: 40,)),
                //we use Expanded to make sure that the list view and the
                //you can also like will always be in the bottom even if
                //the high of the screen increase

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('You can also like',style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                  ),
                ),
                const SizedBox(height: 16,),
                const AlsoLikeBooksListview(),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        )
      ],
    );
  }
  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
