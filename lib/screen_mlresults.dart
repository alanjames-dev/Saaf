import 'package:flutter/material.dart';

class MLResults extends StatelessWidget {
  const MLResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saaf"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("root", (route) => false);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              objectIdentified(
                  identified: true,
                  name: "Potatoes (Condition: Rotten)",
                  biodegrade: true,
                  recycle: true,
                  treatment: "What should you do? | Click Here ",
                  harms:
                      "Rotting potatoes give off a noxious solanine gas that can make a person unconscious if they’ve inhaled enough. There have even been cases of people dying in their root cellars due to unbeknownst rotting potatoes."),
            ],
          ),
        ),
      ),
    );
  }
}

Widget objectIdentified(
    {required bool identified,
    String? name,
    bool? biodegrade,
    bool? recycle,
    String? treatment,
    String? harms}) {
  if (identified)
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Object Identified",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
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
              if (biodegrade == true)
                Text("Biodegradable",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
              else
                Text("Non-Biodegradable",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
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
              if (recycle == true)
                Text("Recyclable",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
              else
                Text("Non-Recyclable",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Divider(),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.mrsocialkeeda.com/wp-content/uploads/2016/09/main-qimg-0195661f907ee43003dd15c35aae3a0b.png"),
          ),
          title: Text("Treating and Composting"),
          subtitle: Text(treatment!),
        ),
        Divider(),
        ListTile(
          leading: Image(
            width: 100,
            image: NetworkImage(
                "https://media.istockphoto.com/photos/closeup-of-rotten-potatoes-on-white-table-picture-id826775064?k=20&m=826775064&s=612x612&w=0&h=05YYZ601o_UE8D4xifg2r1WLqIUNQtagWAJ25LGuB-I="),
          ),
          title: Text("Harmful Effects"),
          subtitle: Text(harms!),
        )
      ],
    );
  else
    return Text("Identification Failed");
}
