import 'package:flutterdemo/views/scanning_pages/syllabus_list.dart';

import '../../imports.dart';

class ScanHistory extends StatefulWidget {
  const ScanHistory({super.key});

  @override
  State<ScanHistory> createState() => _ScanHistoryState();
}

class _ScanHistoryState extends State<ScanHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String schoolName = context.read<UserProvider>().userProfile.schoolName;
      context
          .read<ScannedListProvider>()
          .fetchScannedListAccordingToSchoolName(schoolName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final scannedLists = context.watch<ScannedListProvider>().scannedLists;
    print(scannedLists.toList());

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: screenHeight * 0.9,
        child: Center(
          child: Column(
            children: [
              const HeaderBar(title: "Scanned Lists"),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 20, bottom: 0, left: 10, right: 10),
              //   child: SearchBar(
              //     width: screenWidth * 0.9,
              //     screenHeight: screenHeight,
              //   ),
              // ),
              Expanded(
                child: scannedLists.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        itemBuilder: (context, index) =>
                            scanListTile(scanItem: scannedLists[index]),
                        itemCount: scannedLists.length,
                      )
                    : Center(
                        child: const Text("No Lists Found"),
                      ),
              ),
              Buttons(
                ButtonName: "Scan New List",
                functionToComply: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//list tile

class scanListTile extends StatefulWidget {
  const scanListTile({super.key, required this.scanItem});

  final ScannedList scanItem;

  @override
  State<scanListTile> createState() => _scanListTileState();
}

class _scanListTileState extends State<scanListTile> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SyllabusList(scannedList: widget.scanItem),
            ),
          );
        },
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListtitleText(
            text: widget.scanItem.schoolName,
            align: TextAlign.left,
            size: screenHeight * 0.022,
          ),
        ),
        subtitle: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
          child: SubtitleListTileText(
            text: "Grade ${widget.scanItem.grade}",
            align: TextAlign.left,
            size: screenHeight * 0.019,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios,
              color: MyColors.subtitleColor),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      SyllabusList(scannedList: widget.scanItem)),
            );
          },
        ),
      ),
    );
  }
}
