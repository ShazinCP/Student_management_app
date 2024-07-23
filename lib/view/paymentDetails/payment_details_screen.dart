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
      backgroundColor: cSecondaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cPrimaryColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: cSecondaryColor,
                child: Text(
                  widget.gender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            cHeight10,
            Text(
              widget.name,
              style: const TextStyle(color: cSecondaryColor),
            ),
          ],
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
              final transactions =
                  provider.BusPayments!.transactions.reversed.toList();
              return RefreshIndicator(
                onRefresh: () => provider.fetchBusPayments(widget.studentId),
                child: Column(
                  children: [
                    cHeight10,
                    SizedBox(
                      height: screenHeight * .30,
                      width: screenWidth,
                      child: PaymentCounts(
                        balanceAmount:
                            provider.BusPayments?.balanceAmount.toString() ??
                                "0",
                        paidAmount:
                            provider.BusPayments?.paidAmount.toString() ?? "0",
                        totalAmount: provider.BusPayments?.busService.annualFees
                                .toString() ??
                            "0",
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Recent Payments',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: cBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        color: cWhiteColor24,
                        height: 300,
                        child: provider.BusPayments!.transactions.isEmpty
                            ? const Center(
                                child: Text(
                                  'No transactions added',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: cBlackColor,
                                  ),
                                ),
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.all(5),
                                itemBuilder: (ctx, index) {
                                  final transaction = transactions[index];
                                  return Slidable(
                                    endActionPane: ActionPane(
                                        motion: const BehindMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (indext) {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return TransactionEditAlertBox(
                                                    studentId: widget.studentId,
                                                    amount: transaction.amount,
                                                    transactionType:
                                                        transaction.method,
                                                    transactionId:
                                                        transaction.id,
                                                  );
                                                },
                                              );
                                            },
                                            icon: Icons.edit,
                                            // backgroundColor: Colors.blue,
                                          ),
                                          SlidableAction(
                                            onPressed: (indext) async {
                                              bool? confirmDelete =
                                                  await showDialog<bool>(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Confirm Delete'),
                                                    content: const Text(
                                                        'Are you sure you want to delete this transaction?'),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                            color:
                                                                cPrimaryColor,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(false);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Text(
                                                          'Delete',
                                                          style: TextStyle(
                                                            color:
                                                                cPrimaryColor,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(true);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );

                                              if (confirmDelete ?? false) {
                                                await provider
                                                    .deleteTransaction(
                                                        transaction.id,
                                                        widget.studentId);
                                              }
                                            },
                                            icon: Icons.delete,
                                            // backgroundColor: Colors.red,
                                          ),
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
                                itemCount:
                                    provider.BusPayments!.transactions.length,
                              ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No data available'));
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
