class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThaiBan;

  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTon, this._trangThaiBan);

  //Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTon => _soLuongTon;
  bool get trangthaiBan => _trangThaiBan;

  //Setters
  set maDienThoai(String maDienThoai){
    if (RegExp(r"^DT-\d{3}$").hasMatch(maDienThoai)){
      _maDienThoai = maDienThoai;
    }
  }
  set tenDienThoai(String tenDienThoai){
    if (tenDienThoai.isNotEmpty){
      _tenDienThoai = tenDienThoai;
    }
  }
  set hangSanXuat(String hangSanXuat){
    if (hangSanXuat.isNotEmpty){
      _hangSanXuat = hangSanXuat;
    }
  }
  set giaNhap(double giaNhap){
    if(giaNhap > 0) {
      _giaNhap = giaNhap;
    }
  }
  set giaBan(double giaBan){
    if(giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    }
  }
  set soLuongTon(int soLuongTon){
    if (soLuongTon >= 0) {
      _soLuongTon = soLuongTon;
    }
  }

  set trangThaiBan(bool trangThaiBan) => _trangThaiBan = trangThaiBan;

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() => (_giaBan - _giaNhap) * _soLuongTon;

  // Phương thức hiển thị thông tin
  void hienThongTin() {
    print("Mã điện thoại: $_maDienThoai");
    print("Tên: $_tenDienThoai");
    print("Hãng: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn: $_soLuongTon");
    print("Tình trạng kinh doanh: ${_trangThaiBan ? "Đang kinh doanh" : "Ngừng kinh doanh"}");
  }

  // Phương thức kiểm tra có thể bán hay không
  bool conBan() => _soLuongTon > 0 && _trangThaiBan;
}
