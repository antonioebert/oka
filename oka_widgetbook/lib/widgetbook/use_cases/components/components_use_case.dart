import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as wb;
import '../../../components/input/oka_input.dart';
import '../../../components/alert/oka_alert.dart';
import '../../../components/tag/oka_tag.dart';
import '../../../components/pill/oka_pill.dart';
import '../../../components/list/oka_list_item.dart';

// ─── INPUT ────────────────────────────────────────────────────────────────────

@wb.UseCase(name: 'Campo de Texto', type: OkaInput, path: '[Componentes]')
Widget inputUseCase(BuildContext context) {
  final variation = context.knobs.list<OkaInputVariation>(
    label: 'Variação',
    options: OkaInputVariation.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaInputVariation.texto,
  );
  final state = context.knobs.list<OkaInputState>(
    label: 'Estado',
    options: OkaInputState.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaInputState.habilitado,
  );
  final label      = context.knobs.string(label: 'Label', initialValue: 'E-mail');
  final hint       = context.knobs.string(label: 'Placeholder', initialValue: 'Digite seu e-mail');
  final helperText = context.knobs.string(label: 'Helper text', initialValue: 'Texto de ajuda');
  final errorText  = context.knobs.string(label: 'Erro text', initialValue: 'Campo inválido');
  final showPrefixIcon = context.knobs.boolean(label: 'Ícone prefixo', initialValue: false);

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: OkaInput(
        variation: variation,
        inputState: state,
        label: label,
        hint: hint,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: showPrefixIcon ? Icons.email_outlined : null,
      ),
    ),
  );
}

// ─── ALERT ────────────────────────────────────────────────────────────────────

@wb.UseCase(name: 'Alert Message', type: OkaAlert, path: '[Componentes]')
Widget alertUseCase(BuildContext context) {
  final status = context.knobs.list<OkaAlertStatus>(
    label: 'Status',
    options: OkaAlertStatus.values,
    labelBuilder: (v) => switch (v) {
      OkaAlertStatus.alerta        => 'Alerta',
      OkaAlertStatus.neutroNegativo=> 'Neutro / Negativo',
      OkaAlertStatus.positivo      => 'Positivo',
    },
    initialOption: OkaAlertStatus.neutroNegativo,
  );
  final variation = context.knobs.list<OkaAlertVariation>(
    label: 'Variação',
    options: OkaAlertVariation.values,
    labelBuilder: (v) => switch (v) {
      OkaAlertVariation.simples        => 'Simples',
      OkaAlertVariation.comTitulo      => 'Com título',
      OkaAlertVariation.comBotaoAoLado => 'Com botão ao lado',
      OkaAlertVariation.botaoEmbaixo   => 'Botão embaixo',
    },
    initialOption: OkaAlertVariation.simples,
  );
  final title   = context.knobs.string(label: 'Título', initialValue: 'Título do alerta');
  final message = context.knobs.string(label: 'Mensagem', initialValue: 'Mensagem informativa para o usuário sobre algo importante.');
  final actionLabel = context.knobs.string(label: 'Label da ação', initialValue: 'Ver mais');

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: OkaAlert(
        status: status,
        variation: variation,
        title: title,
        message: message,
        actionLabel: actionLabel,
        onAction: () {},
      ),
    ),
  );
}

// ─── TAG ──────────────────────────────────────────────────────────────────────

@wb.UseCase(name: 'Tag', type: OkaTag, path: '[Componentes]')
Widget tagUseCase(BuildContext context) {
  final status = context.knobs.list<OkaTagStatus>(
    label: 'Status',
    options: OkaTagStatus.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaTagStatus.ativo,
  );

  return Center(child: OkaTag(status: status));
}

// ─── PÍLULAS ──────────────────────────────────────────────────────────────────

@wb.UseCase(name: 'Pílulas', type: OkaPill, path: '[Componentes]')
Widget pillUseCase(BuildContext context) {
  final variation = context.knobs.list<OkaPillVariation>(
    label: 'Variação',
    options: OkaPillVariation.values,
    labelBuilder: (v) => v == OkaPillVariation.emLinha ? 'Em linha' : 'Empilhado',
    initialOption: OkaPillVariation.emLinha,
  );

  return Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: OkaPill(
        variation: variation,
        options: const ['Todos', 'Ativo', 'Pendente', 'Cancelado'],
      ),
    ),
  );
}

// ─── LISTA ────────────────────────────────────────────────────────────────────

@wb.UseCase(name: 'Lista', type: OkaListItem, path: '[Componentes]')
Widget listUseCase(BuildContext context) {
  final variation = context.knobs.list<OkaListVariation>(
    label: 'Variação',
    options: OkaListVariation.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaListVariation.defaultItem,
  );
  final tagStatus = context.knobs.list<OkaTagStatus>(
    label: 'Tag Status',
    options: OkaTagStatus.values,
    labelBuilder: (v) => v.name,
    initialOption: OkaTagStatus.ativo,
  );
  final title    = context.knobs.string(label: 'Título', initialValue: 'Título do item');
  final subtitle = context.knobs.string(label: 'Subtítulo', initialValue: 'Descrição complementar do item da lista');

  return Column(
    children: [
      const Divider(height: 1),
      OkaListItem(
        variation: variation,
        title: title,
        subtitle: subtitle,
        tagStatus: tagStatus,
        onTap: () {},
        onAction: () {},
      ),
      const Divider(height: 1),
    ],
  );
}
