import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsApp/cubit/state.dart';
import 'package:newsapp/modules/settings/setting.dart';

import '../../../modules/busniss/business.dart';
import '../../../modules/science/science_screen.dart';
import '../../../modules/sport/sport_screen.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialStates());

  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<Widget>screens=[
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),

  ];
  List<BottomNavigationBarItem>BottomItems=[
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business'),
     BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sports'),

  ];

  void ChangeBottonNavBar(index){
    currentIndex=index;
    if(index==1)
      getscience();
    if(index==2)
      getsport();
    emit(NewsBottomNavChangeStates());
  }
  List<dynamic>business=[];
void  getbusiness()  async {
  emit(NewsBusnissLoadingStates());
    Response response;
    Dio dio = Dio();

   response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=73d5af48b53a4017934a0cf44bf12a3f');
   business=response.data['articles'];
   // print(business[0]['title']);
   emit(NewsBusinessSucessState());
    // print(response.data['articles']);
  }

  List<dynamic>science=[];
  void  getscience()  async {
    emit(NewsScienceLoadingStates());
    if(science.length==0){
      Response response;
      Dio dio = Dio();

      response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=73d5af48b53a4017934a0cf44bf12a3f ');
      science=response.data['articles'];
      print(science[0]['title']);
      emit(NewsScienceSucessState());
    }else{
      emit(NewsScienceSucessState());
    }

  }

  List<dynamic>sport=[];
  void  getsport()  async {
    emit(NewsSportsLoadingStates());
    if(sport.length==0){
      Response response;
      Dio dio = Dio();

      response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=73d5af48b53a4017934a0cf44bf12a3f ');
      sport=response.data['articles'];
      print(sport[0]['title']);
      emit(NewsSportsSucessState());
    }else{
      emit(NewsSportsSucessState());
    }
  }

  List<dynamic>search=[];
  void  getSearch(String value)  async {
    emit(NewsSearchLoadingStates());
    // if(search.length==0){
      Response response;
      Dio dio = Dio();

      response = await dio.get(
          'https://newsapi.org/v2/everything?q=tesla&apiKey=73d5af48b53a4017934a0cf44bf12a3f');
    search=response.data['articles'];
      print(search.toString());
      emit(NewsSearchSucessState());
    // }else{
    //   emit(NewsSearchSucessState());
    // }
  }
}