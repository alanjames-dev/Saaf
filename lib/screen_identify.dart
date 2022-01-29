import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:saaf/screen_mlresults.dart';

class Identify extends StatefulWidget {
   Identify({ Key? key , required this.cameras}) : super(key: key);

  List<CameraDescription> cameras;

  @override
  State<Identify> createState() => _IdentifyState();
}

class _IdentifyState extends State<Identify> {
  
  late CameraController cameraController;
  XFile? pictureFile;

  Widget cameraWidget(context) {
    var camera = cameraController.value;
    // fetch screen size
    final size = MediaQuery.of(context).size;

    // calculate scale depending on screen and camera ratios
    // this is actually size.aspectRatio / (1 / camera.aspectRatio)
    // because camera preview size is received as landscape
    // but we're calculating for portrait orientation
    var scale = size.aspectRatio * camera.aspectRatio;

    // to prevent scaling down, invert the value
    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(cameraController),
      ),
    );
  }

  @override
  void initState() {
    
  
    cameraController =
        CameraController(widget.cameras[1], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });

    super.initState();

  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SafeArea(
        child: Column(
          children: [
            if (pictureFile == null)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                        child: SizedBox(
                      // width: 200,
                      height: 500,
                      //child: CameraPreview(cameraController),
                      child: cameraWidget(context),
                    )),
                  ),
                  
                ],
              ),]

        ),);
    
  }
}


