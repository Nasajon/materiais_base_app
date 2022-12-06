import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';
import 'package:materiais_app/presentation/presentation.dart';
import 'package:pcp/pcp.dart' hide tr;

class MateriaisHomePage extends StatelessWidget {
  MateriaisHomePage({super.key});

  final producaoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          PcpTextButton(
              text: tr.materiais.sections.production,
              onPressed: () {
                Scrollable.ensureVisible(producaoKey.currentContext!,
                    alignment: 0, duration: const Duration(milliseconds: 500));
              })
        ]),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(38, 92, 191, 0.1),
          Color.fromRGBO(4, 35, 93, 0.1)
        ], stops: [
          0.0159,
          1
        ])),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Spacing.xl.value, vertical: Spacing.md.value),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr.materiais.sections.production,
                    key: producaoKey,
                    style: context.text.h2Light.copyWith(
                        fontSize: 22.fontSize, fontFamily: appFontNarrow)),
                Spacing.md.vertical,
                Wrap(
                  direction: Axis.horizontal,
                  spacing: Spacing.sm.value,
                  runSpacing: Spacing.sm.value,
                  children: const [GrupoDeRecursoCard(), RecursoCard()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
