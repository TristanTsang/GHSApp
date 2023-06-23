import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import 'event.dart';
class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      bottomNavigationBar: myAppBar(),
      appBar: AppBar(
        title:Text("GHS Event Photos", style: TextStyle(fontSize: 25, color: Colors.white),),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Glenelg Community Events", style:TextStyle(fontSize:30, fontWeight: FontWeight.bold, color: Color(0xFF8b0000))),
            Row(
              
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.67,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                    children: [
                      ImageContainer(AssetImage("images/image1.jpg")),
                      ImageContainer(AssetImage("images/image2.jpg")),
                      ImageContainer(AssetImage("images/image3.jpg")),
                      ImageContainer(AssetImage("images/image4.jpg")),
                      ImageContainer(AssetImage("images/image5.jpg")),
                    ],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}



class  ImageContainer extends StatelessWidget {
  late ImageProvider<Object> image;
   ImageContainer(this.image){}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 15,
        surfaceTintColor: Colors.grey,
        child: Container(
          width: MediaQuery.of(context).size.width *0.75,

          decoration: BoxDecoration(
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex:1,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: image, fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:Radius.circular(20)),
                    ),
                  ),
              ),
              Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Event Title",
                      style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),),
                    Text("Event Date",
                      style: TextStyle(fontSize:15, color: Colors.grey),),
                    SizedBox(height:10),
                    Container(
                      height: 50,
                      child: Text("Event Description",
                        style: TextStyle(fontSize:15, color: Colors.grey[900]),),
                    ),
                      SizedBox(height:20),
                      RawMaterialButton(
                        onPressed: (){
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhotoGallery()));
                          };
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical:10, horizontal: 15),
                          child: Text("View More",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          decoration: BoxDecoration(
                            color: Colors.red[900],

                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                  ],),
                ),
              )

            ],
          ),
          ),
      ),
    );
  }
}

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
