import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motodomi_app/lib.dart';

class ExceptionCtrl extends GetxController {
  void onDebugException(Object exception, StackTrace stackTrace) {
    log("=========================== EXCEPTION ===========================");
    log(exception.toString(), stackTrace: stackTrace);
  }

  void exception(Object exception) {
    switch (exception.runtimeType) {
      case FirebaseAuthException:
        _firebaseException(exception as FirebaseException);
        break;
      case FirebaseException:
        _firebaseException(exception as FirebaseException);
        break;
      case PasswordDoesNotMatchException:
        _passwordDoesNotMatchException(
            exception as PasswordDoesNotMatchException);
        break;
      case DioException:
        _dioException(exception as DioException);
        break;
      case GoogleSignInCancelledException:
        showSnackbar(
          "Ups! Cancelado 😢",
          "El inicio de sesión con Google fue cancelado",
        );
        break;
      case ExceptionMessage:
        showSnackbar(
          "Ups! Algo salió mal 😢",
          exception.toString(),
        );
        break;
      default:
        _defaultException(exception);
        break;
    }
  }

  _passwordDoesNotMatchException(PasswordDoesNotMatchException exception) {
    return showSnackbar(
      "Ups! Contraseña incorrecta 😢",
      passwordDoesNotMatchExceptionsCodeMap[exception.code] ?? exception.code,
    );
  }

  _firebaseException(FirebaseException exception) {
    var exceptionCodeAction = firebaseExceptionsCodeMap[exception.code];
    return showSnackbar(
      exceptionCodeAction?.title ?? 'Ups! Algo salió mal 😢',
      exceptionCodeAction?.description ?? 'Se produjo un error desconocido',
      actionLabel: exceptionCodeAction?.action,
      actionCallback: exceptionCodeAction?.onTap,
    );
  }

  _dioException(DioException exception) {
    return printError(
      info: dioExceptionsCodeMap[exception.response?.statusCode ?? 0] ??
          'Se produjo un error desconocido',
    );
  }

  _defaultException(Object exception) {
    return printError(
      info: exception.toString(),
    );
  }
}

Map<int, String> dioExceptionsCodeMap = {
  400: 'Falló la solicitud debido a un error del cliente',
  401: 'Acción no autorizada',
  403: 'Acceso denegado',
  404: 'No se encontró el recurso solicitado',
  409: 'Conflicto en la solicitud',
  408: 'Tiempo de espera de la solicitud',
  500: 'Error interno del servidor',
  503: 'Servicio no disponible',
  505: 'Versión HTTP no soportada',
};

Map<String, String> passwordDoesNotMatchExceptionsCodeMap = {
  'wrong-password': 'Contraseña incorrecta',
  'same-password': 'La contraseña actual y la nueva son iguales',
  'password-does-not-match': 'Las contraseñas no coinciden',
};

Map<String, ExceptionCodeAction> firebaseExceptionsCodeMap = {
  'unknown': ExceptionCodeAction(
    title: "Ups! Algo salió mal 😢",
    description: 'Se produjo un error desconocido',
  ),
  'wrong-password': ExceptionCodeAction(
    title: "Ups! Contraseña incorrecta 😢",
    description: 'La contraseña no es válida o el usuario no tiene contraseña',
    action: 'Recuperar contraseña',
  ),
  'weak-password': ExceptionCodeAction(
    title: "Ups! Contraseña débil 😢",
    description: 'La contraseña proporcionada no es válida',
  ),
  'invalid-email': ExceptionCodeAction(
    title: "Ups! Correo electrónico inválido 😢",
    description: 'La dirección de correo electrónico está mal formateada',
  ),
  'operation-not-allowed': ExceptionCodeAction(
    title: "Ups! Operación no permitida 😢",
    description:
        'Habilitar el inicio de sesión con correo electrónico / contraseña en la consola de Firebase, en la sección Método de inicio de sesión de la sección Auth.',
  ),
  'expired-action-code': ExceptionCodeAction(
    title: "Ups! Código de acción expirado 😢",
    description:
        'El código de acción ha caducado. Vuelva a enviar la solicitud para generar un nuevo código de acción',
  ),
  'invalid-action-code': ExceptionCodeAction(
    title: "Ups! Código de acción inválido 😢",
    description:
        'El código de acción no es válido. Esto puede suceder si el código está malformado o ya se ha utilizado',
  ),
  'user-disabled': ExceptionCodeAction(
    title: "Ups! Usuario deshabilitado 😢",
    description:
        'La cuenta de usuario ha sido deshabilitada por un administrador',
  ),
  'invalid-verification-code': ExceptionCodeAction(
    title: "Ups! Código de verificación inválido 😢",
    description:
        'El código de verificación de autenticación no es válido. Esto puede suceder si el código está malformado o ya se ha utilizado',
  ),
  'invalid-verification-id': ExceptionCodeAction(
    title: "Ups! ID de verificación inválido 😢",
    description:
        'El ID de verificación de autenticación no es válido. Esto puede suceder si el ID está malformado o ya se ha utilizado',
  ),
  'invalid-phone-number': ExceptionCodeAction(
    title: "Ups! Número de teléfono inválido 😢",
    description:
        'El número de teléfono proporcionado no es un número de teléfono válido',
  ),
  'too-many-requests': ExceptionCodeAction(
    title: "Ups! Demasiadas solicitudes 😢",
    description:
        'Se ha bloqueado la solicitud debido a actividades inusuales. Inténtalo de nuevo más tarde',
  ),
};

class ExceptionCodeAction {
  final String title;
  final String description;
  final String? action;
  final Function()? onTap;

  ExceptionCodeAction({
    required this.title,
    required this.description,
    this.action,
    this.onTap,
  });
}
