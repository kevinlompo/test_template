import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:share/share.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';


class V2 extends StatefulWidget {
  const V2({Key? key}) : super(key: key);

  @override
  State<V2> createState() => _V2State();
}

class _V2State extends State<V2> {
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  late TextEditingController clinique1;
  late FocusNode cliniqueFocusNode1;

  late TextEditingController clinique2;
  late FocusNode cliniqueFocusNode2;

  late TextEditingController candidat;
  late FocusNode candidatFocusNode2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clinique1 = TextEditingController();
    clinique2 = TextEditingController();
    candidat = TextEditingController();
    candidatFocusNode2 = FocusNode();
    cliniqueFocusNode2 = FocusNode();
    cliniqueFocusNode1 = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    // WIDGETS & METHODES
    Widget textSection = Padding(
      padding: const EdgeInsets.only(top:32, bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              SizedBox(
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Template V2'),
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
        child: cardWidget(textSection),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 49, 189, 179),
        child: const Icon(Icons.share),
        onPressed: () {
          // Share button implementation goes here.
          print(bytes.toString());
          _shareImage();
        },
      ),
    );
  }
  Widget cardWidget(Widget textSection) {
    return SingleChildScrollView(
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'images/Beach.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 150,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(226, 239, 235, 0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // margin: const EdgeInsets.only(left: 40, right: 40),
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 208, 101, 70),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: candidat,
                                  focusNode: candidatFocusNode2,
                                  decoration: InputDecoration(
                                      hintText: candidatFocusNode2.hasFocus ? '' : 'ASSISTANT(E) VETERINAIRE',
                                      hintStyle: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.blue.shade900,
                                      ),
                                      border: InputBorder.none
                                  ),
                                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue.shade900)
                              ),
                            ),
                          ),
                          textSection,

                        ],
                      )
                  )
              ),
            ),
            Positioned(
              top: 120,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(199, 235, 232, 0.9),
                ),
                height: Theme.of(context).textTheme.headlineMedium!.fontSize! *
                    1.0 +
                    17.0,
                width: 200,
                padding: const EdgeInsets.only(top: 8.0),
                margin: const EdgeInsets.only(left: 40, right: 40),
                // color: const Color.fromRGBO(199, 235, 232, 0.9),
                alignment: Alignment.center,
                child: Text(
                    'RECRUTE',
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.blue.shade900)),
              ),
            ),
            Positioned(
              top: 65,
              left: 25,
              child: Container(
                height:
                Theme.of(context).textTheme.headlineMedium!.fontSize! *
                    0.5 +
                    17.0,
                width: 180,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 49, 189, 179),
                ),
                // margin: const EdgeInsets.only(left: 40, right: 40),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      focusNode: cliniqueFocusNode2,
                      controller: clinique2,
                      decoration: InputDecoration(
                          hintText: cliniqueFocusNode2.hasFocus ? '' : 'DESMOULINAUX',
                          hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          border: InputBorder.none
                      ),
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: Container(
                transform: Matrix4.rotationZ(-0.09),
                height:
                Theme.of(context).textTheme.headlineMedium!.fontSize! *
                    0.5 +
                    17.0,
                width: 180,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                // margin: const EdgeInsets.only(left: 40, right: 40),
                alignment: Alignment.center,
                child: TextFormField(
                    controller: clinique1,
                    focusNode: cliniqueFocusNode1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: cliniqueFocusNode1.hasFocus ? '' : 'CLINIQUE',
                        hintStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 49, 189, 179),
                        ),
                        border: InputBorder.none
                    ),
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18, color: const Color.fromARGB(255, 49, 189, 179))
                ),
                /*style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.blue.shade900))*/
              ),
            ),
          ],
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
  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}

