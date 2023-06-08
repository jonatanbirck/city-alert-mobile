import 'package:flutter/material.dart';

import 'information_page.dart';
import 'maps_page.dart';
import 'routes_page.dart';

class HomePage extends StatefulWidget {
  final int selectedIndex;

  const HomePage({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;
  List<Widget> pages = const [
    MapsPage(),
    RoutesPage(),
    InformationPage()
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 4,
        backgroundColor: Colors.indigo,
        title: const Text("Cidade Limpa", style: TextStyle(color: Colors.white),),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: "Rotas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "Informativo",
          )
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}