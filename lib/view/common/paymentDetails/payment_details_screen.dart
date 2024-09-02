import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:provider/provider.dart';
import 'package:student_management/view/common/paymentDetails/widgets/add_alertbox.dart';
import 'package:student_management/view/common/paymentDetails/widgets/paymentscreen_shimmer.dart';
import 'package:student_management/view/common/paymentDetails/widgets/transaction_count.dart';
import 'package:student_management/view/common/paymentDetails/widgets/edit_alertbox.dart';
import 'package:student_management/widgets/uppercase.dart';

class PaymentDetailsScreen extends StatefulWidget {
  final int studentId;
  final String name;
  final String admissionNo;

  const PaymentDetailsScreen({
    super.key,
    required this.studentId,
    required this.name,
    required this.admissionNo,
  });

  @override
  // ignore: library_private_types_in_public_api
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
        // automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: cWhiteColor),
        backgroundColor: cPrimaryColor,
        title: Column(
          children: [
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(5),
                //   child: CircleAvatar(
                //     radius: 18,
                //     backgroundColor: cSecondaryColor,
                //     child: Text(
                //       widget.admissionNo,
                //       style: TextStyle(
                //         fontSize: 8.5,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.grey[700],
                //       ),
                //     ),
                //   ),
                // ),
                // cHeight10,
                Text(
                  ' ${widget.name.capitalize()}',
                  style: const TextStyle(color: cSecondaryColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  Text(
                    widget.admissionNo,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color.fromARGB(255, 230, 230, 230),
                    ),
                  )
                ],
              ),
            )
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
            } else if (provider.busPayments != null) {
              final transactions =
                  provider.busPayments?.transactions?.reversed.toList() ?? [];
              return RefreshIndicator(
                onRefresh: () => provider.fetchBusPayments(widget.studentId),
                child: Column(
                  children: [
                    // cHeight10,
                    SizedBox(
                        height: screenHeight * .30,
                        width: screenWidth,
                        child: PaymentCounts(
                          balanceAmount: provider.busPayments?.balanceAmount
                                  ?.toStringAsFixed(0) ??
                              "0",
                          paidAmount: provider.busPayments?.paidAmount
                                  ?.toStringAsFixed(0) ??
                              "0",
                          totalAmount: provider
                                  .busPayments?.busService?.annualFees
                                  ?.toStringAsFixed(0) ??
                              "0",
                        )),
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
                        child: (provider.busPayments?.transactions?.isEmpty ??
                                true)
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
                                  // return Slidable(
                                  //   endActionPane: ActionPane(
                                  //       motion: const BehindMotion(),
                                  //       children: [
                                  //         SlidableAction(
                                  //           onPressed: (indext) {
                                  //             showDialog(
                                  //               context: context,
                                  //               builder: (context) {
                                  //                 return TransactionEditAlertBox(
                                  //                   studentId: widget.studentId,
                                  //                   amount: transaction.amount,
                                  //                   // transactionType:
                                  //                   //     transaction.method,
                                  //                   transactionId:
                                  //                       transaction.id,
                                  //                 );
                                  //               },
                                  //             );
                                  //           },
                                  //           icon: Icons.edit,
                                  //           foregroundColor: cWhiteColor,
                                  //           backgroundColor: const Color.fromARGB(166, 124, 128, 238),
                                  //         ),
                                  //         SlidableAction(
                                  //           onPressed: (indext) async {
                                  //             bool? confirmDelete =
                                  //                 await showDialog<bool>(
                                  //               context: context,
                                  //               builder: (context) {
                                  //                 return AlertDialog(
                                  //                   title: const Text(
                                  //                       'Confirm Delete'),
                                  //                   content: const Text(
                                  //                       'Are you sure you want to delete this transaction?'),
                                  //                   actions: [
                                  //                     TextButton(
                                  //                       child: const Text(
                                  //                         'Cancel',
                                  //                         style: TextStyle(
                                  //                           color:
                                  //                               cPrimaryColor,
                                  //                         ),
                                  //                       ),
                                  //                       onPressed: () {
                                  //                         Navigator.of(context)
                                  //                             .pop(false);
                                  //                       },
                                  //                     ),
                                  //                     TextButton(
                                  //                       child: const Text(
                                  //                         'Delete',
                                  //                         style: TextStyle(
                                  //                           color:
                                  //                               cPrimaryColor,
                                  //                         ),
                                  //                       ),
                                  //                       onPressed: () {
                                  //                         Navigator.of(context)
                                  //                             .pop(true);
                                  //                       },
                                  //                     ),
                                  //                   ],
                                  //                 );
                                  //               },
                                  //             );

                                  //             if (confirmDelete ?? false) {
                                  //               await provider
                                  //                   .deleteTransaction(
                                  //                       transaction.id,
                                  //                       widget.studentId);
                                  //             }
                                  //           },
                                  //           icon: Icons.delete,
                                  //           foregroundColor: Colors.white,
                                  //           backgroundColor: const Color.fromARGB(166, 124, 128, 238),
                                  //         ),
                                  //       ]),
                                  return Card(
                                    color: cPrimaryColor,
                                    elevation: 0,
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        backgroundColor: cWhiteARGBColor4,
                                        radius: 50,
                                        child: Icon(
                                          Icons.receipt_long_sharp,
                                          color: Color.fromARGB(
                                              255, 114, 112, 112),
                                          size: 25,
                                        ),
                                      ),
                                      title: Text(
                                        "₹ ${provider.formatAmount(transaction.amount)}",
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: cWhiteColor,
                                        ),
                                      ),
                                      subtitle: Text(
                                        transaction.getFormattedDate(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          color: Color.fromARGB(255, 212, 212, 212),
                                        ),
                                      ),
                                      // trailing: Container(
                                      //   height: 30,
                                      //   width: 30,
                                      //   margin: const EdgeInsets.all(10.0),
                                      //   decoration: const BoxDecoration(
                                      //     shape: BoxShape.circle,
                                      //     color: cGreenColor,
                                      //   ),
                                      //   child: const Icon(
                                      //     Icons.done,
                                      //     color: cWhiteColor,
                                      //     size: 20,
                                      //   ),
                                      // ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return TransactionEditAlertBox(
                                                      studentId:
                                                          widget.studentId,
                                                      amount:
                                                          provider.formatAmount(transaction.amount),
                                                      transactionId:
                                                          transaction.id ?? 0,
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                color: cWhiteColor,
                                              )),
                                          IconButton(
                                              onPressed: () async {
                                                bool? confirmDelete =
                                                    await showDialog<bool>(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: const Text(
                                                        'Confirm Delete',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20),
                                                      ),
                                                      content: const Text(
                                                        'Are you sure you want to delete this transaction?',
                                                        // style: TextStyle(fontWeight: FontWeight.w700),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                              color:
                                                                  cPrimaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: const Text(
                                                            'Delete',
                                                            style: TextStyle(
                                                              color: cRedColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
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
                                              icon: const Icon(
                                                Icons.delete,
                                                color: cWhiteColor,
                                              )),
                                        ],
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
                                itemCount: provider
                                        .busPayments?.transactions?.length ??
                                    0,
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
