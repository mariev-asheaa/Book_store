import 'package:bookly_app/core/helper/styels.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/presentation/widgets/home_widgets/book_item.dart';
import 'package:bookly_app/presentation/widgets/home_widgets/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../constant.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push('/book_details',extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            Bookitem(image: bookModel.volumeInfo.imageLinks?.thumbnail??''),
            const SizedBox(width: 30,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child: Text(bookModel.volumeInfo.title??'',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: koldStandardTt().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(height: 3,),
                   Opacity(
                      opacity: .7,
                      child: Text(bookModel.volumeInfo.authors?[0]??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14,)),
                  const SizedBox(height: 3,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Free',style: Styles.textStyle20,),

                        Rating(rating:bookModel.volumeInfo.averageRating??0,
                          count:bookModel.volumeInfo.ratingsCount??0,
                        ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
