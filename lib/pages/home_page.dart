import 'package:budget_tracker/model/transaction_item.dart';
import 'package:budget_tracker/services/theme_service.dart';
import 'package:budget_tracker/widget/chart.dart';
import 'package:budget_tracker/widget/colors.dart';
import 'package:budget_tracker/widget/dialog_box.dart';
import 'package:budget_tracker/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TransactionItem> items = [];
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: screenSize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //CIRCULAR
                Align(
                  alignment: Alignment.topCenter,
                  child: ChartWidget(screenSize: screenSize),
                ),
                40.heightBox,

                //ITEMS TEXT
                Text(
                  "Items",
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.heightBox,

                ...List.generate(
                  items.length,
                  (index) => TransactionCard(
                    item: items[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      //FLOATINMG ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            themeService.darkTheme ? ColorData.white : ColorData.primary,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddTransactionDialog(itemToAdd: (transactionItem) {
                  setState(() {
                    items.add(transactionItem);
                  });
                });
              });
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
