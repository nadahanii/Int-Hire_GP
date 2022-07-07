import 'package:flutter/material.dart';

InkWell HistoryListItem(String title,String description)
{
  return InkWell(
    onTap: (){},
    child: Container(

      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        title: Text(title,style: TextStyle(fontSize: 20),),
        subtitle: Text(description,style: TextStyle(fontSize: 13),),
      ),
    )
  );
}
