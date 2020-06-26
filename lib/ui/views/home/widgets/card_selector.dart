import 'package:bankingapp/mock/data.dart';
import 'package:bankingapp/ui/shared_widgets/account_action.dart';
import 'package:bankingapp/ui/shared_widgets/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:intl/intl.dart';

class MonzoCardSelector extends StatelessWidget {
  const MonzoCardSelector({
    Key key,
    @required this.f,
    @required int cardIndex,
  })  : _cardIndex = cardIndex,
        super(key: key);

  final NumberFormat f;
  final int _cardIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    text: f.format(cards[_cardIndex].balance.toInt()),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  TextSpan(
                    text: cards[_cardIndex]
                        .balance
                        .toStringAsFixed(2)
                        .substring(cards[_cardIndex]
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
                  return BankCard(cards[index]);
                },
                onIndexChanged: (_) {},
                itemCount: cards.length,
                viewportFraction: 0.7,
                scale: 0.9,
                loop: false,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
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
    );
  }
}
