import 'package:flutter/material.dart';
import 'package:test_template/Templates/V1.dart';
import 'package:test_template/Templates/V2.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: const Color.fromARGB(255, 49, 189, 179),
        primaryColor:  const Color.fromARGB(255, 49, 189, 179),
      ),
      home: const MyHomePage(title: 'Templates Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//VARIABLES
  List<String> Templates = ["V1", "V2",];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double buttonWidth = screenWidth * 0.4;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          titleTextStyle: GoogleFonts.montserrat(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600,),
          backgroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              child: Image.asset(
                'images/Annoncees.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 200),
              child: ListView.builder(
                  itemCount: Templates.length,
                  itemBuilder: (context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: InkWell(
                            onTap: (){
                              if(Templates[index] == "V1"){
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const V1(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      var curveAnimation = CurvedAnimation(parent: animation, curve: Curves.ease);
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(1.0, 0.0),
                                          end: const Offset(0.0, 0.0),
                                        ).animate(curveAnimation),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              }
                              else if(Templates[index] == "V2"){
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => const V2(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      var curveAnimation = CurvedAnimation(parent: animation, curve: Curves.ease);
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(1.0, 0.0),
                                          end: const Offset(0.0, 0.0),
                                        ).animate(curveAnimation),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              };
                            },
                            child: Padding(
                                padding: EdgeInsets.only(left: buttonWidth, right: buttonWidth),
                                child:  Row(children: [
                                  const Icon(Icons.arrow_forward_ios_sharp, size: 25, color: Colors.white,),
                                  Center(child: Text('${Templates[index]}', style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20,),
                                  ))
                                ],)),
                          ),
                        )
                      ],
                    );
                  }
              ),
            )
          ],
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
