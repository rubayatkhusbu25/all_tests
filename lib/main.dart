
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Assignment2/main2.dart';
import 'Live_test2/live_test.dart';

void main() {
  runApp(const MyApp());
}

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



