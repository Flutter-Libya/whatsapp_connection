import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp Button'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _launchWhatsApp(context),
            child: Text('Chat with Company'),
          ),
        ),
      ),
    );
  }

  void _launchWhatsApp(BuildContext context) async {
   //لازم اتغير رقم الهاتف هدا
    String phoneNumber = '0921234567';

  // مش لازم اتغير الرساله هدي 
    String message = Uri.encodeFull('Hello, I want to chat with your company.');

 
    String url = 'https://wa.me/$phoneNumber/?text=$message';

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to launch WhatsApp. Please check your WhatsApp installation.'),
        ),
      );
    }
  }
}
