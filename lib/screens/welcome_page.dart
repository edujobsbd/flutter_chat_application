import 'package:chat_app_flutter_1/screens/registation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../button_navigator.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  static String id ='welcomePage';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 2
        ),
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white54).animate(controller);
    controller.forward();
    controller.addListener(
            () {
              setState(() {
                
              });
            }
          );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:animation.value,
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset("images/logo.png"),
                    height:60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Flash Chat',textStyle: TextStyle(
                      fontSize: 45.0,
                      fontFamily: 'Agne',
                      fontWeight: FontWeight.w900,
                    ),)
                  ],

                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonNavigator(
              onPress: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: 'Login', color: Colors.lightBlueAccent,
            ),
            ButtonNavigator(
                onPress: (){
                  Navigator.pushNamed(context,RegistrationScreen.id);
                },
                text: 'Register', color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}


