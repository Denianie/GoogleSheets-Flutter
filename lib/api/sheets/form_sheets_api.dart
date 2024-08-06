import 'package:gsheets/gsheets.dart';
import 'package:form/model/form.dart';

class FormSheetsApi {
  static const _credentials = r'''
{

}
''';
  static final _spreadsheetId = '1iqZadO9lItE6S4Wcu1ZqSdCLNzeDvg3L1zuIXFisiJg';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _formSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _formSheet = await _getWorkSheet(spreadsheet, title: 'Forms_alpha');

      final firstRow = FormFields.getFields();
      _formSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    return await spreadsheet.addWorksheet(title);
  }

  static Future insert(Map<String, String> row) async {
    if (_formSheet == null) return;
    _formSheet!.values.map.appendRow(row);
  }

}
