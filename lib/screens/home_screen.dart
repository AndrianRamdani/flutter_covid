import 'package:kopit/api/http_service.dart';
import 'package:kopit/counter.dart';
import 'package:flutter/material.dart';
import 'package:kopit/config/palette.dart';
import 'package:kopit/widgets/widgets.dart';
import 'package:kopit/api/post_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get index => null;


  @override
  Widget build(BuildContext context) {
    final DataGlobal _getGlobal = new DataGlobal();
    final DataIndonesia _getDataIndonesia = new DataIndonesia();
    final screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       extendBodyBehindAppBar: true,
       body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                        'assets/images/covit.png'),
                        fit: BoxFit.cover,),
                      ),
                    child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(1.0),
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: "CoronaVirus \n",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24
                    ),
                  children: [
                    TextSpan(
                        text: "Global & Indonesia LiveData.",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 20))
                  ]),
                ),
              ),
          ],
       ),
       Container(
         child :FutureBuilder(
            future: _getDataIndonesia.getDataIndonesia(),
            builder: (BuildContext context, AsyncSnapshot<List<Covid>> snapshot) {
              if (snapshot.hasData) {
                List<Covid> dataIndonesia = snapshot.data;
                // return ListView.builder(
                  // itemCount: dataGlobal.length,
                  // itemBuilder: (context, index){
               return Container(
              child:Column(
           children: <Widget>[
             Card(
              child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    color: Colors.deepOrangeAccent[400],
                    child:ListTile(
                        title : Text(
                          "Positif", 
                          style: TextStyle(color:Colors.white)
                          ),
                        subtitle : Text(
                          dataIndonesia[0].positif,
                          // "1000",
                          style: TextStyle(color: Colors.white,),
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
                        title : Text(
                          "Sembuh", 
                          style: TextStyle(color:Colors.white)
                          ),
                        subtitle : Text(
                          dataIndonesia[0].sembuh,
                          // "800",
                          style: TextStyle(color: Colors.white,),
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
                      title : Text(
                        "Meninggal", 
                        style: TextStyle(color:Colors.white)
                        ),
                      subtitle : Text(
                        dataIndonesia[0].meninggal,
                        // "100",
                        style: TextStyle(color: Colors.white,),
                          ),
                          ),
                        ),
               ),
              ].toList(),
            ) 
            );
        }else{
          return Center(
              child: CircularProgressIndicator()
              );}
        },
        ),
      ),
        ],
    ),
       ),
  
    // CustomScrollView(
    //     physics: ClampingScrollPhysics(),
    //     slivers: <Widget>[
    //       _buildHeader(screenHeight),
    //       _buildPreventionTips(screenHeight),
    //       _buildYourOwnTest(screenHeight),
    //     ],
    //   ),
    // );
  );

//   SliverToBoxAdapter _buildHeader(double screenHeight) {
//     return SliverToBoxAdapter(
//       child: Container(
//         padding: const EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           color: Palette.primaryColor,
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(40.0),
//             bottomRight: Radius.circular(40.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   'Coronavirus',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 25.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
                
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.03),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Global & Indonesia LiveData',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 22.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
                
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.03),
//           ],
//         ),
//       ),
//     );
//   }

//   SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
//     return SliverToBoxAdapter(
//       child: Container(
//         padding: const EdgeInsets.all(5.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Coronavirus Global',
//               style: const TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Container(
//         margin: const EdgeInsets.symmetric(
//           vertical: 10.0,
//           horizontal: 20.0,
//         ),
//         padding: const EdgeInsets.all(10.0),
//         height: screenHeight * 0.15,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFAD9FE4), Palette.primaryColor],
//           ),
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child:Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//               // children: <Widget>[
//               //   Counter(
//               //     number: 1046,
//               //     title: "Positif",
//               //   ),
//               //   Counter(
//               //     number: 87,
//               //     title: "Sembuh",
//               //   ),
//               //   Counter(
//               //     number: 46,
//               //     title: "Meninggal",
//               //   ),
//               // ],
//               ),),
//             ),
//           ],
//         ),
//         ),
//     );
//   }

//   SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
//     final DataIndonesia _getIndonesia = new DataIndonesia();
//    return SliverToBoxAdapter(
//       child: Container(
//         padding: const EdgeInsets.all(5.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Coronavirus Indonesia',
//               style: const TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Container(
//         margin: const EdgeInsets.symmetric(
//           vertical: 10.0,
//           horizontal: 20.0,
//         ),
//         padding: const EdgeInsets.all(10.0),
//         height: screenHeight * 0.15,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFAD9FE4), Palette.primaryColor],
//           ),
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Container(
//           child: FutureBuilder(
//             future: _getIndonesia.getDataIndonesia(),
//             builder: (BuildContext context, AsyncSnapshot<List<Covid>> snapshot) {
//               if (snapshot.hasData) {
//                 List<Covid> dataIndonesia = snapshot.data;
//                 return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     Text('Positif'),
//                     Text(dataIndonesia[index].positif),
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Text('Sembuh'),
//                     Text(dataIndonesia[index].sembuh),
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Text('Meninggal'),
//                     Text(dataIndonesia[index].meninggal),
//                   ],
//                 ),
//               ].toList(),
//             );
//             }else{
//               return Center(
//                   child: CircularProgressIndicator(),
//                 );
//             }
//           }
//         ),
//         ),
//       ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  }
}