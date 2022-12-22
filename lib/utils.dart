import 'imports.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

class _MyAppBarState extends State<MyAppBar> {

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    final bids = context.watch<BiddingProvider>().userBids;

    for (int i = 0; i < bids.length; i++) {
      if (bids[i].isAccepted == false && bids[i].isRejected == false) {
        counter++;
      }
    }

    final userProfile = context.watch<UserProvider>().userProfile;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 10.0),
            child: InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BidNotification()),
                );
              }),
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications_none_outlined,
                    size: 35,
                  ),
                  SizedBox(
                      height: 17,
                      width: 17,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Text(counter.toString()),
                      ))
                ],
              ),
            ),
          )),
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.location_on,
            color: Color.fromRGBO(74, 78, 105, 1.0),
          ),
          AreaSeletorPopup()
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
              iconSize: 50,
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditDetailsPage(),
                  ),
                );
              },
              icon: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image(
                  width: 50,
                  height: 50,
                  image: NetworkImage(userProfile.display.isEmpty
                      ? "https://static.vecteezy.com/system/resources/previews/007/033/146/original/profile-icon-login-head-icon-vector.jpg"
                      : userProfile.display),
                ),
              )
              ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
   final userProfile = context.watch<UserProvider>().userProfile;
    return SizedBox(
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // centerTitle: true,
        title: Text(title,
            style: MyStyles.googleSecondTitleText(
              20)),
        actions: [
          IconButton(
              iconSize: 50,
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EditDetailsPage(),
                  ),
                );
              },
              icon: Image(
                image: NetworkImage(userProfile.display.isEmpty
                    ? "https://static.vecteezy.com/system/resources/previews/007/033/146/original/profile-icon-login-head-icon-vector.jpg"
                    : userProfile.display),
              )
          ),
        ],
      ),
    );
  }
}

class dialogs {
  static errorToast({required String error}) {
    error = TextFormatter.errorFormatter(text: error);
    Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static Future errorDialog(
      BuildContext context, String title, String message) {
    message = TextFormatter.errorFormatter(text: message);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                // color: const Color.fromARGB(255, 59, 59, 61),
                color: Colors.redAccent),
          ),
          content: Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: const Color.fromARGB(255, 59, 59, 61),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromARGB(255, 59, 59, 61),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TextFormatter {
  static String removeSpecialCharacters(String input) {
    return input.replaceAll(RegExp(r'[^\w\s]+'), '');
  }

  static String firebaseError(String input) {
    return input.toString().split("]").last.trim();
  }

  static String errorFormatter({required String text}) {
    // Error messages Formatting
    text = text.split(" or ")[0];
    text = "${text.split(".")[0]}.";
    text = text.replaceAll("String", "Field");
    text = text.replaceAll("null", "blank");
    text = text.replaceAll("badly", "incorrectly");
    text = text.replaceAll("identifier", "email");
    return text;
  }

  static productNameFormatter(String name) {
    name = "${name.split(" ").first} ${name.split(" ").last}";
    // if both first and last name are same, remove last name
    if (name.split(" ").first == name.split(" ").last) {
      name = name.split(" ").first;
    }
    // capetalise first letter
    name = name.split(" ").map((e) {
      return e.substring(0, 1).toUpperCase() + e.substring(1);
    }).join(" ");
    return name;
  }
}

// picks image from gallery and calls image to text function
pickImageFromGallery() async {
  final picker = ImagePicker();
  XFile? img;
  InputImage inputImage;
  img = await picker.pickImage(source: ImageSource.gallery);
  if (img != null) {
    img = img;
  } else {
    dialogs.errorToast(
      error: TextFormatter.firebaseError("Please pick an image to upload"),
    );
  }

  return img;
}
