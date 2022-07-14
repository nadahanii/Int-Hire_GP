import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:history_feature/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/icon_widget.dart';
class HeaderPage extends StatelessWidget{

  static const keyDarkMode='key-dark-mode';
  @override
  Widget build(BuildContext context) {
    final themeProvider= Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        BuildHeader(),
        const SizedBox(height: 32,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IsDark(),
         Switch.adaptive(
          value: themeProvider.isDarkMode,
          onChanged:(value) {
            final provider = Provider.of<ThemeProvider>(context, listen: false);
            provider.toggleTheme(value);
          }
         )
      ],
        ),
      ],
    );
  }
  Widget IsDark()=> Container(
    margin:EdgeInsets.only(left:10),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconWidget(
          icon: Icons.dark_mode,
          color:Color(0xFF642ef3),
        ),
        SizedBox(width: 20,),
        Text('DarkMode')

      ],
    )


  );

  Widget BuildHeader()=> Center(
    child: Text(
      'Settings',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,

      ),
    ),
  );



}