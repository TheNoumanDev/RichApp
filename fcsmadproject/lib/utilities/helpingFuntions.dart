import 'package:flutter/material.dart';

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
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

Future<void> ShowDialogGeneric(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error Occoured"),
        content: Text(
          text,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("OK"),
          )
        ],
      );
    },
  );
}
