import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:async/async.dart';
import 'package:geocode/geocode.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String locationName = "Kottayam, Kerala";

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    GeoCode geoCode = GeoCode();

    var currentLocation = Location();
    final location = await currentLocation.getLocation();
    try {
      if (location.latitude != null && location.longitude != null) {
        final addresses = await geoCode.reverseGeocoding(
            latitude: location.latitude!, longitude: location.longitude!);
        setState(() {
          locationName = addresses.streetAddress! + "," + addresses.region!;
        });
        print(locationName.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Howdy Alex",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  Text(
                    locationName,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _complaintCard(
                  title: "Complaint Title",
                  id: "UNIQUE ID",
                  location: "Location"),
              SizedBox(
                height: 42,
              ),
              Card(
                  elevation: 4.0,
                  child: Stack(alignment: Alignment.center, children: <Widget>[
                    Image(
                      image: NetworkImage(
                          "https://thumbs.dreamstime.com/z/kerala-india-december-plastic-waste-bottles-floating-small-river-left-careless-people-near-rice-crops-field-205351358.jpg"),
                      height: 200,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                          fontSize: 55,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ])),
              _newsTile(
                  title: "Overflow of Septic Tank",
                  subtitle: "Status: Resolved",
                  avatarURL:
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmoonvillageassociation.org%2Fwp-content%2Fuploads%2F2018%2F06%2Fdefault-profile-picture1-744x744.jpg&f=1&nofb=1",
                  imageURL:
                      "https://www.irs-restoration.com/wp-content/uploads/2017/01/sewage-spills.jpg")
            ],
          ),
        ]),
      ),
    );
  }
}

Card _complaintCard(
        {required String title,
        required String id,
        required String location}) =>
    Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              subtitle: Text(id),
              trailing: Text(
                "Status",
                style: TextStyle(
                    background: Paint()
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

Card _newsTile(
        {required String title,
        required String subtitle,
        required String avatarURL,
        required String imageURL}) =>
    Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(avatarURL),
              ),
            ),
            Divider(),
            Image(
              image: NetworkImage(imageURL),
              fit: BoxFit.cover,
            )
          ],
        ));
