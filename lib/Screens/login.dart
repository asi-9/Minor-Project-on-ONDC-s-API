import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '/controller/google_login_controller.dart';
//
import '../controller/google_login_controller.dart';
import '/Screens/signup.dart';
import '/utils/constanst.dart';
import '/widget/rep_textfiled.dart';
import '/Screens/forgotpass.dart';
import 'loggedin_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(15),
          width: gWidth,
          height: gHeight,
          child: Column(
            children: [
              TopImage(),
              LoginText(),
              //SizedBox(height: 20),
              EmailTextFiled(),
              //SizedBox(
              //height: 20,
              //),
              PasswordTextFiled(),
              ForgotText(),
              SizedBox(
                height: 15,
              ),
              LoginButton(),
              SizedBox(height: 15),
              OrText(),
              SizedBox(height: 15),
              GoogleLoginButton(),
              SizedBox(
                height: 15,
              ),
              FacebookLoginButton(),
              RegisterText(),
            ],
          ),
        ),

      ),
    );

  }
}

// Register Text Components

class RegisterText extends StatelessWidget {
  const RegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: GestureDetector(
        onTap: () {
          Get.offAll(
                () => SignUpScreen(),
            transition: Transition.leftToRight,
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 22),
          width: gWidth / 2,
          height: gHeight / 32,
          child: FittedBox(
            child: RichText(
              text: TextSpan(
                text: "New to system unify ?",
                style: TextStyle(color: text1Color),
                children: [
                  TextSpan(
                    text: "  Sign Up",
                    style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Login With Google Button Components
class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 300),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: gWidth,
        height: gHeight / 15,
        child: ElevatedButton(
          onPressed: () {
            Provider.of<GoogleSignInController>(context, listen: false)
                .login();
            Get.offAll(
                  () => LoggedIN(),
              transition: Transition.circularReveal,
            );
          },
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: Image.network(
                    "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png"),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                "Login with Google",
                style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
              ),
            ],
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              buttonColor.withOpacity(0.2),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 238, 238, 238)),
          ),
        ),
      ),
    );
  }
}
class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 600),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: gWidth,
        height: gHeight / 15,
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              SizedBox(
                width:30,
                height: 30,
                child: Image.network(
                    "https://www.freepnglogos.com/uploads/facebook-logo-13.png"),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                "Login with Facebook",
                style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
              ),
            ],
          ),
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              buttonColor.withOpacity(0.2),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 238, 238, 238)),
          ),
        ),
      ),
    );
  }
}
// OR Text Components
class OrText extends StatelessWidget {
  const OrText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 700),
      child: Container(
        width: gWidth,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 130,
                height: 0.5,
                color: iconColor,
              ),
              Text(
                "  OR  ",
                style: TextStyle(color: iconColor, fontSize: 20),
              ),
              Container(
                width: 130,
                height: 0.5,
                color: iconColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Login Button Components
class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 1000),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7),
        width: gWidth,
        height: gHeight / 25,
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(LoginScreen());
          },
          child: Text("Login to ONDC"),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(buttonColor),
          ),
        ),
      ),
    );
  }
}

// Forgot Text Components
class ForgotText extends StatelessWidget {
  const ForgotText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 1200),
      child: GestureDetector(
        onTap: () {
          Get.to(
                () => ForgotPasswordScreen(),
            transition: Transition.leftToRight,
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 240, top: 10),
          width: gWidth / 3.7,
          height: gHeight / 32,
          child: FittedBox(
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: buttonColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

// Password TextFiled Components
class PasswordTextFiled extends StatelessWidget {
  const PasswordTextFiled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 1700),
      child: RepTextFiled(
        sufIcon: Icon(LineIcons.eyeSlash),
        icon: LineIcons.alternateUnlock,
        text: "Password",
      ),
    );
  }
}

// Email TextFiled Components
class EmailTextFiled extends StatelessWidget {
  const EmailTextFiled({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: 1700),
      child: RepTextFiled(
        sufIcon: null,
        icon: LineIcons.at,
        text: "Email ID",
      ),
    );
  }
}

// Top Login Text Components
class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: 2000),
      child: Container(
        margin: const EdgeInsets.only(left:5,right: 90, top: 1),
        width: gWidth*50,
        height: gHeight / 18,
        child: FittedBox(
          child: Text(
            "Type in your Credentials",
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Top Image Components
class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 2000),
      child: SizedBox(
        width: gWidth,
        height: gHeight / 2.85,
        child: Image.asset(
          "assets/images/img_2.png",
        ),
      ),
    );
  }
}


