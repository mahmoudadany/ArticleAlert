import 'package:articleaert/modules/webview/web_view.dart';
import 'package:flutter/material.dart';

Widget buildArticlItem(context,Map<dynamic,dynamic> item){
  print(item['urlToImage']);
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder:(context)=> AppWebView(url: item['url'].toString())
          )
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120.0,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0,),
                  image: DecorationImage(

                      image: NetworkImage(item['image']),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(width: 20.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item['title'].toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyText1
                  ),
                  SizedBox(height: 10.0,),
                  Expanded(
                    child: Text(
                      item['publishedAt'].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ) ,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}