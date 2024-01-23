import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const modified_text({Key? key, this.text = '', this.color = Colors.white, this.size = 16.0})
      : super(key: key);

 @override
  Widget build(BuildContext context){
   return Text(
     text,
     style: GoogleFonts.breeSerif(color:color, fontSize: size),
   );
 }
}