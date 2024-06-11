import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/paymentDetails/widgets/alertbox.dart';
import 'package:student_management/view/paymentDetails/widgets/paymentscreen_shimmer.dart';
import 'package:student_management/view/paymentDetails/widgets/transaction_count.dart';
import 'package:provider/provider.dart';
import 'package:student_management/view/paymentDetails/widgets/transaction_edit_alertbox.dart';

class PaymentDetailsScreen extends StatefulWidget {
  final int studentId;
  final String name;
  final String gender;

  const PaymentDetailsScreen({
    super.key,
    required this.studentId,
    required this.name,
    required this.gender,
  });

  @override
  _PaymentDetailsScreenState createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<BusPaymentDetailsProvider>(context, listen: false)
        .fetchBusPayments(widget.studentId);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        backgroundColor: cBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: cPrimaryColor,
            child: Text(
              widget.gender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: cSecondaryColor,
              ),
            ),
          ),
        ),
        title: Text(
          widget.name,
          style: TextStyle(color: cBlackColor),
        ),
      ),
      body: SafeArea(
        child: Consumer<BusPaymentDetailsProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return paymentShimmerEffect(screenHeight, screenWidth);
            } else if (provider.errorMessage != null) {
              return Center(child: Text(provider.errorMessage!));
            } else if (provider.BusPayments != null) {
              return Column(
                children: [
                  cHeight10,
                  SizedBox(
                    height: screenHeight * .30,
                    width: screenWidth,
                    child:  PaymentCounts(
                      balanceAmount: provider.BusPayments?.balanceAmount.toString()??"0",
                      paidAmount: provider.BusPayments?.paidAmount.toString()??"0",
                      totalAmount: provider.BusPayments?.busService.annualFees.toString()??"0",
                      ),
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Recent Payments',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: cWhiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: cWhiteColor24,
                      height: 300,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(5),
                        itemBuilder: (ctx, index) {
                          final transaction =
                              provider.BusPayments!.transactions[index];
                          return Slidable(
                              endActionPane: ActionPane(
                motion: const BehindMotion(),
               children:[
                SlidableAction(
                  onPressed: (indext)async{
                  await  provider.deleteTransaction(transaction.id, widget.studentId);
                   },
                   icon: Icons.delete,backgroundColor: Colors.red,
    
                   ),
    
                    SlidableAction(
                  onPressed: (indext){ 
                     showDialog(
            context: context,
            builder: (context) {
              return TransactionEditAlertBox(studentId: widget.studentId,amount: transaction.amount,transactionType: transaction.method,transactionId: transaction.id,);
            },
          );  
                   },
                   icon: Icons.edit,backgroundColor: Colors.blue,
                   
                  
    
                )
               ]),
                            child: Card(
                              color: cPrimaryColor,
                              elevation: 0,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: cWhiteARGBColor4,
                                  radius: 50,
                                  child: Image.asset(
                                    transaction.method == "CASH"
                                        ? 'assets/payment_page/CASH.png'
                                        : 'assets/payment_page/UPI.png',
                                    height: 32,
                                  ),
                                ),
                                title: Text(
                                  "₹ ${transaction.amount}",
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: cWhiteColor,
                                  ),
                                ),
                                subtitle: Text(
                                  transaction.createdAt.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: cWhiteColor,
                                  ),
                                ),
                                trailing: Container(
                                  height: 30,
                                  width: 30,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: cGreenColor,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: cWhiteColor,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider(
                            height: 4,
                            thickness: 2,
                          );
                        },
                        itemCount: provider.BusPayments!.transactions.length,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cPrimaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertBoxWidget(studentId: widget.studentId);
            },
          );
        },
        child: const Icon(
          CupertinoIcons.add,
          color: cWhiteColor,
        ),
      ),
    );
  }

}
