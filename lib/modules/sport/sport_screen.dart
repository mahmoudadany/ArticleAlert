import 'package:articleaert/components/components.dart';
import 'package:articleaert/layout/article_app/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
   List list=AppCubit.get(context).sport;

    return ConditionalBuilder(
      condition: !list.isEmpty,
      builder:(context)=> ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>buildArticlItem(context,list[index]),
          separatorBuilder: (context,index)=>Container(
            color: Colors.grey,
            width: double.infinity,
            height: 2.0,
          ),
          itemCount: AppCubit.get(context).sport.length
      ),
      fallback: (context)=> Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
    );
  }
}
