import 'package:bankingapp/mock/data.dart';
import 'package:bankingapp/ui/shared_widgets/app_bar_icon.dart';
import 'package:bankingapp/ui/views/home/widgets/card_selector.dart';
import 'package:bankingapp/ui/views/home/widgets/transactions_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final f = NumberFormat();

  int _cardIndex = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppBarIcon(iconData: Icons.account_circle, size: 30),
        title: Text(
          cards[_cardIndex].name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: <Widget>[
          AppBarIcon(iconData: Icons.pie_chart),
          SizedBox(width: 15),
          AppBarIcon(iconData: Icons.search, size: 27.5),
          SizedBox(width: 15),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          MonzoCardSelector(f: f, cardIndex: _cardIndex),
          MonzoTransactionsView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            title: Text('Payments'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text('Help'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
