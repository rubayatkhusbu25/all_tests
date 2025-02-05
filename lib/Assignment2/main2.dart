import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Live_test2/live_test.dart';
import 'contact_list.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(420, 893),
        builder: (context ,child)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Contact List',
          theme: ThemeData.light(),
          home:LiveTest(),
        )
    );
  }
}
