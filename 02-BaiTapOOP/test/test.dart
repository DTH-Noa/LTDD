import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

void main(){
  /*
  var dienThoai = DienThoai('001', 'Samsung', 'Samsung Galaxy', 150, 200, 10, true);
  dienThoai.hienThongTin();
  print('Lợi nhuận dự kiến: ${dienThoai.tinhLoiNhuan()}');
  dienThoai.conBan() ? print('Còn bán') : print('Không còn bán');

  var hoaDon = HoaDon('001', DateTime.now(), dienThoai, 2, 250, 'Hieu', '0123456789');
  hoaDon.hienThongTinHoaDon();
  */

  var cuaHang = CuaHang('Noa', 'Hồ Chí Minh');
  cuaHang.themDT(DienThoai('DT-001', 'Samsung', 'Samsung Galaxy', 150, 200, 10, true));
  cuaHang.themDT(DienThoai('DT-002', 'Apple', 'iPhone 14 Pro', 300, 350, 8, true)) ;
  cuaHang.themDT(DienThoai('DT-003', 'Xiaomi', 'Redmi Note 12', 100, 150, 15, true));
  cuaHang.themDT(DienThoai('DT-004', 'Oppo', 'Oppo Reno 10', 120, 180, 12, true));
  cuaHang.themDT(DienThoai('DT-005', 'Vivo', 'Vivo X90', 110, 160, 20, true));

  cuaHang.hienDSDT();

  cuaHang.taoHoaDon(HoaDon('HD001', DateTime(2024, 11, 24), cuaHang.listDT[0] , 2, 400, 'Nguyen Van A', '0123456789'));
  cuaHang.taoHoaDon(HoaDon('HD001', DateTime(2024, 11, 25), cuaHang.listDT[1] , 2, 400, 'Tran Thi B', '0987654321'));
  cuaHang.taoHoaDon(HoaDon('HD001', DateTime(2024, 11, 25), cuaHang.listDT[0] , 2, 450, 'Le Van C', '0931122334'));
  cuaHang.taoHoaDon(HoaDon('HD001', DateTime(2024, 11, 26), cuaHang.listDT[3] , 1, 450, 'Nguyen Van A', '0931122334'));


  cuaHang.hienDSHD();

  cuaHang.timDTTheoMa('001');
  cuaHang.timHDTheoNgay(DateTime(2024,11,24));
  print('Tổng doanh thu: ${cuaHang.tinhDoanhThuTheoKhoangThoiGian(DateTime(2024,11,24), DateTime(2024,11,25))}');

  cuaHang.thongKeTonKho();
}