# Banking Payment Account Segmentation
## 1. Giới thiệu
Dự án này được triển khai với mục tiêu thu thập và phân tích chi tiết dữ liệu thanh toán của khách hàng tại ngân hàng VNC trong **quý 1 năm 2024**. Báo cáo tập trung vào việc theo dõi các giao dịch trong ba tháng đầu năm—bao gồm dòng tiền vào, dòng tiền ra, các hoạt động gửi tiền, rút tiền, và số dư cuối kỳ của tài khoản. Dự án không chỉ cung cấp cái nhìn tổng quan về hoạt động thanh toán mà còn tập trung phân tích **Top 3 khách hàng có tổng khối lượng giao dịch lớn nhất**. Thông qua việc nghiên cứu kỹ lưỡng các thông tin này, mục tiêu chính là hiểu rõ **hành vi khách hàng**, từ đó đưa ra các đề xuất nhằm **nâng cao chất lượng dịch vụ ngân hàng** và **tối ưu hóa quy trình vận hành**.

## 2. Mục tiêu của dự án
- **Theo dõi và đánh giá hoạt động thanh toán**: Dự án phân tích chi tiết dòng tiền của khách hàng theo từng tháng trong quý 1, bao gồm cả tiền gửi, tiền rút, và tổng giá trị giao dịch. Điều này giúp đánh giá **mức độ hoạt động giao dịch**, **xu hướng sử dụng dịch vụ ngân hàng**, và khả năng duy trì tài chính của khách hàng trong từng giai đoạn. Qua đó, ngân hàng có thể nhận diện các điểm mạnh và yếu trong quá trình cung cấp dịch vụ.

- **Quản lý và giám sát số dư tài khoản**: Một trong những mục tiêu quan trọng của dự án là theo dõi sự biến động của **số dư đầu kỳ và cuối kỳ** để kiểm soát dòng tiền ra vào một cách hiệu quả. Việc này đóng vai trò quan trọng trong **quản lý thanh khoản** của ngân hàng, đảm bảo nguồn lực tài chính luôn được điều hành đúng đắn, từ đó giảm thiểu rủi ro thanh khoản và tăng cường hiệu quả sử dụng vốn.

- **Xác định khách hàng trọng điểm**: Dự án sẽ tập trung phân tích và nhận diện những khách hàng có **khối lượng giao dịch cao nhất** trong quý 1. Đây là những khách hàng có tiềm năng lớn, và việc hiểu rõ nhu cầu, hành vi của họ giúp ngân hàng xây dựng các **chiến lược chăm sóc khách hàng cá nhân hóa**, đưa ra các **chương trình ưu đãi** và **sản phẩm dịch vụ phù hợp** nhằm **nâng cao sự hài lòng** và **gắn kết lâu dài**. Mục tiêu cuối cùng là phát triển các mối quan hệ bền vững, tạo ra giá trị lâu dài cho cả khách hàng lẫn ngân hàng.

## 3. Đọc hiểu và xử lý dữ liệu

### BÀI TOÁN 1: Báo cáo tình hình hoạt động thanh toán 3 tháng đầu năm 2024
- Truy vấn: Xem tại BAOCAO_THANHTOAN.sql
- Kết quả:
|  |  |  **BÁO CÁO TÌNH HÌNH THANH TOÁN QUÝ I NĂM 2024** |  |  |
| --- | --- | --- | --- | --- |
| **STT** | **Nội dung** | **Tháng 1/2024** | **Tháng 2/2024** | **Tháng 3/2024** |
| 1 | **Số dư đầu kỳ** | 4,881,707,064 | 13,511,699,165 | 13,013,399,298 |
| 2 | **Tiền ra** | 29,301,249,412 | 33,836,051,028 | 31,989,792,426 |
| 3 | **Tiền vào** | 18,483,367,417 | 29,049,591,161 | 29,049,591,161 |
| 4 | **Rút tiền mặt** | 7,500,000 | 180,040,000 | 9,761,400,000 |
| 5 | **Nộp tiền mặt** | 20,000,000,000 | 7,850,000,000 |  |
| 6 | **Số dư cuối kỳ** | 13,333,106,266 | 12,892,439,298 | 7,395,796,383 |

Bảng báo cáo chi tiết về tình hình thanh toán trong Quý 1/2024 cung cấp thông tin về các giao dịch liên quan đến tài khoản của khách hàng, bao gồm các khoản tiền gửi, tiền rút, và sự biến động của số dư đầu kỳ và số dư cuối kỳ.

- Tháng 1/2024: Số dư đầu kỳ là 4.881.707.064 VND. Tổng tiền ra trong tháng là 29.301.249.412 VND, trong khi dòng tiền vào đạt 18.438.367.417 VND. Sau khi khấu trừ các giao dịch rút tiền mặt và nộp tiền mặt, số dư cuối kỳ là 13.333.106.266 VND.
- Tháng 2/2024: Số dư đầu kỳ tăng mạnh lên 13.511.699.165 VND. Dòng tiền ra tiếp tục tăng với 33.836.051.028 VND, nhưng dòng tiền vào cũng tăng theo, đạt 29.049.591.161 VND, cho thấy khách hàng tiếp tục sử dụng các dịch vụ thanh toán của ngân hàng một cách tích cực. Số dư cuối kỳ ghi nhận là 12.892.439.298 VND.
- Tháng 3/2024: Dòng tiền ra trong tháng đạt 31.989.792.426 VND, tuy nhiên số dư cuối kỳ giảm xuống còn 7.395.796.383 VND, cho thấy lượng tiền rút tăng cao hoặc các khoản tiền gửi không đáp ứng đủ dòng tiền rút.
**Kết quả**:
- Dữ liệu cho thấy dòng tiền ra vào ngân hàng khá ổn định trong cả ba tháng. Tuy nhiên, xu hướng số dư cuối kỳ giảm dần từ tháng 1 đến tháng 3 là một dấu hiệu cho thấy cần thắt chặt việc quản lý dòng tiền, đặc biệt là trong việc kiểm soát thanh khoản.
**Phân tích kết quả**:
- Tỷ lệ giao dịch thanh toán cao cho thấy khách hàng có mức độ sử dụng các dịch vụ ngân hàng liên tục và ổn định. Tuy nhiên, xu hướng giảm số dư cuối kỳ cảnh báo ngân hàng cần chú ý hơn đến việc tăng trưởng tiền gửi và giảm thiểu tỷ lệ rút tiền để duy trì trạng thái thanh khoản an toàn.
- Mức độ rút tiền mặt tăng lên trong các tháng gần đây có thể phản ánh nhu cầu sử dụng tiền mặt của khách hàng, đặc biệt là để tài trợ cho các giao dịch kinh doanh hoặc đầu tư, dẫn đến rủi ro thanh khoản tiền mặt.

### BÀI TOÁN 2: BÁO CÁO TOP 3 KHÁCH HÀNG CÓ TỔNG LƯỢNG TIỀN GIAO DỊCH (CẢ NHẬN VÀ CHUYỂN) LỚN NHẤT
- Truy vấn: Xem tại BAOCAO_TOP3.sql
- Kết quả:
|  |  | TOP 3 KHÁCH HÀNG CÓ TỔNG LƯỢNG TIỀN GIAO DỊCH (CẢ NHẬN VÀ CHUYỂN) LỚN NHẤT |  |  |  |
| --- | --- | --- | --- | --- | --- |
| STT | Mã KH | Chi nhánh | Tên khách hàng | Tài khoản Casa | Tổng tiền GD |
| 1 | CIF0001951 | NH TMCP VNC - Chi nhánh Đống Đa | CÔNG TY CP ĐẦU TƯ PHÁT TRIỂN ĐÔ THỊ SDA | CASA0001951 | 1,35354E+11 |
| 2 | CIF0002560 | NH TMCP VNC - Chi nhánh Đống Đa | CÔNG TY CP SX VÀ ĐT VIỆT GAP | CASA0002560 | 22325646466 |
| 3 | CIF0019418 | NH TMCP VNC - Chi nhánh Huế | CÔNG TY CỔ PHẦN ĐẦU TƯ THIÊN HẠ | CASA0019418 | 20306314850 |

Bảng Top 3 khách hàng có tổng lượng tiền giao dịch lớn nhất cho thấy những khách hàng có số lượng giao dịch thanh toán lớn nhất trong Quý 1/2024:

- Công ty CP Đầu tư Phát triển Đô thị SDA: Tổng lượng giao dịch đạt 135.353.710.254 VND, là khách hàng có tổng lượng giao dịch cao nhất. Điều này chứng tỏ mức độ tín nhiệm vào các dịch vụ thanh toán của ngân hàng và vai trò chiến lược của công ty này trong danh mục khách hàng trọng yếu.
- Công ty CP SX và ĐT Việt Gap: Với tổng giá trị giao dịch đạt 22.325.646.466 VND, khách hàng này cũng có khối lượng giao dịch lớn, mặc dù thấp hơn đáng kể so với khách hàng đầu tiên.
- Công ty CP Đầu tư Thiên Hạ: Tổng giao dịch đạt 20.306.314.850 VND, là một khách hàng quan trọng với mức độ sử dụng các dịch vụ thanh toán cao.
**Kết quả**:
- Những khách hàng này có khối lượng giao dịch cao, phản ánh mức độ sử dụng các sản phẩm thanh toán và dịch vụ tài chính của ngân hàng một cách tích cực. Đặc biệt, Công ty CP Đầu tư Phát triển Đô thị SDA có giá trị giao dịch vượt trội, cho thấy tiềm năng lớn để phát triển mối quan hệ hợp tác lâu dài.
**Phân tích kết quả**:
- Công ty CP Đầu tư Phát triển Đô thị SDA là khách hàng chiến lược, với lượng giao dịch lớn vượt trội. Ngân hàng nên ưu tiên xây dựng các giải pháp thanh toán chuyên biệt để duy trì và phát triển quan hệ đối tác.
- Hai khách hàng còn lại tuy có lượng giao dịch thấp hơn nhưng vẫn đóng vai trò quan trọng trong việc đẩy mạnh hoạt động thanh toán. Đặc biệt, việc hiểu rõ nhu cầu và hành vi giao dịch của nhóm khách hàng này sẽ giúp ngân hàng xây dựng chiến lược chăm sóc khách hàng cá nhân hóa, từ đó gia tăng lòng trung thành và sự gắn bó.

## KẾT LUẬN
Dự án "Quản lý và giám sát số dư tài khoản" đã mang lại những insights quan trọng về tình hình thanh toán trong quý 1 năm 2024. Qua việc theo dõi sự biến động của số dư tài khoản, chúng ta có thể khẳng định rằng ngân hàng đang duy trì một mức độ giao dịch cao từ phía khách hàng. Tuy nhiên, sự sụt giảm liên tục của số dư cuối kỳ từ tháng 1 đến tháng 3 cho thấy ngân hàng cần có các biện pháp quản lý thanh khoản chặt chẽ hơn.

Việc phân tích số liệu về các giao dịch thanh toán đã chỉ ra rằng dòng tiền ra vào có sự ổn định, nhưng đồng thời cũng đặt ra thách thức trong việc kiểm soát rủi ro thanh khoản. Các biến động trong nhu cầu rút tiền mặt cho thấy một xu hướng tăng cao, có thể phản ánh nhu cầu tài chính cấp thiết từ phía khách hàng, đặc biệt trong bối cảnh kinh tế hiện tại. Do đó, ngân hàng cần xem xét lại các chính sách về tiền gửi và rút tiền để tối ưu hóa quy trình quản lý dòng tiền và bảo đảm trạng thái thanh khoản.

Đặc biệt, phân tích về các khách hàng trọng điểm đã chỉ rõ vai trò chiến lược của những khách hàng có khối lượng giao dịch lớn. Ngân hàng cần triển khai các chương trình chăm sóc khách hàng cá nhân hóa và xây dựng các giải pháp thanh toán linh hoạt để tối ưu hóa trải nghiệm của khách hàng, đồng thời phát triển mối quan hệ hợp tác lâu dài. Việc duy trì và gia tăng sự hài lòng của những khách hàng chiến lược sẽ góp phần củng cố vị thế của ngân hàng trong thị trường cạnh tranh khốc liệt hiện nay.

Tóm lại, việc tăng cường quản lý thanh khoản và tối ưu hóa chiến lược chăm sóc khách hàng sẽ là những yếu tố quyết định cho sự thành công và phát triển bền vững của ngân hàng trong tương lai.
