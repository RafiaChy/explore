enum ApiUrl {
  baseUrl(
    'https://macus.vitecdevelopment.com:4200/api/',
  ), // favourGiverList
  favourGiverList(
    'favourGiverList',
  );

  const ApiUrl(
    this.value,
  );
  final String value;
}
