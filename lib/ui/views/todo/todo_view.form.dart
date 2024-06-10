// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TodoTitleInputValueKey = 'todoTitleInput';

final Map<String, TextEditingController> _TodoViewTextEditingControllers = {};

final Map<String, FocusNode> _TodoViewFocusNodes = {};

final Map<String, String? Function(String?)?> _TodoViewTextValidations = {
  TodoTitleInputValueKey: null,
};

mixin $TodoView {
  TextEditingController get todoTitleInputController =>
      _getFormTextEditingController(TodoTitleInputValueKey);

  FocusNode get todoTitleInputFocusNode =>
      _getFormFocusNode(TodoTitleInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TodoViewTextEditingControllers.containsKey(key)) {
      return _TodoViewTextEditingControllers[key]!;
    }

    _TodoViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TodoViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TodoViewFocusNodes.containsKey(key)) {
      return _TodoViewFocusNodes[key]!;
    }
    _TodoViewFocusNodes[key] = FocusNode();
    return _TodoViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    todoTitleInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    todoTitleInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TodoTitleInputValueKey: todoTitleInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _TodoViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TodoViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TodoViewTextEditingControllers.clear();
    _TodoViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get todoTitleInputValue =>
      this.formValueMap[TodoTitleInputValueKey] as String?;

  set todoTitleInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TodoTitleInputValueKey: value}),
    );

    if (_TodoViewTextEditingControllers.containsKey(TodoTitleInputValueKey)) {
      _TodoViewTextEditingControllers[TodoTitleInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasTodoTitleInput =>
      this.formValueMap.containsKey(TodoTitleInputValueKey) &&
      (todoTitleInputValue?.isNotEmpty ?? false);

  bool get hasTodoTitleInputValidationMessage =>
      this.fieldsValidationMessages[TodoTitleInputValueKey]?.isNotEmpty ??
      false;

  String? get todoTitleInputValidationMessage =>
      this.fieldsValidationMessages[TodoTitleInputValueKey];
}

extension Methods on FormStateHelper {
  setTodoTitleInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TodoTitleInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    todoTitleInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TodoTitleInputValueKey: getValidationMessage(TodoTitleInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TodoViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TodoViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TodoTitleInputValueKey: getValidationMessage(TodoTitleInputValueKey),
    });
