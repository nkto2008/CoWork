import 'package:backoffice_cowork/requests/subscribes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/model_subscribe.dart';
import '../screens/place_admin/place_screen.dart';
import '../utils/constants.dart';
import 'custom_text.dart';

class SuppressionButtonSubscribe extends StatefulWidget {
  final Subscribe subscribe;

  const SuppressionButtonSubscribe({
    Key? key,
    required this.subscribe,
  }) : super(key: key);

  @override
  State<SuppressionButtonSubscribe> createState() => _SuppressionButtonSubscribeState();
}

class _SuppressionButtonSubscribeState extends State<SuppressionButtonSubscribe> {
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
              var res = Subscribes.delSubscribe(widget.subscribe.id);
              if (await res) {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const PlaceScreen()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Lieu supprimé"),
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
