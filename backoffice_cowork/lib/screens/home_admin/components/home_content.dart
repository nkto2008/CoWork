import 'package:backoffice_cowork/utils/constants.dart';
import 'package:backoffice_cowork/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'counter_user.dart';
import 'counter_place.dart';
import 'counter_service.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: "Accueil", backward: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: const [
                          Expanded(
                            child: CounterService(),
                          ),
                          SizedBox(width: defaultPadding),
                          Expanded(
                            child: CounterPlace(),
                          ),
                          SizedBox(width: defaultPadding),
                          Expanded(
                            child: CounterUser(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
