import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowTransactionItem extends StatelessWidget {
   ShowTransactionItem({super.key, this.show});
  final show;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              'Receiver Account:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp
                              ),
                            ),
                            const Spacer(),
                            Text('${show?[index].receiverAccount}'),
                          ],),
                          SizedBox(height: 8.h,),
                          Row(
                            children: [
                            Text(
                              'Transaction Type:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp
                              ),
                            ),
                            const Spacer(),
                            Text('${show?[index].transactionType}'),
                          ],),
                          SizedBox(height: 8.h,),
                          Row(children: [
                            Text(
                              'Amount:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp
                              ),
                            ),
                            const Spacer(),
                            Text('${show?[index].amount}'),
                          ],),
                          SizedBox(height: 8.h,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Transaction Date:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp
                                ),
                              ),
                              SizedBox(height: 5.h,),
                              Center(child: Text('${show?[index].transactionDate}')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 8.h,),
                  itemCount: show.length,
                ),
            )
          ],
        ),
      ),
    );
  }
}
