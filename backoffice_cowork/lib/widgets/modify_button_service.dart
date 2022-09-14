import 'package:backoffice_cowork/requests/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_service.dart';
import '../screens/service_admin/service_details.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class ModifyButtonService extends StatefulWidget {
  Service service;

  final String id;
  final TextEditingController name;
  final TextEditingController price;

  ModifyButtonService({
    Key? key,
    required this.service,
    required this.id,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  State<ModifyButtonService> createState() => _ModifyButtonServiceState();
}

class _ModifyButtonServiceState extends State<ModifyButtonService> {
  bool display = false;

  void confirm() {
    setState(() {
      display = !display;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: display
          ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              confirm();
            },
            style: TextButton.styleFrom(
              backgroundColor: redSup,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2),
              child: CustomText(
                text: "NON",
                color: lightCream,
                font: "Comfortaa",
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: defaultPadding),
          TextButton(
            onPressed: () async {
              var res = Services.updateService(
                widget.id,
                widget.name.text,
                widget.price.text as double,
              );
              if (await res == 1) {
                if (widget.name.text.isNotEmpty) {
                  widget.service.name = widget.name.text;
                }
                if (widget.price.text.isNotEmpty) {
                  double price =  widget.price.text as double;
                  widget.service.price = price;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Service modifié"),
                  ),
                );
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: ServiceDetails(
                      service: widget.service,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Une erreur est survenue"),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2),
              child: CustomText(
                text: "OUI",
                color: lightCream,
                font: "Comfortaa",
                size: 15,
              ),
            ),
          ),
        ],
      )
          : TextButton(
        onPressed: () {
          if (widget.name.text.isEmpty &&
              widget.price.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Modifiez au moins 1 champ"),
              ),
            );
          } else {
            confirm();
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: CustomText(
            text: "MODIFIER",
            color: lightCream,
            font: "Comfortaa",
            size: 20,
          ),
        ),
      ),
    );
  }
}
