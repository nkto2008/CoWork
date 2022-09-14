import 'package:flutter/material.dart';

import '../../models/model_service.dart';
import '../../widgets/side_menu.dart';
import 'components/service_details_content.dart';

class ServiceDetails extends StatefulWidget {
  final Service service;

  const ServiceDetails({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SideMenu(select: 4),
            Expanded(
              flex: 7,
              child: ServiceDetailsContent(service: widget.service),
            ),
          ],
        ),
      ),
    );
  }
}
