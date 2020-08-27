import 'package:flutter/material.dart';
import 'main_page.dart';
import 'dart:async';

void main() => runApp(
    MaterialApp(
        home: Loading()
    )
);

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Center(child: Image.asset('images/chicken.jpg')
            ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '플러터 스터디 첫강',
        theme: ThemeData(),
        home: HelloPage('Hello world'));
  }
}

class HelloPage extends StatefulWidget {
  final String title;

  HelloPage(this.title);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print('잘 눌려?'),
        ),
        body: Center(
            child: CustomLogo(
          size: 400,
        )


            ));
  }
}

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    Key key,
    this.size,
    this.colors,
    this.textColor = const Color(0xFF616161),
    this.style = FlutterLogoStyle.markOnly,
    this.duration = const Duration(milliseconds: 1800),
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  final double size;
  final MaterialColor colors;

  final Color textColor;

  /// Whether and where to draw the "Flutter" text. By default, only the logo
  /// itself is drawn.
  final FlutterLogoStyle style;

  /// The length of time for the animation if the [style], [colors], or
  /// [textColor] properties are changed.
  final Duration duration;

  /// The curve for the logo animation if the [style], [colors], or [textColor]
  /// change.
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    final double iconSize = size ?? iconTheme.size;
    final MaterialColor logoColors = colors ?? Colors.blue;
    return AnimatedContainer(
      width: iconSize,
      height: iconSize,
      duration: duration,
      curve: curve,
      decoration: FlutterLogoDecoration(
        lightColor: logoColors.shade400,
        darkColor: logoColors.shade900,
        style: style,
        textColor: textColor,
      ),
    );
  }
}
