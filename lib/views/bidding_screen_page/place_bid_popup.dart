
import '../../imports.dart';

class PlaceBidPopUp extends StatefulWidget {
  const PlaceBidPopUp({
    Key? key,
    required this.pid,
    required this.bid,
  }) : super(key: key);

  final String pid;
  final List<BiddingModel> bid;

  @override
  State<PlaceBidPopUp> createState() => _PlaceBidPopUpState();
}

class _PlaceBidPopUpState extends State<PlaceBidPopUp> {
  //  bool bidsFetched = false;

  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth?>(context);
    final userProfile = context.watch<UserProvider>().userProfile;
    // print("NAME"+userProfile.name);

    TextEditingController bidController = TextEditingController();
    widget.bid.sort(((a, b) => b.bid.compareTo(a.bid)));
    // context
    //     .read<BiddingProvider>()
    //     .addBid(widget.pid, user.id, int.parse(_bidController.text),userProfile.name);

    void saveMyBid(user) async {
      var bid = Bidding(
          productID: widget.pid,
          buyerName: userProfile.name,
          buyerID: user.id,
          bid: int.parse(bidController.text),
          isAccepted: false,
          isRejected: false);
      var bidid = await context.read<BiddingProvider>().addBid(bid);
      //update user's biddingIDs
      context.read<UserProvider>().addNewBid(bidid);
      context.read<UserProvider>().saveChanges();
      //update seller's sellingbiddingIDs
      Product product =
          await context.read<ProductsProvider>().getProductByID(widget.pid);
      String psellerID = product.sellerID;
      context.read<UserProvider>().updateSeller(psellerID, bidid);
    }

    Row placebid(bidController, user) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller: bidController,
              //  keyboardType: TextInputType.emailAddress,
              autofocus: false,
              // initialValue: 'sathyabaman@gmail.com',
              style: const TextStyle(
                  fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                hintText: 'Enter your bid',
                hintStyle: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 10,
                  // color: const Color.fromRGBO(74, 78, 105, 1.0)
                ),
                contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ElevatedButton(
              onPressed: () {
                saveMyBid(user);
                // context
                //     .read<BiddingProvider>()
                //     .addBid(widget.pid, user.id, int.parse(_bidController.text),userProfile.name);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  minimumSize: const Size(50, 30),
                  backgroundColor: MyColors.buttonColor,
                  textStyle: GoogleFonts.poppins(),
                  foregroundColor: MyColors.buttonTextColor,
                  shadowColor: Colors.grey),
              child: const Text("Bid"),
            ),
          )
        ],
      );
    }

    return SingleChildScrollView(
      child: AlertDialog(
        content: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.grey,
                height: 200,
                width: 200,
                child: Image.network(
                  "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ], border: Border.all(color: Colors.grey)),
                  height: 300,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Top 3 Bidder", style: MyStyles.googleTitleText(20)),
                        widget.bid.isEmpty
                            ? Container(child: const Text("There are no bids yet."),)
                            : ListView.builder(
                                shrinkWrap: true,
                                // scrollDirection: Axis.horizontal,
                                itemCount:
                                    widget.bid.length > 3 ? 3 : widget.bid.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      foregroundColor: Colors.black,
                                      child: Text(widget.bid[index].buyerName[0]),
                                    ),
                                    title: Text(widget.bid[index].buyerName),
                                    trailing:
                                        Text(widget.bid[index].bid.toString()),
                                  );
                                }),
                        Text("Your Bid!", style: MyStyles.googleTitleText(20)),
                        placebid(bidController, userAuth)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
