import 'package:bookly_app/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'book_item.dart';

class FeaturedBooksListview extends StatelessWidget {
  const FeaturedBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccess){
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * .3,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final imageLink = state.books[index].volumeInfo.imageLinks?.thumbnail
                    ?? state.books[index].volumeInfo.imageLinks?.smallThumbnail;

                if (imageLink == null || imageLink.isEmpty) {
                  return const SizedBox.shrink();
                }
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push('/book_details',extra: state.books[index]);
                      },
                      child: Bookitem(image:imageLink
                ),)
                );
              }),
        );
      }
       else if (state is NewestBooksFailure){
            return  Text(state.errormessage);
        }else {
        return  Skeletonizer(
          child:  Container(
            height: MediaQuery.of(context).size.height * 0.3, // Set a fixed height
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Image.asset('assets/images/test Novel Book Cover.png')
                  );
                }),
          ),
        );
        }
      }
    );
  }
}
