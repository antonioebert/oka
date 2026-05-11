import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;
import '../../../components/button/oka_button.dart';

@wb.UseCase(name: 'Botão', type: OkaButton, path: '[Componentes]')
Widget buttonUseCase(BuildContext context) {
  final tipo = context.knobs.list<OkaButtonType>(
    label: 'Tipo',
    options: OkaButtonType.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaButtonType.primario,
  );
  final tamanho = context.knobs.list<OkaButtonSize>(
    label: 'Tamanho',
    options: OkaButtonSize.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaButtonSize.grande,
  );
  final iconSide = context.knobs.list<OkaButtonIconSide>(
    label: 'Lado do Ícone',
    options: OkaButtonIconSide.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaButtonIconSide.none,
  );
  final isDisabled = context.knobs.boolean(label: 'Desabilitado', initialValue: false);
  final label      = context.knobs.string(label: 'Label', initialValue: 'Botão');

  return Center(
    child: OkaButton(
      label: label,
      tipo: tipo,
      tamanho: tamanho,
      iconSide: iconSide,
      icon: iconSide != OkaButtonIconSide.none ? Icons.arrow_forward : null,
      isDisabled: isDisabled,
      onPressed: () {},
    ),
  );
}
