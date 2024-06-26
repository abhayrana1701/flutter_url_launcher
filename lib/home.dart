import 'package:flutter/material.dart';
import "package:url_launcher/url_launcher.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<void> launchDialer(String url) async{
    if(!await launchUrl(Uri.parse("tel:$url"))){
      throw Exception("Cannot launch $url");
    }
  }

  Future<void> launchURL(String url) async{
    if(!await launchUrl(Uri.parse(url))){
      throw Exception("Cannot launch $url");
    }
  }

  Future<void> sendSMS(String url,String message) async{
    if(!await launchUrl(Uri.parse('sms:$url?body=${Uri.encodeQueryComponent(message)}'))){
      throw Exception("Cannot launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher",style: TextStyle(color: Color.fromRGBO(223,182,126,1),),),
        backgroundColor: Color.fromRGBO(18, 56,77,1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height:20),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(18, 56,77,1),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                children: [
                  SizedBox(height:15),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:10,
                    color:  Color.fromRGBO(223,182,126,1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius:40,
                              backgroundImage: AssetImage("assets/profile.jpg"),
                            ),
                            SizedBox(height:10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                color:Colors.white,
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed:(){
                                        launchURL("https://www.linkedin.com/in/abhay-rana-a3389a232");
                                      },
                                      icon: Image(image: AssetImage("assets/linkedin.png")),
                                  ),
                                  IconButton(
                                    onPressed:(){
                                      launchDialer("9517979498");
                                    },
                                    icon: Image(image: AssetImage("assets/call.jpg")),
                                  ),
                                  IconButton(
                                    onPressed:(){
                                      sendSMS("9517979498", "Hi Abhay");
                                    },
                                    icon: Image(image: AssetImage("assets/mess.jpg")),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Abhay Rana",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromRGBO(223,182,126,1)),),
                                SizedBox(height:10),
                                Text("Flutter Developer",style: TextStyle(color: Color.fromRGBO(223,182,126,1)),),
                                Text("Jalandhar, Punjab",style: TextStyle(color: Color.fromRGBO(223,182,126,1)),),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:10,
                    color:  Color.fromRGBO(223,182,126,1),
                  ),
                  SizedBox(height:15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
