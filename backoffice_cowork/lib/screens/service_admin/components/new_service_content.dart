import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constants.dart';
import '../../../widgets/create_button_service.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_text.dart';

class NewServiceContent extends StatefulWidget {
  const NewServiceContent({Key? key}) : super(key: key);

  @override
  State<NewServiceContent> createState() => _NewServiceContentState();
}

class _NewServiceContentState extends State<NewServiceContent> {
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: "Création d'un service", backward: true),
          Container(
            width: 740,
            height: 640,
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              border: Border.all(width: 8.0, color: primaryColor),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Nom :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "nom",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Prix :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                TextFormField(
                                  controller: price,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Comfortaa",
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "prix",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CreateButtonService(
                        name: name,
                        price: price,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
