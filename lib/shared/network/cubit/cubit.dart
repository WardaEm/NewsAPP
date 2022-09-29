import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/network/cubit/state.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialStates());
  static AppCubit get(context)=>BlocProvider.of(context);

  bool isDark=false;
  void changeAppMode({ bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;

    else
    isDark = !isDark;
    CachHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeStates());
    });
    emit(AppChangeModeStates());
  }

}