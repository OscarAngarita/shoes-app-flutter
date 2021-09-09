import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';

import 'package:shoes_app/src/pages/zapato_page.dart';
 
void main() { 
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ZapatoModel()),
      ],
      child: MyApp()
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xffFFCF53),
      )
    );

    return MaterialApp(
      title: 'ShoesApp',
      debugShowCheckedModeBanner: false,
      home: ZapatoPage(),
    );
  }
}