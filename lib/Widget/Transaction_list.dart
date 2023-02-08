// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:expansive_manage/Widget/Transaction_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expansive_manage/model/transtion.dart';

class TransactionList extends StatelessWidget {
  final Function deleteTx;
  final List<Transaction> transactions;
  TransactionList(
    this.transactions,
    this.deleteTx,
  );
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/Images/Waitting.png'))
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList());
  }
}
