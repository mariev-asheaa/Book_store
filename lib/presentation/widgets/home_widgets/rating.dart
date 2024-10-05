import 'package:bookly_app/core/helper/styels.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Rating extends StatelessWidget {
  const Rating({super.key,
    this.axisAlignment=MainAxisAlignment.start, required this.rating, required this.count});
final num rating;
final int count;
 final MainAxisAlignment axisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: axisAlignment,
      children:  [
      const Icon( FontAwesomeIcons.solidStar,color: Colors.yellow,size: 14,),
        const SizedBox(width: 6,),
         Text(rating.toString(),style: Styles.textStyle16,),
        const SizedBox(width: 4,),

        Opacity(opacity: .7,
            child: Text('($count)',style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600
            )))
      ],
    );
  }
}
