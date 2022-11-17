import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/views/Scanning%20Pages/Loading_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    cameraController =
        CameraController(cameras[0], ResolutionPreset.high, enableAudio: false);

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); // to refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.buttonColor,
        ),
        backgroundColor: MyColors.buttonColor,
        body: Stack(
          children: [CameraPreview(cameraController), optionRow()],
        ),
      );
    } else {
      return const SizedBox(
        child: Text("Select Camera"),
      );
    }
  }

  Widget optionRow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoadingScreen()),
              );
            },
            child: Text("SCAN"),
            style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.subtitleColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                minimumSize: const Size(120, 40),
                foregroundColor: Colors.white),
          ),
          GestureDetector(
              onTap: () {
                cameraController.takePicture().then((XFile? file) {
                  if (mounted) {
                    if (file != null) {
                      print("Picture saved to ${file.path}");
                    }
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CaptureButton(),
              )),
          const Text(
            "UPLOAD",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget CaptureButton() {
    return Container(
      margin: const EdgeInsets.only(
        //left: 20,
        bottom: 20,
      ),
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(2, 2), blurRadius: 10)
          ]),
      child: const Center(
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.black54,
        ),
      ),
    );
  }
}
