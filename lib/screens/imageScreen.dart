import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("GHS Event Photos", style: TextStyle(fontSize: 25, color: Colors.white),),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageContainer(AssetImage("images/image1.jpg")),
              SizedBox(height:20),
              ImageContainer(AssetImage("images/image2.jpg")),
              SizedBox(height:20),
              ImageContainer(AssetImage("images/image3.jpg")),
              SizedBox(height:20),
              ImageContainer(AssetImage("images/image4.jpg")),
              SizedBox(height:20),
              ImageContainer(AssetImage("images/image5.jpg")),
            ],
          ),
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
    return Material(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(5),
        ),
        width:400,
        height:200,
      ),
    );
  }
}
