import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '/controller/google_login_controller.dart';
import '/Screens/login.dart';



class LoggedIN extends StatefulWidget {
  const LoggedIN({Key? key}) : super(key: key);

  @override
  State<LoggedIN> createState() => _LoggedINState();
}

class _LoggedINState extends State<LoggedIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: loginUI(),
    );

  }
  loginUI(){
    return Consumer<GoogleSignInController>(
      builder: (context,model,child){
        if(model.googleAccount != null){
          Fluttertoast.showToast(
            msg: 'No personal info was taken',
            backgroundColor: Colors.grey,
          );
          // return Center(child :loggedInUI(model),);
          return Center(child :loggedInUI(model),);
        }
        else {
          return loginControls(context);
        }
      }
    );
  }
  loggedInUI(GoogleSignInController model){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.googleAccount!.photoUrl ??'').image,
        ),
        Text(model.googleAccount!.displayName ??''),
        Text(model.googleAccount!.email),
        ActionChip(
            label: Text("Logout"),
            onPressed: (){
              Fluttertoast.showToast(
                msg: 'Thanks for Trying',
                backgroundColor: Colors.grey,
              );
              Fluttertoast.showToast(
                msg: model.googleAccount!.displayName ??'',
                backgroundColor: Colors.grey,
              );
              Provider.of<GoogleSignInController>(context,listen: false).logOut();
              Get.to(LoginScreen());
              // Get.offAll(
              //       () => LoginScreen(),
              //   transition: Transition.leftToRight,
              // );

            }
        ),
      ],
    );
  }

  loginControls(BuildContext context) {
    return 0;
    //Get.to(SignUpScreen());

  }
}



