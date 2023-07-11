import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class V2 extends StatefulWidget {
  const V2({Key? key}) : super(key: key);

  @override
  State<V2> createState() => _V2State();
}

class _V2State extends State<V2> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
