import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text("Howdy Alex", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, ),),
              SizedBox(height: 14),
              
              Row(
                children: [
                  const Icon( Icons.location_pin),
                   Text( "Kottayam, Kerala", style: TextStyle(fontSize: 16),)
                ],
        
              ),
              SizedBox(height: 10,),
              _complaintCard(title: "Complaint Title", id: "UNIQUE ID", location: "Location"),

              SizedBox(height: 42,),

              Card(
                elevation: 4.0,
                child:Stack(
                 alignment: Alignment.center,
                 children: <Widget>[
                      Image(
                        image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.camera-rumors.com%2Fwp-content%2Fuploads%2F2018%2F02%2Fsony-a7iii-sample-image-3.jpg&f=1&nofb=1"),
                        height: 200,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                     Text("News", style: TextStyle(fontSize: 55, color: Colors.white, fontWeight: FontWeight.w500),),
                 ]
)
                ),
              

              _newsTile(title: "Headline 6",
              subtitle: "Body 2", 
              avatarURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.vhv.rs%2Fdpng%2Fd%2F426-4263064_circle-avatar-png-picture-circle-avatar-image-png.png&f=1&nofb=1", 
              imageURL: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.cameraegg.org%2Fwp-content%2Fuploads%2F2016%2F01%2FNikon-D500-Sample-Images-2.jpg&f=1&nofb=1")
            
            
            ],
            
          ),]
        ),
      ),
    );
  }
}

Card _complaintCard({required String title, required String id, required String location}) => Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(id),
            trailing: Text("Status", style: TextStyle(  background: Paint()
                ..color = Colors.grey
                ..strokeWidth = 20
                ..strokeJoin = StrokeJoin.round
                ..strokeCap = StrokeCap.round
                ..style = PaintingStyle.stroke,
        
                color: Colors.black),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(location),
            leading: Icon(Icons.location_pin),
            horizontalTitleGap: 1,
    )
            ],
          ));


Card _newsTile({required String title, required String subtitle, required String avatarURL, required String imageURL}) => Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            leading:CircleAvatar(child: Image(image: NetworkImage(avatarURL), ),)
          ),
          Divider(),
          Image(
            image: NetworkImage(imageURL),
            fit: BoxFit.cover,
            )
            ],
          ));