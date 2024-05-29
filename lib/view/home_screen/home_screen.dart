
import 'package:flutter/material.dart';
import 'package:student_management/view/home_screen/widgets/home_center_widget.dart';
import 'package:student_management/view/home_screen/widgets/home_top_widget.dart';
import 'package:student_management/view/studentList/studentlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeTopWidget(name: "Shahal",),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 5,
              color: Colors.black,
              thickness: 3,
            ),
          ),
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCenterWidget(onTap: (){},image: "assets/home_page/home_classroom.png",text: "class room",),
                HomeCenterWidget(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => StudentListScreen(),));},image: "assets/home_page/home_school_bus.jpg",text: "manage bus",),
              ],
            ),
          ),
            SizedBox(height: 80,),
          Container(
            height: size.height/12,
            width: size.width/1.5,
            decoration: const BoxDecoration(
                 color: Colors.blue,
              borderRadius: BorderRadius.all( Radius.circular(20))
            ),
          )
        ],
      ),
    );
  }
}




