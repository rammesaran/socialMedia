import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialmedia/api/apiservice.dart';
import 'package:socialmedia/model/usermodel.dart';
import 'package:socialmedia/screen/postScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ApiServie servie = ApiServie();
  bool isloading = false;

  Future getApi(String name) async {
    List<User> response = await servie.getUserInfo(name);
    return response;
  }

  TextEditingController userInput = TextEditingController();
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 1,
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: isloading? const Center(child: CircularProgressIndicator(),) : Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(15),
              child: TextFormField(
            
                decoration:const InputDecoration( 
                  labelStyle: TextStyle(color: Colors.pink),
                      labelText: "Username",
                      prefixIcon: Icon(Icons.people, color: Colors.pink,),
                      border: OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.pink,
          width: 3,
        )
    ),
                      enabledBorder: OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.pink,
          width: 3,
        )
    ),
                      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
          color:Colors.pink,
          width: 3,
        ),),
                  ),
                controller: userInput,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isloading = true;
                  });
                  List<User> userresponse = await getApi(userInput.text.trim());
                          setState(() {
                    isloading =false;
                  });
                  if(userresponse.isNotEmpty){
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>   const PostScreen()),
        );
                  }else{
              
                                      Fluttertoast.showToast(
                    msg: "UserName is not matched", // message
                    toastLength: Toast.LENGTH_SHORT, // length
                    gravity: ToastGravity.BOTTOM, // location
                  );
                 userInput.clear();
                 
          
                  }
          
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 15.0,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
