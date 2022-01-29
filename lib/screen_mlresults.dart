import 'package:flutter/material.dart';

class MLResults extends StatelessWidget {
  const MLResults({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saaf"),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.exit_to_app), onPressed: (){
        Navigator.of(context).pushNamedAndRemoveUntil("root", (route) => false);
      },),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              objectIdentified(
                identified: true, 
              name: "Potatoes", 
              biodegrade: true,
              recycle: true,
              treatment: "Can be treated",
              harms: "Very Harmful"
              ),
              

              

            ],

          ),
        ),
        
      ),
    );
  }
}

Widget objectIdentified({ required bool identified, String? name, bool? biodegrade, bool? recycle, String? treatment, String? harms } ){
  if(identified)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text("Object Identified", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          Text("${name}"),
          
            ],
          ),
        ),
        Divider(),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CATEGORY"),
          if(biodegrade == true) Text("Biodegradable",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)) else Text("Non-Biodegradable",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Divider(),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("MATERIAL"),
          if(recycle == true) Text("Recyclable",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
          else Text("Non-Recyclable",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Divider(),

        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.greenmatters.com%2Fbrand-img%2FItPnJ%2F0x0%2Fwhat-is-composting-1539283210573-1539283216657.jpg&f=1&nofb=1"),),
          title: Text("Treating and Composting"),
          subtitle: Text(treatment!),
          
        ),
        Divider(),

        ListTile(
          leading: Image(width:100 ,image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fimg.xcitefun.net%2Fusers%2F2015%2F01%2F377937%2Cxcitefun-overpopulation-6.jpg&f=1&nofb=1"),),
          title: Text("Harmful Effects"),
          subtitle: Text(harms!),
          
        )



      ],
    );
  else 
    return Text ("Identification Failed");
  
}