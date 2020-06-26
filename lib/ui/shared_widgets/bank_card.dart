import 'package:bankingapp/datamodels/account.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  final Account _account;
  BankCard(this._account);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: _account.color,
          boxShadow: [
            BoxShadow(color: Colors.grey[300], spreadRadius: 1, blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _account.logo != null
                      ? Text(
                          _account.logo,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Text(''),
                ],
              ),
              _account.lastFourDigits != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 15),
                        Image.asset('assets/img/card-chip.png', height: 32.5),
                      ],
                    )
                  : SizedBox(),
              _account.lastFourDigits != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        for (var x = 0; x < 3; x++)
                          Text('****',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  letterSpacing: 1.5)),
                        Text(
                          _account.lastFourDigits.join(''),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ShareTechMono',
                              letterSpacing: 0.75),
                        ),
                      ],
                    )
                  : SizedBox(),
              _account.lastFourDigits != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _account.cardholderName.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'ShareTechMono',
                            letterSpacing: 0.5,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'ShareTechMono',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    _account.expiresEnd.sublist(0, 2).join(''),
                              ),
                              TextSpan(text: '/'),
                              TextSpan(
                                text:
                                    _account.expiresEnd.sublist(2, 4).join(''),
                              ),
                            ],
                          ),
                        ),
                        Image.asset('assets/img/mastercard.png', height: 47.5),
                      ],
                    )
                  : SizedBox(),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
