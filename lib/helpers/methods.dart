import 'package:flutter/material.dart';

push(context, screen) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

pushReplacement(context, screen) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

class MyHeightSizedBox extends StatelessWidget {
  double? x;

  MyHeightSizedBox({required this.x});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: x,
    );
  }
}

class MyWidthSizedBox extends StatelessWidget {
  double? x;

  MyWidthSizedBox({required this.x});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: x,
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  double? height;
  double? width;
  Color color;
  Function function;

  Widget widget;

  MyElevatedButton({Key? key,
    this.height,
    this.width,
    required this.color,
    required this.widget,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??double.maxFinite,
      height: height??50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          function();
        },
        child: widget,
      ),
    );
  }
}

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          color: Colors.deepPurple,
        ));
  }
}

class MyText extends StatelessWidget {
  // const MyText({Key? key}) : super(key: key);
  String? text;
  String? fontFamily;
  Color? color;

  double? fontSize;

  FontStyle? fontStyle;

  FontWeight? fontWeight;

  MyText({Key? key,
    required this.text,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.color,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: fontFamily ?? '',
      ),
    );
  }
}