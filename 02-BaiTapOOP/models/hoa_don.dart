import 'dien_thoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dtBan;
  int _slMua;
  double _giaBanTT;
  String _tenKH;
  String _sdtKH;

  HoaDon(this._maHoaDon, this._ngayBan, this._dtBan, this._slMua,
      this._giaBanTT, this._tenKH, this._sdtKH);

  //Getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dtBan;
  int get slMua => _slMua;
  double get giaBanTT => _giaBanTT;
  String get tenKH => _tenKH;
  String get sdtKH => _sdtKH;

  //Setters
  set maHoaDon(String maHoaDon) {
    if (RegExp(r"^HD-\d{3}$").hasMatch(maHoaDon)) {
      _maHoaDon = maHoaDon;
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isAfter(DateTime.now())) {
      _ngayBan = ngayBan;
    }
  }

  set dtBan(DienThoai dtBan) => _dtBan = dtBan;

  set slMua(int slMua) {
    if (slMua > 0 && slMua <= _dtBan.soLuongTon) {
      _slMua = slMua;
    }
  }

  set tenKH(String tenKH) {
    if (tenKH.isNotEmpty) {
      _tenKH = tenKH;
    }
  }

  set sdtKH(String sdtKH) {
    if (RegExp(r"^\d{10,11}$").hasMatch(sdtKH)) {
      _sdtKH = sdtKH;
    }
  }

  //Phương thức tính tổng tiền
  double tinhTongTien() => _giaBanTT * _slMua;

  //Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    double tongTien = tinhTongTien();
    double chiPhiNhap = _dtBan.giaNhap * _slMua;
    return tongTien - chiPhiNhap;
  }

  //Phương thức hiển thị thông tin hóa đơn
  void hienThongTinHoaDon() {
    print("=== Thông tin hóa đơn ===");
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_ngayBan");
    print("Tên điện thoại: ${_dtBan.tenDienThoai}");
    print("Hãng: ${_dtBan.hangSanXuat}");
    print("Số lượng mua: $_slMua");
    print("Giá bán thực tế: $_giaBanTT");
    print("Tổng tiền: ${tinhTongTien()}");
    print("Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}");
    print("Tên khách hàng: $_tenKH");
    print("Số điện thoại khách: $_sdtKH");
  }
}
