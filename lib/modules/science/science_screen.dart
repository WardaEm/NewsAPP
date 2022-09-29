import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/newsApp/cubit/cubit.dart';
import '../../layout/newsApp/cubit/state.dart';
import '../../shared/components/component.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var list=NewsCubit.get(context).science;
        return   ConditionalBuilder(
          condition:list.length>0 ,
          builder: (context)=>ListView.separated(
            physics:BouncingScrollPhysics() ,
            itemBuilder: (BuildContext context, int index) =>buildArticleItem(list[index],context) ,
            separatorBuilder: (BuildContext context, int index) =>
                Container(decoration: BoxDecoration(color: Colors.grey[100]),height: 2,),
            itemCount: 10,

          ),
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
        );},

    );
  }
}
