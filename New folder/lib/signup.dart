import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:untitled1/loggedIn_page.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
var snpid;
var pass;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{

      Response response = await get(
          Uri.parse('http://mobileapi.work121.com/api/AppLogin/GetMethod?associateID=8709A59B-6B47-4E30-97AC-08793E39C297&associatepwd=m56pth&licenceId=401098&licenceFor=AssetProfiling&AppVersion=1.0&geolocation=0,0&methodname=Getloginuser&AppDateTime=2021-05-04 12:00:00&UserId=0&jsonData={"UserId":"${snpid}","Password":"${pass}",}'),
          // body: {
          //   'UserId' : "SNP37938",
          //   'Password' : "1745148"
          // },
          headers: {"username":"uYfVkoP5BDouLkCBZ971sNZhzocdFLhmAvULyvsDnBo=", "password" : "/I/tmrWuA6AxGV6CiFgD/1AaOcV+2zzhS6OabhGQXVs="}
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body) ;
        print(data);
        print('Login successfully');
        // print(data["ResponseValue"].runtimeType);
        // print("alok${snpid}");
        // print("vikram${pass}");
        // print(snpid.runtimeType);
        // print(pass.runtimeType);

        if(data["ResponseValue"] !="[]")
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoggedInPage()));

      }else {
        print('failed');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed")));
      }
    }catch(e){
      print(e.toString());
    }
  }

//bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
              onEditingComplete: ()
              {
                setState(() {
                  snpid=emailController;
                  snpid=snpid.trim();
                });
              },
              onChanged:(value){
                setState(() {
                  snpid=value;
                });
              },
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
              // onEditingComplete: (){setState(() {
              //   pass=passwordController;
              // });},
onChanged: (value)
              {
                setState(() {
                  pass=value;
                });
              },


              onSubmitted: (value){
                setState(() {
                  pass=value;
                  pass=pass.trim();
                });

              },
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: (){
                print(snpid);
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Login'),),
              ),
            )
          ],
        ),
      ),

















    //   backgroundColor: Colors.deepOrangeAccent,
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: <Widget>[
    //         Stack(
    //           children: <Widget>[
    //             Container(
    //               width: double.infinity,
    //               padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    //               margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20),
    //                   color: Colors.white,
    //                   boxShadow: [
    //                     BoxShadow(
    //                         color: Colors.yellowAccent.withOpacity(0.2),
    //                         offset: Offset(0, 10),
    //                         blurRadius: 20)
    //                   ]),
    //               child: Form(
    //                 child: Column(
    //                   children: <Widget>[
    //                     SizedBox(
    //                       height: 30,
    //                     ),
    //                     Text(
    //                       "L O G I N",
    //                       style: GoogleFonts.montserrat(
    //                           fontSize: 30, color: Colors.deepOrangeAccent),
    //                     ),
    //                     SizedBox(
    //                       height: 55,
    //                     ),
    //                     new TextField(
    //                       keyboardType: TextInputType.emailAddress,
    //                       onSubmitted: (value)
    //                                 {
    //                                   setState(() {
    //                                     snpid=value;
    //                                   });
    //                                 },
    //                       decoration: new InputDecoration(
    //                         hintText: "Email Address",
    //                         enabledBorder: UnderlineInputBorder(
    //                           borderSide: BorderSide(
    //                               color: Colors.red.withOpacity(0.5)),
    //                         ),
    //                         focusedBorder: UnderlineInputBorder(
    //                           borderSide:
    //                           BorderSide(color: Colors.deepOrangeAccent),
    //                         ),
    //                         prefixIcon: Icon(
    //                           Icons.email,
    //                           color: Colors.deepOrangeAccent,
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 20,
    //                     ),
    //                     new TextField(
    //                       keyboardType: TextInputType.text,
    // onSubmitted: (value){
    //             setState(() {
    //               pass=value;
    //             });
    //
    //           },
    //                       obscureText: hidePassword,
    //                       decoration: new InputDecoration(
    //                         hintText: "Password",
    //                         enabledBorder: UnderlineInputBorder(
    //                           borderSide: BorderSide(
    //                               color: Colors.red.withOpacity(0.5)),
    //                         ),
    //                         focusedBorder: UnderlineInputBorder(
    //                           borderSide:
    //                           BorderSide(color: Colors.deepOrangeAccent),
    //                         ),
    //                         prefixIcon: Icon(
    //                           Icons.lock,
    //                           color: Colors.deepOrangeAccent,
    //                         ),
    //                         suffixIcon: IconButton(
    //                           onPressed: () {
    //                             setState(() {
    //                               hidePassword = !hidePassword;
    //                             });
    //                           },
    //                           color: Colors.deepOrangeAccent.withOpacity(0.5),
    //                           icon: Icon(hidePassword
    //                               ? Icons.visibility_off
    //                               : Icons.visibility),
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 30,
    //                     ),
    //                     ElevatedButton(
    //                       onPressed:  (){
    //                             login(emailController.text.toString(), passwordController.text.toString());
    //                           },
    //                       child: Text(
    //                         "Login",
    //                         style: GoogleFonts.sourceSansPro(
    //                             fontSize: 18,
    //                             color: Colors.white,
    //                             fontWeight: FontWeight.w500),
    //                       ),
    //                       style: ElevatedButton.styleFrom(
    //                         primary: Colors.deepOrangeAccent,
    //                         fixedSize: Size(120, 45),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   ),
     );
  }

  fn() {
    
  }
}