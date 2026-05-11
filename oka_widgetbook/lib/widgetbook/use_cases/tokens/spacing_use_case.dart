import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;
import '../../../design_system/tokens/oka_tokens.dart';

@wb.UseCase(name: 'Escala de Espaçamento', type: _SpacingScale, path: '[Tokens]/Espaçamento')
Widget spacingScale(BuildContext context) => const _SpacingScale();

@wb.UseCase(name: 'Border Radius', type: _RadiusScale, path: '[Tokens]/Espaçamento')
Widget radiusScale(BuildContext context) => const _RadiusScale();

class _SpacingScale extends StatelessWidget {
  const _SpacingScale();

  @override
  Widget build(BuildContext context) {
    final tokens = [
      ('XMicro', OkaSpacing.xMicro),
      ('Micro',  OkaSpacing.micro),
      ('XS',     OkaSpacing.xs),
      ('XXS',    OkaSpacing.xxs),
      ('XXXS',   OkaSpacing.xxxs),
      ('Small',  OkaSpacing.small),
      ('Medium', OkaSpacing.medium),
      ('Large',  OkaSpacing.large),
      ('XL',     OkaSpacing.xl),
      ('XXL',    OkaSpacing.xxl),
      ('XXXL',   OkaSpacing.xxxl),
    ];
    return ListView(
      padding: const EdgeInsets.all(24),
      children: tokens.map((e) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            SizedBox(width: 80, child: Text(e.$1, style: const TextStyle(fontSize: 12, color: Colors.black54))),
            SizedBox(width: 40, child: Text('${e.$2.toInt()}px', style: const TextStyle(fontSize: 12))),
            Container(width: e.$2, height: 20, color: OkaColors.brandPrimary.withOpacity(0.5)),
          ],
        ),
      )).toList(),
    );
  }
}

class _RadiusScale extends StatelessWidget {
  const _RadiusScale();

  @override
  Widget build(BuildContext context) {
    final radii = [
      ('None',   OkaBorderRadius.none),
      ('Small',  OkaBorderRadius.small),
      ('Medium', OkaBorderRadius.medium),
      ('Large',  OkaBorderRadius.large),
    ];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: radii.map((e) => Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: OkaColors.bgPrimary,
                border: Border.all(color: OkaColors.strokePrimary),
                borderRadius: BorderRadius.circular(e.$2),
              ),
            ),
            const SizedBox(height: 8),
            Text(e.$1, style: const TextStyle(fontSize: 12)),
            Text('${e.$2.toInt()}px', style: const TextStyle(fontSize: 11, color: Colors.black45)),
          ],
        )).toList(),
      ),
    );
  }
}
