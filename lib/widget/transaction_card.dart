import 'package:budget_tracker/model/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class TransactionCard extends StatelessWidget {
  final TransactionItem item;
  // final String text;
  // final double amount;
  // final bool isExpense;
  const TransactionCard({required this.item, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              offset: const Offset(0, 25),
              blurRadius: 50,
            )
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: HStack(
          [
            Text(
              item.itemTitle,
              style: GoogleFonts.nunito(),
            ).text.xl2.semiBold.make(),
            const Spacer(),
            Text(
              (!item.isExpense ? "+ " : "- ") + item.amount.toString(),
              style: GoogleFonts.nunito(),
            ).text.xl.make(),
          ],
        ),
      ),
    );
  }
}
