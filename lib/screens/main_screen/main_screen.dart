import '../../providers/auth_provider.dart';
import '../empty_screen/empty_screen.dart';
import '../screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String routeName = '/MainScreen';

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    EmptyScreen(),
    ProfileScreen(),
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    @override
  void initState() {
    load();
    super.initState();
  }
  bool loading=false;
   void load(){
    setState(() {
      loading=true;
    });
  Provider.of<AuthProvider>(context,listen: false).getUser();
    setState(() {
      loading=false;
    });
   }
  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<AppProvider>(context).currentTap;
    

    return loading? 
    const CircularProgressIndicator()
    :Scaffold(
      body: MainScreen._pages[currentIndex],
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
