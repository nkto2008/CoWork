import 'package:backoffice_cowork/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/model_service.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/modify_button_service.dart';
import '../../../widgets/suppression_button_service.dart';

class ServiceDetailsContent extends StatefulWidget {
  Service service;

  ServiceDetailsContent({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<ServiceDetailsContent> createState() => _ServiceDetailsContentState();
}

class _ServiceDetailsContentState extends State<ServiceDetailsContent> {
  final TextEditingController name = TextEditingController();
  final TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title:
                  "Service - ${widget.service.id}",
              backward: true),
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
                                  text: "ID :",
                                  font: "Comfortaa",
                                  size: 20,
                                  align: TextAlign.left,
                                ),
                                CustomText(
                                  text: widget.service.id,
                                  font: "Comfortaa",
                                  size: 15,
                                  align: TextAlign.left,
                                ),
                              ],
                            ),
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
                                  decoration: InputDecoration(
                                    hintText: widget.service.name,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
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
                                  decoration: InputDecoration(
                                    hintText: "${widget.service.price}",
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(0),
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
                      ModifyButtonService(
                        service: widget.service,
                        id: widget.service.id,
                        name: name,
                        price: price
                      ),
                      const SizedBox(height: defaultPadding),
                      SuppressionButtonService(service: widget.service),
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
