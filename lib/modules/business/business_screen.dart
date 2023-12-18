import 'package:articleaert/components/components.dart';
import 'package:articleaert/layout/article_app/cubit/cubit.dart';
import 'package:articleaert/layout/article_app/cubit/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List list=AppCubit.get(context).business;
    return ConditionalBuilder(
          condition: !list.isEmpty,
          builder:(context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,int index)=>buildArticlItem(context,list[index]),
              separatorBuilder: (context,int index)=>Container(
                color: Colors.grey,
                width: double.infinity,
                height: 2.0,
              ),
              itemCount: list.length
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
        );
  }
}
