import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Links in flutter')),
        body: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,              
            children:[   
               Linkify(
               style: const TextStyle(color: Colors.yellow),
                  linkStyle: const TextStyle(color: Colors.red),
              text: "Welcome To - https://flutter.dev",
                
                   onOpen: (linki){
                     launch(linki.url);
          // print("opened succesfully ${linki.url}");
                   },
                   
                   //options: const LinkifyOptions(humanize: true,removeWww: false),
             ),

                            RichText(
          text:  TextSpan(
             children: [
             
                    
                const TextSpan(
                      text: "Welcome To",
                      style: TextStyle(color: Colors.black)
                 ),
                                TextSpan(
                      text: "Futter website", 
                      style: const TextStyle(
                           color: Colors.blue,
                           fontWeight: FontWeight.bold,
                           //decoration: TextDecoration.underline,
                     ),
                        recognizer: TapGestureRecognizer()..onTap=() async{
                          var url ="https://flutter.dev";
                            if (!await launch(url)) throw 'Could not launch $url';
                          /*if(await canLaunch(url)){
                              await launch(url);
                          }
                          else{
                            //throw("Could not launch $url");
                            const Text("Could not lauch");
                          }   */
                        },
                 )    
                 
             ]
       ),
),

             Linkify(
               style: const TextStyle(color: Colors.yellow),
                  linkStyle: const TextStyle(color: Colors.red),
              text: "Welcome To - https://flutter.dev",
                
                   onOpen: (linki){
                     launch(linki.url);
          // print("opened succesfully ${linki.url}");
                   },
                   
                   //options: const LinkifyOptions(humanize: true,removeWww: false),
             ),
              SelectableLinkify(
  text: "Made by https://cretezy.com\n\nMail: example@gmail.com",
      onOpen: (linki) async{
          if (await canLaunch(linki.url)) {
          await launch(linki.url);
      } else {
          throw 'Could not launch $linki';
      }
      },
),
                    
              
          ]
          ),
        ),
      ),
    );
  }
}