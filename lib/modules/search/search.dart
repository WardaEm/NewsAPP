import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsApp/cubit/cubit.dart';
import 'package:newsapp/shared/components/component.dart';

import '../../layout/newsApp/cubit/state.dart';
class Search extends StatelessWidget {
   Search({Key? key}) : super(key: key);


var SearchController=TextEditingController();
bool isSearch=false;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) { },

      builder: (BuildContext context, Object? state) {
        var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(validator: (String ?value) {
                  if (value== null||  value.isEmpty) {
                    return 'search must not be empty';
                  }else {
                    isSearch = true;

                    return null;
                  }
                },
                  controller: SearchController,
                  decoration: const InputDecoration(
                      label: Text('search'), prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()
                  ),

                  onChanged: (value) {
            NewsCubit.get(context).getSearch(value);
                  },
                  keyboardType: TextInputType.text,),
              ),
              Expanded(child: ConditionalBuilder(condition: list.length>0,
              builder: (context){
                return ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (context,index){
                  return buildArticleItem(list[index], context);

                }, separatorBuilder: (context,index){
               return   Container(decoration: BoxDecoration(
                  color: Colors.orange,
                  ),height: 3,);
        }, itemCount: 10);
              }, fallback: (BuildContext context) =>Center(child: isSearch ==false?Container():CircularProgressIndicator()),

          ),
              )])

        );
      }
    );


  
    
  }
}
