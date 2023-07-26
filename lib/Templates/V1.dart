import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:share/share.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class V1 extends StatefulWidget {
  const V1({Key? key}) : super(key: key);

  @override
  State<V1> createState() => _V1State();
}

class _V1State extends State<V1> {
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;
  late TextEditingController clinique2;
  late FocusNode cliniqueFocusNode2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clinique2 = TextEditingController();
    cliniqueFocusNode2 = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    // VARIABLES
    Color color = const Color.fromARGB(255, 49, 189, 179);


    // WIDGETS & METHODES
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'VETERINAIRE NAC',
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 26, 8, 107)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
    Widget textSection = Padding(
      padding: const EdgeInsets.only(top:32, bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset('images/pin.png'),
              ),
              Text(
                'VUADENS, SUISSE',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 15, color: const Color.fromARGB(255, 26, 8, 107)),
              ),
            ],
          ),
          const SizedBox(width: 20,),
          Container(
            width: 2,
            height: 40,
            color: const Color.fromARGB(255, 49, 189, 179),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      height: 5,
                      width: 5,
                    ),
                    const SizedBox(width: 5,),
                    FittedBox(
                      child: Text(
                        'CDI ou CDD',
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 13, color: const Color.fromARGB(255, 26, 8, 107)), softWrap: true,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      height: 5,
                      width: 5,
                    ),
                    const SizedBox(width: 5,),
                    FittedBox(child: Text('URGENCE NUITS', style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 13, color: const Color.fromARGB(255, 26, 8, 107)), softWrap: true,)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      height: 5,
                      width: 5,
                    ),
                    const SizedBox(width: 5,),
                    FittedBox(child: Text(' DES QUE POSSIBLE', style: GoogleFonts.montserrat(fontWeight: FontWeight.w400,fontSize: 13, color: const Color.fromARGB(255, 26, 8, 107)), softWrap: true,)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Template V1'),
          titleTextStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 30, color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 5,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: WidgetsToImage(
          controller: controller,
          child: cardWidget(titleSection, buttonSection, textSection),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 49, 189, 179),
          child: const Icon(Icons.share),
          onPressed: () async {
            _shareImage();
            // Share button implementation goes here.
            print(bytes.toString());
          },
        ),
      ),
    );
  }
  Widget cardWidget(Widget titleSection, Widget buttonSection, Widget textSection) {
    return SingleChildScrollView(
      child: Center(
        child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'images/snake.png',
                width: MediaQuery.of(context).size.width,
                height: 240,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250),
                child: Container(
                    height:
                    Theme.of(context).textTheme.headlineMedium!.fontSize! *
                        1.0 +
                        17.0,
                    width: 180,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(226, 239, 235, 0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.only(top: 8.0),
                    // margin: const EdgeInsets.only(left: 40, right: 40),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text('RECRUTE',
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue.shade900)
                        /*style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.blue.shade900))*/
                      ),
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(199, 235, 232, 0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: Theme.of(context).textTheme.headlineMedium!.fontSize! *
                      1.0 +
                      17.0,
                  padding: const EdgeInsets.only(top: 8.0),
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  // color: const Color.fromRGBO(199, 235, 232, 0.9),
                  alignment: Alignment.center,
                  child:
                  TextFormField(
                      textAlign: TextAlign.center,
                      focusNode: cliniqueFocusNode2,
                      controller: clinique2,
                      decoration: InputDecoration(
                          hintText: cliniqueFocusNode2.hasFocus ? '' : 'CLINIQUE DES ROSIERS',
                          hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.blue.shade900,
                          ),
                          border: InputBorder.none
                      ),
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.blue.shade900)
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 320),
                child: titleSection,
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 350),
                child: textSection,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 560),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 49, 189, 179),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    print('button pressed!');
                  },
                  child:  Text('Plus d\'informations', style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w500),),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 610),
                child: buttonSection,
              ),
            ]
        ),
      ),
    );
  }
  _shareImage() async {
    final bytes = await controller.capture();
    /* setState(() {
      this.bytes = bytes;
    });*/
    final directory = await getTemporaryDirectory();
    final imagePath = "${directory.path}/image.png";
    File(imagePath).writeAsBytesSync(bytes!);
    await Share.shareFiles([imagePath], text: 'Check out this image!');
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
