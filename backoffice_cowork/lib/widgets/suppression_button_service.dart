import 'package:backoffice_cowork/models/model_service.dart';
import 'package:backoffice_cowork/requests/services.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/service_admin/service_screen.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class SuppressionButtonService extends StatefulWidget {
  final Service service;

  const SuppressionButtonService({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<SuppressionButtonService> createState() => _SuppressionButtonServiceState();
}

class _SuppressionButtonServiceState extends State<SuppressionButtonService> {
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
              var res = Services.delService(widget.service.id);
              if(await res){
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: const ServiceScreen()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Service supprimé"),
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
          confirm();
        },
        style: TextButton.styleFrom(
          backgroundColor: redSup,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: CustomText(
            text: "SUPPRIMER",
            color: lightCream,
            font: "Comfortaa",
            size: 20,
          ),
        ),
      ),
    );
  }
}
