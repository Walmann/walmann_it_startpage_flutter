// import 'dart:ffi';

import 'dart:js' as js;
// import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
// import 'dart:async';
import 'package:flutter_social_button/flutter_social_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walmann.IT',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFf7dcf3),
              image: DecorationImage(
                  repeat: ImageRepeat.repeatX,
                  image: Svg('assets/Background.svg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          const Positioned.fill(
            // top: -10,
            child: Center(
              child: ProfileBadge(),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ProfileBadge extends StatelessWidget {
  const ProfileBadge({super.key});

  final double badgeBorderWidth = 7;
  final double badgeWidth = 250;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 350,
        width: badgeWidth,
        decoration: BoxDecoration(
            color: const Color(0xFFb03e77),
            border: Border.all(
                color: const Color(0xFF4b1a32), width: badgeBorderWidth),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22))),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Positioned(
                top: -badgeWidth / 2,
                child: Container(
                  height: badgeWidth,
                  width: badgeWidth,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.repeated,
                          stops: [
                            0,
                            0.5,
                            0.5,
                            1
                          ],
                          colors: [
                            // Color(0xFF4b1a32),
                            // Color(0xFF4b1a32),

                            Color(0x00f7dcf3),
                            Color(0x00f7dcf3),
                            Color(0xFFf7dcf3),
                            Color(0xFFf7dcf3)
                          ])),
                  child: Padding(
                    padding: EdgeInsets.all(badgeBorderWidth),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: const CircleAvatar(
                        foregroundImage:
                            AssetImage("assets/ProfilePicture.jpg"),
                      ),
                    ),
                  ),
                )),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "TOV ARE WALMANN",
                  style: TextStyle(
                    fontFamily: 'FreestyleScript',
                    fontSize: 30,
                    color: Color(0xFFf7dcf3),
                    // fontWeight: FontWeight.bold
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProfileBadgeButton(
                      buttonText: "Facebook",
                      buttonIcon: FontAwesomeIcons.facebook,
                      buttonUrl: "https://www.facebook.com/tovare.walmann/",
                    ),
                    ProfileBadgeButton(
                      buttonText: "Github",
                      buttonIcon: FontAwesomeIcons.github,
                      buttonUrl: "https://github.com/Walmann",
                    ),
                    ProfileBadgeButton(
                      buttonText: "Instagram",
                      buttonIcon: FontAwesomeIcons.instagram,
                      buttonUrl: "https://www.instagram.com/tov.are/",
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 30))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBadgeButton extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;
  final String buttonUrl;
  // final VoidCallback onPressed;

  const ProfileBadgeButton(
      {super.key,
      required this.buttonText,
      required this.buttonIcon,
      required this.buttonUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ElevatedButton.icon(
        icon: Icon(
          buttonIcon,
          color: const Color(0xFFb03e77),
        ),
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(
                    5))), //TODO Experiment with different styles

            fixedSize: const Size(175, 40),
            backgroundColor: const Color(0xFFf7dcf3)),
        onPressed: () async {
          js.context.callMethod('open', [buttonUrl]);
        },
        label: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFb03e77),
          ),
        ),
      ),
    );
  }
}
