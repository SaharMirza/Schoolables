import 'imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => TabNotifier()),
        ChangeNotifierProvider(create: (_) => ParentProvider()),
        ChangeNotifierProvider(create: (_) => ChildProvider()),
        ChangeNotifierProvider(create: (_) => BiddingProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => ScannedListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Schoolables',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const LogoWidget(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<UserAuth?>(context);
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        print('user statue ${userAuth?.id}');
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong!"),
          );
        } else if (snapshot.hasData) //if the user was logged in
        {
          Future.delayed(const Duration(seconds: 1), () async {
            context.read<UserProvider>().loadUser(userAuth);
            context.read<BiddingProvider>().fetchBids();
            context.read<ProductsProvider>().fetchProducts();
            context.read<ChildProvider>().fetchChildern();
            context.read<CategoriesProvider>().fetchCategories();
            context.read<UserProvider>().loadUsers();
          });
          return const BottomNavBar();
        } else //if the user was logged out
        {
          return const RoleScreen();
        }
      },
    ));
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 300,
            width: 300,
          ),
          Text("Schoolables",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 36))
        ],
      ),
      backgroundColor: MyColors.startColor,
      splashIconSize: 400,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      centered: true,
      nextScreen: const MyHomePage(title: " "),
    );
  }
}
