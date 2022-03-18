import 'package:flutter/material.dart';

class GlobalMethods{
  Future<void> showDialogg(String title, String subtitle, Function fct, BuildContext context) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0AVvdQVH2LdtsYFauXEnnrgt2CG1diwowkJ1qLwGXLjJrzStCxFnH4p2rEDA9jkomk54&usqp=CAU',
              height: 20,
              width: 20,),
            ),
            Text(title)
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(onPressed: (){
            fct();
            Navigator.pop(context);
          }, child: Text('OK')),
        ],
      );
    });
  }
}