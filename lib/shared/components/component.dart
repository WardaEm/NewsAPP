

import 'package:flutter/material.dart';
import 'package:newsapp/modules/web_view/webview_screen.dart';

Widget buildArticleItem(article,context)=>InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder:(context)=>WebVIEWScreen(url: article['url'])));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

          image:  DecorationImage(

                image: NetworkImage('${article['urlToImage']}'),

                fit: BoxFit.cover)



          ),

        ),

        SizedBox(width: 15,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              mainAxisSize: MainAxisSize.min,

              mainAxisAlignment: MainAxisAlignment.start,

              crossAxisAlignment: CrossAxisAlignment.start,



              children: [

                Expanded(

                  child: Text('${article['title']}',

                    style:Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),



                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                      color: Colors.grey

                  ),

                ),

              ],

            ),

          ),

        )

      ],

    ),



  ),
);