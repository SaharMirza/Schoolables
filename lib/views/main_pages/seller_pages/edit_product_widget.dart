
import '../../../imports.dart';

class EditProductFields extends StatefulWidget {
   EditProductFields(
      {super.key, required this.sellerProduct });

  Product sellerProduct;
  @override
  State<EditProductFields> createState() => _EditProductFieldsState();
}

class _EditProductFieldsState extends State<EditProductFields> {
  List<String> category = ["Books", "Stationary", "Calculator"];
  List<String> subCategory = ["English", "Math", "Physics", "Calculator", "Pen", "Urdu","Leather Bag"];
  List<String> condition = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  bool isEmpty = false;
  var downloadUrls = [];

  String _currentCategory = '';
  String _currentCondition = '';
  String _currentSubCategory = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<UserProvider>().userProfile;

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    priceController.text=widget.sellerProduct.price.toString();
    titleController.text=widget.sellerProduct.title;

    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: FormTextField(
              FieldLabel: "Title",
              hintText: widget.sellerProduct.title,
              controller: titleController,
              isEmpty: false,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category", style: MyStyles.googleTextFieldLabelStyle),
                  dropdownCategory()
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sub Category",
                      style: MyStyles.googleTextFieldLabelStyle),
                  dropDownSubCategory()
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Condition", style: MyStyles.googleTextFieldLabelStyle),
                  dropdownCondition()
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FormTextField(
              FieldLabel: "Price",
              hintText: widget.sellerProduct.price.toString(),
              controller: priceController,
              isEmpty: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: LocationTextFieldNBtn(screenWidth: screenWidth),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: screenHeight * 0.15 - screenWidth * 0.02,
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.textColor),
                color: MyColors.startColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                const Icon(Icons.info_outlined),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Pickup point helps the buyer to locate where your book is located. You an change the location and mark it near your college as to reach more number of potential buyers.",
                    style: MyStyles.googleTitleText(screenWidth * 0.03),
                  ),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                      Product product = Product(
                      id:widget.sellerProduct.id,
                      sellerID: userProfile.id,
                      title: titleController.text,
                      price: int.parse(priceController.text),
                      images: widget.sellerProduct.images,
                      category: _currentCategory,
                      subCategory: _currentSubCategory,
                      condition: _currentCondition);
                      context.read<ProductsProvider>().updateProduct(product);
                   Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.buttonColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Save Changes",
                      style: TextStyle(color: Colors.white)),
                ),
              ))
        ],
      ),
    );
  }

// dropdown widget for Condition
  StatefulBuilder dropdownCondition() {
    _currentCondition = widget.sellerProduct.condition;
    String currentConditon = widget.sellerProduct.condition;
    return StatefulBuilder(builder: ((context, setState) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 2),
              child: DropdownButton(
                value: widget.sellerProduct.condition,
                hint: Text(widget.sellerProduct.condition),
                isExpanded: true,
                underline: Container(),
                focusColor: Colors.white,
                items: condition.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  print(value);
                  currentConditon = value!;
                  _currentCondition=currentConditon;
                  setState(
                        () {},
                  );
                  print(currentConditon);
                },
              )));
    }));
  }

// dropdown widget for SubCategory
  StatefulBuilder dropDownSubCategory() {
    _currentSubCategory=widget.sellerProduct.subCategory;
    String currentSubCategory=widget.sellerProduct.subCategory;
    return StatefulBuilder(
      builder: ((context, setState) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 2),
            child: DropdownButton(
              value: currentSubCategory,
              hint: Text(currentSubCategory),
              isExpanded: true,
              underline: Container(),
              focusColor: Colors.white,
              items: subCategory.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (value) {
                print(value);
                currentSubCategory = value!;
                _currentSubCategory = currentSubCategory;
                setState(
                      () {},
                );
                print(currentSubCategory);
              },
            ),
          ),
        );
      }),
    );
  }

// dropdown widget for Category
  StatefulBuilder dropdownCategory() {
    _currentCategory=widget.sellerProduct.category;
    String currentCategory=widget.sellerProduct.category;
    return StatefulBuilder(builder: ((context, setState) {
      return DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 2),
              child: DropdownButton(
                value: currentCategory,
                hint: Text(currentCategory),
                isExpanded: true,
                underline: Container(),
                focusColor: Colors.white,
                items: category.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  print(value);
                  currentCategory = value!;
                  _currentCategory = currentCategory;
                  setState(() {});
                  print(currentCategory);
                },
              )));
    }));
  }
}