import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text("Howdy Alex", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, ),),
            SizedBox(height: 14),
            
            Row(
              children: [
                Icon(Icons.location_pin),
                Text("Kottayam, Kerala", style: TextStyle(fontSize: 16),)
              ],

            ),
            Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text("Complaint Title"),
              subtitle: Text("ID: {UNIQUE ID}"),
              trailing: Text("Status", style: TextStyle(  background: Paint()
       ..color = Colors.grey
       ..strokeWidth = 20
       ..strokeJoin = StrokeJoin.round
       ..strokeCap = StrokeCap.round
       ..style = PaintingStyle.stroke,
       color: Colors.black),
       ),
            ),

            ButtonBar(
              children: [
                TextButton(
                  child: const Text('CONTACT AGENT'),
                  onPressed: () {/* ... */},
                ),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {/* ... */},
                )
              ],
            )
          ],
        ))
          ],
          
        ),
      ),
    );
  }
}