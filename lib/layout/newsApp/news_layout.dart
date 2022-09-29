import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsApp/cubit/cubit.dart';
import 'package:newsapp/modules/busniss/business.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sport/sport_screen.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

import '../../shared/network/cubit/cubit.dart';
import 'cubit/state.dart';
class NewsLayout extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit()..getbusiness()..getscience()..getsport(),
      child: BlocConsumer<NewsCubit,NewsStates> (
        listener: (BuildContext context, state){},
        builder: (BuildContext context, Object? state) {
          var cubit=NewsCubit.get(context);
          return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(onPressed: (){ }, icon:Icon(Icons.search)),
              IconButton(onPressed: (){
                AppCubit.get(context).changeAppMode();
              }, icon:Icon(Icons.brightness_4_outlined))

            ],
          ),
        body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(items:
cubit.BottomItems,

            currentIndex:cubit.currentIndex,

onTap: (index){
          cubit.ChangeBottonNavBar(index);
},
          ) ,


//           floatingActionButton: FloatingActionButton(
//             child: Icon(Icons.add),
//             onPressed: () async{
// //               Response response;
// // DioHelper.getData(url: 'v2/top-headlines', query:
// // {
// //   'country':'us',
// //   'apiKey':'73d5af48b53a4017934a0cf44bf12a3f'
// // }
// //
// // ).then((response)  {
// //   print(response!.data.toString());
// // });
// Response response;
// Dio dio=Dio();
//
//  response=await dio.get('https://newsapi.org/v2/top-headlines?country=us&apiKey=73d5af48b53a4017934a0cf44bf12a3f ');
// print(response.data['articles']);
//
// // response=await dio.get('https://jsonplaceholder.typicode.com/albums');
// // print(response.data.toString());
//
// // response=await dio.get('https://api.themoviedb.org/3/movie/popular?api_key=837aa67b269303622a476bbe24283a57');
// // print(response.data.toString());
// //
// //               response = await dio.get('https://api.openweathermap.org/data/2.5/weather?q=zagazig&lang=ar&mode=json&appid=d81144d3c05c7f489530fb626c66415f');
// //               print(response.data.toString());
//             },
//           ),

        ); },

      ),
    );
  }
}
