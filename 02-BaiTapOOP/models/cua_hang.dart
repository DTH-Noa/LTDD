import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _listDT = [];
  List<HoaDon> _listHD = [];

  CuaHang(this._tenCuaHang, this._diaChi);

  //Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get listDT => _listDT;
  List<HoaDon> get listHD => listHD;

  //Phương thức thêm điện thoại
  void themDT(DienThoai dienThoai) => _listDT.add(dienThoai);

  //Phương thức cập nhật thông tin điện thoại
  void suaThongTinDT(DienThoai dienThoai, int ma) {
    _listDT[ma] = dienThoai;
  }

  //Phương thức ngừng bán
  void ngungBan(int ma) {
    _listDT[ma].trangThaiBan = false;
  }

  //Phương thức tìm kiếm điện thoại
  void timDTTheoMa(String ma) {
    for (var dienthoai in _listDT) {
      if (dienthoai.maDienThoai.contains(ma)) {
        dienthoai.hienThongTin();
      }
    }
  }

  void timDTTheoTen(String ten) {
    for (var dienthoai in _listDT) {
      if (dienthoai.tenDienThoai.contains(ten)) {
        dienthoai.hienThongTin();
      }
    }
  }

  void timDTTheoHang(String hang) {
    for (var dienthoai in _listDT) {
      if (dienthoai.hangSanXuat.contains(hang)) {
        dienthoai.hienThongTin();
      }
    }
  }

  //Phương thức hiện danh sách điện thoại
  void hienDSDT() {
    for (var dienthoai in _listDT) {
      dienthoai.hienThongTin();
    }
  }

  //Phương thức tạo hóa đơn
  void taoHoaDon(HoaDon hoadon) {
    _listHD.add(hoadon);
    for (var dienthoai in _listDT) {
      if (dienthoai.maDienThoai == hoadon.dienThoai.maDienThoai) {
        dienthoai.soLuongTon -= hoadon.slMua;
      }
    }
  }

  //Phương thức tìm kiếm hóa đơn
  void timHDTheoMa(String ma) {
    for (var hoadon in _listHD) {
      if (hoadon.maHoaDon.contains(ma)) {
        hoadon.hienThongTinHoaDon();
      }
    }
  }

  void timHDTheoNgay(DateTime ngay) {
    for (var hoadon in _listHD) {
      if (hoadon.ngayBan == ngay) {
        hoadon.hienThongTinHoaDon();
      }
    }
  }

  void timHDTheoKH(String tenKH) {
    for (var hoadon in _listHD) {
      if (hoadon.tenKH.contains(tenKH)) {
        hoadon.hienThongTinHoaDon();
      }
    }
  }

  //Phương thức hiển thị danh sách hóa đơn
  void hienDSHD() {
    for (var hoadon in _listHD) {
      hoadon.hienThongTinHoaDon();
    }
  }

  //Phương thức tính doanh thu theo khoảng ngày
  double tinhDoanhThuTheoKhoangThoiGian(DateTime tuNgay, DateTime denNgay) {
    double doanhThu = 0;

    for (var hoadon in _listHD) {
      if (hoadon.ngayBan.isAfter(tuNgay) && hoadon.ngayBan.isBefore(denNgay) ||
          hoadon.ngayBan.isAtSameMomentAs(tuNgay) ||
          hoadon.ngayBan.isAtSameMomentAs(denNgay)) {
        doanhThu += hoadon.tinhTongTien();
      }
    }
    return doanhThu;
  }

  //Phương thức tính lợi nhuận theo khoảng ngày
  double tinhLoiNhuanTheoKhoangThoiGian(DateTime tuNgay, DateTime denNgay) {
    double loiNhuan = 0;
    for (var hoadon in _listHD) {
      if (hoadon.ngayBan.isAfter(tuNgay) && hoadon.ngayBan.isBefore(denNgay) ||
          hoadon.ngayBan.isAtSameMomentAs(tuNgay) ||
          hoadon.ngayBan.isAtSameMomentAs(denNgay)) {
        loiNhuan += hoadon.tinhLoiNhuanThucTe();
      }
    }
    return loiNhuan;
  }

  //Phương thức tìm top điện thoại bán chạy
  List<DienThoai> thongKeTopDienThoaiBanChay(int topN) {
    Map<String, int> soLuongBan = {};

    // Tính tổng số lượng bán của mỗi điện thoại
    for (var hoadon in _listHD) {
      var maDT = hoadon.dienThoai.maDienThoai;
      soLuongBan[maDT] = (soLuongBan[maDT] ?? 0) + hoadon.slMua;
    }

    // Sắp xếp theo số lượng bán giảm dần
    var sortedMaDT = soLuongBan.keys.toList()
      ..sort((a, b) => soLuongBan[b]!.compareTo(soLuongBan[a]!));

    // Lấy top N điện thoại bán chạy nhất
    List<DienThoai> topBanChay = [];
    for (var maDT in sortedMaDT.take(topN)) {
      var dt = _listDT.firstWhere((dienThoai) => dienThoai.maDienThoai == maDT);
      topBanChay.add(dt);
    }

    return topBanChay;
  }

  //Thống kê tồn kho
  void thongKeTonKho() {
    print("Danh sách điện thoại còn tồn kho:");
    for (var dienthoai in _listDT) {
      if (dienthoai.soLuongTon > 0) {
        print(
            "Mã: ${dienthoai.maDienThoai}, Tên: ${dienthoai.tenDienThoai}, Số lượng tồn: ${dienthoai.soLuongTon}");
      }
    }
  }
}
