import 'package:flutter/material.dart';

import '../../../styles/colors_app.dart';

class ProposalFormWidget extends StatelessWidget {
  final String title;
  final String budget;
  final String time;

  const ProposalFormWidget({
    Key? key,
    required this.title,
    required this.budget,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: budget,
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(value: "100-200", child: Text("100-200")),
                    DropdownMenuItem(value: "200-300", child: Text("200-300")),
                    DropdownMenuItem(value: "300-400", child: Text("300-400")),
                  ],
                  onChanged: (value) {},
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: time,
                    border: OutlineInputBorder(),
                  ),
                  items: [
                    DropdownMenuItem(value: "1 day", child: Text("1 day")),
                    DropdownMenuItem(value: "2 days", child: Text("2 days")),
                    DropdownMenuItem(value: "3 days", child: Text("3 days")),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Write your proposal here...",
              labelText: "Proposal",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.headlines,
              foregroundColor: ColorsApp.gray100,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              fixedSize: const Size.fromHeight(48),
              textStyle: const TextStyle(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text("Submit Offer"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
