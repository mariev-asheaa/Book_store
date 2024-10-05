import 'package:bookly_app/presentation/widgets/home_widgets/best_seller_item.dart';
import 'package:bookly_app/view_model/best_books_cubit/best_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestBooksCubit, BestBooksState>(
      builder: (context, state) {
        if(state is BestBooksSuccess){
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount:state.books.length ,
            itemBuilder: (context, index) {
              return
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerItem( bookModel:state.books[index],),
              );
            });}else if(state is BestBooksFailure){
          return  Text(state.errormessage);
        }else {
          return  Skeletonizer(
            child:  Container(
              height: MediaQuery.of(context).size.height * 0.3, // Set a fixed height
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Image.asset('assets/images/test Novel Book Cover.png')
                      );
                  }),
            ),
          );
        }
      },
    );
  }
}
