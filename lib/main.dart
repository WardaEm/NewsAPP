import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsApp/cubit/cubit.dart';
import 'package:newsapp/layout/newsApp/cubit/state.dart';
import 'package:newsapp/shared/network/cubit/cubit.dart';
import 'package:newsapp/shared/network/cubit/state.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'layout/newsApp/cubit/bloc_observer.dart';
import 'layout/newsApp/news_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
DioHelper.init();
await CachHelper.init();
bool? isDark=CachHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark!));
}
class MyApp extends StatelessWidget {

final bool isDark;


MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>NewsCubit()..getbusiness()..getscience()..getsport(),),
        BlocProvider(create:(BuildContext context)=>AppCubit()..changeAppMode(fromShared: isDark),)
      ],

      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
           primarySwatch: Colors.orange,
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                // backgroundColor: Colors.grey[100],
                // selectedItemColor: Colors.orange,

                backgroundColor: Colors.white,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing:20 ,
                  titleTextStyle: TextStyle(
                      color: Colors.orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                      color: Colors.orange
                  ),

                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark
                  )
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),

            ),

            darkTheme: ThemeData(
              scaffoldBackgroundColor:HexColor('#2C3E50'),
              primarySwatch: Colors.orange,

              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('#2C3E50'),
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,

              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )
              ),
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                  backgroundColor: HexColor('#2C3E50'),
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                      color: Colors.white
                  ),

                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('#2C3E50'),
                      statusBarIconBrightness: Brightness.light
                  )
              ),

            ),
            themeMode:AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home:  Directionality(textDirection: TextDirection.ltr, child: NewsLayout(),),

        );
        },

      ),
    );
  }
}
