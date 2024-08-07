String? emtypValidator(String? content) {
  if (content!.isEmpty) {
    return 'Field is required';
  }
  return null;
}
