import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailesAppBar extends StatelessWidget {
  const DetailesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          GoRouter.of(context).pop();
        }, icon: const Icon(Icons.close,size: 30,)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart,size: 30,)),
      ],
    );
  }
}
