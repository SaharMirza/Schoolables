
import '../../../imports.dart';

class EditProductPage extends StatefulWidget {
  EditProductPage({super.key,required this.sellerProduct});

  Product sellerProduct;
  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
@override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderBar(title: "Edit Product"),
                SizedBox(
                  height: screenHeight * 0.85,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  EditProductFields(sellerProduct: widget.sellerProduct,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
