import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/colors.dart';
import 'package:flutterdemo/views/Scanning%20Pages/loading_screen.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../provider/scanned_list_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late List<String> result = [];
  XFile? pickedFile;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

//searches for available cameras and picks the first camera available initialises it.
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

// function that does text detection on image and converts it into text
  Future imageToText(img) async {
    InputImage inputImage = InputImage.fromFilePath(img!.path);
    final textDetector = TextRecognizer(
      script: TextRecognitionScript.latin,
    );
    final RecognizedText recognisedText = await textDetector.processImage(
      inputImage,
    );

    setState(
      () {
        String text = recognisedText.text;
        print(text);
        for (TextBlock block in recognisedText.blocks) {
          //each block of text/section of text
          final String text = block.text;
          // print("block of text: ");
          // print(text);
          for (TextLine line in block.lines) {
            String _line = line.text;
            result.add(_line);
          }
        }
      },
    );

    print(result);

    List<ProductModel> scannedProducts =
        await Provider.of<ScannedListProvider>(context, listen: false)
            .scannedProducts;
    print(scannedProducts.toString());
  }

  parsethetext(XFile pickedFile) async {
    var bytes = File(pickedFile.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    return img64;
  }

  OCRThroughAPI(String img64) async {
    String parsedtext = '';

    var url = Uri.parse('https://api.ocr.space/parse/image');
    var payload = {
      "base64Image": "data:image/jpg;base64,${img64}",
      // "isTable": "true",
      "scale": "true",
      "OCREngine": "2"
    };
    var header = {"apikey": "K89478109688957"};
    var post = await http.post(url = url, body: payload, headers: header);

    var result = jsonDecode(post.body);
    print(result);
    // print(result);
    setState(() {
      parsedtext = result['ParsedResults'][0]['ParsedText'];
      print(parsedtext);
    });
  }

// picks image from gallery and calls image to text function
  pickImageFromGallery() async {
    final picker = ImagePicker();
    InputImage inputImage;
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        // imageToText(pickedFile);
      } else {
        print('No image selected.');
      }
    });
    return pickedFile;
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
                imageToText(pickedFile);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CaptureButton(),
              )),
          GestureDetector(
            onTap: () async {
              XFile pickedFile = await pickImageFromGallery();
              String img64 = await parsethetext(pickedFile);
              OCRThroughAPI(img64);
            },
            child: const Text(
              "UPLOAD",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget CaptureButton() {
    return GestureDetector(
      onTap: () {
        cameraController.takePicture().then((XFile? file) {
          if (mounted) {
            if (file != null) {
              setState(() {
                pickedFile = file;
              });
              print("Picture saved to ${file.path}");
            }
          }
        });
      },
      child: Container(
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
      ),
    );
  }
}
