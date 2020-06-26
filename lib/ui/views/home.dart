import 'package:bankingapp/datamodels/account.dart';
import 'package:bankingapp/datamodels/transaction.dart';
import 'package:bankingapp/ui/shared_widgets/bank_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';

final List<Transaction> txs = [
  Transaction(-8.99, 'Amazon', 'assets/img/amazon.png'),
  Transaction(500, 'Savings', 'assets/img/savings.png'),
  Transaction(-25.98, 'Sainsbury\'s', 'assets/img/sainsburys.png'),
  Transaction(-11.49, 'Deliveroo', 'assets/img/deliveroo.png'),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final f = NumberFormat();
  final List<Account> _cards = [
    Account('Current Account', Colors.red, 6803.16,
        lastFourDigits: [5, 9, 2, 8],
        logo: 'monzo',
        expiresEnd: [0, 8, 2, 2],
        cardholderName: 'John Appleseed'),
    Account('Savings', Colors.blue, 85000.00,
        image: AssetImage('assets/img/savings.png')),
  ];

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
          _cards[_cardIndex].name,
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
          Column(
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '£',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: f.format(_cards[_cardIndex].balance.toInt()),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 28,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        TextSpan(
                          text: _cards[_cardIndex]
                              .balance
                              .toStringAsFixed(2)
                              .substring(_cards[_cardIndex]
                                  .balance
                                  .toStringAsFixed(2)
                                  .indexOf('.')),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: <Widget>[
                  Container(
                    height: 165,
                    width: MediaQuery.of(context).size.width,
                    child: Swiper(
                      index: _cardIndex,
                      itemBuilder: (BuildContext context, int index) {
                        return BankCard(_cards[index]);
                      },
                      onIndexChanged: (index) {
                        setState(() {
                          _cardIndex = index;
                        });
                      },
                      itemCount: _cards.length,
                      viewportFraction: 0.7,
                      scale: 0.9,
                      loop: false,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AccountAction(
                      iconData: Icons.credit_card,
                      onPress: () {},
                      text: 'Account',
                    ),
                    AccountAction(
                      iconData: Icons.remove_red_eye,
                      onPress: () {},
                      text: 'PIN & card\n number',
                    ),
                    AccountAction(
                      iconData: Icons.ac_unit,
                      onPress: () {},
                      text: 'Freeze',
                    ),
                    AccountAction(
                      iconData: Icons.add,
                      onPress: () {},
                      text: 'Add money',
                    ),
                  ],
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.425,
            minChildSize: 0.425,
            builder: (context, scrollController) {
              return Card(
                elevation: 15.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                margin: const EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 12),
                    Container(
                      height: 5,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        controller: scrollController,
                        itemCount: txs.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(txs[index].asset),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            txs[index].name,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                            ),
                          ),
                          trailing: RichText(
                            text: TextSpan(
                              style: txs[index].amount > 0
                                  ? TextStyle(color: Colors.green)
                                  : TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                txs[index].amount > 0
                                    ? TextSpan(
                                        text: '+',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18))
                                    : TextSpan(),
                                TextSpan(
                                  text: txs[index].amount.toStringAsFixed(0),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                TextSpan(
                                  text: txs[index]
                                      .amount
                                      .toStringAsFixed(2)
                                      .substring(
                                        txs[index]
                                            .amount
                                            .toStringAsFixed(2)
                                            .indexOf('.'),
                                      ),
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
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

class AccountAction extends StatelessWidget {
  const AccountAction({
    Key key,
    @required IconData iconData,
    @required Function onPress,
    @required String text,
  })  : this.iconData = iconData,
        this.onPress = onPress,
        this.text = text,
        super(key: key);

  final IconData iconData;
  final Function onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Ink(
          width: 35,
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: Icon(iconData, size: 20),
            color: Colors.white,
            onPressed: onPress,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            color: Colors.lightBlue[400],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class AppBarIcon extends StatelessWidget {
  final IconData iconData;
  final double size;
  const AppBarIcon({
    Key key,
    IconData iconData,
    double size,
  })  : this.iconData = iconData,
        this.size = size ?? 25,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {},
      child: Icon(iconData, color: Colors.lightBlue, size: size),
    );
  }
}
