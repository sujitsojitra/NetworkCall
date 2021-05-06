import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';
import 'Controlls/Widgets.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool isVisible=false;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return
      GestureDetector(
        onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);
    },
    child:

      Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Column(
              children: [
                // Center(
                //   child: Container(
                //     width: 128,
                //     height: 49,
                //     child: Image.asset('assets/images/vbet_logo.png'),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(bottom: 34, top: 58),
                  child: Text("Sign In", style: GoogleFonts.openSans(fontSize: 24, fontWeight: semiBold),),
                ),
                getThemeTextField(context, txtEmail, "Enter your email or username", TextInputType.emailAddress, false, focusNode, TextInputAction.next,null),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 32,
                  child: TextFormField(
                    controller: txtPassword,
                    obscureText: !isVisible,
                    onFieldSubmitted: (value){
                      focusNode.unfocus();
                    },
                    textInputAction: TextInputAction.done,
                    style: GoogleFonts.openSans(),
                    decoration: InputDecoration(
                      suffixIcon: (isVisible)?
                      GestureDetector(
                        child: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onTap: (){
                          setState(() {
                            isVisible=!isVisible;
                          });
                        },
                      ):
                      GestureDetector(
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                        onTap: (){
                          setState(() {
                            isVisible=!isVisible;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: themeWhite,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      hintStyle: GoogleFonts.openSans(color: Colors.grey),
                      focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: themeBlue, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: themeBlue, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: themeBlue, width: 2.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 10, right: 25),
                      child: GestureDetector(
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.openSans(
                              color: themeWhite
                          ),
                        ),
                        onTap: (){
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (context)=>ResetPasswordView()
//                           ));

                        },
                      ),
                    )
                  ],
                ),

                getThemeButton("Sign In", themeGreen, context, true, (){

                  String email = txtEmail.text;
                  String password = txtPassword.text;

                  if(email == null || email.length == 0){
                    showToast("Please enter email");
                    return;
                  }

                  else if(password == null || password.length == 0){
                    showToast("Please enter password");
                    return;
                  }else{

                  }

                }),
              ],
            ),
          )
        ],
      ),
    ));
  }
}