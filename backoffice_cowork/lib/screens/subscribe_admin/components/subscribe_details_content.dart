import 'package:backoffice_cowork/models/model_subscribe.dart';
import 'package:backoffice_cowork/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../models/model_user.dart';
import '../../../utils/constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/modify_button_user.dart';
import '../../../widgets/suppression_button_subscribe.dart';
import '../../../widgets/suppression_button_user.dart';

class SubscribeDetailsContent extends StatefulWidget {
  Subscribe subscribe;

  SubscribeDetailsContent({
    Key? key,
    required this.subscribe,
  }) : super(key: key);

  @override
  State<SubscribeDetailsContent> createState() => _SubscribeDetailsContentState();
}

class _SubscribeDetailsContentState extends State<SubscribeDetailsContent> {
  final TextEditingController lname = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController pseudo = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              title:
              "Abonnement - ${widget.subscribe.name}",
              backward: true),
          Expanded(
            child: Container(
              width: 740,
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
                                    text: widget.subscribe.id,
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
                                    controller: lname,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Comfortaa",
                                    ),
                                    decoration: InputDecoration(
                                      hintText: widget.subscribe.name,
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
                                    controller: pseudo,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Comfortaa",
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "${widget.subscribe.price}",
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
                        SuppressionButtonSubscribe(subscribe: widget.subscribe),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
