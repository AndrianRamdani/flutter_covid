import 'package:kopit/config/palette.dart';
import 'package:kopit/widgets/custom_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar : CustomAppBar(),
      body: Container(
        child: Column(
            children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Informasi Mengenai Coronavirus',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
       Container(
          child:Column(
           children: <Widget>[
             Card(
              child: Container(
                    color: Colors.deepOrangeAccent[400],
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                child:ListTile(
                    title:RichText(
                         text :TextSpan(
                          text :"Novel Coronavirus (COVID-19) \n" 
                          +"Hal-hal yang perlu anda ketahui", 
                          style: TextStyle(color:Colors.white,
                           ),
                           recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://www.unicef.org/indonesia/id/coronavirus";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
                    ), 
                  ),
                ),
                 ),
               ),
              Card(
                child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      color: Colors.lightBlue[900],
                      child: ListTile(
                       title:RichText(
                         text :TextSpan(
                          text :"Media Informasi \n" 
                          +"Media informasi resmi penyakit Infeksi Emerging", 
                          style: TextStyle(color:Colors.white,
                           ),
                           recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://infeksiemerging.kemkes.go.id/";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
                    ), 
                  ),
                      ),
                    ),
                 ),

              Card(
                child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Colors.redAccent[700],
                    child: ListTile(
                      title:RichText(
                         text :TextSpan(
                          text :"Coronavirus Disease(COVID-19) \n" 
                          +"Coronavirus Disease advice for the public", 
                          style: TextStyle(color:Colors.white,
                           ),
                           recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
                    ), 
                  ),
                          ),
                        ),
               ),
              Card(
                child :Container(
                 margin: EdgeInsets.all(10),
                 padding: EdgeInsets.all(10),
                 color: Colors.deepPurple,
                 child: ListTile(
                   title:RichText(
                         text :TextSpan(
                          text :"Daftar Rumah Sakit \n" 
                          +"Daftar rumah sakit di Indoneis rujukan penanganan virus corona", 
                          style: TextStyle(color:Colors.white,
                           ),
                           recognizer: TapGestureRecognizer()..onTap =  () async{
                    var url = "https://jeo.kompas.com/daftar-rumah-sakit-rujukan-per-provinsi-dan-nomor-kontaknya-untuk-wabah-corona";
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                  }
                    ), 
                  ),
                 ),
              ),
            ),
           ],
          ), 
        ),
            ],
      ),
    ),
    );
  }
}