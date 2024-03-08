import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/design/app_color.dart';
import 'package:mobile/utils/constants.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.scaffoldBgColor,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
                fillColor: Colors.grey.shade700,
                filled: true,
              ),
              onChanged: (value) => setState(() {
                searchText = value;
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20)
                .copyWith(bottom: 10),
            child: Divider(
              color: Colors.grey.shade600,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text("Yesterday"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: searchText.isEmpty
                  ? Prompts.storedPromts.length
                  : Prompts.storedPromts
                      .where((element) => element
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .toList()
                      .length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final filteredPrompt = searchText.isEmpty
                    ? Prompts.storedPromts
                    : Prompts.storedPromts
                        .where((element) => element
                            .toLowerCase()
                            .contains(searchText.toLowerCase()))
                        .toList();
                final prompt = filteredPrompt[index];

                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10,
                      top: 18,
                    ),
                    child: Text(
                      prompt,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10).copyWith(bottom: 0),
            child: Divider(
              color: Colors.grey.shade600,
            ),
          ),
          Container(
            height: 76,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/tony.jpeg",
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "Tony Stark",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
          )
        ],
      ),
    );
  }
}
