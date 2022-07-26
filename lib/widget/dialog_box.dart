import 'package:budget_tracker/model/transaction_item.dart';
import 'package:budget_tracker/services/theme_service.dart';
import 'package:budget_tracker/widget/colors.dart';
import 'package:budget_tracker/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class AddTransactionDialog extends StatefulWidget {
  final Function(TransactionItem) itemToAdd;
  const AddTransactionDialog({required this.itemToAdd, Key? key})
      : super(key: key);

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final TextEditingController itemTitleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool _isExpenseController = true;

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return Dialog(
      child: SizedBox(
          width: width(context) / 1.1,
          height: height(context) * .4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: VStack(
                crossAlignment: CrossAxisAlignment.center,
                [
                  Text(
                    "Add an Expense",
                    style: GoogleFonts.nunito(),
                  ).text.xl2.semiBold.make(),
                  16.heightBox,
                  TextField(
                    controller: itemTitleController,
                    decoration: const InputDecoration(hintText: "Name"),
                  ),
                  16.heightBox,
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(hintText: "Amount in \$"),
                  ),
                  16.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Is expense?",
                        style: GoogleFonts.nunito(),
                      ).text.xl.make(),
                      Switch.adaptive(
                          value: _isExpenseController,
                          onChanged: (b) {
                            setState(() {
                              _isExpenseController = b;
                            });
                          })
                    ],
                  ),
                  20.heightBox,
                  ElevatedButton(
                    onPressed: () {
                      if (amountController.text.isNotEmpty &&
                          itemTitleController.text.isNotEmpty) {
                        widget.itemToAdd(TransactionItem(
                            amount: double.parse(amountController.text),
                            itemTitle: itemTitleController.text,
                            isExpense: _isExpenseController));
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Add",
                      style: GoogleFonts.nunito(
                          color: themeService.darkTheme
                              ? ColorData.black
                              : ColorData.white),
                    ).text.xl.semiBold.make(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class BudgetDialog extends StatefulWidget {
  final Function(double) budgetToAdd;
  const BudgetDialog({required this.budgetToAdd, Key? key}) : super(key: key);

  @override
  State<BudgetDialog> createState() => _BudgetDialogState();
}

class _BudgetDialogState extends State<BudgetDialog> {
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return Dialog(
      child: SizedBox(
          width: width(context) / 1.1,
          height: height(context) * .28,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: VStack(
                crossAlignment: CrossAxisAlignment.center,
                [
                  Text(
                    "Add a Budget",
                    style: GoogleFonts.nunito(),
                  ).text.xl2.semiBold.make(),
                  16.heightBox,
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Budget in \$"),
                  ),
                  32.heightBox,
                  ElevatedButton(
                    onPressed: () {
                      if (amountController.text.isNotEmpty) {
                        widget.budgetToAdd(
                          double.parse(amountController.text),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Add",
                      style: GoogleFonts.nunito(
                          color: themeService.darkTheme
                              ? ColorData.black
                              : ColorData.white),
                    ).text.xl.semiBold.make(),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
