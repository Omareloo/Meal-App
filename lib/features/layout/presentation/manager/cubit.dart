import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_ware/features/fav/presentation/screens/fav.dart';
import 'package:meal_ware/features/home/presentation/pages/home_screen.dart';
import 'package:meal_ware/features/layout/presentation/manager/states.dart';
import 'package:meal_ware/features/profile/presentation/screens/profile.dart';



class LayoutCubit extends Cubit<LayoutStates>{

  LayoutCubit():super(LayoutInitialState());

  static LayoutCubit get(context)=>BlocProvider.of(context);


  int currentIndex=0;

  List<Widget> screens=[
    HomeScreen(),
    Fav(),
    Profile(),


  ];

  void changeScreen({required int index}){
    currentIndex=index;
    emit(ChangeScreenState());
  }
}