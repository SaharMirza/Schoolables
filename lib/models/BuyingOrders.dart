class BuyingOrdersClass {
  final String name;
  final String image;
  final String price;
  final String condition;
  final String progress;
  final String sellerImg;
  final String sellerName;
  final String sellerNum;

  BuyingOrdersClass({
    required this.sellerImg,
    required this.sellerName,
    required this.sellerNum,
    required this.condition,
    required this.progress,
    required this.name,
    required this.image,
    required this.price,
  });
}

List<BuyingOrdersClass> buyingOrders = [
  BuyingOrdersClass(
      condition: "7/10",
      progress: "In Progress",
      name: "Karwan e Urdu",
      image:
          "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fG1hdGglMjBib29rfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      price: "500",
      sellerImg:
          "https://media.istockphoto.com/id/1288732130/photo/portrait-of-cheerful-mixed-race-teenage-girl.jpg?b=1&s=170667a&w=0&k=20&c=R3BwP5rv0nG441whzRmAaLXCs9OZMdZHKOfUw0oj4sQ=",
      sellerName: "Qiblatain Fatima",
      sellerNum: "03321233400"),
  BuyingOrdersClass(
      condition: "5/10",
      progress: "Cancelled",
      name: "Olevel Math",
      image:
          "https://images.unsplash.com/photo-1455885661740-29cbf08a42fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2xhc3NpYyUyMGJvb2tzfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      price: "700",
      sellerImg:
          "https://media.istockphoto.com/id/1288732130/photo/portrait-of-cheerful-mixed-race-teenage-girl.jpg?b=1&s=170667a&w=0&k=20&c=R3BwP5rv0nG441whzRmAaLXCs9OZMdZHKOfUw0oj4sQ=",
      sellerName: "Qiblatain Fatima",
      sellerNum: "03321233400"),
  BuyingOrdersClass(
      condition: "8/10",
      progress: "Completed",
      name: "Cambridge Science",
      image:
          "https://images.unsplash.com/photo-1565022536102-f7645c84354a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZW5nbGlzaCUyMGdyYW1tYXJ8ZW58MHx8MHx8&w=1000&q=80",
      price: "1000",
      sellerImg:
          "https://media.istockphoto.com/id/1288732130/photo/portrait-of-cheerful-mixed-race-teenage-girl.jpg?b=1&s=170667a&w=0&k=20&c=R3BwP5rv0nG441whzRmAaLXCs9OZMdZHKOfUw0oj4sQ=",
      sellerName: "Qiblatain Fatima",
      sellerNum: "03321233400"),
  BuyingOrdersClass(
      condition: "9/10",
      progress: "In Progress",
      name: "Geography",
      image:
          "https://images.unsplash.com/photo-1607776639522-3754b6893ac7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJvb2tzJTIwYW5kJTIwbGFwdG9wfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      price: "250",
      sellerImg:
          "https://media.istockphoto.com/id/1288732130/photo/portrait-of-cheerful-mixed-race-teenage-girl.jpg?b=1&s=170667a&w=0&k=20&c=R3BwP5rv0nG441whzRmAaLXCs9OZMdZHKOfUw0oj4sQ=",
      sellerName: "Roha Khan",
      sellerNum: "03321233400"),
];
