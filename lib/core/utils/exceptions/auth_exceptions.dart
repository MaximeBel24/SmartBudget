// Generic Exceptions

class GenericAuthException implements Exception {
  @override
  String toString() {
    return 'Une erreur est survenue veuillez réessayer';
  }
}

// Register Exceptions

class WeakPasswordAuthException implements GenericAuthException{
 @override
  String toString() {
    return 'Le mot de passe doit contenir au moins 6 caractères.';
  }
}

class EmailAlreadyExistsAuthException implements GenericAuthException {
  @override
  String toString() {
    return 'Un compte est déjà associé à cette adresse mail.';
  }
}