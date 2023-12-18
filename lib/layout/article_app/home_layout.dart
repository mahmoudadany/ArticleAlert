import 'package:articleaert/layout/article_app/cubit/cubit.dart';
import 'package:articleaert/layout/article_app/cubit/state.dart';
import 'package:articleaert/shard/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    AppCubit cubit=AppCubit.get(context);
    return  Scaffold(
          appBar: AppBar(
            title: Text(cubit.screenTitle[cubit.currentIndex]),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              IconButton(onPressed: (){cubit.onChangeMode();}, icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: cubit.screenWidget[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.onBottomNavChange(index);
            },
            items: cubit.bottomNavItem,
          ),

        );


  }
}
