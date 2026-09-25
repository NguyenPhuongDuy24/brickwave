# 🎵 Brickwave

**Brickwave** là ứng dụng nghe nhạc SoundCloud dành cho **TrimUI Brick Pro**. Đây là dự án độc lập, không phải ứng dụng chính thức của SoundCloud và không có liên kết với SoundCloud.

## Tải xuống

Chọn đúng gói theo hệ điều hành đang dùng:

| Hệ điều hành | Gói cài đặt | Trạng thái |
|---|---|---|
| StockOS | [Brickwave-StockOS-00.4.25.zip](https://github.com/NguyenPhuongDuy24/brickwave/releases/download/Brickwave-00.4.25/Brickwave-StockOS-00.4.25.zip) | Đã chạy thực tế trên TrimUI Brick Pro |
| NextUI | [Brickwave-NextUI-00.2.0.zip](https://github.com/NguyenPhuongDuy24/brickwave/releases/download/Brickwave-00.4.25/Brickwave-NextUI-00.2.0.zip) | Chứa Brickwave 0.4.25; chưa kiểm thử trên thiết bị thật |

Không cài lẫn hai gói. Bản StockOS dùng thư mục `Apps`, còn bản NextUI dùng Tool Pak trong thư mục `Tools`.

## Cài lần đầu trên StockOS

1. Tải `Brickwave-StockOS-00.4.25.zip` và giải nén trên máy tính.
2. Mở thư mục `Apps` vừa giải nén.
3. Sao chép nguyên thư mục `Brickwave` vào thư mục `Apps` trên thẻ nhớ.
4. Kiểm tra đường dẫn cuối cùng:

```text
SD_CARD:\Apps\Brickwave\launch.sh
SD_CARD:\Apps\Brickwave\bin\brickwave
SD_CARD:\Apps\Brickwave\brickwave.png
```

5. Tháo thẻ an toàn, lắp lại vào TrimUI Brick Pro.
6. Kết nối Wi-Fi, vào app quét mã QR và đăng nhập trên trang SoundCloud chính thức.

Khi cập nhật, giữ lại `Apps/Brickwave/data` để bảo toàn phiên đăng nhập và cài đặt.

## Cài lần đầu trên NextUI

1. Tải `Brickwave-NextUI-00.2.0.zip` và giải nén trên máy tính.
2. Sao chép thư mục `Tools` vừa giải nén vào thư mục gốc của thẻ NextUI; chọn gộp với thư mục `Tools` đang có.
3. Kiểm tra đường dẫn cuối cùng:

```text
SD_CARD:\Tools\tg5040\Brickwave.pak\launch.sh
SD_CARD:\Tools\tg5040\Brickwave.pak\bin\brickwave
```

4. Tháo thẻ an toàn, khởi động NextUI, Kết nối Wi-Fi.
5. Vào **Tools** và chọn **Brickwave**. , quét mã QR và đăng nhập trên trang SoundCloud chính thức.

Dữ liệu đăng nhập và cài đặt nằm tại `.userdata/shared/BrickwaveNextUI/data`; cache ảnh nằm tại `.userdata/shared/BrickwaveNextUI/artwork-cache`. Cập nhật Tool Pak không ghi đè các thư mục này.

## Phím điều khiển

| Phím | Chức năng |
|---|---|
| Analog | Di chuyển con trỏ ảo |
| D-pad | Cuộn danh sách; di chuyển lựa chọn trên bàn phím ảo |
| A | Bấm, xác nhận hoặc giữ để kéo |
| B | Quay lại hoặc hủy |
| MENU | Mở hộp thoại xác nhận thoát ứng dụng |
| A trong hộp thoại thoát | Thoát ngay |
| B trong hộp thoại thoát | Hủy thoát |
| START | Phát hoặc tiếp tục bài đang tạm dừng |
| Y / SELECT | Tạm dừng và giữ nguyên vị trí |
| L1 / R1 | Bài trước / bài tiếp theo |
| POWER | Do StockOS hoặc NextUI xử lý |

Khi bàn phím ảo đang mở, dùng D-pad để chọn phím, A để nhập và B để đóng bàn phím.

## Lưu ý

- Cần kết nối mạng để đăng nhập, tải dữ liệu và phát nhạc.
- Brickwave không lưu mật khẩu SoundCloud trên thiết bị.
- Bản NextUI là Tool Pak độc lập cho nền tảng `tg5040` và thiết bị `brickpro`; chưa có xác nhận chạy thực tế trên NextUI.
