import 'package:flutter/material.dart';

Widget buildTextField(String mainText, Icon preicon, String hintText,
    TextEditingController controller,
    [IconButton? postIcon]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(mainText, style: rLabelStyle),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: rBoxDecorationStyle,
        height: 60.0,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: preicon,
              suffixIcon: postIcon,
              hintText: hintText,
              hintStyle: rHintTextStyle),
        ),
      ),
    ],
  );
}

Widget buildButton(String text, Function()? onpressed) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 5.0,
        //borderRadius: BorderRadius.circular(30.0),
        //onPrimary: Colors.white, // foreground
      ),
      onPressed: onpressed,
      child: Text(text, style: rButtonTextStyle),
    ),
  );
}

const rButtonTextStyle = TextStyle(
  color: Color.fromRGBO(37, 24, 78, 1),
  letterSpacing: 1.5,
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const rHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const rLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final rBoxDecorationStyle = BoxDecoration(
  color: const Color.fromRGBO(37, 24, 78, 0.5),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
