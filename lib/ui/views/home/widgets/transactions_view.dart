import 'package:bankingapp/mock/data.dart';
import 'package:flutter/material.dart';

class MonzoTransactionsView extends StatelessWidget {
  const MonzoTransactionsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.425,
      minChildSize: 0.425,
      builder: (context, scrollController) {
        return Card(
          elevation: 15.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
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
                                      fontSize: 18),
                                )
                              : TextSpan(),
                          TextSpan(
                            text: txs[index].amount.toStringAsFixed(0),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: txs[index]
                                .amount
                                .toStringAsFixed(2)
                                .substring(txs[index]
                                    .amount
                                    .toStringAsFixed(2)
                                    .indexOf('.')),
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
    );
  }
}
