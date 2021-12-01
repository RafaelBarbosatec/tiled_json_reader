///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 01/12/21
class Text {
  final bool bold;
  final String color;
  final String fontFamily;
  final String hAlign;
  final bool italic;
  final bool kerning;
  final int pixelSize;
  final bool strikeout;
  final String text;
  final bool underline;
  final String vAlign;
  final bool wrap;

  Text({
    this.bold = false,
    this.color = '#000000',
    this.fontFamily = 'sans-serif',
    this.hAlign = 'left',
    this.italic = false,
    this.kerning = true,
    this.pixelSize = 16,
    this.strikeout = false,
    this.text = '',
    this.underline = false,
    this.vAlign = 'top',
    this.wrap = false,
  });

  Text.fromJson(Map<String, dynamic> json)
      : bold = json['bold'] ?? false,
        color = json['color'] ?? '#000000',
        fontFamily = json['fontfamily'] ?? 'sans-serif',
        hAlign = json['halign'] ?? 'left',
        italic = json['italic'] ?? false,
        kerning = json['kerning'] ?? true,
        pixelSize = int.tryParse(json['pixelsize'].toString()) ?? 16,
        strikeout = json['strikeout'] ?? false,
        text = json['text'] ?? '',
        underline = json['underline'] ?? false,
        vAlign = json['valign'] ?? 'top',
        wrap = json['wrap'] ?? false;

  Map toJson() {
    return {
      'bold': bold,
      'color': color,
      'fontfamily': fontFamily,
      'halign': hAlign,
      'italic': italic,
      'kerning': kerning,
      'pixelsize': pixelSize,
      'strikeout': strikeout,
      'text': text,
      'underline': underline,
      'valign': vAlign,
      'wrap': wrap,
    };
  }
}
