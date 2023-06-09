import 'package:camera/camera.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../imports.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late List<String> result = [];
  late XFile? pickedImage;
  bool initial = false;

  @override
  void initState() {
    startCamera();
    super.initState();
    setState(() {});
    Future.delayed(const Duration(seconds: 1), () {
      initial = true;
      setState(() {});
    });
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
        result.removeAt(0);
        Provider.of<ScannedListProvider>(context, listen: false)
            .saveScannedList(
                result,
                context.read<UserProvider>().user.schoolName,
                context.read<UserProvider>().user.grade);
        result = [];

        Provider.of<ScannedListProvider>(context, listen: false)
            .fetchScannedListAccordingToSchoolName(
                context.read<UserProvider>().user.schoolName);
      },
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.buttonColor,
      ),
      backgroundColor: MyColors.buttonColor,
      body: initial == true
          ? Stack(
              children: [CameraPreview(cameraController), optionRow()],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget optionRow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              if (pickedImage != null) {
                dialogs.errorToast(
                  error: TextFormatter.firebaseError(
                      "Please upload or capture an image first in order to scan"),
                );
              } else {
                imageToText(pickedImage);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const LoadingScreen()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.subtitleColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                minimumSize: const Size(120, 40),
                foregroundColor: Colors.white),
            child: const Text("SCAN"),
          ),
          GestureDetector(
              onTap: () {
                imageToText(pickedImage);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: captureButton(),
              )),
          GestureDetector(
            onTap: () async {
              XFile? pickedFile = await pickImageFromGallery();
              setState(() {
                pickedImage = pickedFile;
              });
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

  Future<CroppedFile?> cropSquareImage(XFile imageFile) async {
    File image = File(imageFile.path);
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      compressQuality: 70,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    print("cropping is working");
    if (croppedFile != null) {
      imageToText(croppedFile);
      // image = croppedFile as File;

    }

    return croppedFile;
  }

  Widget captureButton() {
    return GestureDetector(
      onTap: () async {
        await cameraController.takePicture().then(
          (XFile? file) async {
            if (mounted) {
              if (file != null) {
                CroppedFile? res = await cropSquareImage(file);
                if (res != null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const LoadingScreen()),
                  );
                }
                // setState(() {
                //   pickedFile = file;
                // });
              }
            }
          },
        );
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
