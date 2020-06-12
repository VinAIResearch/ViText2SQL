select t1.id tài_sản , t1.chi_tiết tài_sản from tài_sản as t1 join bộ_phận của tài_sản as t2 on t1.id tài_sản = t2.id tài_sản group by t1.id tài_sản having count ( * ) = 2 intersect select t1.id tài_sản , t1.chi_tiết tài_sản from tài_sản as t1 join nhật_ký lỗi as t2 on t1.id tài_sản = t2.id tài_sản group by t1.id tài_sản having count ( * ) < 2	assets_maintenance
select count ( * ) , t1.id hợp_đồng bảo_trì from hợp_đồng bảo_trì as t1 join tài_sản as t2 on t1.id hợp_đồng bảo_trì = t2.id hợp_đồng bảo_trì group by t1.id hợp_đồng bảo_trì	assets_maintenance
select count ( * ) , t1.id công_ty from công_ty bên thứ ba as t1 join tài_sản as t2 on t1.id công_ty = t2.id công_ty cung_cấp group by t1.id công_ty	assets_maintenance
select t1.id công_ty , t1.tên công_ty from công_ty bên thứ ba as t1 join kỹ_sư bảo_trì as t2 on t1.id công_ty = t2.id công_ty group by t1.id công_ty having count ( * ) >= 2 union select t3.id công_ty , t3.tên công_ty from công_ty bên thứ ba as t3 join hợp_đồng bảo_trì as t4 on t3.id công_ty = t4.id hợp_đồng bảo_trì của công_ty group by t3.id công_ty having count ( * ) >= 2	assets_maintenance
select t1.tên nhân_viên , t1.id nhân_viên from nhân_viên as t1 join nhật_ký lỗi as t2 on t1.id nhân_viên = t2.được ghi lại bởi nhân_viên có id except select t3.tên nhân_viên , t3.id nhân_viên from nhân_viên as t3 join chuyến thăm của kỹ_sư as t4 on t3.id nhân_viên = t4.id nhân_viên liên_lạc	assets_maintenance
select t1.id kỹ_sư , t1.tên , t1.họ from kỹ_sư bảo_trì as t1 join chuyến thăm của kỹ_sư as t2 group by t1.id kỹ_sư order by count ( * ) desc limit 1	assets_maintenance
select t1.tên bộ_phận , t1.id bộ_phận from bộ_phận as t1 join lỗi bộ_phận as t2 on t1.id bộ_phận = t2.id bộ_phận group by t1.id bộ_phận having count ( * ) > 2	assets_maintenance
select t1.tên , t1.họ , t1.những chi_tiết khác , t3.mô_tả về kỹ_năng from kỹ_sư bảo_trì as t1 join kỹ_năng của kỹ_sư as t2 on t1.id kỹ_sư = t2.id kỹ_sư join kỹ_năng as t3 on t2.id kỹ_năng = t3.id kỹ_năng	assets_maintenance
select t1.tên viết tắt của lỗi , t3.mô_tả về kỹ_năng from lỗi bộ_phận as t1 join kỹ_năng cần để sửa_chữa as t2 on t1.id bộ_phận bị lỗi = t2.id bộ_phận bị lỗi join kỹ_năng as t3 on t2.id kỹ_năng = t3.id kỹ_năng	assets_maintenance
select t1.tên bộ_phận , count ( * ) from bộ_phận as t1 join bộ_phận của tài_sản as t2 on t1.id bộ_phận = t2.id bộ_phận group by t1.tên bộ_phận	assets_maintenance
select t1.mô_tả về lỗi , t2.tình_trạng lỗi from nhật_ký lỗi as t1 join nhật_ký của lỗi bộ_phận as t2 on t1.id mục nhập của nhật_ký lỗi = t2.id mục nhập của nhật_ký lỗi	assets_maintenance
select count ( * ) , t1.id mục nhập của nhật_ký lỗi from nhật_ký lỗi as t1 join chuyến thăm của kỹ_sư as t2 on t1.id mục nhập của nhật_ký lỗi = t2.id mục nhập của nhật_ký lỗi group by t1.id mục nhập của nhật_ký lỗi order by count ( * ) desc limit 1	assets_maintenance
select distinct họ from kỹ_sư bảo_trì	assets_maintenance
select distinct tình_trạng lỗi from nhật_ký của lỗi bộ_phận	assets_maintenance
select tên , họ from kỹ_sư bảo_trì where id kỹ_sư not in ( select id kỹ_sư from chuyến thăm của kỹ_sư )	assets_maintenance
select id tài_sản , chi_tiết tài_sản , thương_hiệu tài_sản , mẫu_mã tài_sản from tài_sản	assets_maintenance
select ngày mua tài_sản from tài_sản order by ngày mua tài_sản asc limit 1	assets_maintenance
select t1.id bộ_phận , t1.tên bộ_phận from bộ_phận as t1 join lỗi bộ_phận as t2 on t1.id bộ_phận = t2.id bộ_phận join kỹ_năng cần để sửa_chữa as t3 on t2.id bộ_phận bị lỗi = t3.id bộ_phận bị lỗi group by t1.id bộ_phận order by count ( * ) desc limit 1	assets_maintenance
select t1.tên bộ_phận from bộ_phận as t1 join lỗi bộ_phận as t2 on t1.id bộ_phận = t2.id bộ_phận group by t1.tên bộ_phận order by count ( * ) asc limit 1	assets_maintenance
select t1.id kỹ_sư , t1.tên , t1.họ from kỹ_sư bảo_trì as t1 join chuyến thăm của kỹ_sư as t2 on t1.id kỹ_sư = t2.id kỹ_sư group by t1.id kỹ_sư order by count ( * ) asc limit 1	assets_maintenance
select t1.tên nhân_viên , t3.tên , t3.họ from nhân_viên as t1 join chuyến thăm của kỹ_sư as t2 on t1.id nhân_viên = t2.id nhân_viên liên_lạc join kỹ_sư bảo_trì as t3 on t2.id kỹ_sư = t3.id kỹ_sư	assets_maintenance
select t1.id mục nhập của nhật_ký lỗi , t1.mô_tả về lỗi , t1.thời_gian mục nhập của nhật_ký lỗi from nhật_ký lỗi as t1 join nhật_ký của lỗi bộ_phận as t2 on t1.id mục nhập của nhật_ký lỗi = t2.id mục nhập của nhật_ký lỗi group by t1.id mục nhập của nhật_ký lỗi order by count ( * ) desc limit 1	assets_maintenance
select t1.id kỹ_năng , t1.mô_tả về kỹ_năng from kỹ_năng as t1 join kỹ_năng cần để sửa_chữa as t2 on t1.id kỹ_năng = t2.id kỹ_năng group by t1.id kỹ_năng order by count ( * ) desc limit 1	assets_maintenance
select distinct mẫu_mã tài_sản from tài_sản	assets_maintenance
select thương_hiệu tài_sản , mẫu_mã tài_sản , chi_tiết tài_sản from tài_sản order by ngày thanh_lý tài_sản asc	assets_maintenance
select id bộ_phận , số tiền phải trả from bộ_phận order by số tiền phải trả asc limit 1	assets_maintenance
select t1.tên công_ty from công_ty bên thứ ba as t1 join hợp_đồng bảo_trì as t2 on t1.id công_ty = t2.id hợp_đồng bảo_trì của công_ty order by t2.ngày bắt_đầu hợp_đồng asc limit 1	assets_maintenance
select t1.tên công_ty from công_ty bên thứ ba as t1 join hợp_đồng bảo_trì as t2 on t1.id công_ty = t2.id hợp_đồng bảo_trì của công_ty order by t2.ngày kết_thúc hợp_đồng desc limit 1	assets_maintenance
select giới_tính from nhân_viên group by giới_tính order by count ( * ) desc limit 1	assets_maintenance
select t1.tên nhân_viên , count ( * ) from nhân_viên as t1 join chuyến thăm của kỹ_sư as t2 on t1.id nhân_viên = t2.id nhân_viên liên_lạc group by t1.tên nhân_viên	assets_maintenance
select mẫu_mã tài_sản from tài_sản where id tài_sản not in (select id tài_sản from nhật_ký lỗi)	assets_maintenance
select count ( * ) from sách	book_2
select tác_giả from sách order by tác_giả asc	book_2
select tiêu_đề from sách order by số_lượng phát_hành asc	book_2
select tiêu_đề from sách where tác_giả != "Elaine Lee"	book_2
select tiêu_đề , số_lượng phát_hành from sách	book_2
select ngày xuất_bản from ấn_phẩm order by giá bán desc	book_2
select distinct nhà_xuất_bản from ấn_phẩm where giá bán > 5000000	book_2
select nhà_xuất_bản from ấn_phẩm order by giá bán desc limit 1	book_2
select ngày xuất_bản from ấn_phẩm order by giá bán asc limit 3	book_2
select t1.tiêu_đề , t2.ngày xuất_bản from sách as t1 join ấn_phẩm as t2 on t1.id sách = t2.id sách	book_2
select t1.tác_giả from sách as t1 join ấn_phẩm as t2 on t1.id sách = t2.id sách where t2.giá bán > 4000000	book_2
select t1.tiêu_đề from sách as t1 join ấn_phẩm as t2 on t1.id sách = t2.id sách order by t2.giá bán desc	book_2
select nhà_xuất_bản from ấn_phẩm group by nhà_xuất_bản having count ( * ) > 1	book_2
select nhà_xuất_bản , count ( * ) from ấn_phẩm group by nhà_xuất_bản	book_2
select ngày xuất_bản from ấn_phẩm group by ngày xuất_bản order by count ( * ) desc limit 1	book_2
select tác_giả from sách group by tác_giả having count ( * ) > 1	book_2
select tiêu_đề from sách where id sách not in ( select id sách from ấn_phẩm )	book_2
select nhà_xuất_bản from ấn_phẩm where giá bán > 10000000 intersect select nhà_xuất_bản from ấn_phẩm where giá bán < 5000000	book_2
select count ( distinct ngày xuất_bản ) from ấn_phẩm	book_2
select count ( distinct ngày xuất_bản ) from ấn_phẩm	book_2
select giá bán from ấn_phẩm where nhà_xuất_bản = "Person" or nhà_xuất_bản = "Wiley"	book_2
select tên bộ_phận from bộ_phận order by ngày bắt_đầu quản_lý	company_1
select tên người phụ_thuộc from người phụ_thuộc where mối quan_hệ = "Spouse"	company_1
select count ( * ) from người phụ_thuộc where giới_tính = "F"	company_1
select t1.tên bộ_phận from bộ_phận as t1 join địa_điểm của bộ_phận as t2 on t1.mã_số bộ_phận = t2.mã_số bộ_phận where t2.địa_điểm bộ_phận = "Houston"	company_1
select tên , họ from nhân_viên where lương > 30000	company_1
select count ( * ) , giới_tính from nhân_viên where lương < 50000 group by giới_tính	company_1
select tên , họ , địa_chỉ from nhân_viên order by ngày_sinh	company_1
select count ( * ) from giáo_viên	course_teach
select count ( * ) from giáo_viên	course_teach
select tên from giáo_viên order by tuổi asc	course_teach
select tên from giáo_viên order by tuổi asc	course_teach
select tuổi , quê_quán from giáo_viên	course_teach
select tuổi , quê_quán from giáo_viên	course_teach
select tên from giáo_viên where quê_quán != "Little Lever Urban Distric"	course_teach
select tên from giáo_viên where quê_quán != "Little Lever Urban Distric"	course_teach
select tên from giáo_viên where tuổi = 32 or tuổi = 33	course_teach
select tên from giáo_viên where tuổi = 32 or tuổi = 33	course_teach
select quê_quán from giáo_viên order by tuổi asc limit 1	course_teach
select quê_quán from giáo_viên order by tuổi asc limit 1	course_teach
select quê_quán , count ( * ) from giáo_viên group by quê_quán	course_teach
select quê_quán , count ( * ) from giáo_viên group by quê_quán	course_teach
select quê_quán from giáo_viên group by quê_quán order by count ( * ) desc limit 1	course_teach
select quê_quán from giáo_viên group by quê_quán order by count ( * ) desc limit 1	course_teach
select quê_quán from giáo_viên group by quê_quán having count ( * ) >= 2	course_teach
select quê_quán from giáo_viên group by quê_quán having count ( * ) >= 2	course_teach
select t3.tên , t2.khoá học from sắp_xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo_viên as t3 on t1.id giáo_viên = t3.id giáo_viên	course_teach
select t3.tên , t2.khoá học from sắp_xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo_viên as t3 on t1.id giáo_viên = t3.id giáo_viên	course_teach
select t3.tên , t2.khoá học from sắp_xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo_viên as t3 on t1.id giáo_viên = t3.id giáo_viên order by t3.tên	course_teach
select t3.tên , t2.khoá học from sắp_xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo_viên as t3 on t1.id giáo_viên = t3.id giáo_viên order by t3.tên	course_teach
select t3.tên from sắp_xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo_viên as t3 on t1.id giáo_viên = t3.id giáo_viên where t2.khoá học = "Math"	course_teach
select t3.tên from sắp_xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo_viên as t3 on t1.id giáo_viên = t3.id giáo_viên where t2.khoá học = "Math"	course_teach
select t2.tên , count ( * ) from sắp_xếp khoá học as t1 join giáo_viên as t2 on t1.id giáo_viên = t2.id giáo_viên group by t2.tên	course_teach
select t2.tên , count ( * ) from sắp_xếp khoá học as t1 join giáo_viên as t2 on t1.id giáo_viên = t2.id giáo_viên group by t2.tên	course_teach
select t2.tên from sắp_xếp khoá học as t1 join giáo_viên as t2 on t1.id giáo_viên = t2.id giáo_viên group by t2.tên having count ( * ) >= 2	course_teach
select t2.tên from sắp_xếp khoá học as t1 join giáo_viên as t2 on t1.id giáo_viên = t2.id giáo_viên group by t2.tên having count ( * ) >= 2	course_teach
select tên from giáo_viên where id giáo_viên not in ( select id giáo_viên from sắp_xếp khoá học )	course_teach
select tên from giáo_viên where id giáo_viên not in ( select id giáo_viên from sắp_xếp khoá học )	course_teach
select count ( * ) from thành_viên	decoration_competition
select tên from thành_viên order by tên asc	decoration_competition
select tên , quốc_gia from thành_viên	decoration_competition
select tên from thành_viên where quốc_gia = "United States" or quốc_gia = "Canada"	decoration_competition
select quốc_gia , count ( * ) from thành_viên group by quốc_gia	decoration_competition
select quốc_gia from thành_viên group by quốc_gia order by count ( * ) desc limit 1	decoration_competition
select quốc_gia from thành_viên group by quốc_gia having count ( * ) > 2	decoration_competition
select tên lãnh_đạo , địa_điểm trường đại_học from trường đại_học	decoration_competition
select t2.tên , t1.tên from trường đại_học as t1 join thành_viên as t2 on t1.id đại_học = t2.id đại_học	decoration_competition
select t2.tên , t1.địa_điểm trường đại_học from trường đại_học as t1 join thành_viên as t2 on t1.id đại_học = t2.id đại_học order by t2.tên asc	decoration_competition
select distinct t1.tên lãnh_đạo from trường đại_học as t1 join thành_viên as t2 on t1.id đại_học = t2.id đại_học where t2.quốc_gia = "Canada"	decoration_competition
select t1.tên , t2.chủ_đề trang_trí from thành_viên as t1 join vòng as t2 on t1.id thành_viên = t2.id thành_viên	decoration_competition
select t1.tên from thành_viên as t1 join vòng as t2 on t1.id thành_viên = t2.id thành_viên where t2.xếp_hạng từng vòng > 3	decoration_competition
select t1.tên from thành_viên as t1 join vòng as t2 on t1.id thành_viên = t2.id thành_viên order by xếp_hạng từng vòng asc	decoration_competition
select tên from thành_viên where id thành_viên not in ( select id thành_viên from vòng )	decoration_competition
select count ( * ) from cuộc bầu_cử	election_representative
select số_lượng phiếu bầu from cuộc bầu_cử order by số_lượng phiếu bầu desc	election_representative
select ngày , tỉ_lệ phiếu bầu from cuộc bầu_cử	election_representative
select min ( tỉ_lệ phiếu bầu ) , max ( tỉ_lệ phiếu bầu ) from cuộc bầu_cử	election_representative
select tên , đảng from đại_diện	election_representative
select tên from đại_diện where đảng != "Republican"	election_representative
select tuổi_thọ from đại_diện where tiểu_bang = "New York" or tiểu_bang = "Indiana"	election_representative
select t2.tên , t1.ngày from cuộc bầu_cử as t1 join đại_diện as t2 on t1.id đại_diện = t2.id đại_diện	election_representative
select t2.tên from cuộc bầu_cử as t1 join đại_diện as t2 on t1.id đại_diện = t2.id đại_diện where số_lượng phiếu bầu > 10000	election_representative
select t2.tên from cuộc bầu_cử as t1 join đại_diện as t2 on t1.id đại_diện = t2.id đại_diện order by số_lượng phiếu bầu desc	election_representative
select t2.đảng from cuộc bầu_cử as t1 join đại_diện as t2 on t1.id đại_diện = t2.id đại_diện order by số_lượng phiếu bầu asc limit 1	election_representative
select t2.tuổi_thọ from cuộc bầu_cử as t1 join đại_diện as t2 on t1.id đại_diện = t2.id đại_diện order by tỉ_lệ phiếu bầu desc	election_representative
select avg ( t1.số_lượng phiếu bầu ) from cuộc bầu_cử as t1 join đại_diện as t2 on t1.id đại_diện = t2.id đại_diện where t2.đảng = "Republican"	election_representative
select đảng , count ( * ) from đại_diện group by đảng	election_representative
select đảng , count ( * ) from đại_diện group by đảng order by count ( * ) desc limit 1	election_representative
select đảng from đại_diện group by đảng having count ( * ) >= 3	election_representative
select tiểu_bang from đại_diện group by tiểu_bang having count ( * ) >= 2	election_representative
select tên from đại_diện where id đại_diện not in ( select id đại_diện from cuộc bầu_cử )	election_representative
select đảng from đại_diện where tiểu_bang = "New York" intersect select đảng from đại_diện where tiểu_bang = "Pennsylvania"	election_representative
select count ( distinct đảng ) from đại_diện	election_representative
select count ( * ) from quốc_gia	match_season
select count ( * ) from quốc_gia	match_season
select tên quốc_gia , thủ_đô from quốc_gia	match_season
select tên quốc_gia , thủ_đô from quốc_gia	match_season
select ngôn_ngữ bản_địa chính_thức from quốc_gia where ngôn_ngữ bản_địa chính_thức like "%English%"	match_season
select ngôn_ngữ bản_địa chính_thức from quốc_gia where ngôn_ngữ bản_địa chính_thức like "%English%"	match_season
select distinct vị_trí from trận đấu trong mùa giải	match_season
select distinct vị_trí from trận đấu trong mùa giải	match_season
select cầu_thủ from trận đấu trong mùa giải where trường đại_học = "UCLA"	match_season
select cầu_thủ from trận đấu trong mùa giải where trường đại_học = "UCLA"	match_season
select distinct vị_trí from trận đấu trong mùa giải where trường đại_học = "UCLA" or trường đại_học = "Duke"	match_season
select distinct vị_trí from trận đấu trong mùa giải where trường đại_học = "UCLA" or trường đại_học = "Duke"	match_season
select mã_số tuyển_chọn tân_binh , mùa tuyển_chọn from trận đấu trong mùa giải where vị_trí = "Defender"	match_season
select mã_số tuyển_chọn tân_binh , mùa tuyển_chọn from trận đấu trong mùa giải where vị_trí = "Defender"	match_season
select count ( distinct đội ) from trận đấu trong mùa giải	match_season
select count ( distinct đội ) from trận đấu trong mùa giải	match_season
select cầu_thủ , số năm đã chơi from cầu_thủ	match_season
select cầu_thủ , số năm đã chơi from cầu_thủ	match_season
select tên from đội	match_season
select tên from đội	match_season
select t2.mùa giải , t2.cầu_thủ , t1.tên quốc_gia from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia	match_season
select t2.mùa giải , t2.cầu_thủ , t1.tên quốc_gia from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia	match_season
select t2.cầu_thủ from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t1.tên quốc_gia = "Indonesia"	match_season
select t2.cầu_thủ from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t1.tên quốc_gia = "Indonesia"	match_season
select distinct t2.vị_trí from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t1.thủ_đô = "Dublin"	match_season
select distinct t2.vị_trí from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t1.thủ_đô = "Dublin"	match_season
select t1.ngôn_ngữ bản_địa chính_thức from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.trường đại_học = "Maryland" or t2.trường đại_học = "Duke"	match_season
select t1.ngôn_ngữ bản_địa chính_thức from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.trường đại_học = "Maryland" or t2.trường đại_học = "Duke"	match_season
select count ( distinct t1.ngôn_ngữ bản_địa chính_thức ) from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.vị_trí = "Defender"	match_season
select count ( distinct t1.ngôn_ngữ bản_địa chính_thức ) from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.vị_trí = "Defender"	match_season
select t1.mùa giải , t1.cầu_thủ , t2.tên from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội	match_season
select t1.mùa giải , t1.cầu_thủ , t2.tên from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội	match_season
select t1.vị_trí from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Ryley Goldner"	match_season
select t1.vị_trí from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Ryley Goldner"	match_season
select count ( distinct t1.trường đại_học ) from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select count ( distinct t1.trường đại_học ) from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select t1.cầu_thủ , t1.số năm đã chơi from cầu_thủ as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select t1.cầu_thủ , t1.số năm đã chơi from cầu_thủ as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select vị_trí , count ( * ) from trận đấu trong mùa giải group by vị_trí	match_season
select vị_trí , count ( * ) from trận đấu trong mùa giải group by vị_trí	match_season
select tên quốc_gia , count ( * ) from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia group by t1.tên quốc_gia	match_season
select tên quốc_gia , count ( * ) from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia group by t1.tên quốc_gia	match_season
select cầu_thủ from trận đấu trong mùa giải order by trường đại_học asc	match_season
select cầu_thủ from trận đấu trong mùa giải order by trường đại_học asc	match_season
select vị_trí from trận đấu trong mùa giải group by vị_trí order by count ( * ) desc limit 1	match_season
select vị_trí from trận đấu trong mùa giải group by vị_trí order by count ( * ) desc limit 1	match_season
select trường đại_học from trận đấu trong mùa giải group by trường đại_học order by count ( * ) desc limit 3	match_season
select trường đại_học from trận đấu trong mùa giải group by trường đại_học order by count ( * ) desc limit 3	match_season
select trường đại_học from trận đấu trong mùa giải group by trường đại_học having count ( * ) >= 2	match_season
select trường đại_học from trận đấu trong mùa giải group by trường đại_học having count ( * ) >= 2	match_season
select trường đại_học from trận đấu trong mùa giải group by trường đại_học having count ( * ) >= 2 order by trường đại_học desc	match_season
select trường đại_học from trận đấu trong mùa giải group by trường đại_học having count ( * ) >= 2 order by trường đại_học desc	match_season
select tên from đội where id đội not in ( select đội from trận đấu trong mùa giải )	match_season
select tên from đội where id đội not in ( select đội from trận đấu trong mùa giải )	match_season
select t1.tên quốc_gia from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.vị_trí = "Forward" intersect select t1.tên quốc_gia from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.vị_trí = "Defender"	match_season
select t1.tên quốc_gia from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.vị_trí = "Forward" intersect select t1.tên quốc_gia from quốc_gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc_gia = t2.quốc_gia where t2.vị_trí = "Defender"	match_season
select trường đại_học from trận đấu trong mùa giải where vị_trí = "Midfielder" intersect select trường đại_học from trận đấu trong mùa giải where vị_trí = "Defender"	match_season
select trường đại_học from trận đấu trong mùa giải where vị_trí = "Midfielder" intersect select trường đại_học from trận đấu trong mùa giải where vị_trí = "Defender"	match_season
select count ( * ) from tội_phạm	perpetrator
select ngày from tội_phạm order by số người bị giết desc	perpetrator
select số người bị_thương from tội_phạm order by số người bị_thương asc	perpetrator
select avg ( số người bị_thương ) from tội_phạm	perpetrator
select địa_điểm from tội_phạm order by số người bị giết desc limit 1	perpetrator
select tên from cá_nhân order by chiều cao asc	perpetrator
select t1.tên from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân	perpetrator
select t1.tên from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân where t2.quốc_gia != "China"	perpetrator
select t1.tên from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân order by t1.cân nặng desc limit 1	perpetrator
select sum ( t2.số người bị giết ) from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân where t1.chiều cao > 1.84	perpetrator
select t1.tên from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân where t2.quốc_gia = "China" or t2.quốc_gia = "Japan"	perpetrator
select t1.chiều cao from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân order by t2.số người bị_thương desc	perpetrator
select quốc_gia , count ( * ) from tội_phạm group by quốc_gia	perpetrator
select quốc_gia , count ( * ) from tội_phạm group by quốc_gia order by count ( * ) desc limit 1	perpetrator
select quốc_gia , count ( * ) from tội_phạm group by quốc_gia having count ( * ) >= 2	perpetrator
select t1.tên from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân order by t2.năm desc	perpetrator
select tên from cá_nhân where id cá_nhân not in ( select id cá_nhân from tội_phạm )	perpetrator
select quốc_gia from tội_phạm where số người bị_thương > 50 intersect select quốc_gia from tội_phạm where số người bị_thương < 20	perpetrator
select count ( distinct địa_điểm ) from tội_phạm	perpetrator
select t2.ngày from cá_nhân as t1 join tội_phạm as t2 on t1.id cá_nhân = t2.id cá_nhân order by t1.chiều cao desc limit 1	perpetrator
select max ( năm ) from tội_phạm	perpetrator
select chính_quyền địa_phương , dịch_vụ from nhà_ga	station_weather
select số_hiệu tàu , tên from tàu_hoả order by thời_gian	station_weather
select thời_gian , số_hiệu tàu from tàu_hoả where điểm đến = "Chennai" order by thời_gian	station_weather
select count ( * ) from tàu_hoả where tên like "%Express%"	station_weather
select số_hiệu tàu , thời_gian from tàu_hoả where điểm khởi_hành = "Chennai" and điểm đến = "Guruvayur"	station_weather
select điểm khởi_hành , count ( * ) from tàu_hoả group by điểm khởi_hành	station_weather
select t1.tên from tàu_hoả as t1 join lộ_trình as t2 on t1.id = t2.id tàu group by t2.id tàu order by count ( * ) desc limit 1	station_weather
select count ( * ) , t1.tên mạng_lưới , t1.dịch_vụ from nhà_ga as t1 join lộ_trình as t2 on t1.id = t2.id nhà_ga group by t2.id nhà_ga	station_weather
select avg ( nhiệt_độ cao ) , ngày trong tuần from thời_tiết hàng tuần group by ngày trong tuần	station_weather
select max ( t1.nhiệt_độ thấp ) , avg ( t1.lượng mưa ) from thời_tiết hàng tuần as t1 join nhà_ga as t2 on t1.id nhà_ga = t2.id where t2.tên mạng_lưới = "Amersham"	station_weather
select t3.tên , t3.thời_gian from nhà_ga as t1 join lộ_trình as t2 on t1.id = t2.id nhà_ga join tàu_hoả as t3 on t2.id tàu = t3.id where t1.chính_quyền địa_phương = "Chiltern"	station_weather
select count ( distinct dịch_vụ ) from nhà_ga	station_weather
select t2.id , t2.chính_quyền địa_phương from thời_tiết hàng tuần as t1 join nhà_ga as t2 on t1.id nhà_ga = t2.id group by t1.id nhà_ga order by avg ( nhiệt_độ cao ) desc limit 1	station_weather
select t2.id , t2.chính_quyền địa_phương from thời_tiết hàng tuần as t1 join nhà_ga as t2 on t1.id nhà_ga = t2.id group by t1.id nhà_ga having max ( t1.lượng mưa ) > 50	station_weather
select min ( nhiệt_độ thấp ) , max ( tốc_độ gió mph ) from thời_tiết hàng tuần	station_weather
select điểm khởi_hành from tàu_hoả group by điểm khởi_hành having count ( * ) > 1	station_weather
select count ( * ) from nhà_thờ where ngày mở_cửa < 1850	wedding
select tên , ngày mở_cửa , được tổ_chức bởi from nhà_thờ	wedding
select tên from nhà_thờ order by ngày mở_cửa desc	wedding
select ngày mở_cửa from nhà_thờ group by ngày mở_cửa having count ( * ) >= 2	wedding
select được tổ_chức bởi , tên from nhà_thờ where ngày mở_cửa between 1830 and 1840	wedding
select ngày mở_cửa , count ( * ) from nhà_thờ group by ngày mở_cửa	wedding
select tên , ngày mở_cửa from nhà_thờ order by ngày mở_cửa desc limit 3	wedding
select count ( * ) from cá_nhân where là nam hay nữ = "F" and tuổi > 30	wedding
select quốc_gia from cá_nhân where tuổi < 25 intersect select quốc_gia from cá_nhân where tuổi > 30	wedding
select min ( tuổi ) , max ( tuổi ) , avg ( tuổi ) from cá_nhân	wedding
select tên , quốc_gia from cá_nhân where tuổi < ( select avg ( tuổi ) from cá_nhân )	wedding
select t2.tên , t3.tên from lễ cưới as t1 join cá_nhân as t2 on t1.id nam = t2.id cá_nhân join cá_nhân as t3 on t1.id nữ = t3.id cá_nhân where t1.năm > 2014	wedding
select tên , tuổi from cá_nhân where là nam hay nữ = "T" and id cá_nhân not in ( select id nam from lễ cưới )	wedding
select tên from nhà_thờ except select t1.tên from nhà_thờ as t1 join lễ cưới as t2 on t1.id nhà_thờ = t2.id nhà_thờ where t2.năm = 2015	wedding
select t1.tên from nhà_thờ as t1 join lễ cưới as t2 on t1.id nhà_thờ = t2.id nhà_thờ group by t1.id nhà_thờ having count ( * ) >= 2	wedding
select t2.tên from lễ cưới as t1 join cá_nhân as t2 on t1.id nữ = t2.id cá_nhân where t1.năm = 2016 and t2.là nam hay nữ = "F" and t2.quốc_gia = "Canada"	wedding
select count ( * ) from lễ cưới where năm = 2016	wedding
select t4.tên from lễ cưới as t1 join cá_nhân as t2 on t1.id nam = t2.id cá_nhân join cá_nhân as t3 on t1.id nữ = t3.id cá_nhân join nhà_thờ as t4 on t4.id nhà_thờ = t1.id nhà_thờ where t2.tuổi > 30 or t3.tuổi > 30	wedding
select quốc_gia , count ( * ) from cá_nhân group by quốc_gia	wedding
select count ( distinct id nhà_thờ ) from lễ cưới where năm = 2016	wedding
select count ( * ) from giảng_viên	activity_1
select count ( * ) from giảng_viên	activity_1
select distinct ngạch from giảng_viên	activity_1
select distinct ngạch from giảng_viên	activity_1
select distinct toà nhà from giảng_viên	activity_1
select distinct toà nhà from giảng_viên	activity_1
select ngạch , tên , họ from giảng_viên	activity_1
select ngạch , tên , họ from giảng_viên	activity_1
select tên , họ , số điện_thoại from giảng_viên where giới_tính = "F"	activity_1
select tên , họ , số điện_thoại from giảng_viên where giới_tính = "F"	activity_1
select id giảng_viên from giảng_viên where giới_tính = "M"	activity_1
select id giảng_viên from giảng_viên where giới_tính = "M"	activity_1
select count ( * ) from giảng_viên where giới_tính = "F" and ngạch = "Professor"	activity_1
select count ( * ) from giảng_viên where giới_tính = "F" and ngạch = "Professor"	activity_1
select số điện_thoại , số phòng , toà nhà from giảng_viên where tên = "Jerry" and họ = "Prince"	activity_1
select số điện_thoại , số phòng , toà nhà from giảng_viên where tên = "Jerry" and họ = "Prince"	activity_1
select count ( * ) from giảng_viên where ngạch = "Professor" and toà nhà = "NEB"	activity_1
select count ( * ) from giảng_viên where ngạch = "Professor" and toà nhà = "NEB"	activity_1
select tên , họ from giảng_viên where ngạch = "Instructor"	activity_1
select tên , họ from giảng_viên where ngạch = "Instructor"	activity_1
select toà nhà , count ( * ) from giảng_viên group by toà nhà	activity_1
select toà nhà , count ( * ) from giảng_viên group by toà nhà	activity_1
select toà nhà from giảng_viên group by toà nhà order by count ( * ) desc limit 1	activity_1
select toà nhà from giảng_viên group by toà nhà order by count ( * ) desc limit 1	activity_1
select toà nhà from giảng_viên where ngạch = "Professor" group by toà nhà having count ( * ) >= 10	activity_1
select toà nhà from giảng_viên where ngạch = "Professor" group by toà nhà having count ( * ) >= 10	activity_1
select ngạch , count ( * ) from giảng_viên group by ngạch	activity_1
select ngạch , count ( * ) from giảng_viên group by ngạch	activity_1
select ngạch , giới_tính , count ( * ) from giảng_viên group by ngạch , giới_tính	activity_1
select ngạch , giới_tính , count ( * ) from giảng_viên group by ngạch , giới_tính	activity_1
select ngạch from giảng_viên group by ngạch order by count ( * ) asc limit 1	activity_1
select ngạch from giảng_viên group by ngạch order by count ( * ) asc limit 1	activity_1
select giới_tính , count ( * ) from giảng_viên where ngạch = "AsstProf" group by giới_tính	activity_1
select giới_tính , count ( * ) from giảng_viên where ngạch = "AsstProf" group by giới_tính	activity_1
select t1.tên , t1.họ from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn where t2.tên = "Linda" and t2.họ = "Smith"	activity_1
select t1.tên , t1.họ from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn where t2.tên = "Linda" and t2.họ = "Smith"	activity_1
select t2.id sinh_viên from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn where t1.ngạch = "Professor"	activity_1
select t2.id sinh_viên from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn where t1.ngạch = "Professor"	activity_1
select t2.tên , t2.họ from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn where t1.tên = "Michael" and t1.họ = "Goodrich"	activity_1
select t2.tên , t2.họ from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn where t1.tên = "Michael" and t1.họ = "Goodrich"	activity_1
select t1.id giảng_viên , count ( * ) from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.id giảng_viên	activity_1
select t1.id giảng_viên , count ( * ) from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.id giảng_viên	activity_1
select t1.ngạch , count ( * ) from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.ngạch	activity_1
select t1.ngạch , count ( * ) from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.ngạch	activity_1
select t1.tên , t1.họ from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.id giảng_viên order by count ( * ) desc limit 1	activity_1
select t1.tên , t1.họ from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.id giảng_viên order by count ( * ) desc limit 1	activity_1
select t1.id giảng_viên from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.id giảng_viên having count ( * ) >= 2	activity_1
select t1.id giảng_viên from giảng_viên as t1 join sinh_viên as t2 on t1.id giảng_viên = t2.cố_vấn group by t1.id giảng_viên having count ( * ) >= 2	activity_1
select id giảng_viên from giảng_viên except select cố_vấn from sinh_viên	activity_1
select id giảng_viên from giảng_viên except select cố_vấn from sinh_viên	activity_1
select tên hoạt_động from hoạt_động	activity_1
select tên hoạt_động from hoạt_động	activity_1
select count ( * ) from hoạt_động	activity_1
select count ( * ) from hoạt_động	activity_1
select count ( distinct id giảng_viên ) from giảng_viên tham_gia vào	activity_1
select count ( distinct id giảng_viên ) from giảng_viên tham_gia vào	activity_1
select id giảng_viên from giảng_viên except select id giảng_viên from giảng_viên tham_gia vào	activity_1
select id giảng_viên from giảng_viên except select id giảng_viên from giảng_viên tham_gia vào	activity_1
select id giảng_viên from giảng_viên tham_gia vào intersect select cố_vấn from sinh_viên	activity_1
select id giảng_viên from giảng_viên tham_gia vào intersect select cố_vấn from sinh_viên	activity_1
select count ( * ) from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select count ( * ) from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select t3.tên hoạt_động from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t3.id hoạt_động = t2.id hoạt_động where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select t3.tên hoạt_động from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t3.id hoạt_động = t2.id hoạt_động where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select t1.tên , t1.họ , count ( * ) , t1.id giảng_viên from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên group by t1.id giảng_viên	activity_1
select t1.tên , t1.họ , count ( * ) , t1.id giảng_viên from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên group by t1.id giảng_viên	activity_1
select t1.tên hoạt_động , count ( * ) from hoạt_động as t1 join giảng_viên tham_gia vào as t2 on t1.id hoạt_động = t2.id hoạt_động group by t1.id hoạt_động	activity_1
select t1.tên hoạt_động , count ( * ) from hoạt_động as t1 join giảng_viên tham_gia vào as t2 on t1.id hoạt_động = t2.id hoạt_động group by t1.id hoạt_động	activity_1
select t1.tên , t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên group by t1.id giảng_viên order by count ( * ) desc limit 1	activity_1
select t1.tên , t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên group by t1.id giảng_viên order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt_động from hoạt_động as t1 join giảng_viên tham_gia vào as t2 on t1.id hoạt_động = t2.id hoạt_động group by t1.id hoạt_động order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt_động from hoạt_động as t1 join giảng_viên tham_gia vào as t2 on t1.id hoạt_động = t2.id hoạt_động group by t1.id hoạt_động order by count ( * ) desc limit 1	activity_1
select id sinh_viên from sinh_viên except select id sinh_viên from tham_gia vào	activity_1
select id sinh_viên from sinh_viên except select id sinh_viên from tham_gia vào	activity_1
select id sinh_viên from tham_gia vào intersect select id sinh_viên from sinh_viên where tuổi < 20	activity_1
select id sinh_viên from tham_gia vào intersect select id sinh_viên from sinh_viên where tuổi < 20	activity_1
select t1.tên , t1.họ from sinh_viên as t1 join tham_gia vào as t2 on t1.id sinh_viên = t2.id sinh_viên group by t1.id sinh_viên order by count ( * ) desc limit 1	activity_1
select t1.tên , t1.họ from sinh_viên as t1 join tham_gia vào as t2 on t1.id sinh_viên = t2.id sinh_viên group by t1.id sinh_viên order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt_động from hoạt_động as t1 join tham_gia vào as t2 on t1.id hoạt_động = t2.id hoạt_động group by t1.id hoạt_động order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt_động from hoạt_động as t1 join tham_gia vào as t2 on t1.id hoạt_động = t2.id hoạt_động group by t1.id hoạt_động order by count ( * ) desc limit 1	activity_1
select distinct t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Canoeing" or t3.tên hoạt_động = "Kayaking"	activity_1
select distinct t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Canoeing" or t3.tên hoạt_động = "Kayaking"	activity_1
select họ from giảng_viên where ngạch = "Professor" except select distinct t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Canoeing" or t3.tên hoạt_động = "Kayaking"	activity_1
select họ from giảng_viên where ngạch = "Professor" except select distinct t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Canoeing" or t3.tên hoạt_động = "Kayaking"	activity_1
select t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Canoeing" intersect select t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Kayaking"	activity_1
select t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Canoeing" intersect select t1.họ from giảng_viên as t1 join giảng_viên tham_gia vào as t2 on t1.id giảng_viên = t2.id giảng_viên join hoạt_động as t3 on t2.id hoạt_động = t2.id hoạt_động where t3.tên hoạt_động = "Kayaking"	activity_1
select t1.id sinh_viên from tham_gia vào as t1 join hoạt_động as t2 on t2.id hoạt_động = t2.id hoạt_động where t2.tên hoạt_động = "Canoeing" intersect select t1.id sinh_viên from tham_gia vào as t1 join hoạt_động as t2 on t2.id hoạt_động = t2.id hoạt_động where t2.tên hoạt_động = "Kayaking"	activity_1
select t1.id sinh_viên from tham_gia vào as t1 join hoạt_động as t2 on t2.id hoạt_động = t2.id hoạt_động where t2.tên hoạt_động = "Canoeing" intersect select t1.id sinh_viên from tham_gia vào as t1 join hoạt_động as t2 on t2.id hoạt_động = t2.id hoạt_động where t2.tên hoạt_động = "Kayaking"	activity_1
select count ( * ) from người luyện thể_hình	body_builder
select tổng from người luyện thể_hình order by tổng asc	body_builder
select cử giật , cử đẩy from người luyện thể_hình order by cử giật asc	body_builder
select avg ( cử giật ) from người luyện thể_hình	body_builder
select cử đẩy from người luyện thể_hình order by tổng desc limit 1	body_builder
select ngày_sinh from cá_nhân order by chiều cao asc	body_builder
select t2.tên from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân	body_builder
select t2.tên from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân where t1.tổng > 300	body_builder
select t2.tên from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân order by t2.cân nặng desc limit 1	body_builder
select t2.ngày_sinh , t2.nơi sinh from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân order by t1.tổng desc limit 1	body_builder
select t2.chiều cao from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân where t1.tổng < 315	body_builder
select avg ( t1.tổng ) from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân where t2.chiều cao > 200	body_builder
select t2.tên from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân order by t1.tổng desc	body_builder
select nơi sinh , count ( * ) from cá_nhân group by nơi sinh	body_builder
select nơi sinh from cá_nhân group by nơi sinh order by count ( * ) desc limit 1	body_builder
select nơi sinh from cá_nhân group by nơi sinh having count ( * ) >= 2	body_builder
select chiều cao , cân nặng from cá_nhân order by chiều cao desc	body_builder
select * from người luyện thể_hình	body_builder
select tên , nơi sinh from cá_nhân except select t1.tên , t1.nơi sinh from cá_nhân as t1 join người luyện thể_hình as t2 on t1.id cá_nhân = t2.id cá_nhân	body_builder
select count ( distinct nơi sinh ) from cá_nhân	body_builder
select count ( * ) from cá_nhân where id cá_nhân not in ( select id cá_nhân from người luyện thể_hình )	body_builder
select t2.cân nặng from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân where t1.cử giật > 140 or t2.chiều cao > 200	body_builder
select t1.tổng from người luyện thể_hình as t1 join cá_nhân as t2 on t1.id cá_nhân = t2.id cá_nhân where t2.ngày_sinh like "%January%"	body_builder
select min ( cử giật ) from người luyện thể_hình	body_builder
select count ( * ) from ứng_cử_viên	candidate_poll
select count ( * ) from ứng_cử_viên	candidate_poll
select nguồn thăm_dò ý_kiến from ứng_cử_viên group by nguồn thăm_dò ý_kiến order by count ( * ) desc limit 1	candidate_poll
select nguồn thăm_dò ý_kiến from ứng_cử_viên group by nguồn thăm_dò ý_kiến order by count ( * ) desc limit 1	candidate_poll
select tỷ_lệ ủng_hộ from ứng_cử_viên order by tỷ_lệ ủng_hộ desc limit 3	candidate_poll
select tỷ_lệ ủng_hộ from ứng_cử_viên order by tỷ_lệ ủng_hộ desc limit 3	candidate_poll
select id ứng_cử_viên from ứng_cử_viên order by tỷ_lệ phản_đối limit 1	candidate_poll
select id ứng_cử_viên from ứng_cử_viên order by tỷ_lệ phản_đối limit 1	candidate_poll
select tỷ_lệ ủng_hộ , tỷ_lệ xem_xét , tỷ_lệ phản_đối from ứng_cử_viên order by tỷ_lệ không chắc_chắn	candidate_poll
select tỷ_lệ ủng_hộ , tỷ_lệ xem_xét , tỷ_lệ phản_đối from ứng_cử_viên order by tỷ_lệ không chắc_chắn	candidate_poll
select nguồn thăm_dò ý_kiến from ứng_cử_viên order by tỷ_lệ phản_đối desc limit 1	candidate_poll
select nguồn thăm_dò ý_kiến from ứng_cử_viên order by tỷ_lệ phản_đối desc limit 1	candidate_poll
select tên from cá_nhân order by ngày_sinh	candidate_poll
select tên from cá_nhân order by ngày_sinh	candidate_poll
select avg ( chiều cao ) , avg ( cân nặng ) from cá_nhân where giới_tính = "M"	candidate_poll
select avg ( chiều cao ) , avg ( cân nặng ) from cá_nhân where giới_tính = "M"	candidate_poll
select tên from cá_nhân where chiều cao > 200 or chiều cao < 190	candidate_poll
select tên from cá_nhân where chiều cao > 200 or chiều cao < 190	candidate_poll
select avg ( cân nặng ) , min ( cân nặng ) , giới_tính from cá_nhân group by giới_tính	candidate_poll
select avg ( cân nặng ) , min ( cân nặng ) , giới_tính from cá_nhân group by giới_tính	candidate_poll
select t1.tên , t1.giới_tính from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân order by t2.tỷ_lệ ủng_hộ desc limit 1	candidate_poll
select t1.tên , t1.giới_tính from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân order by t2.tỷ_lệ ủng_hộ desc limit 1	candidate_poll
select t1.tên , t1.giới_tính , min ( tỷ_lệ phản_đối ) from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân group by t1.giới_tính	candidate_poll
select t1.tên , t1.giới_tính , min ( tỷ_lệ phản_đối ) from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân group by t1.giới_tính	candidate_poll
select t1.giới_tính from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân group by t1.giới_tính order by avg ( t2.tỷ_lệ không chắc_chắn ) desc limit 1	candidate_poll
select t1.giới_tính from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân group by t1.giới_tính order by avg ( t2.tỷ_lệ không chắc_chắn ) desc limit 1	candidate_poll
select tên from cá_nhân where id cá_nhân not in ( select id cá_nhân from ứng_cử_viên )	candidate_poll
select tên from cá_nhân where id cá_nhân not in ( select id cá_nhân from ứng_cử_viên )	candidate_poll
select t1.tên from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân where t2.tỷ_lệ ủng_hộ < t2.tỷ_lệ phản_đối	candidate_poll
select t1.tên from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân where t2.tỷ_lệ ủng_hộ < t2.tỷ_lệ phản_đối	candidate_poll
select count ( * ) , giới_tính from cá_nhân where cân nặng > 85 group by giới_tính	candidate_poll
select count ( * ) , giới_tính from cá_nhân where cân nặng > 85 group by giới_tính	candidate_poll
select max ( tỷ_lệ ủng_hộ ) , min ( tỷ_lệ xem_xét ) , min ( tỷ_lệ phản_đối ) from ứng_cử_viên	candidate_poll
select max ( tỷ_lệ ủng_hộ ) , min ( tỷ_lệ xem_xét ) , min ( tỷ_lệ phản_đối ) from ứng_cử_viên	candidate_poll
select t1.tên from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân where t1.giới_tính = "F" order by t1.tên	candidate_poll
select t1.tên from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id cá_nhân where t1.giới_tính = "F" order by t1.tên	candidate_poll
select tên from cá_nhân where chiều cao < ( select avg ( chiều cao ) from cá_nhân )	candidate_poll
select tên from cá_nhân where chiều cao < ( select avg ( chiều cao ) from cá_nhân )	candidate_poll
select * from cá_nhân	candidate_poll
select * from cá_nhân	candidate_poll
select thành_phố chủ nhà from thành_phố chủ nhà order by năm desc limit 1	city_record
select thành_phố chủ nhà from thành_phố chủ nhà order by năm desc limit 1	city_record
select id trận đấu from trận đấu where giải đấu = "1994 FIFA World Cup qualification"	city_record
select id trận đấu from trận đấu where giải đấu = "1994 FIFA World Cup qualification"	city_record
select t1.thành_phố from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà where t2.năm > 2010	city_record
select t1.thành_phố from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà where t2.năm > 2010	city_record
select t1.thành_phố from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà group by t2.thành_phố chủ nhà order by count ( * ) desc limit 1	city_record
select t1.thành_phố from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà group by t2.thành_phố chủ nhà order by count ( * ) desc limit 1	city_record
select t3.địa_điểm from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà join trận đấu as t3 on t2.id trận đấu = t3.id trận đấu where t1.thành_phố = "Nanjing ( Jiangsu )" and t3.giải đấu = "1994 FIFA World Cup qualification"	city_record
select t3.địa_điểm from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà join trận đấu as t3 on t2.id trận đấu = t3.id trận đấu where t1.thành_phố = "Nanjing ( Jiangsu )" and t3.giải đấu = "1994 FIFA World Cup qualification"	city_record
select t2.tháng_một from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t1.thành_phố = "Shanghai"	city_record
select t2.tháng_một from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t1.thành_phố = "Shanghai"	city_record
select t2.năm from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà where t1.thành_phố = "Taizhou ( Zhejiang )"	city_record
select t2.năm from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà where t1.thành_phố = "Taizhou ( Zhejiang )"	city_record
select thành_phố from thành_phố order by dân_số khu_vực desc limit 3	city_record
select thành_phố from thành_phố order by dân_số khu_vực desc limit 3	city_record
select thành_phố , gdp from thành_phố order by gdp limit 1	city_record
select thành_phố , gdp from thành_phố order by gdp limit 1	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố order by t2.tháng hai desc limit 1	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố order by t2.tháng hai desc limit 1	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng ba < t2.tháng bảy or t2.tháng ba > t2.tháng mười	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng ba < t2.tháng bảy or t2.tháng ba > t2.tháng mười	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng ba < t2.tháng bảy intersect select t3.thành_phố from thành_phố as t3 join thành_phố chủ nhà as t4 on t3.id thành_phố = t4.thành_phố chủ nhà	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng ba < t2.tháng bảy intersect select t3.thành_phố from thành_phố as t3 join thành_phố chủ nhà as t4 on t3.id thành_phố = t4.thành_phố chủ nhà	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng ba < t2.tháng mười hai except select t3.thành_phố from thành_phố as t3 join thành_phố chủ nhà as t4 on t3.id thành_phố = t4.thành_phố chủ nhà	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng ba < t2.tháng mười hai except select t3.thành_phố from thành_phố as t3 join thành_phố chủ nhà as t4 on t3.id thành_phố = t4.thành_phố chủ nhà	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng hai > t2.tháng sáu union select t3.thành_phố from thành_phố as t3 join thành_phố chủ nhà as t4 on t3.id thành_phố = t4.thành_phố chủ nhà	city_record
select t1.thành_phố from thành_phố as t1 join nhiệt_độ as t2 on t1.id thành_phố = t2.id thành_phố where t2.tháng hai > t2.tháng sáu union select t3.thành_phố from thành_phố as t3 join thành_phố chủ nhà as t4 on t3.id thành_phố = t4.thành_phố chủ nhà	city_record
select thành_phố from thành_phố where dân_số khu_vực > 10000000	city_record
select thành_phố from thành_phố where dân_số khu_vực > 10000000	city_record
select thành_phố from thành_phố where dân_số khu_vực > 10000000 union select thành_phố from thành_phố where dân_số khu_vực < 5000000	city_record
select thành_phố from thành_phố where dân_số khu_vực > 10000000 union select thành_phố from thành_phố where dân_số khu_vực < 5000000	city_record
select count ( * ) , giải đấu from trận đấu group by giải đấu	city_record
select count ( * ) , giải đấu from trận đấu group by giải đấu	city_record
select địa_điểm from trận đấu order by ngày desc	city_record
select địa_điểm from trận đấu order by ngày desc	city_record
select gdp from thành_phố order by dân_số khu_vực desc limit 1	city_record
select gdp from thành_phố order by dân_số khu_vực desc limit 1	city_record
select t1.gdp , t1.dân_số khu_vực from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà group by t2.thành_phố chủ nhà having count ( * ) > 1	city_record
select t1.gdp , t1.dân_số khu_vực from thành_phố as t1 join thành_phố chủ nhà as t2 on t1.id thành_phố = t2.thành_phố chủ nhà group by t2.thành_phố chủ nhà having count ( * ) > 1	city_record
select count ( * ) from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Accounting"	college_1
select count ( * ) from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Accounting"	college_1
select count ( distinct mã_số nhân_viên của giáo_sư ) from lớp_học where mã khoá học = "ACCT-211"	college_1
select count ( distinct mã_số nhân_viên của giáo_sư ) from lớp_học where mã khoá học = "ACCT-211"	college_1
select t3.tên của nhân_viên , t3.họ của nhân_viên from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa join nhân_viên as t3 on t1.mã số nhân_viên = t3.mã số nhân_viên where tên khoa = "Biology"	college_1
select t3.tên của nhân_viên , t3.họ của nhân_viên from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa join nhân_viên as t3 on t1.mã số nhân_viên = t3.mã số nhân_viên where tên khoa = "Biology"	college_1
select distinct t1.tên của nhân_viên , t1.ngày_sinh của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where mã khoá học = "ACCT-211"	college_1
select distinct t1.tên của nhân_viên , t1.ngày_sinh của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where mã khoá học = "ACCT-211"	college_1
select count ( * ) from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where t1.họ của nhân_viên = "Graztevski"	college_1
select count ( * ) from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where t1.họ của nhân_viên = "Graztevski"	college_1
select mã_trường from khoa where tên khoa = "Accounting"	college_1
select mã_trường from khoa where tên khoa = "Accounting"	college_1
select số_lượng tín_chỉ của khoá học , mô_tả về khoá học from khoá học where mã khoá học = "CIS-220"	college_1
select số_lượng tín_chỉ của khoá học , mô_tả về khoá học from khoá học where mã khoá học = "CIS-220"	college_1
select địa_chỉ khoa from khoa where tên khoa = "History"	college_1
select địa_chỉ khoa from khoa where tên khoa = "History"	college_1
select count ( distinct địa_chỉ khoa ) from khoa where mã_trường = "BUS"	college_1
select count ( distinct địa_chỉ khoa ) from khoa where mã_trường = "BUS"	college_1
select count ( distinct địa_chỉ khoa ) , mã_trường from khoa group by mã_trường	college_1
select count ( distinct địa_chỉ khoa ) , mã_trường from khoa group by mã_trường	college_1
select số_lượng tín_chỉ của khoá học , mô_tả về khoá học from khoá học where mã khoá học = "QM-261"	college_1
select số_lượng tín_chỉ của khoá học , mô_tả về khoá học from khoá học where mã khoá học = "QM-261"	college_1
select count ( distinct tên khoa ) , mã_trường from khoa group by mã_trường	college_1
select count ( distinct tên khoa ) , mã_trường from khoa group by mã_trường	college_1
select count ( distinct tên khoa ) , mã_trường from khoa group by mã_trường having count ( distinct tên khoa ) < 5	college_1
select count ( distinct tên khoa ) , mã_trường from khoa group by mã_trường having count ( distinct tên khoa ) < 5	college_1
select count ( * ) , mã khoá học from lớp_học group by mã khoá học	college_1
select count ( * ) , mã khoá học from lớp_học group by mã khoá học	college_1
select sum ( số_lượng tín_chỉ của khoá học ) , mã khoa from khoá học group by mã khoa	college_1
select sum ( số_lượng tín_chỉ của khoá học ) , mã khoa from khoá học group by mã khoa	college_1
select count ( * ) , phòng học from lớp_học group by phòng học having count ( * ) >= 2	college_1
select count ( * ) , phòng học from lớp_học group by phòng học having count ( * ) >= 2	college_1
select count ( * ) , mã khoa from lớp_học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học group by mã khoa	college_1
select count ( * ) , mã khoa from lớp_học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học group by mã khoa	college_1
select count ( * ) , t3.mã_trường from lớp_học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t2.mã khoa = t3.mã khoa group by t3.mã_trường	college_1
select count ( * ) , t3.mã_trường from lớp_học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t2.mã khoa = t3.mã khoa group by t3.mã_trường	college_1
select count ( * ) , t1.mã_trường from khoa as t1 join giáo_sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã_trường	college_1
select count ( * ) , t1.mã_trường from khoa as t1 join giáo_sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã_trường	college_1
select mã công_việc của nhân_viên , count ( * ) from nhân_viên group by mã công_việc của nhân_viên order by count ( * ) desc limit 1	college_1
select mã công_việc của nhân_viên , count ( * ) from nhân_viên group by mã công_việc của nhân_viên order by count ( * ) desc limit 1	college_1
select t1.mã_trường from khoa as t1 join giáo_sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã_trường order by count ( * ) limit 1	college_1
select t1.mã_trường from khoa as t1 join giáo_sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã_trường order by count ( * ) limit 1	college_1
select count ( * ) , mã khoa from giáo_sư where bằng_cấp cao nhất = "Ph.D." group by mã khoa	college_1
select count ( * ) , mã khoa from giáo_sư where bằng_cấp cao nhất = "Ph.D." group by mã khoa	college_1
select count ( * ) , mã khoa from sinh_viên group by mã khoa	college_1
select count ( * ) , mã khoa from sinh_viên group by mã khoa	college_1
select sum ( giờ học của sinh_viên ) , mã khoa from sinh_viên group by mã khoa	college_1
select sum ( giờ học của sinh_viên ) , mã khoa from sinh_viên group by mã khoa	college_1
select max ( gpa của sinh_viên ) , avg ( gpa của sinh_viên ) , min ( gpa của sinh_viên ) , mã khoa from sinh_viên group by mã khoa	college_1
select max ( gpa của sinh_viên ) , avg ( gpa của sinh_viên ) , min ( gpa của sinh_viên ) , mã khoa from sinh_viên group by mã khoa	college_1
select t2.tên khoa , avg ( t1.gpa của sinh_viên ) from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by avg ( t1.gpa của sinh_viên ) desc limit 1	college_1
select t2.tên khoa , avg ( t1.gpa của sinh_viên ) from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by avg ( t1.gpa của sinh_viên ) desc limit 1	college_1
select count ( distinct mã_trường ) from khoa	college_1
select count ( distinct mã_trường ) from khoa	college_1
select count ( distinct mã lớp_học ) from lớp_học	college_1
select count ( distinct mã lớp_học ) from lớp_học	college_1
select count ( distinct mã khoá học ) from lớp_học	college_1
select count ( distinct mã khoá học ) from lớp_học	college_1
select count ( distinct tên khoa ) from khoa	college_1
select count ( distinct tên khoa ) from khoa	college_1
select count ( * ) from khoa as t1 join khoá học as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Computer Info. Systems"	college_1
select count ( * ) from khoa as t1 join khoá học as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Computer Info. Systems"	college_1
select count ( distinct lớp_học phần ) from lớp_học where mã khoá học = "ACCT-211"	college_1
select count ( distinct lớp_học phần ) from lớp_học where mã khoá học = "ACCT-211"	college_1
select sum ( t1.số_lượng tín_chỉ của khoá học ) , t1.mã khoa from khoá học as t1 join lớp_học as t2 on t1.mã khoá học = t2.mã khoá học group by t1.mã khoa	college_1
select sum ( t1.số_lượng tín_chỉ của khoá học ) , t1.mã khoa from khoá học as t1 join lớp_học as t2 on t1.mã khoá học = t2.mã khoá học group by t1.mã khoa	college_1
select t3.tên khoa from khoá học as t1 join lớp_học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t1.mã khoa = t3.mã khoa group by t1.mã khoa order by sum ( t1.số_lượng tín_chỉ của khoá học ) desc limit 1	college_1
select t3.tên khoa from khoá học as t1 join lớp_học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t1.mã khoa = t3.mã khoa group by t1.mã khoa order by sum ( t1.số_lượng tín_chỉ của khoá học ) desc limit 1	college_1
select count ( * ) from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp where t1.mã khoá học = "ACCT-211"	college_1
select count ( * ) from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp where t1.mã khoá học = "ACCT-211"	college_1
select t3.tên của sinh_viên from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t2.mã_số sinh_viên = t3.mã_số sinh_viên where t1.mã khoá học = "ACCT-211"	college_1
select t3.tên của sinh_viên from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t2.mã_số sinh_viên = t3.mã_số sinh_viên where t1.mã khoá học = "ACCT-211"	college_1
select t3.tên của sinh_viên from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t2.mã_số sinh_viên = t3.mã_số sinh_viên where t1.mã khoá học = "ACCT-211" and t2.điểm_số = "C"	college_1
select t3.tên của sinh_viên from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t2.mã_số sinh_viên = t3.mã_số sinh_viên where t1.mã khoá học = "ACCT-211" and t2.điểm_số = "C"	college_1
select count ( * ) from nhân_viên	college_1
select count ( * ) from nhân_viên	college_1
select count ( * ) from giáo_sư where bằng_cấp cao nhất = "Ph.D."	college_1
select count ( * ) from giáo_sư where bằng_cấp cao nhất = "Ph.D."	college_1
select count ( * ) from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa where t4.tên khoa = "Accounting"	college_1
select count ( * ) from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa where t4.tên khoa = "Accounting"	college_1
select t4.tên khoa from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa group by t3.mã khoa order by count ( * ) desc limit 1	college_1
select t4.tên khoa from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa group by t3.mã khoa order by count ( * ) desc limit 1	college_1
select tên khoa from khoa order by tên khoa	college_1
select tên khoa from khoa order by tên khoa	college_1
select mã lớp_học from lớp_học where phòng học = "KLR209"	college_1
select mã lớp_học from lớp_học where phòng học = "KLR209"	college_1
select tên của nhân_viên from nhân_viên where mã công_việc của nhân_viên = "PROF" order by ngày_sinh của nhân_viên	college_1
select tên của nhân_viên from nhân_viên where mã công_việc của nhân_viên = "PROF" order by ngày_sinh của nhân_viên	college_1
select t2.tên của nhân_viên , t1.văn_phòng giáo_sư from giáo_sư as t1 join nhân_viên as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên order by t2.tên của nhân_viên	college_1
select t2.tên của nhân_viên , t1.văn_phòng giáo_sư from giáo_sư as t1 join nhân_viên as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên order by t2.tên của nhân_viên	college_1
select tên của nhân_viên , họ của nhân_viên from nhân_viên order by ngày_sinh của nhân_viên limit 1	college_1
select tên của nhân_viên , họ của nhân_viên from nhân_viên order by ngày_sinh của nhân_viên limit 1	college_1
select tên của sinh_viên , họ của sinh_viên , gpa của sinh_viên from sinh_viên where gpa của sinh_viên > 3 order by ngày_sinh của sinh_viên desc limit 1	college_1
select tên của sinh_viên , họ của sinh_viên , gpa của sinh_viên from sinh_viên where gpa của sinh_viên > 3 order by ngày_sinh của sinh_viên desc limit 1	college_1
select distinct tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên where điểm_số = "C"	college_1
select distinct tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên where điểm_số = "C"	college_1
select t2.tên khoa from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) limit 1	college_1
select t2.tên khoa from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) limit 1	college_1
select t2.tên khoa , t1.mã khoa from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.bằng_cấp cao nhất = "Ph.D." group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select t2.tên khoa , t1.mã khoa from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.bằng_cấp cao nhất = "Ph.D." group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select tên của nhân_viên from nhân_viên where mã công_việc của nhân_viên = "PROF" except select t1.tên của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư	college_1
select tên của nhân_viên from nhân_viên where mã công_việc của nhân_viên = "PROF" except select t1.tên của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư	college_1
select t1.tên của nhân_viên from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History" except select t4.tên của nhân_viên from nhân_viên as t4 join lớp_học as t5 on t4.mã số nhân_viên = t5.mã_số nhân_viên của giáo_sư	college_1
select t1.tên của nhân_viên from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History" except select t4.tên của nhân_viên from nhân_viên as t4 join lớp_học as t5 on t4.mã số nhân_viên = t5.mã_số nhân_viên của giáo_sư	college_1
select t1.họ của nhân_viên , t2.văn_phòng giáo_sư from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History"	college_1
select t1.họ của nhân_viên , t2.văn_phòng giáo_sư from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History"	college_1
select t3.tên khoa , t2.văn_phòng giáo_sư from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t1.họ của nhân_viên = "Heffington"	college_1
select t3.tên khoa , t2.văn_phòng giáo_sư from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t1.họ của nhân_viên = "Heffington"	college_1
select t1.họ của nhân_viên , t1.ngày bắt_đầu công_việc của nhân_viên from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên where t2.văn_phòng giáo_sư = "DRE 102"	college_1
select t1.họ của nhân_viên , t1.ngày bắt_đầu công_việc của nhân_viên from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên where t2.văn_phòng giáo_sư = "DRE 102"	college_1
select t1.mã khoá học from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t3.mã_số sinh_viên = t2.mã_số sinh_viên where t3.họ của sinh_viên = "Smithson"	college_1
select t1.mã khoá học from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t3.mã_số sinh_viên = t2.mã_số sinh_viên where t3.họ của sinh_viên = "Smithson"	college_1
select t4.mô_tả về khoá học , t4.số_lượng tín_chỉ của khoá học from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t3.mã_số sinh_viên = t2.mã_số sinh_viên join khoá học as t4 on t4.mã khoá học = t1.mã khoá học where t3.họ của sinh_viên = "Smithson"	college_1
select t4.mô_tả về khoá học , t4.số_lượng tín_chỉ của khoá học from lớp_học as t1 join đăng_ký khoá học as t2 on t1.mã lớp_học = t2.mã lớp join sinh_viên as t3 on t3.mã_số sinh_viên = t2.mã_số sinh_viên join khoá học as t4 on t4.mã khoá học = t1.mã khoá học where t3.họ của sinh_viên = "Smithson"	college_1
select count ( * ) from giáo_sư where bằng_cấp cao nhất = "Ph.D." or bằng_cấp cao nhất = "MA"	college_1
select count ( * ) from giáo_sư where bằng_cấp cao nhất = "Ph.D." or bằng_cấp cao nhất = "MA"	college_1
select count ( * ) from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t2.tên khoa = "Accounting" or t2.tên khoa = "Biology"	college_1
select count ( * ) from giáo_sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t2.tên khoa = "Accounting" or t2.tên khoa = "Biology"	college_1
select t1.tên của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where mã khoá học = "CIS-220" intersect select t1.tên của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where mã khoá học = "QM-261"	college_1
select t1.tên của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where mã khoá học = "CIS-220" intersect select t1.tên của nhân_viên from nhân_viên as t1 join lớp_học as t2 on t1.mã số nhân_viên = t2.mã_số nhân_viên của giáo_sư where mã khoá học = "QM-261"	college_1
select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Accounting" intersect select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Computer Info. Systems"	college_1
select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Accounting" intersect select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Computer Info. Systems"	college_1
select avg ( t2.gpa của sinh_viên ) from đăng_ký khoá học as t1 join sinh_viên as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t1.mã lớp = t3.mã lớp_học where t3.mã khoá học = "ACCT-211"	college_1
select avg ( t2.gpa của sinh_viên ) from đăng_ký khoá học as t1 join sinh_viên as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t1.mã lớp = t3.mã lớp_học where t3.mã khoá học = "ACCT-211"	college_1
select gpa của sinh_viên , số điện_thoại của sinh_viên , tên của sinh_viên from sinh_viên order by gpa của sinh_viên desc limit 5	college_1
select gpa của sinh_viên , số điện_thoại của sinh_viên , tên của sinh_viên from sinh_viên order by gpa của sinh_viên desc limit 5	college_1
select t2.tên khoa from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa order by gpa của sinh_viên limit 1	college_1
select t2.tên khoa from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa order by gpa của sinh_viên limit 1	college_1
select tên của sinh_viên , gpa của sinh_viên from sinh_viên where gpa của sinh_viên < ( select avg ( gpa của sinh_viên ) from sinh_viên )	college_1
select tên của sinh_viên , gpa của sinh_viên from sinh_viên where gpa của sinh_viên < ( select avg ( gpa của sinh_viên ) from sinh_viên )	college_1
select t2.tên khoa , t2.địa_chỉ khoa from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select t2.tên khoa , t2.địa_chỉ khoa from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select t2.tên khoa , t2.địa_chỉ khoa , count ( * ) from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 3	college_1
select t2.tên khoa , t2.địa_chỉ khoa , count ( * ) from sinh_viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 3	college_1
select t1.tên của nhân_viên , t2.văn_phòng giáo_sư from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t3.mã khoa = t2.mã khoa where t3.tên khoa = "History" and t2.bằng_cấp cao nhất = "Ph.D."	college_1
select t1.tên của nhân_viên , t2.văn_phòng giáo_sư from nhân_viên as t1 join giáo_sư as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t3.mã khoa = t2.mã khoa where t3.tên khoa = "History" and t2.bằng_cấp cao nhất = "Ph.D."	college_1
select t2.tên của nhân_viên , t1.mã khoá học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên	college_1
select t2.tên của nhân_viên , t1.mã khoá học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên	college_1
select t2.tên của nhân_viên , t3.mô_tả về khoá học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học	college_1
select t2.tên của nhân_viên , t3.mô_tả về khoá học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học	college_1
select t2.tên của nhân_viên , t4.văn_phòng giáo_sư , t3.mô_tả về khoá học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo_sư as t4 on t2.mã số nhân_viên = t4.mã số nhân_viên	college_1
select t2.tên của nhân_viên , t4.văn_phòng giáo_sư , t3.mô_tả về khoá học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo_sư as t4 on t2.mã số nhân_viên = t4.mã số nhân_viên	college_1
select t2.tên của nhân_viên , t4.văn_phòng giáo_sư , t3.mô_tả về khoá học , t5.tên khoa from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo_sư as t4 on t2.mã số nhân_viên = t4.mã số nhân_viên join khoa as t5 on t4.mã khoa = t5.mã khoa	college_1
select t2.tên của nhân_viên , t4.văn_phòng giáo_sư , t3.mô_tả về khoá học , t5.tên khoa from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo_sư as t4 on t2.mã số nhân_viên = t4.mã số nhân_viên join khoa as t5 on t4.mã khoa = t5.mã khoa	college_1
select t1.tên của sinh_viên , t1.họ của sinh_viên , t4.mô_tả về khoá học from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học	college_1
select t1.tên của sinh_viên , t1.họ của sinh_viên , t4.mô_tả về khoá học from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học	college_1
select t1.tên của sinh_viên , t1.họ của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên where t2.điểm_số = "C" or t2.điểm_số = "A"	college_1
select t1.tên của sinh_viên , t1.họ của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên where t2.điểm_số = "C" or t2.điểm_số = "A"	college_1
select t2.tên của nhân_viên , t1.phòng học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join giáo_sư as t3 on t2.mã số nhân_viên = t3.mã số nhân_viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Accounting"	college_1
select t2.tên của nhân_viên , t1.phòng học from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join giáo_sư as t3 on t2.mã số nhân_viên = t3.mã số nhân_viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Accounting"	college_1
select distinct t2.tên của nhân_viên , t3.bằng_cấp cao nhất from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join giáo_sư as t3 on t2.mã số nhân_viên = t3.mã số nhân_viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Computer Info. Systems"	college_1
select distinct t2.tên của nhân_viên , t3.bằng_cấp cao nhất from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên join giáo_sư as t3 on t2.mã số nhân_viên = t3.mã số nhân_viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Computer Info. Systems"	college_1
select t1.họ của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên where t2.điểm_số = "A" and t2.mã lớp = 10018	college_1
select t1.họ của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên where t2.điểm_số = "A" and t2.mã lớp = 10018	college_1
select t2.tên của nhân_viên , t1.văn_phòng giáo_sư from giáo_sư as t1 join nhân_viên as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t1.mã khoa = t3.mã khoa where t3.tên khoa = "History" and t1.bằng_cấp cao nhất != "Ph.D."	college_1
select t2.tên của nhân_viên , t1.văn_phòng giáo_sư from giáo_sư as t1 join nhân_viên as t2 on t1.mã số nhân_viên = t2.mã số nhân_viên join khoa as t3 on t1.mã khoa = t3.mã khoa where t3.tên khoa = "History" and t1.bằng_cấp cao nhất != "Ph.D."	college_1
select t2.tên của nhân_viên from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên group by t1.mã_số nhân_viên của giáo_sư having count ( * ) > 1	college_1
select t2.tên của nhân_viên from lớp_học as t1 join nhân_viên as t2 on t1.mã_số nhân_viên của giáo_sư = t2.mã số nhân_viên group by t1.mã_số nhân_viên của giáo_sư having count ( * ) > 1	college_1
select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên group by t2.mã_số sinh_viên having count ( * ) = 1	college_1
select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên group by t2.mã_số sinh_viên having count ( * ) = 1	college_1
select t2.tên khoa from khoá học as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.mô_tả về khoá học like "%Statistics%"	college_1
select t2.tên khoa from khoá học as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.mô_tả về khoá học like "%Statistics%"	college_1
select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học where t3.mã khoá học = "ACCT-211" and t1.họ của sinh_viên like "S%"	college_1
select t1.tên của sinh_viên from sinh_viên as t1 join đăng_ký khoá học as t2 on t1.mã_số sinh_viên = t2.mã_số sinh_viên join lớp_học as t3 on t2.mã lớp = t3.mã lớp_học where t3.mã khoá học = "ACCT-211" and t1.họ của sinh_viên like "S%"	college_1
select mã trạng_thái tài_liệu from trạng_thái của tài_liệu	cre_Doc_Control_Systems
select mô_tả về trạng_thái tài_liệu from trạng_thái của tài_liệu where mã trạng_thái tài_liệu = "working"	cre_Doc_Control_Systems
select mã loại tài_liệu from loại tài_liệu	cre_Doc_Control_Systems
select mô_tả về loại tài_liệu from loại tài_liệu where mã loại tài_liệu = "Paper"	cre_Doc_Control_Systems
select tên đại_lý vận_chuyển from đại_lý vận_chuyển tài_liệu	cre_Doc_Control_Systems
select mã đại_lý vận_chuyển from đại_lý vận_chuyển tài_liệu where tên đại_lý vận_chuyển = "UPS"	cre_Doc_Control_Systems
select mã vai_trò from vai_trò	cre_Doc_Control_Systems
select mô_tả về vai_trò from vai_trò where mã vai_trò = "ED"	cre_Doc_Control_Systems
select count ( * ) from nhân_viên	cre_Doc_Control_Systems
select t1.mô_tả về vai_trò from vai_trò as t1 join nhân_viên as t2 on t1.mã vai_trò = t2.mã vai_trò where t2.tên nhân_viên = "Koby"	cre_Doc_Control_Systems
select id tài_liệu , ngày lập biên_lai from tài_liệu	cre_Doc_Control_Systems
select t1.mô_tả về vai_trò , t2.mã vai_trò , count ( * ) from vai_trò as t1 join nhân_viên as t2 on t1.mã vai_trò = t2.mã vai_trò group by t2.mã vai_trò	cre_Doc_Control_Systems
select vai_trò.mô_tả về vai_trò , count ( nhân_viên.id nhân_viên ) from vai_trò join nhân_viên on nhân_viên.mã vai_trò = vai_trò.mã vai_trò group by nhân_viên.mã vai_trò having count ( nhân_viên.id nhân_viên ) > 1	cre_Doc_Control_Systems
select trạng_thái của tài_liệu.mô_tả về trạng_thái tài_liệu from trạng_thái của tài_liệu join tài_liệu on tài_liệu.mã trạng_thái tài_liệu = trạng_thái của tài_liệu.mã trạng_thái tài_liệu where tài_liệu.id tài_liệu = 1	cre_Doc_Control_Systems
select count ( * ) from tài_liệu where mã trạng_thái tài_liệu = "done"	cre_Doc_Control_Systems
select mã loại tài_liệu from tài_liệu where id tài_liệu = 2	cre_Doc_Control_Systems
select id tài_liệu from tài_liệu where mã trạng_thái tài_liệu = "done" and mã loại tài_liệu = "Paper"	cre_Doc_Control_Systems
select đại_lý vận_chuyển tài_liệu.tên đại_lý vận_chuyển from đại_lý vận_chuyển tài_liệu join tài_liệu on tài_liệu.mã đại_lý vận_chuyển = đại_lý vận_chuyển tài_liệu.mã đại_lý vận_chuyển where tài_liệu.id tài_liệu = 2	cre_Doc_Control_Systems
select count ( * ) from đại_lý vận_chuyển tài_liệu join tài_liệu on tài_liệu.mã đại_lý vận_chuyển = đại_lý vận_chuyển tài_liệu.mã đại_lý vận_chuyển where đại_lý vận_chuyển tài_liệu.tên đại_lý vận_chuyển = "USPS"	cre_Doc_Control_Systems
select đại_lý vận_chuyển tài_liệu.tên đại_lý vận_chuyển , count ( tài_liệu.id tài_liệu ) from đại_lý vận_chuyển tài_liệu join tài_liệu on tài_liệu.mã đại_lý vận_chuyển = đại_lý vận_chuyển tài_liệu.mã đại_lý vận_chuyển group by đại_lý vận_chuyển tài_liệu.mã đại_lý vận_chuyển order by count ( tài_liệu.id tài_liệu ) desc limit 1	cre_Doc_Control_Systems
select ngày lập biên_lai from tài_liệu where id tài_liệu = 3	cre_Doc_Control_Systems
select địa_chỉ.chi_tiết địa_chỉ from địa_chỉ join tài_liệu được gửi on tài_liệu được gửi.gửi đến địa_chỉ có id = địa_chỉ.id địa_chỉ where id tài_liệu = 4	cre_Doc_Control_Systems
select ngày gửi from tài_liệu được gửi where id tài_liệu = 7	cre_Doc_Control_Systems
select id tài_liệu from tài_liệu where mã trạng_thái tài_liệu = "done" and mã loại tài_liệu = "Paper" except select id tài_liệu from tài_liệu join đại_lý vận_chuyển tài_liệu on tài_liệu.mã đại_lý vận_chuyển = đại_lý vận_chuyển tài_liệu.mã đại_lý vận_chuyển where đại_lý vận_chuyển tài_liệu.tên đại_lý vận_chuyển = "USPS"	cre_Doc_Control_Systems
select id tài_liệu from tài_liệu where mã trạng_thái tài_liệu = "done" and mã loại tài_liệu = "Paper" intersect select id tài_liệu from tài_liệu join đại_lý vận_chuyển tài_liệu on tài_liệu.mã đại_lý vận_chuyển = đại_lý vận_chuyển tài_liệu.mã đại_lý vận_chuyển where đại_lý vận_chuyển tài_liệu.tên đại_lý vận_chuyển = "USPS"	cre_Doc_Control_Systems
select chi_tiết dự_thảo from bản dự_thảo của tài_liệu where id tài_liệu = 7	cre_Doc_Control_Systems
select count ( * ) from bản_sao where id tài_liệu = 2	cre_Doc_Control_Systems
select id tài_liệu , count ( số_lượng bản_sao ) from bản_sao group by id tài_liệu order by count ( số_lượng bản_sao ) desc limit 1	cre_Doc_Control_Systems
select id tài_liệu , count ( * ) from bản_sao group by id tài_liệu having count ( * ) > 1	cre_Doc_Control_Systems
select nhân_viên.tên nhân_viên from nhân_viên join lịch_sử lưu_hành on lịch_sử lưu_hành.id nhân_viên = nhân_viên.id nhân_viên where lịch_sử lưu_hành.id tài_liệu = 1	cre_Doc_Control_Systems
select tên nhân_viên from nhân_viên except select nhân_viên.tên nhân_viên from nhân_viên join lịch_sử lưu_hành on lịch_sử lưu_hành.id nhân_viên = nhân_viên.id nhân_viên	cre_Doc_Control_Systems
select nhân_viên.tên nhân_viên , count ( * ) from nhân_viên join lịch_sử lưu_hành on lịch_sử lưu_hành.id nhân_viên = nhân_viên.id nhân_viên group by lịch_sử lưu_hành.id tài_liệu , lịch_sử lưu_hành.số_lượng dự_thảo , lịch_sử lưu_hành.số_lượng bản_sao order by count ( * ) desc limit 1	cre_Doc_Control_Systems
select id tài_liệu , count ( distinct id nhân_viên ) from lịch_sử lưu_hành group by id tài_liệu	cre_Doc_Control_Systems
select count ( * ) from lượt đặt_hàng	cre_Drama_Workshop_Groups
select count ( * ) from lượt đặt_hàng	cre_Drama_Workshop_Groups
select ngày đặt_hàng from lượt đặt_hàng	cre_Drama_Workshop_Groups
select ngày đặt_hàng from lượt đặt_hàng	cre_Drama_Workshop_Groups
select ngày giao hàng theo kế_hoạch , ngày giao hàng thực_tế from lượt đặt_hàng	cre_Drama_Workshop_Groups
select ngày giao hàng theo kế_hoạch , ngày giao hàng thực_tế from lượt đặt_hàng	cre_Drama_Workshop_Groups
select count ( * ) from khách_hàng	cre_Drama_Workshop_Groups
select count ( * ) from khách_hàng	cre_Drama_Workshop_Groups
select số điện_thoại khách_hàng , địa_chỉ email khách_hàng from khách_hàng where tên khách_hàng = "Harold"	cre_Drama_Workshop_Groups
select số điện_thoại khách_hàng , địa_chỉ email khách_hàng from khách_hàng where tên khách_hàng = "Harold"	cre_Drama_Workshop_Groups
select tên cửa_hàng from nhóm hội_thảo kịch	cre_Drama_Workshop_Groups
select tên cửa_hàng from nhóm hội_thảo kịch	cre_Drama_Workshop_Groups
select min ( số_lượng đặt_hàng ) , avg ( số_lượng đặt_hàng ) , max ( số_lượng đặt_hàng ) from hoá_đơn	cre_Drama_Workshop_Groups
select min ( số_lượng đặt_hàng ) , avg ( số_lượng đặt_hàng ) , max ( số_lượng đặt_hàng ) from hoá_đơn	cre_Drama_Workshop_Groups
select distinct mã phương_thức thanh_toán from hoá_đơn	cre_Drama_Workshop_Groups
select distinct mã phương_thức thanh_toán from hoá_đơn	cre_Drama_Workshop_Groups
select mô_tả về khu_vực tiếp_thị from khu_vực tiếp_thị where tên khu_vực tiếp_thị = "China"	cre_Drama_Workshop_Groups
select mô_tả về khu_vực tiếp_thị from khu_vực tiếp_thị where tên khu_vực tiếp_thị = "China"	cre_Drama_Workshop_Groups
select distinct tên sản_phẩm from các sản_phẩm where giá sản_phẩm > ( select avg ( giá sản_phẩm ) from các sản_phẩm )	cre_Drama_Workshop_Groups
select distinct tên sản_phẩm from các sản_phẩm where giá sản_phẩm > ( select avg ( giá sản_phẩm ) from các sản_phẩm )	cre_Drama_Workshop_Groups
select tên sản_phẩm from các sản_phẩm order by giá sản_phẩm desc limit 1	cre_Drama_Workshop_Groups
select tên sản_phẩm from các sản_phẩm order by giá sản_phẩm desc limit 1	cre_Drama_Workshop_Groups
select tên sản_phẩm from các sản_phẩm order by giá sản_phẩm asc	cre_Drama_Workshop_Groups
select tên sản_phẩm from các sản_phẩm order by giá sản_phẩm asc	cre_Drama_Workshop_Groups
select số điện_thoại khách_hàng from người biểu_diễn where tên khách_hàng = "Ashley"	cre_Drama_Workshop_Groups
select số điện_thoại khách_hàng from người biểu_diễn where tên khách_hàng = "Ashley"	cre_Drama_Workshop_Groups
select mã phương_thức thanh_toán , count ( * ) from hoá_đơn group by mã phương_thức thanh_toán	cre_Drama_Workshop_Groups
select mã phương_thức thanh_toán , count ( * ) from hoá_đơn group by mã phương_thức thanh_toán	cre_Drama_Workshop_Groups
select mã phương_thức thanh_toán from hoá_đơn group by mã phương_thức thanh_toán order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select mã phương_thức thanh_toán from hoá_đơn group by mã phương_thức thanh_toán order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.thành_phố thị_trấn from địa_chỉ as t1 join cửa_hàng as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t2.tên cửa_hàng = "FJA Filming"	cre_Drama_Workshop_Groups
select t1.thành_phố thị_trấn from địa_chỉ as t1 join cửa_hàng as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t2.tên cửa_hàng = "FJA Filming"	cre_Drama_Workshop_Groups
select t1.quận hạt from địa_chỉ as t1 join cửa_hàng as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t2.mã khu_vực tiếp_thị = "CA"	cre_Drama_Workshop_Groups
select t1.quận hạt from địa_chỉ as t1 join cửa_hàng as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t2.mã khu_vực tiếp_thị = "CA"	cre_Drama_Workshop_Groups
select t1.tên khu_vực tiếp_thị from khu_vực tiếp_thị as t1 join cửa_hàng as t2 on t1.mã khu_vực tiếp_thị = t2.mã khu_vực tiếp_thị where t2.tên cửa_hàng = "Rob Dinning"	cre_Drama_Workshop_Groups
select t1.tên khu_vực tiếp_thị from khu_vực tiếp_thị as t1 join cửa_hàng as t2 on t1.mã khu_vực tiếp_thị = t2.mã khu_vực tiếp_thị where t2.tên cửa_hàng = "Rob Dinning"	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ where t2.giá sản_phẩm > 100	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ where t2.giá sản_phẩm > 100	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ , t2.mã loại dịch_vụ , count ( * ) from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ group by t2.mã loại dịch_vụ	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ , t2.mã loại dịch_vụ , count ( * ) from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ group by t2.mã loại dịch_vụ	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ , t1.mã loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ group by t1.mã loại dịch_vụ order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ , t1.mã loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ group by t1.mã loại dịch_vụ order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.số điện_thoại cửa_hàng , t1.địa_chỉ email cửa_hàng from nhóm hội_thảo kịch as t1 join dịch_vụ as t2 on t1.id nhóm hội_thảo kịch = t2.id nhóm hội_thảo kịch	cre_Drama_Workshop_Groups
select t1.số điện_thoại cửa_hàng , t1.địa_chỉ email cửa_hàng from nhóm hội_thảo kịch as t1 join dịch_vụ as t2 on t1.id nhóm hội_thảo kịch = t2.id nhóm hội_thảo kịch	cre_Drama_Workshop_Groups
select t1.số điện_thoại cửa_hàng , t1.địa_chỉ email cửa_hàng from nhóm hội_thảo kịch as t1 join dịch_vụ as t2 on t1.id nhóm hội_thảo kịch = t2.id nhóm hội_thảo kịch where t2.tên sản_phẩm = "film"	cre_Drama_Workshop_Groups
select t1.số điện_thoại cửa_hàng , t1.địa_chỉ email cửa_hàng from nhóm hội_thảo kịch as t1 join dịch_vụ as t2 on t1.id nhóm hội_thảo kịch = t2.id nhóm hội_thảo kịch where t2.tên sản_phẩm = "film"	cre_Drama_Workshop_Groups
select tên sản_phẩm , avg ( giá sản_phẩm ) from các sản_phẩm group by tên sản_phẩm	cre_Drama_Workshop_Groups
select tên sản_phẩm , avg ( giá sản_phẩm ) from các sản_phẩm group by tên sản_phẩm	cre_Drama_Workshop_Groups
select tên sản_phẩm from các sản_phẩm group by tên sản_phẩm having avg ( giá sản_phẩm ) < 1000000	cre_Drama_Workshop_Groups
select tên sản_phẩm from các sản_phẩm group by tên sản_phẩm having avg ( giá sản_phẩm ) < 1000000	cre_Drama_Workshop_Groups
select sum ( t1.số_lượng đặt_hàng ) from mặt_hàng được đặt as t1 join các sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm where t2.tên sản_phẩm = "photo"	cre_Drama_Workshop_Groups
select sum ( t1.số_lượng đặt_hàng ) from mặt_hàng được đặt as t1 join các sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm where t2.tên sản_phẩm = "photo"	cre_Drama_Workshop_Groups
select t1.chi_tiết khác về mặt_hàng from mặt_hàng được đặt as t1 join các sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm where t2.giá sản_phẩm > 2000	cre_Drama_Workshop_Groups
select t1.chi_tiết khác về mặt_hàng from mặt_hàng được đặt as t1 join các sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm where t2.giá sản_phẩm > 2000	cre_Drama_Workshop_Groups
select t1.ngày giao hàng thực_tế from lượt đặt_hàng của khách_hàng as t1 join mặt_hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng where t2.số_lượng đặt_hàng = 1	cre_Drama_Workshop_Groups
select t1.ngày giao hàng thực_tế from lượt đặt_hàng của khách_hàng as t1 join mặt_hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng where t2.số_lượng đặt_hàng = 1	cre_Drama_Workshop_Groups
select t1.ngày đặt_hàng from lượt đặt_hàng của khách_hàng as t1 join mặt_hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng join các sản_phẩm as t3 on t2.id sản_phẩm = t3.id sản_phẩm where t3.giá sản_phẩm > 1000	cre_Drama_Workshop_Groups
select t1.ngày đặt_hàng from lượt đặt_hàng của khách_hàng as t1 join mặt_hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng join các sản_phẩm as t3 on t2.id sản_phẩm = t3.id sản_phẩm where t3.giá sản_phẩm > 1000	cre_Drama_Workshop_Groups
select count ( distinct mã_tiền tệ ) from nhóm hội_thảo kịch	cre_Drama_Workshop_Groups
select count ( distinct mã_tiền tệ ) from nhóm hội_thảo kịch	cre_Drama_Workshop_Groups
select t2.tên cửa_hàng from địa_chỉ as t1 join nhóm hội_thảo kịch as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t1.thành_phố thị_trấn = "Feliciaberg"	cre_Drama_Workshop_Groups
select t2.tên cửa_hàng from địa_chỉ as t1 join nhóm hội_thảo kịch as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t1.thành_phố thị_trấn = "Feliciaberg"	cre_Drama_Workshop_Groups
select t2.địa_chỉ email cửa_hàng from địa_chỉ as t1 join nhóm hội_thảo kịch as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t1.quận hạt = "Alaska"	cre_Drama_Workshop_Groups
select t2.địa_chỉ email cửa_hàng from địa_chỉ as t1 join nhóm hội_thảo kịch as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t1.quận hạt = "Alaska"	cre_Drama_Workshop_Groups
select t1.thành_phố thị_trấn , count ( * ) from địa_chỉ as t1 join nhóm hội_thảo kịch as t2 on t1.id địa_chỉ = t2.id địa_chỉ group by t1.thành_phố thị_trấn	cre_Drama_Workshop_Groups
select t1.thành_phố thị_trấn , count ( * ) from địa_chỉ as t1 join nhóm hội_thảo kịch as t2 on t1.id địa_chỉ = t2.id địa_chỉ group by t1.thành_phố thị_trấn	cre_Drama_Workshop_Groups
select mã khu_vực tiếp_thị from nhóm hội_thảo kịch group by mã khu_vực tiếp_thị order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select mã khu_vực tiếp_thị from nhóm hội_thảo kịch group by mã khu_vực tiếp_thị order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.thành_phố thị_trấn from địa_chỉ as t1 join khách_hàng as t2 on t1.id địa_chỉ = t2.id địa_chỉ except select t1.thành_phố thị_trấn from địa_chỉ as t1 join người biểu_diễn as t2 on t1.id địa_chỉ = t2.id địa_chỉ	cre_Drama_Workshop_Groups
select t1.thành_phố thị_trấn from địa_chỉ as t1 join khách_hàng as t2 on t1.id địa_chỉ = t2.id địa_chỉ except select t1.thành_phố thị_trấn from địa_chỉ as t1 join người biểu_diễn as t2 on t1.id địa_chỉ = t2.id địa_chỉ	cre_Drama_Workshop_Groups
select mã trạng_thái from lượt đặt_hàng group by mã trạng_thái order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select mã trạng_thái from lượt đặt_hàng group by mã trạng_thái order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t2.tên cửa_hàng from lượt đặt_hàng as t1 join nhóm hội_thảo kịch as t2 on t1.id nhóm hội_thảo kịch = t2.id nhóm hội_thảo kịch where t1.mã trạng_thái = "stop"	cre_Drama_Workshop_Groups
select t2.tên cửa_hàng from lượt đặt_hàng as t1 join nhóm hội_thảo kịch as t2 on t1.id nhóm hội_thảo kịch = t2.id nhóm hội_thảo kịch where t1.mã trạng_thái = "stop"	cre_Drama_Workshop_Groups
select tên khách_hàng from khách_hàng except select t2.tên khách_hàng from lượt đặt_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng	cre_Drama_Workshop_Groups
select tên khách_hàng from khách_hàng except select t2.tên khách_hàng from lượt đặt_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng	cre_Drama_Workshop_Groups
select avg ( số_lượng đặt_hàng ) from hoá_đơn where mã phương_thức thanh_toán = "MasterCard"	cre_Drama_Workshop_Groups
select avg ( số_lượng đặt_hàng ) from hoá_đơn where mã phương_thức thanh_toán = "MasterCard"	cre_Drama_Workshop_Groups
select id sản_phẩm from hoá_đơn group by id sản_phẩm order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select id sản_phẩm from hoá_đơn group by id sản_phẩm order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ where t2.tên sản_phẩm = "photo" intersect select t1.mô_tả về loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ where t2.tên sản_phẩm = "film"	cre_Drama_Workshop_Groups
select t1.mô_tả về loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ where t2.tên sản_phẩm = "photo" intersect select t1.mô_tả về loại dịch_vụ from loại dịch_vụ as t1 join dịch_vụ as t2 on t1.mã loại dịch_vụ = t2.mã loại dịch_vụ where t2.tên sản_phẩm = "film"	cre_Drama_Workshop_Groups
select count ( * ) from tài_khoản	customers_and_invoices
select count ( * ) from tài_khoản	customers_and_invoices
select count ( distinct id khách_hàng ) from tài_khoản	customers_and_invoices
select count ( distinct id khách_hàng ) from tài_khoản	customers_and_invoices
select id tài_khoản , ngày mở tài_khoản , tên tài_khoản , chi_tiết khác về tài_khoản from tài_khoản	customers_and_invoices
select id tài_khoản , ngày mở tài_khoản , tên tài_khoản , chi_tiết khác về tài_khoản from tài_khoản	customers_and_invoices
select t1.id tài_khoản , t1.ngày mở tài_khoản , t1.tên tài_khoản , t1.chi_tiết khác về tài_khoản from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên khách_hàng = "Meaghan"	customers_and_invoices
select t1.id tài_khoản , t1.ngày mở tài_khoản , t1.tên tài_khoản , t1.chi_tiết khác về tài_khoản from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên khách_hàng = "Meaghan"	customers_and_invoices
select t1.tên tài_khoản , t1.chi_tiết khác về tài_khoản from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên khách_hàng = "Meaghan" and t2.họ của khách_hàng = "Keeling"	customers_and_invoices
select t1.tên tài_khoản , t1.chi_tiết khác về tài_khoản from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên khách_hàng = "Meaghan" and t2.họ của khách_hàng = "Keeling"	customers_and_invoices
select t2.tên khách_hàng , t2.họ của khách_hàng from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.tên tài_khoản = "900"	customers_and_invoices
select t2.tên khách_hàng , t2.họ của khách_hàng from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.tên tài_khoản = "900"	customers_and_invoices
select count ( * ) from khách_hàng where id khách_hàng not in ( select id khách_hàng from tài_khoản )	customers_and_invoices
select count ( * ) from khách_hàng where id khách_hàng not in ( select id khách_hàng from tài_khoản )	customers_and_invoices
select distinct t1.tên khách_hàng , t1.họ của khách_hàng , t1.số điện_thoại from khách_hàng as t1 join tài_khoản as t2 on t1.id khách_hàng = t2.id khách_hàng	customers_and_invoices
select distinct t1.tên khách_hàng , t1.họ của khách_hàng , t1.số điện_thoại from khách_hàng as t1 join tài_khoản as t2 on t1.id khách_hàng = t2.id khách_hàng	customers_and_invoices
select id khách_hàng from khách_hàng except select id khách_hàng from tài_khoản	customers_and_invoices
select id khách_hàng from khách_hàng except select id khách_hàng from tài_khoản	customers_and_invoices
select count ( * ) , id khách_hàng from tài_khoản group by id khách_hàng	customers_and_invoices
select count ( * ) , id khách_hàng from tài_khoản group by id khách_hàng	customers_and_invoices
select t1.id khách_hàng , t2.tên khách_hàng , t2.họ của khách_hàng from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng order by count ( * ) desc limit 1	customers_and_invoices
select t1.id khách_hàng , t2.tên khách_hàng , t2.họ của khách_hàng from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng order by count ( * ) desc limit 1	customers_and_invoices
select t1.id khách_hàng , t2.tên khách_hàng , t2.họ của khách_hàng , count ( * ) from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng	customers_and_invoices
select t1.id khách_hàng , t2.tên khách_hàng , t2.họ của khách_hàng , count ( * ) from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng	customers_and_invoices
select t2.tên khách_hàng , t1.id khách_hàng from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng having count ( * ) >= 2	customers_and_invoices
select t2.tên khách_hàng , t1.id khách_hàng from tài_khoản as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng having count ( * ) >= 2	customers_and_invoices
select count ( * ) from khách_hàng	customers_and_invoices
select count ( * ) from khách_hàng	customers_and_invoices
select giới_tính , count ( * ) from khách_hàng group by giới_tính	customers_and_invoices
select giới_tính , count ( * ) from khách_hàng group by giới_tính	customers_and_invoices
select count ( * ) from giao_dịch tài_chính	customers_and_invoices
select count ( * ) from giao_dịch tài_chính	customers_and_invoices
select count ( * ) , id tài_khoản from giao_dịch tài_chính	customers_and_invoices
select count ( * ) , id tài_khoản from giao_dịch tài_chính	customers_and_invoices
select count ( * ) from giao_dịch tài_chính as t1 join tài_khoản as t2 on t1.id tài_khoản = t2.id tài_khoản where t2.tên tài_khoản = "337"	customers_and_invoices
select count ( * ) from giao_dịch tài_chính as t1 join tài_khoản as t2 on t1.id tài_khoản = t2.id tài_khoản where t2.tên tài_khoản = "337"	customers_and_invoices
select avg ( số tiền giao_dịch ) , min ( số tiền giao_dịch ) , max ( số tiền giao_dịch ) , sum ( số tiền giao_dịch ) from giao_dịch tài_chính	customers_and_invoices
select avg ( số tiền giao_dịch ) , min ( số tiền giao_dịch ) , max ( số tiền giao_dịch ) , sum ( số tiền giao_dịch ) from giao_dịch tài_chính	customers_and_invoices
select id giao_dịch from giao_dịch tài_chính where số tiền giao_dịch > ( select avg ( số tiền giao_dịch ) from giao_dịch tài_chính )	customers_and_invoices
select id giao_dịch from giao_dịch tài_chính where số tiền giao_dịch > ( select avg ( số tiền giao_dịch ) from giao_dịch tài_chính )	customers_and_invoices
select loại giao_dịch , sum ( số tiền giao_dịch ) from giao_dịch tài_chính group by loại giao_dịch	customers_and_invoices
select loại giao_dịch , sum ( số tiền giao_dịch ) from giao_dịch tài_chính group by loại giao_dịch	customers_and_invoices
select t2.tên tài_khoản , t1.id tài_khoản , count ( * ) from giao_dịch tài_chính as t1 join tài_khoản as t2 on t1.id tài_khoản = t2.id tài_khoản group by t1.id tài_khoản	customers_and_invoices
select t2.tên tài_khoản , t1.id tài_khoản , count ( * ) from giao_dịch tài_chính as t1 join tài_khoản as t2 on t1.id tài_khoản = t2.id tài_khoản group by t1.id tài_khoản	customers_and_invoices
select id tài_khoản from giao_dịch tài_chính group by id tài_khoản order by count ( * ) desc limit 1	customers_and_invoices
select id tài_khoản from giao_dịch tài_chính group by id tài_khoản order by count ( * ) desc limit 1	customers_and_invoices
select t1.id tài_khoản , t2.tên tài_khoản from giao_dịch tài_chính as t1 join tài_khoản as t2 on t1.id tài_khoản = t2.id tài_khoản group by t1.id tài_khoản having count ( * ) >= 4	customers_and_invoices
select t1.id tài_khoản , t2.tên tài_khoản from giao_dịch tài_chính as t1 join tài_khoản as t2 on t1.id tài_khoản = t2.id tài_khoản group by t1.id tài_khoản having count ( * ) >= 4	customers_and_invoices
select distinct kích_thước sản_phẩm from sản_phẩm	customers_and_invoices
select distinct kích_thước sản_phẩm from sản_phẩm	customers_and_invoices
select distinct màu sản_phẩm from sản_phẩm	customers_and_invoices
select distinct màu sản_phẩm from sản_phẩm	customers_and_invoices
select số_hoá đơn , count ( * ) from giao_dịch tài_chính group by số_hoá đơn	customers_and_invoices
select số_hoá đơn , count ( * ) from giao_dịch tài_chính group by số_hoá đơn	customers_and_invoices
select t2.số_hoá đơn , t2.ngày lập hoá_đơn from giao_dịch tài_chính as t1 join hoá_đơn as t2 on t1.số_hoá đơn = t2.số_hoá đơn group by t1.số_hoá đơn order by count ( * ) desc limit 1	customers_and_invoices
select t2.số_hoá đơn , t2.ngày lập hoá_đơn from giao_dịch tài_chính as t1 join hoá_đơn as t2 on t1.số_hoá đơn = t2.số_hoá đơn group by t1.số_hoá đơn order by count ( * ) desc limit 1	customers_and_invoices
select count ( * ) from hoá_đơn	customers_and_invoices
select count ( * ) from hoá_đơn	customers_and_invoices
select t1.ngày lập hoá_đơn , t1.id đơn hàng , t2.chi_tiết đặt_hàng from hoá_đơn as t1 join đơn đặt_hàng as t2 on t1.id đơn hàng = t2.id đơn hàng	customers_and_invoices
select t1.ngày lập hoá_đơn , t1.id đơn hàng , t2.chi_tiết đặt_hàng from hoá_đơn as t1 join đơn đặt_hàng as t2 on t1.id đơn hàng = t2.id đơn hàng	customers_and_invoices
select id đơn hàng , count ( * ) from hoá_đơn group by id đơn hàng	customers_and_invoices
select id đơn hàng , count ( * ) from hoá_đơn group by id đơn hàng	customers_and_invoices
select t2.id đơn hàng , t2.chi_tiết đặt_hàng from hoá_đơn as t1 join đơn đặt_hàng as t2 on t1.id đơn hàng = t2.id đơn hàng group by t2.id đơn hàng having count ( * ) > 2	customers_and_invoices
select t2.id đơn hàng , t2.chi_tiết đặt_hàng from hoá_đơn as t1 join đơn đặt_hàng as t2 on t1.id đơn hàng = t2.id đơn hàng group by t2.id đơn hàng having count ( * ) > 2	customers_and_invoices
select t2.họ của khách_hàng , t1.id khách_hàng , t2.số điện_thoại from đơn đặt_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng order by count ( * ) desc limit 1	customers_and_invoices
select t2.họ của khách_hàng , t1.id khách_hàng , t2.số điện_thoại from đơn đặt_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng order by count ( * ) desc limit 1	customers_and_invoices
select tên sản_phẩm from sản_phẩm except select t1.tên sản_phẩm from sản_phẩm as t1 join mặt_hàng được đặt as t2 on t1.id sản_phẩm = t2.id sản_phẩm	customers_and_invoices
select tên sản_phẩm from sản_phẩm except select t1.tên sản_phẩm from sản_phẩm as t1 join mặt_hàng được đặt as t2 on t1.id sản_phẩm = t2.id sản_phẩm	customers_and_invoices
select t2.tên sản_phẩm , sum ( t1.số_lượng sản_phẩm ) from mặt_hàng được đặt as t1 join sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm group by t2.tên sản_phẩm	customers_and_invoices
select t2.tên sản_phẩm , sum ( t1.số_lượng sản_phẩm ) from mặt_hàng được đặt as t1 join sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm group by t2.tên sản_phẩm	customers_and_invoices
select id đơn hàng , count ( * ) from mặt_hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , count ( * ) from mặt_hàng được đặt group by id đơn hàng	customers_and_invoices
select id sản_phẩm , count ( distinct id đơn hàng ) from mặt_hàng được đặt group by id sản_phẩm	customers_and_invoices
select id sản_phẩm , count ( distinct id đơn hàng ) from mặt_hàng được đặt group by id sản_phẩm	customers_and_invoices
select t2.tên sản_phẩm , count ( * ) from mặt_hàng được đặt as t1 join sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm join đơn đặt_hàng as t3 on t3.id đơn hàng = t1.id đơn hàng group by t2.tên sản_phẩm	customers_and_invoices
select t2.tên sản_phẩm , count ( * ) from mặt_hàng được đặt as t1 join sản_phẩm as t2 on t1.id sản_phẩm = t2.id sản_phẩm join đơn đặt_hàng as t3 on t3.id đơn hàng = t1.id đơn hàng group by t2.tên sản_phẩm	customers_and_invoices
select id đơn hàng , count ( distinct id sản_phẩm ) from mặt_hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , count ( distinct id sản_phẩm ) from mặt_hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , sum ( số_lượng sản_phẩm ) from mặt_hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , sum ( số_lượng sản_phẩm ) from mặt_hàng được đặt group by id đơn hàng	customers_and_invoices
select count ( * ) from sản_phẩm where id sản_phẩm not in ( select id sản_phẩm from mặt_hàng được đặt )	customers_and_invoices
select count ( * ) from sản_phẩm where id sản_phẩm not in ( select id sản_phẩm from mặt_hàng được đặt )	customers_and_invoices
select count ( * ) from địa_chỉ where quốc_gia = "USA"	customers_and_products_contacts
select distinct thành_phố from địa_chỉ	customers_and_products_contacts
select tiểu_bang , count ( * ) from địa_chỉ group by tiểu_bang	customers_and_products_contacts
select tên khách_hàng , điện_thoại khách_hàng from khách_hàng where id khách_hàng not in ( select id khách_hàng from lịch_sử địa_chỉ khách_hàng )	customers_and_products_contacts
select t1.tên khách_hàng from khách_hàng as t1 join lượt đặt_hàng của khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng order by count ( * ) desc limit 1	customers_and_products_contacts
select mã loại sản_phẩm from sản_phẩm group by mã loại sản_phẩm having count ( * ) >= 2	customers_and_products_contacts
select t1.tên khách_hàng from khách_hàng as t1 join lượt đặt_hàng của khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.mã trạng_thái đơn hàng = "Completed" intersect select t1.tên khách_hàng from khách_hàng as t1 join lượt đặt_hàng của khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.mã trạng_thái đơn hàng = "Part"	customers_and_products_contacts
select tên khách_hàng , điện_thoại khách_hàng , mã phương_thức thanh_toán from khách_hàng order by mã_số khách_hàng desc	customers_and_products_contacts
select t1.tên sản_phẩm , sum ( t2.số_lượng đặt_hàng ) from sản_phẩm as t1 join mặt_hàng được đặt as t2 on t1.id sản_phẩm = t2.id sản_phẩm group by t1.id sản_phẩm	customers_and_products_contacts
select min ( giá sản_phẩm ) , max ( giá sản_phẩm ) , avg ( giá sản_phẩm ) from sản_phẩm	customers_and_products_contacts
select count ( * ) from sản_phẩm where giá sản_phẩm > ( select avg ( giá sản_phẩm ) from sản_phẩm )	customers_and_products_contacts
select t2.tên khách_hàng , t3.thành_phố , t1.từ ngày , t1.đến ngày from lịch_sử địa_chỉ khách_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng join địa_chỉ as t3 on t1.id địa_chỉ = t3.id địa_chỉ	customers_and_products_contacts
select t1.tên khách_hàng from khách_hàng as t1 join lượt đặt_hàng của khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.mã phương_thức thanh_toán = "Credit Card" group by t1.id khách_hàng having count ( * ) > 2	customers_and_products_contacts
select t1.tên khách_hàng , t1.điện_thoại khách_hàng from khách_hàng as t1 join lượt đặt_hàng của khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng join mặt_hàng được đặt as t3 on t3.id đơn hàng = t2.id đơn hàng group by t1.id khách_hàng order by sum ( t3.số_lượng đặt_hàng ) desc limit 1	customers_and_products_contacts
select mã loại sản_phẩm , tên sản_phẩm from sản_phẩm where giá sản_phẩm > 1000 or giá sản_phẩm < 500	customers_and_products_contacts
select count ( * ) from bộ_trưởng where tuổi > 56	department_management
select tên , sinh ra ở tiểu_bang , tuổi from bộ_trưởng order by tuổi	department_management
select năm thành_lập , tên , ngân_sách tính theo tỷ from các bộ	department_management
select max ( ngân_sách tính theo tỷ ) , min ( ngân_sách tính theo tỷ ) from các bộ	department_management
select avg ( số_lượng nhân_viên ) from các bộ where xếp_hạng between 10 and 15	department_management
select tên from bộ_trưởng where sinh ra ở tiểu_bang != "California"	department_management
select distinct t1.năm thành_lập from các bộ as t1 join sự quản_lý as t2 on t1.id các bộ = t2.id các bộ join bộ_trưởng as t3 on t2.id người đứng đầu = t3.id người đứng đầu where t3.sinh ra ở tiểu_bang = "Alabama"	department_management
select sinh ra ở tiểu_bang from bộ_trưởng group by sinh ra ở tiểu_bang having count ( * ) >= 3	department_management
select năm thành_lập from các bộ group by năm thành_lập order by count ( * ) desc limit 1	department_management
select t1.tên , t1.số_lượng nhân_viên from các bộ as t1 join sự quản_lý as t2 on t1.id các bộ = t2.id các bộ where t2.vai_trò tạm_thời = "Yes"	department_management
select count ( distinct vai_trò tạm_thời ) from sự quản_lý	department_management
select count ( * ) from các bộ where id các bộ not in ( select id các bộ from sự quản_lý )	department_management
select distinct t1.tuổi from sự quản_lý as t2 join bộ_trưởng as t1 on t1.id người đứng đầu = t2.id người đứng đầu where t2.vai_trò tạm_thời = "Yes"	department_management
select t3.sinh ra ở tiểu_bang from các bộ as t1 join sự quản_lý as t2 on t1.id các bộ = t2.id các bộ join bộ_trưởng as t3 on t2.id người đứng đầu = t3.id người đứng đầu where t1.tên = "Treasury" intersect select t3.sinh ra ở tiểu_bang from các bộ as t1 join sự quản_lý as t2 on t1.id các bộ = t2.id các bộ join bộ_trưởng as t3 on t2.id người đứng đầu = t3.id người đứng đầu where t1.tên = "Homeland Security"	department_management
select t1.id các bộ , t1.tên , count ( * ) from sự quản_lý as t2 join các bộ as t1 on t1.id các bộ = t2.id các bộ group by t1.id các bộ having count ( * ) > 1	department_management
select id người đứng đầu , tên from bộ_trưởng where tên like "%Ha%"	department_management
select id from xe	driving_school
select id from xe	driving_school
select count ( * ) from xe	driving_school
select count ( * ) from xe	driving_school
select chi_tiết về xe from xe where id = 1	driving_school
select chi_tiết về xe from xe where id = 1	driving_school
select tên , tên đệm , họ from nhân_viên	driving_school
select tên , tên đệm , họ from nhân_viên	driving_school
select ngày_sinh from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày_sinh from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân_viên gia_nhập from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân_viên gia_nhập from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân_viên rời đi from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân_viên rời đi from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select count ( * ) from nhân_viên where tên = "Ludie"	driving_school
select count ( * ) from nhân_viên where tên = "Ludie"	driving_school
select biệt_danh from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select biệt_danh from nhân_viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select count ( * ) from nhân_viên	driving_school
select count ( * ) from nhân_viên	driving_school
select t1.thành_phố from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.thành_phố from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.quốc_gia , t1.tiểu_bang from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.quốc_gia , t1.tiểu_bang from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select sum ( t1.giờ học ) from bài giảng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Rylan" and t2.họ = "Goodwin"	driving_school
select sum ( t1.giờ học ) from bài giảng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Rylan" and t2.họ = "Goodwin"	driving_school
select t1.mã bưu_điện from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.mã bưu_điện from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select count ( * ) from địa_chỉ where tiểu_bang = "Georgia"	driving_school
select count ( * ) from địa_chỉ where tiểu_bang = "Georgia"	driving_school
select t2.tên , t2.họ from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t1.thành_phố = "Damianfort"	driving_school
select t2.tên , t2.họ from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên where t1.thành_phố = "Damianfort"	driving_school
select t1.thành_phố , count ( * ) from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên group by t1.thành_phố order by count ( * ) desc limit 1	driving_school
select t1.thành_phố , count ( * ) from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên group by t1.thành_phố order by count ( * ) desc limit 1	driving_school
select t1.tiểu_bang from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên group by t1.tiểu_bang having count ( * ) between 2 and 4	driving_school
select t1.tiểu_bang from địa_chỉ as t1 join nhân_viên as t2 on t1.id địa_chỉ = t2.id địa_chỉ nhân_viên group by t1.tiểu_bang having count ( * ) between 2 and 4	driving_school
select tên , họ from khách_hàng	driving_school
select tên , họ from khách_hàng	driving_school
select địa chỉ email , ngày_sinh from khách_hàng where tên = "Carole"	driving_school
select địa chỉ email , ngày_sinh from khách_hàng where tên = "Carole"	driving_school
select số điện_thoại , địa chỉ email from khách_hàng where số tiền còn thiếu > 2000	driving_school
select số điện_thoại , địa chỉ email from khách_hàng where số tiền còn thiếu > 2000	driving_school
select mã trạng_thái khách_hàng , số điện_thoại_di_động , địa chỉ email from khách_hàng where tên = "Marina" or họ = "Kohler"	driving_school
select mã trạng_thái khách_hàng , số điện_thoại_di_động , địa chỉ email from khách_hàng where tên = "Marina" or họ = "Kohler"	driving_school
select ngày_sinh from khách_hàng where mã trạng_thái khách_hàng = "Good Customer"	driving_school
select ngày_sinh from khách_hàng where mã trạng_thái khách_hàng = "Good Customer"	driving_school
select ngày trở_thành khách_hàng from khách_hàng where tên = "Carole" and họ = "Bernhard"	driving_school
select ngày trở_thành khách_hàng from khách_hàng where tên = "Carole" and họ = "Bernhard"	driving_school
select count ( * ) from khách_hàng	driving_school
select count ( * ) from khách_hàng	driving_school
select mã trạng_thái khách_hàng , count ( * ) from khách_hàng group by mã trạng_thái khách_hàng	driving_school
select mã trạng_thái khách_hàng , count ( * ) from khách_hàng group by mã trạng_thái khách_hàng	driving_school
select mã trạng_thái khách_hàng from khách_hàng group by mã trạng_thái khách_hàng order by count ( * ) asc limit 1	driving_school
select mã trạng_thái khách_hàng from khách_hàng group by mã trạng_thái khách_hàng order by count ( * ) asc limit 1	driving_school
select count ( * ) from bài giảng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Rylan" and t2.họ = "Goodwin" and t1.mã trạng_thái bài giảng = "Completed"	driving_school
select count ( * ) from bài giảng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Rylan" and t2.họ = "Goodwin" and t1.mã trạng_thái bài giảng = "Completed"	driving_school
select max ( số tiền còn thiếu ) , min ( số tiền còn thiếu ) , avg ( số tiền còn thiếu ) from khách_hàng	driving_school
select max ( số tiền còn thiếu ) , min ( số tiền còn thiếu ) , avg ( số tiền còn thiếu ) from khách_hàng	driving_school
select tên , họ from khách_hàng where số tiền còn thiếu between 1000 and 3000	driving_school
select tên , họ from khách_hàng where số tiền còn thiếu between 1000 and 3000	driving_school
select t1.tên , t1.họ from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ where t2.thành_phố = "Lockmanfurt"	driving_school
select t1.tên , t1.họ from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ where t2.thành_phố = "Lockmanfurt"	driving_school
select t2.quốc_gia from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.quốc_gia from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.mã bưu_điện from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.mã bưu_điện from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.thành_phố from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ group by t2.thành_phố order by count ( * ) desc limit 1	driving_school
select t2.thành_phố from khách_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ khách_hàng = t2.id địa_chỉ group by t2.thành_phố order by count ( * ) desc limit 1	driving_school
select sum ( t1.số tiền thanh_toán ) from khoản thanh_toán của khách_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Carole" and t2.họ = "Bernhard"	driving_school
select sum ( t1.số tiền thanh_toán ) from khoản thanh_toán của khách_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Carole" and t2.họ = "Bernhard"	driving_school
select count ( * ) from khách_hàng where id khách_hàng not in ( select id khách_hàng from khoản thanh_toán của khách_hàng )	driving_school
select count ( * ) from khách_hàng where id khách_hàng not in ( select id khách_hàng from khoản thanh_toán của khách_hàng )	driving_school
select t2.tên , t2.họ from khoản thanh_toán của khách_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng having count ( * ) > 2	driving_school
select t2.tên , t2.họ from khoản thanh_toán của khách_hàng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng having count ( * ) > 2	driving_school
select mã phương_thức thanh_toán , count ( * ) from khoản thanh_toán của khách_hàng group by mã phương_thức thanh_toán	driving_school
select mã phương_thức thanh_toán , count ( * ) from khoản thanh_toán của khách_hàng group by mã phương_thức thanh_toán	driving_school
select count ( * ) from bài giảng where mã trạng_thái bài giảng = "Cancelled"	driving_school
select count ( * ) from bài giảng where mã trạng_thái bài giảng = "Cancelled"	driving_school
select t1.id bài giảng from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn" and biệt_danh like "%s%"	driving_school
select t1.id bài giảng from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn" and biệt_danh like "%s%"	driving_school
select count ( * ) from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên like "%a%"	driving_school
select count ( * ) from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên like "%a%"	driving_school
select sum ( giờ học ) from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select sum ( giờ học ) from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select avg ( giá ) from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select avg ( giá ) from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select count ( * ) from bài giảng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Ray"	driving_school
select count ( * ) from bài giảng as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.tên = "Ray"	driving_school
select họ from khách_hàng intersect select họ from nhân_viên	driving_school
select họ from khách_hàng intersect select họ from nhân_viên	driving_school
select tên from nhân_viên except select t2.tên from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên	driving_school
select tên from nhân_viên except select t2.tên from bài giảng as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên	driving_school
select t1.id , t1.chi_tiết về xe from xe as t1 join bài giảng as t2 on t1.id = t2.id xe group by t1.id order by count ( * ) desc limit 1	driving_school
select count ( * ) from nhân_viên	employee_hire_evaluation
select count ( * ) from nhân_viên	employee_hire_evaluation
select tên from nhân_viên order by tuổi	employee_hire_evaluation
select tên from nhân_viên order by tuổi	employee_hire_evaluation
select count ( * ) , thành_phố from nhân_viên group by thành_phố	employee_hire_evaluation
select count ( * ) , thành_phố from nhân_viên group by thành_phố	employee_hire_evaluation
select thành_phố from nhân_viên where tuổi < 30 group by thành_phố having count ( * ) > 1	employee_hire_evaluation
select thành_phố from nhân_viên where tuổi < 30 group by thành_phố having count ( * ) > 1	employee_hire_evaluation
select count ( * ) , địa_điểm from cửa_hàng group by địa_điểm	employee_hire_evaluation
select count ( * ) , địa_điểm from cửa_hàng group by địa_điểm	employee_hire_evaluation
select tên người_quản_lý , quận from cửa_hàng order by số_lượng sản_phẩm desc limit 1	employee_hire_evaluation
select tên người_quản_lý , quận from cửa_hàng order by số_lượng sản_phẩm desc limit 1	employee_hire_evaluation
select min ( số_lượng sản_phẩm ) , max ( số_lượng sản_phẩm ) from cửa_hàng	employee_hire_evaluation
select min ( số_lượng sản_phẩm ) , max ( số_lượng sản_phẩm ) from cửa_hàng	employee_hire_evaluation
select tên , địa_điểm , quận from cửa_hàng order by số_lượng sản_phẩm desc	employee_hire_evaluation
select tên , địa_điểm , quận from cửa_hàng order by số_lượng sản_phẩm desc	employee_hire_evaluation
select tên from cửa_hàng where số_lượng sản_phẩm > ( select avg ( số_lượng sản_phẩm ) from cửa_hàng )	employee_hire_evaluation
select tên from cửa_hàng where số_lượng sản_phẩm > ( select avg ( số_lượng sản_phẩm ) from cửa_hàng )	employee_hire_evaluation
select t1.tên from nhân_viên as t1 join đánh_giá as t2 on t1.id nhân_viên = t2.id nhân_viên group by t2.id nhân_viên order by count ( * ) desc limit 1	employee_hire_evaluation
select t1.tên from nhân_viên as t1 join đánh_giá as t2 on t1.id nhân_viên = t2.id nhân_viên group by t2.id nhân_viên order by count ( * ) desc limit 1	employee_hire_evaluation
select t1.tên from nhân_viên as t1 join đánh_giá as t2 on t1.id nhân_viên = t2.id nhân_viên order by t2.tiền thưởng desc limit 1	employee_hire_evaluation
select t1.tên from nhân_viên as t1 join đánh_giá as t2 on t1.id nhân_viên = t2.id nhân_viên order by t2.tiền thưởng desc limit 1	employee_hire_evaluation
select tên from nhân_viên where id nhân_viên not in ( select id nhân_viên from đánh_giá )	employee_hire_evaluation
select tên from nhân_viên where id nhân_viên not in ( select id nhân_viên from đánh_giá )	employee_hire_evaluation
select t2.tên from tuyển_dụng as t1 join cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng group by t1.id cửa_hàng order by count ( * ) desc limit 1	employee_hire_evaluation
select t2.tên from tuyển_dụng as t1 join cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng group by t1.id cửa_hàng order by count ( * ) desc limit 1	employee_hire_evaluation
select tên from cửa_hàng where id cửa_hàng not in ( select id cửa_hàng from tuyển_dụng )	employee_hire_evaluation
select tên from cửa_hàng where id cửa_hàng not in ( select id cửa_hàng from tuyển_dụng )	employee_hire_evaluation
select count ( * ) , t2.tên from tuyển_dụng as t1 join cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng group by t2.tên	employee_hire_evaluation
select count ( * ) , t2.tên from tuyển_dụng as t1 join cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng group by t2.tên	employee_hire_evaluation
select sum ( tiền thưởng ) from đánh_giá	employee_hire_evaluation
select sum ( tiền thưởng ) from đánh_giá	employee_hire_evaluation
select * from tuyển_dụng	employee_hire_evaluation
select * from tuyển_dụng	employee_hire_evaluation
select quận from cửa_hàng where số_lượng sản_phẩm < 3000 intersect select quận from cửa_hàng where số_lượng sản_phẩm > 10000	employee_hire_evaluation
select quận from cửa_hàng where số_lượng sản_phẩm < 3000 intersect select quận from cửa_hàng where số_lượng sản_phẩm > 10000	employee_hire_evaluation
select count ( distinct địa_điểm ) from cửa_hàng	employee_hire_evaluation
select count ( distinct địa_điểm ) from cửa_hàng	employee_hire_evaluation
select quốc_gia from hãng hàng_không where tên hãng hàng_không = "JetBlue Airways"	flight_2
select quốc_gia from hãng hàng_không where tên hãng hàng_không = "JetBlue Airways"	flight_2
select tên viết tắt from hãng hàng_không where tên hãng hàng_không = "JetBlue Airways"	flight_2
select tên viết tắt from hãng hàng_không where tên hãng hàng_không = "JetBlue Airways"	flight_2
select tên hãng hàng_không , tên viết tắt from hãng hàng_không where quốc_gia = "USA"	flight_2
select tên hãng hàng_không , tên viết tắt from hãng hàng_không where quốc_gia = "USA"	flight_2
select mã sân_bay , tên sân_bay from sân_bay where thành_phố = "Anthony"	flight_2
select mã sân_bay , tên sân_bay from sân_bay where thành_phố = "Anthony"	flight_2
select count ( * ) from hãng hàng_không	flight_2
select count ( * ) from hãng hàng_không	flight_2
select count ( * ) from sân_bay	flight_2
select count ( * ) from sân_bay	flight_2
select count ( * ) from chuyến bay	flight_2
select count ( * ) from chuyến bay	flight_2
select tên hãng hàng_không from hãng hàng_không where tên viết tắt = "UAL"	flight_2
select tên hãng hàng_không from hãng hàng_không where tên viết tắt = "UAL"	flight_2
select count ( * ) from hãng hàng_không where quốc_gia = "USA"	flight_2
select count ( * ) from hãng hàng_không where quốc_gia = "USA"	flight_2
select thành_phố , quốc_gia from sân_bay where tên sân_bay = "Alton"	flight_2
select thành_phố , quốc_gia from sân_bay where tên sân_bay = "Alton"	flight_2
select tên sân_bay from sân_bay where mã sân_bay = "AKO"	flight_2
select tên sân_bay from sân_bay where mã sân_bay = "AKO"	flight_2
select tên sân_bay from sân_bay where thành_phố = "Aberdeen"	flight_2
select tên sân_bay from sân_bay where thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay where sân_bay khởi_hành = "APG"	flight_2
select count ( * ) from chuyến bay where sân_bay khởi_hành = "APG"	flight_2
select count ( * ) from chuyến bay where sân_bay đích = "ATO"	flight_2
select count ( * ) from chuyến bay where sân_bay đích = "ATO"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay khởi_hành = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay khởi_hành = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay join sân_bay as t3 on t1.sân_bay khởi_hành = t3.mã sân_bay where t2.thành_phố = "Ashley" and t3.thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay join sân_bay as t3 on t1.sân_bay khởi_hành = t3.mã sân_bay where t2.thành_phố = "Ashley" and t3.thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join hãng hàng_không as t2 on t1.hãng hàng_không = t2.id hãng hàng_không where t2.tên hãng hàng_không = "JetBlue Airways"	flight_2
select count ( * ) from chuyến bay as t1 join hãng hàng_không as t2 on t1.hãng hàng_không = t2.id hãng hàng_không where t2.tên hãng hàng_không = "JetBlue Airways"	flight_2
select count ( * ) from hãng hàng_không as t1 join chuyến bay as t2 on t2.hãng hàng_không = t1.id hãng hàng_không where t1.tên hãng hàng_không = "United Airlines" and t2.sân_bay đích = "ASY"	flight_2
select count ( * ) from hãng hàng_không as t1 join chuyến bay as t2 on t2.hãng hàng_không = t1.id hãng hàng_không where t1.tên hãng hàng_không = "United Airlines" and t2.sân_bay đích = "ASY"	flight_2
select count ( * ) from hãng hàng_không as t1 join chuyến bay as t2 on t2.hãng hàng_không = t1.id hãng hàng_không where t1.tên hãng hàng_không = "United Airlines" and t2.sân_bay khởi_hành = "AHD"	flight_2
select count ( * ) from hãng hàng_không as t1 join chuyến bay as t2 on t2.hãng hàng_không = t1.id hãng hàng_không where t1.tên hãng hàng_không = "United Airlines" and t2.sân_bay khởi_hành = "AHD"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay join hãng hàng_không as t3 on t3.id hãng hàng_không = t1.hãng hàng_không where t2.thành_phố = "Aberdeen" and t3.tên hãng hàng_không = "United Airlines"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay join hãng hàng_không as t3 on t3.id hãng hàng_không = t1.hãng hàng_không where t2.thành_phố = "Aberdeen" and t3.tên hãng hàng_không = "United Airlines"	flight_2
select t1.thành_phố from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay đích group by t1.thành_phố order by count ( * ) desc limit 1	flight_2
select t1.thành_phố from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay đích group by t1.thành_phố order by count ( * ) desc limit 1	flight_2
select t1.thành_phố from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay khởi_hành group by t1.thành_phố order by count ( * ) desc limit 1	flight_2
select t1.thành_phố from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay khởi_hành group by t1.thành_phố order by count ( * ) desc limit 1	flight_2
select t1.mã sân_bay from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay đích or t1.mã sân_bay = t2.sân_bay khởi_hành group by t1.mã sân_bay order by count ( * ) desc limit 1	flight_2
select t1.mã sân_bay from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay đích or t1.mã sân_bay = t2.sân_bay khởi_hành group by t1.mã sân_bay order by count ( * ) desc limit 1	flight_2
select t1.mã sân_bay from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay đích or t1.mã sân_bay = t2.sân_bay khởi_hành group by t1.mã sân_bay order by count ( * ) limit 1	flight_2
select t1.mã sân_bay from sân_bay as t1 join chuyến bay as t2 on t1.mã sân_bay = t2.sân_bay đích or t1.mã sân_bay = t2.sân_bay khởi_hành group by t1.mã sân_bay order by count ( * ) limit 1	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không order by count ( * ) desc limit 1	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không order by count ( * ) desc limit 1	flight_2
select t1.tên viết tắt , t1.quốc_gia from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không order by count ( * ) limit 1	flight_2
select t1.tên viết tắt , t1.quốc_gia from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không order by count ( * ) limit 1	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "AHD"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "AHD"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay đích = "AHD"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay đích = "AHD"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "APG" intersect select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "CVO"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "APG" intersect select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "CVO"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "CVO" except select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "APG"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "CVO" except select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không where t2.sân_bay khởi_hành = "APG"	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không having count ( * ) > 10	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không having count ( * ) > 10	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không having count ( * ) < 200	flight_2
select t1.tên hãng hàng_không from hãng hàng_không as t1 join chuyến bay as t2 on t1.id hãng hàng_không = t2.hãng hàng_không group by t1.tên hãng hàng_không having count ( * ) < 200	flight_2
select t1.số_hiệu chuyến bay from chuyến bay as t1 join hãng hàng_không as t2 on t2.id hãng hàng_không = t1.hãng hàng_không where t2.tên hãng hàng_không = "United Airlines"	flight_2
select t1.số_hiệu chuyến bay from chuyến bay as t1 join hãng hàng_không as t2 on t2.id hãng hàng_không = t1.hãng hàng_không where t2.tên hãng hàng_không = "United Airlines"	flight_2
select số_hiệu chuyến bay from chuyến bay where sân_bay khởi_hành = "APG"	flight_2
select số_hiệu chuyến bay from chuyến bay where sân_bay khởi_hành = "APG"	flight_2
select số_hiệu chuyến bay from chuyến bay where sân_bay đích = "APG"	flight_2
select số_hiệu chuyến bay from chuyến bay where sân_bay đích = "APG"	flight_2
select t1.số_hiệu chuyến bay from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay khởi_hành = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select t1.số_hiệu chuyến bay from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay khởi_hành = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select t1.số_hiệu chuyến bay from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select t1.số_hiệu chuyến bay from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay where t2.thành_phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay where t2.thành_phố = "Aberdeen" or t2.thành_phố = "Abilene"	flight_2
select count ( * ) from chuyến bay as t1 join sân_bay as t2 on t1.sân_bay đích = t2.mã sân_bay where t2.thành_phố = "Aberdeen" or t2.thành_phố = "Abilene"	flight_2
select tên sân_bay from sân_bay where mã sân_bay not in ( select sân_bay khởi_hành from chuyến bay union select sân_bay đích from chuyến bay )	flight_2
select tên sân_bay from sân_bay where mã sân_bay not in ( select sân_bay khởi_hành from chuyến bay union select sân_bay đích from chuyến bay )	flight_2
select count ( * ) from trận đấu where mùa giải > 2007	game_injury
select ngày from trận đấu order by đội chủ nhà desc	game_injury
select mùa giải , đội chủ nhà , đội khách from trận đấu	game_injury
select max ( trận đấu sân_nhà ) , min ( trận đấu sân_nhà ) , avg ( trận đấu sân_nhà ) from sân_vận_động	game_injury
select số_lượng người tham_dự trung_bình from sân_vận_động where phần_trăm sức chứa > 100	game_injury
select cầu_thủ , số_lượng trận đấu , nguồn thông_tin from chấn_thương where chấn_thương != "Knee problem"	game_injury
select t1.mùa giải from trận đấu as t1 join chấn_thương as t2 on t1.id = t2.id trận đấu where t2.cầu_thủ = "Walter Samuel"	game_injury
select t1.id , t1.tỉ_số , t1.ngày from trận đấu as t1 join chấn_thương as t2 on t2.id trận đấu = t1.id group by t1.id having count ( * ) >= 2	game_injury
select t1.id , t1.tên from sân_vận_động as t1 join trận đấu as t2 on t1.id = t2.id sân_vận_động join chấn_thương as t3 on t2.id = t3.id trận đấu group by t1.id order by count ( * ) desc limit 1	game_injury
select t1.id , t1.tên from sân_vận_động as t1 join trận đấu as t2 on t1.id = t2.id sân_vận_động join chấn_thương as t3 on t2.id = t3.id trận đấu group by t1.id order by count ( * ) desc limit 1	game_injury
select t1.mùa giải , t2.tên from trận đấu as t1 join sân_vận_động as t2 on t1.id sân_vận_động = t2.id join chấn_thương as t3 on t1.id = t3.id trận đấu where t3.chấn_thương = "Foot injury" or t3.chấn_thương = "Knee problem"	game_injury
select count ( distinct nguồn thông_tin ) from chấn_thương	game_injury
select count ( * ) from trận đấu where id not in ( select id trận đấu from chấn_thương )	game_injury
select count ( distinct t1.chấn_thương ) from chấn_thương as t1 join trận đấu as t2 on t1.id trận đấu = t2.id where t2.mùa giải > 2010	game_injury
select t2.tên from trận đấu as t1 join sân_vận_động as t2 on t1.id sân_vận_động = t2.id join chấn_thương as t3 on t1.id = t3.id trận đấu where t3.cầu_thủ = "Walter Samuel" intersect select t2.tên from trận đấu as t1 join sân_vận_động as t2 on t1.id sân_vận_động = t2.id join chấn_thương as t3 on t1.id = t3.id trận đấu where t3.cầu_thủ = "Thiago Motta"	game_injury
select tên , số_lượng người tham_dự trung_bình , tổng_số người tham_dự from sân_vận_động except select t2.tên , t2.số_lượng người tham_dự trung_bình , t2.tổng_số người tham_dự from trận đấu as t1 join sân_vận_động as t2 on t1.id sân_vận_động = t2.id join chấn_thương as t3 on t1.id = t3.id trận đấu	game_injury
select tên from sân_vận_động where tên like "%Bank%"	game_injury
select t1.id , count ( * ) from sân_vận_động as t1 join trận đấu as t2 on t1.id = t2.id sân_vận_động group by t1.id	game_injury
select t1.ngày , t2.cầu_thủ from trận đấu as t1 join chấn_thương as t2 on t1.id = t2.id trận đấu order by t1.mùa giải desc	game_injury
select năm phát_hành from bộ phim where tiêu_đề = "The Imitation Game"	imdb
select năm phát_hành from bộ phim where tiêu_đề = "The Imitation Game"	imdb
select năm sinh from diễn_viên where tên = "Benedict Cumberbatch"	imdb
select năm sinh from diễn_viên where tên = "Benedict Cumberbatch"	imdb
select quốc_tịch from diễn_viên where tên = "Christoph Waltz"	imdb
select quốc_tịch from diễn_viên where tên = "Christoph Waltz"	imdb
select tiêu_đề from bộ phim where năm phát_hành = 2015	imdb
select tên from diễn_viên where nơi sinh = "Tehran"	imdb
select tên from diễn_viên where nơi sinh = "Tehran"	imdb
select tên from diễn_viên where nơi sinh = "Tehran"	imdb
select tên from diễn_viên where quốc_tịch = "Afghanistan"	imdb
select tên from diễn_viên where quốc_tịch = "Afghanistan"	imdb
select tên from diễn_viên where quốc_tịch = "Afghanistan"	imdb
select tên from diễn_viên where năm sinh = 1984	imdb
select năm sinh from diễn_viên where tên = "actor_name0"	imdb
select năm sinh from diễn_viên where tên = "actor_name0"	imdb
select nơi sinh from đạo_diễn where tên = "director_name0"	imdb
select nơi sinh from đạo_diễn where tên = "director_name0"	imdb
select quốc_tịch from đạo_diễn where tên = "director_name0"	imdb
select ngân_sách from bộ phim where tiêu_đề = "Finding Nemo"	imdb
select t3.tiêu_đề from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Steven Spielberg" and t3.năm phát_hành > 2006	imdb
select t2.tên from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu_đề = "James Bond"	imdb
select t2.tên from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu_đề = "James Bond"	imdb
select t2.tên from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu_đề = "James Bond"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu_đề = "The Imitation Game"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu_đề = "The Imitation Game"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu_đề = "The Imitation Game"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu_đề = "The Imitation Game"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu_đề = "The Imitation Game"	imdb
select t2.thể_loại from thể_loại as t2 join phân_loại as t1 on t2.id thể_loại = t1.id thể_loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu_đề = "Jurassic Park"	imdb
select t2.tên from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.năm phát_hành = 2015 and t3.tiêu_đề = "Joy"	imdb
select t1.tiêu_đề from được viết bởi as t3 join bộ phim as t1 on t3.id sê-ri phim = t1.id bộ phim join nhà viết kịch_bản as t2 on t3.id nhà viết kịch_bản = t2.id nhà viết kịch_bản where t2.tên = "Matt Damon"	imdb
select t2.tiêu_đề from bộ phim as t2 join được làm bởi as t3 on t2.id bộ phim = t3.id sê-ri phim join nhà_sản_xuất as t1 on t1.id nhà_sản_xuất = t3.id nhà_sản_xuất join được viết bởi as t5 on t5.id sê-ri phim = t2.id bộ phim join nhà viết kịch_bản as t4 on t5.id nhà viết kịch_bản = t4.id nhà viết kịch_bản where t1.tên = "Woody Allen" and t4.tên = "Woody Allen"	imdb
select t2.tiêu_đề from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Robin Wright"	imdb
select t2.tiêu_đề from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Robin Wright"	imdb
select t2.tiêu_đề from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Robin Wright"	imdb
select ngân_sách from bộ phim where năm phát_hành = 2007 and tiêu_đề = "Juno"	imdb
select t3.tiêu_đề from thể_loại as t2 join phân_loại as t1 on t2.id thể_loại = t1.id thể_loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.thể_loại = "Sci-Fi" and t3.năm phát_hành = 2010	imdb
select t3.tiêu_đề from thể_loại as t2 join phân_loại as t1 on t2.id thể_loại = t1.id thể_loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.thể_loại = "Sci-Fi" and t3.năm phát_hành = 2010	imdb
select tên from diễn_viên where nơi sinh = "Austin" and năm sinh > 1980	imdb
select tên from diễn_viên where nơi sinh = "Austin" and năm sinh > 1980	imdb
select tên from diễn_viên where nơi sinh = "Austin" and năm sinh > 1980	imdb
select t3.tiêu_đề from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.nơi sinh = "Los Angeles"	imdb
select tên from diễn_viên where nơi sinh = "New York City" and năm sinh = 1984	imdb
select t3.tiêu_đề from nhãn as t2 join từ_khoá as t1 on t2.id từ_khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ_khoá = "nuclear weapons"	imdb
select t3.tiêu_đề from nhãn as t2 join từ_khoá as t1 on t2.id từ_khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ_khoá = "nuclear weapons"	imdb
select t3.tiêu_đề from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Alfred Hitchcock"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo_diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo_diễn as t3 on t3.id đạo_diễn = t2.id đạo_diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo_diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo_diễn as t3 on t3.id đạo_diễn = t2.id đạo_diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo_diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo_diễn as t3 on t3.id đạo_diễn = t2.id đạo_diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo_diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo_diễn as t3 on t3.id đạo_diễn = t2.id đạo_diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t2.tiêu_đề from nhà_sản_xuất as t1 join được làm bởi as t3 on t1.id nhà_sản_xuất = t3.id nhà_sản_xuất join phim_truyền_hình nhiều tập as t2 on t2.id sê-ri phim_truyền_hình = t3.id sê-ri phim where t1.tên = "Shonda Rhimes"	imdb
select t1.tên from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join phim_truyền_hình nhiều tập as t2 on t2.id sê-ri phim_truyền_hình = t3.id sê-ri phim where t3.vai diễn = "Olivia Pope" and t2.tiêu_đề = "Scandal"	imdb
select t2.tên from được viết bởi as t3 join bộ phim as t1 on t3.id sê-ri phim = t1.id bộ phim join nhà viết kịch_bản as t2 on t3.id nhà viết kịch_bản = t2.id nhà viết kịch_bản where t1.tiêu_đề = "The Truman Show"	imdb
select t2.tên from được viết bởi as t3 join bộ phim as t1 on t3.id sê-ri phim = t1.id bộ phim join nhà viết kịch_bản as t2 on t3.id nhà viết kịch_bản = t2.id nhà viết kịch_bản where t1.tiêu_đề = "The Truman Show"	imdb
select t2.tiêu_đề from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join phim_truyền_hình nhiều tập as t2 on t2.id sê-ri phim_truyền_hình = t3.id sê-ri phim where t1.tên = "Scott Foley"	imdb
select t2.tiêu_đề from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join phim_truyền_hình nhiều tập as t2 on t2.id sê-ri phim_truyền_hình = t3.id sê-ri phim where t1.tên = "Scott Foley"	imdb
select t3.tên from phân_vai as t4 join diễn_viên as t1 on t4.id diễn_viên = t1.id diễn_viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join đạo_diễn bởi as t2 on t5.id bộ phim = t2.id sê-ri phim join đạo_diễn as t3 on t3.id đạo_diễn = t2.id đạo_diễn where t1.tên = "Kate Winslet"	imdb
select t1.tên from phân_vai as t3 join diễn_viên as t2 on t3.id diễn_viên = t2.id diễn_viên join bộ phim as t5 on t5.id bộ phim = t3.id sê-ri phim join được làm bởi as t4 on t5.id bộ phim = t4.id sê-ri phim join nhà_sản_xuất as t1 on t1.id nhà_sản_xuất = t4.id nhà_sản_xuất where t2.tên = "Kate Winslet"	imdb
select t2.tên from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join phim_truyền_hình nhiều tập as t3 on t3.id sê-ri phim_truyền_hình = t1.id sê-ri phim where t3.năm phát_hành = 2013 and t3.tiêu_đề = "House of Cards"	imdb
select tên from diễn_viên where nơi sinh = "Austin" and giới_tính = "female"	imdb
select tên from diễn_viên where năm sinh > 1980 and quốc_tịch = "Italy"	imdb
select tên from diễn_viên where nơi sinh = "New York City" and năm sinh > 1980 and giới_tính = "female"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.giới_tính = "female" and t3.tiêu_đề = "Saving Private Ryan"	imdb
select tên from đạo_diễn where quốc_tịch = "Afghanistan"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu_đề = "Camp X-Ray"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.quốc_tịch = "Canada" and t3.tiêu_đề = "James Bond"	imdb
select t2.tiêu_đề from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Rowan Atkinson" and t3.vai diễn = "Mr. Bean"	imdb
select t2.nơi sinh from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu_đề = "The Past"	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên where t2.vai diễn = "Mr. Bean"	imdb
select t3.thể_loại from đạo_diễn as t5 join đạo_diễn bởi as t2 on t5.id đạo_diễn = t2.id đạo_diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join phân_loại as t1 on t4.id bộ phim = t1.id sê-ri phim join thể_loại as t3 on t3.id thể_loại = t1.id thể_loại where t5.tên = "Asghar Farhadi"	imdb
select t1.tiêu_đề from bộ phim as t1 join phân_vai as t2 on t1.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Daffy Duck"	imdb
select t2.vai diễn from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu_đề = "Daddy Long Legs"	imdb
select t3.tên from đạo_diễn as t3 join đạo_diễn bởi as t2 on t3.id đạo_diễn = t2.id đạo_diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join nhãn as t5 on t5.id sê-ri phim = t4.id bộ phim join từ_khoá as t1 on t5.id từ_khoá = t1.id where t1.từ_khoá = "nuclear weapons"	imdb
select count ( distinct t2.tiêu_đề ) from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Jennifer Aniston" and t2.năm phát_hành > 2010	imdb
select count ( distinct t1.tên ) from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu_đề = "Saving Private Ryan"	imdb
select count ( distinct t1.tên ) from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu_đề = "Saving Private Ryan"	imdb
select count ( distinct t3.tiêu_đề ) from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Steven Spielberg"	imdb
select count ( distinct tiêu_đề ) from bộ phim where năm phát_hành = 2013	imdb
select count ( distinct tiêu_đề ) from bộ phim where năm phát_hành = 2013	imdb
select count ( distinct t3.tiêu_đề ) , t3.năm phát_hành from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Woody Allen" group by t3.năm phát_hành	imdb
select count ( distinct t2.tiêu_đề ) from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct t2.tiêu_đề ) from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct t2.tiêu_đề ) from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct t2.tiêu_đề ) from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct tên ) from diễn_viên where nơi sinh = "Los Angeles" and năm sinh > 2000	imdb
select count ( distinct t2.tiêu_đề ) from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Humphrey Bogart" and t2.năm phát_hành < 1942	imdb
select count ( distinct t2.tiêu_đề ) , t2.năm phát_hành from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Brad Pitt" group by t2.năm phát_hành	imdb
select count ( distinct t3.tiêu_đề ) from nhãn as t2 join từ_khoá as t1 on t2.id từ_khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ_khoá = "Iraq war" and t3.năm phát_hành = 2015	imdb
select count ( distinct t3.tiêu_đề ) from nhãn as t2 join từ_khoá as t1 on t2.id từ_khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ_khoá = "Persians" and t3.năm phát_hành > 1990	imdb
select count ( distinct t3.tiêu_đề ) from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Quentin Tarantino" and t3.năm phát_hành > 2010	imdb
select count ( distinct t3.tiêu_đề ) from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Quentin Tarantino" and t3.năm phát_hành < 2010	imdb
select count ( distinct t4.tiêu_đề ) from đạo_diễn as t3 join đạo_diễn bởi as t2 on t3.id đạo_diễn = t2.id đạo_diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join được làm bởi as t5 on t4.id bộ phim = t5.id sê-ri phim join nhà_sản_xuất as t1 on t1.id nhà_sản_xuất = t5.id nhà_sản_xuất where t3.tên = "Quentin Tarantino" and t4.năm phát_hành < 2010 and t4.năm phát_hành > 2002	imdb
select count ( distinct tên ) from diễn_viên where nơi sinh = "New York City" and năm sinh > 1980 and giới_tính = "female"	imdb
select count ( distinct t1.tên ) from phân_vai as t4 join diễn_viên as t1 on t4.id diễn_viên = t1.id diễn_viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join đạo_diễn bởi as t2 on t5.id bộ phim = t2.id sê-ri phim join đạo_diễn as t3 on t3.id đạo_diễn = t2.id đạo_diễn where t1.quốc_tịch = "Iran" and t3.tên = "Jim Jarmusch"	imdb
select count ( distinct t1.tên ) from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.quốc_tịch = "China" and t3.tiêu_đề = "Rush Hour 3"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân_vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn_viên as t2 on t3.id diễn_viên = t2.id diễn_viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân_vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn_viên as t2 on t3.id diễn_viên = t2.id diễn_viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân_vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn_viên as t2 on t3.id diễn_viên = t2.id diễn_viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t4.tiêu_đề from phân_vai as t5 join diễn_viên as t1 on t5.id diễn_viên = t1.id diễn_viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân_vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn_viên as t2 on t3.id diễn_viên = t2.id diễn_viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t1.tên from phân_vai as t4 join diễn_viên as t1 on t4.id diễn_viên = t1.id diễn_viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join phân_vai as t3 on t5.id bộ phim = t3.id sê-ri phim join diễn_viên as t2 on t3.id diễn_viên = t2.id diễn_viên where t2.tên = "Tom Hanks"	imdb
select t3.tiêu_đề from đạo_diễn as t5 join đạo_diễn bởi as t2 on t5.id đạo_diễn = t2.id đạo_diễn join đạo_diễn bởi as t1 on t5.id đạo_diễn = t1.id đạo_diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t4.tiêu_đề = "Revolutionary Road"	imdb
select t3.tiêu_đề from thể_loại as t2 join phân_loại as t1 on t2.id thể_loại = t1.id thể_loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim group by t3.tiêu_đề order by count ( distinct t2.thể_loại ) desc limit 1	imdb
select t2.tiêu_đề from phân_vai as t3 join diễn_viên as t1 on t3.id diễn_viên = t1.id diễn_viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.quốc_tịch = "China" group by t2.tiêu_đề order by count ( distinct t1.tên ) desc limit 1	imdb
select t1.tên from phân_vai as t4 join diễn_viên as t1 on t4.id diễn_viên = t1.id diễn_viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join đạo_diễn bởi as t2 on t5.id bộ phim = t2.id sê-ri phim join đạo_diễn as t3 on t3.id đạo_diễn = t2.id đạo_diễn where t3.tên = "Quentin Tarantino" order by t5.năm phát_hành desc limit 1	imdb
select t3.ngân_sách , t3.tiêu_đề from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Quentin Tarantino" order by t3.năm phát_hành desc limit 1	imdb
select t3.tiêu_đề from đạo_diễn as t2 join đạo_diễn bởi as t1 on t2.id đạo_diễn = t1.id đạo_diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Jim Jarmusch" order by t3.năm phát_hành desc limit 1	imdb
select t1.tên from đạo_diễn as t3 join đạo_diễn bởi as t2 on t3.id đạo_diễn = t2.id đạo_diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join được làm bởi as t5 on t4.id bộ phim = t5.id sê-ri phim join nhà_sản_xuất as t1 on t1.id nhà_sản_xuất = t5.id nhà_sản_xuất group by t1.tên order by count ( distinct t3.tên ) desc limit 1	imdb
select t1.tên from phân_vai as t2 join diễn_viên as t1 on t2.id diễn_viên = t1.id diễn_viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.tên = "Gabriele Ferzetti" order by t3.năm phát_hành desc limit 1	imdb
select chi_tiết khách_hàng from khách_hàng order by chi_tiết khách_hàng	insurance_and_eClaims
select chi_tiết khách_hàng from khách_hàng order by chi_tiết khách_hàng	insurance_and_eClaims
select mã loại chính_sách from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.chi_tiết khách_hàng = "Dayana Robel"	insurance_and_eClaims
select mã loại chính_sách from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t2.chi_tiết khách_hàng = "Dayana Robel"	insurance_and_eClaims
select mã loại chính_sách from chính_sách group by mã loại chính_sách order by count ( * ) desc limit 1	insurance_and_eClaims
select mã loại chính_sách from chính_sách group by mã loại chính_sách order by count ( * ) desc limit 1	insurance_and_eClaims
select mã loại chính_sách from chính_sách group by mã loại chính_sách having count ( * ) > 2	insurance_and_eClaims
select mã loại chính_sách from chính_sách group by mã loại chính_sách having count ( * ) > 2	insurance_and_eClaims
select sum ( số tiền được trả ) , avg ( số tiền được trả ) from tiêu_đề của yêu_cầu	insurance_and_eClaims
select sum ( số tiền được trả ) , avg ( số tiền được trả ) from tiêu_đề của yêu_cầu	insurance_and_eClaims
select sum ( t1.số tiền được yêu_cầu ) from tiêu_đề của yêu_cầu as t1 join tài_liệu của yêu_cầu as t2 on t1.id tiêu_đề của yêu_cầu = t2.id yêu_cầu where t2.ngày tạo ra = ( select ngày tạo ra from tài_liệu của yêu_cầu order by ngày tạo ra limit 1 )	insurance_and_eClaims
select sum ( t1.số tiền được yêu_cầu ) from tiêu_đề của yêu_cầu as t1 join tài_liệu của yêu_cầu as t2 on t1.id tiêu_đề của yêu_cầu = t2.id yêu_cầu where t2.ngày tạo ra = ( select ngày tạo ra from tài_liệu của yêu_cầu order by ngày tạo ra limit 1 )	insurance_and_eClaims
select t3.chi_tiết khách_hàng from tiêu_đề của yêu_cầu as t1 join chính_sách as t2 on t1.id chính_sách = t2.id chính_sách join khách_hàng as t3 on t2.id khách_hàng = t3.id khách_hàng where t1.số tiền được yêu_cầu = ( select max ( số tiền được yêu_cầu ) from tiêu_đề của yêu_cầu )	insurance_and_eClaims
select t3.chi_tiết khách_hàng from tiêu_đề của yêu_cầu as t1 join chính_sách as t2 on t1.id chính_sách = t2.id chính_sách join khách_hàng as t3 on t2.id khách_hàng = t3.id khách_hàng where t1.số tiền được yêu_cầu = ( select max ( số tiền được yêu_cầu ) from tiêu_đề của yêu_cầu )	insurance_and_eClaims
select t3.chi_tiết khách_hàng from tiêu_đề của yêu_cầu as t1 join chính_sách as t2 on t1.id chính_sách = t2.id chính_sách join khách_hàng as t3 on t2.id khách_hàng = t3.id khách_hàng where t1.số tiền được trả = ( select min ( số tiền được trả ) from tiêu_đề của yêu_cầu )	insurance_and_eClaims
select t3.chi_tiết khách_hàng from tiêu_đề của yêu_cầu as t1 join chính_sách as t2 on t1.id chính_sách = t2.id chính_sách join khách_hàng as t3 on t2.id khách_hàng = t3.id khách_hàng where t1.số tiền được trả = ( select min ( số tiền được trả ) from tiêu_đề của yêu_cầu )	insurance_and_eClaims
select chi_tiết khách_hàng from khách_hàng except select t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng	insurance_and_eClaims
select chi_tiết khách_hàng from khách_hàng except select t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng	insurance_and_eClaims
select count ( * ) from giai_đoạn xử_lý yêu_cầu	insurance_and_eClaims
select count ( * ) from giai_đoạn xử_lý yêu_cầu	insurance_and_eClaims
select t2.tên tình_trạng yêu_cầu from xử_lý yêu_cầu as t1 join giai_đoạn xử_lý yêu_cầu as t2 on t1.id giai_đoạn xử_lý yêu_cầu = t2.id giai_đoạn yêu_cầu group by t1.id giai_đoạn xử_lý yêu_cầu order by count ( * ) desc limit 1	insurance_and_eClaims
select t2.tên tình_trạng yêu_cầu from xử_lý yêu_cầu as t1 join giai_đoạn xử_lý yêu_cầu as t2 on t1.id giai_đoạn xử_lý yêu_cầu = t2.id giai_đoạn yêu_cầu group by t1.id giai_đoạn xử_lý yêu_cầu order by count ( * ) desc limit 1	insurance_and_eClaims
select chi_tiết khách_hàng from khách_hàng where chi_tiết khách_hàng like "%Diana%"	insurance_and_eClaims
select chi_tiết khách_hàng from khách_hàng where chi_tiết khách_hàng like "%Diana%"	insurance_and_eClaims
select distinct t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.mã loại chính_sách = "Deputy"	insurance_and_eClaims
select distinct t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.mã loại chính_sách = "Deputy"	insurance_and_eClaims
select distinct t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.mã loại chính_sách = "Deputy" or t1.mã loại chính_sách = "Uniform"	insurance_and_eClaims
select distinct t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.mã loại chính_sách = "Deputy" or t1.mã loại chính_sách = "Uniform"	insurance_and_eClaims
select chi_tiết khách_hàng from khách_hàng union select chi_tiết nhân_viên from nhân_viên	insurance_and_eClaims
select chi_tiết khách_hàng from khách_hàng union select chi_tiết nhân_viên from nhân_viên	insurance_and_eClaims
select mã loại chính_sách , count ( * ) from chính_sách group by mã loại chính_sách	insurance_and_eClaims
select mã loại chính_sách , count ( * ) from chính_sách group by mã loại chính_sách	insurance_and_eClaims
select t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t2.chi_tiết khách_hàng order by count ( * ) desc limit 1	insurance_and_eClaims
select t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng group by t2.chi_tiết khách_hàng order by count ( * ) desc limit 1	insurance_and_eClaims
select mô_tả về tình_trạng yêu_cầu from giai_đoạn xử_lý yêu_cầu where tên tình_trạng yêu_cầu = "Open"	insurance_and_eClaims
select mô_tả về tình_trạng yêu_cầu from giai_đoạn xử_lý yêu_cầu where tên tình_trạng yêu_cầu = "Open"	insurance_and_eClaims
select count ( distinct mã kết_quả của yêu_cầu ) from xử_lý yêu_cầu	insurance_and_eClaims
select count ( distinct mã kết_quả của yêu_cầu ) from xử_lý yêu_cầu	insurance_and_eClaims
select t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.ngày bắt_đầu = ( select max ( ngày bắt_đầu ) from chính_sách )	insurance_and_eClaims
select t2.chi_tiết khách_hàng from chính_sách as t1 join khách_hàng as t2 on t1.id khách_hàng = t2.id khách_hàng where t1.ngày bắt_đầu = ( select max ( ngày bắt_đầu ) from chính_sách )	insurance_and_eClaims
select t1.chi_tiết sự_kiện from sự_kiện as t1 join dịch_vụ as t2 on t1.id dịch_vụ = t2.id dịch_vụ where t2.mã loại dịch_vụ = "Marriage"	local_govt_in_alabama
select t1.id sự_kiện , t1.chi_tiết sự_kiện from sự_kiện as t1 join người tham_gia sự_kiện as t2 on t1.id sự_kiện = t2.id sự_kiện group by t1.id sự_kiện having count ( * ) > 1	local_govt_in_alabama
select t1.id người tham_gia , t1.mã loại người tham_gia , count ( * ) from người tham_gia as t1 join người tham_gia sự_kiện as t2 on t1.id người tham_gia = t2.id người tham_gia group by t1.id người tham_gia	local_govt_in_alabama
select id người tham_gia , mã loại người tham_gia , chi_tiết người tham_gia from người tham_gia	local_govt_in_alabama
select count ( * ) from người tham_gia where mã loại người tham_gia = "Organizer"	local_govt_in_alabama
select mã loại dịch_vụ from dịch_vụ order by mã loại dịch_vụ	local_govt_in_alabama
select id dịch_vụ , chi_tiết sự_kiện from sự_kiện	local_govt_in_alabama
select count ( * ) from người tham_gia as t1 join người tham_gia sự_kiện as t2 on t1.id người tham_gia = t2.id người tham_gia where t1.chi_tiết người tham_gia like "%Dr.%"	local_govt_in_alabama
select mã loại người tham_gia from người tham_gia group by mã loại người tham_gia order by count ( * ) desc limit 1	local_govt_in_alabama
select t3.id dịch_vụ , t4.mã loại dịch_vụ from người tham_gia as t1 join người tham_gia sự_kiện as t2 on t1.id người tham_gia = t2.id người tham_gia join sự_kiện as t3 on t2.id sự_kiện = t3.id sự_kiện join dịch_vụ as t4 on t3.id dịch_vụ = t4.id dịch_vụ group by t3.id dịch_vụ order by count ( * ) asc limit 1	local_govt_in_alabama
select id sự_kiện from người tham_gia sự_kiện group by id sự_kiện order by count ( * ) desc limit 1	local_govt_in_alabama
select id sự_kiện from sự_kiện except select t1.id sự_kiện from người tham_gia sự_kiện as t1 join người tham_gia as t2 on t1.id người tham_gia = t2.id người tham_gia where chi_tiết người tham_gia = "Kenyatta Kuhn"	local_govt_in_alabama
select t1.mã loại dịch_vụ from dịch_vụ as t1 join sự_kiện as t2 on t1.id dịch_vụ = t2.id dịch_vụ where t2.chi_tiết sự_kiện = "Success" intersect select t1.mã loại dịch_vụ from dịch_vụ as t1 join sự_kiện as t2 on t1.id dịch_vụ = t2.id dịch_vụ where t2.chi_tiết sự_kiện = "Fail"	local_govt_in_alabama
select count ( * ) from sự_kiện where id sự_kiện not in ( select id sự_kiện from người tham_gia sự_kiện )	local_govt_in_alabama
select count ( distinct id người tham_gia ) from người tham_gia sự_kiện	local_govt_in_alabama
select count ( * ) from kỹ_thuật_viên	machine_repair
select count ( * ) from kỹ_thuật_viên	machine_repair
select tên from kỹ_thuật_viên order by tuổi asc	machine_repair
select tên from kỹ_thuật_viên order by tuổi asc	machine_repair
select đội , năm bắt_đầu from kỹ_thuật_viên	machine_repair
select đội , năm bắt_đầu from kỹ_thuật_viên	machine_repair
select tên from kỹ_thuật_viên where đội != "NYY"	machine_repair
select tên from kỹ_thuật_viên where đội != "NYY"	machine_repair
select tên from kỹ_thuật_viên where tuổi = 36 or tuổi = 37	machine_repair
select tên from kỹ_thuật_viên where tuổi = 36 or tuổi = 37	machine_repair
select năm bắt_đầu from kỹ_thuật_viên order by tuổi desc limit 1	machine_repair
select năm bắt_đầu from kỹ_thuật_viên order by tuổi desc limit 1	machine_repair
select đội , count ( * ) from kỹ_thuật_viên group by đội	machine_repair
select đội , count ( * ) from kỹ_thuật_viên group by đội	machine_repair
select đội from kỹ_thuật_viên group by đội order by count ( * ) desc limit 1	machine_repair
select đội from kỹ_thuật_viên group by đội order by count ( * ) desc limit 1	machine_repair
select đội from kỹ_thuật_viên group by đội having count ( * ) >= 2	machine_repair
select đội from kỹ_thuật_viên group by đội having count ( * ) >= 2	machine_repair
select t3.tên , t2.loạt máy from phân_công sửa_chữa as t1 join máy_móc as t2 on t1.id máy = t2.id máy join kỹ_thuật_viên as t3 on t1.id kỹ_thuật_viên = t3.id kỹ_thuật_viên	machine_repair
select t3.tên , t2.loạt máy from phân_công sửa_chữa as t1 join máy_móc as t2 on t1.id máy = t2.id máy join kỹ_thuật_viên as t3 on t1.id kỹ_thuật_viên = t3.id kỹ_thuật_viên	machine_repair
select t3.tên from phân_công sửa_chữa as t1 join máy_móc as t2 on t1.id máy = t2.id máy join kỹ_thuật_viên as t3 on t1.id kỹ_thuật_viên = t3.id kỹ_thuật_viên order by t2.xếp_hạng chất_lượng	machine_repair
select t3.tên from phân_công sửa_chữa as t1 join máy_móc as t2 on t1.id máy = t2.id máy join kỹ_thuật_viên as t3 on t1.id kỹ_thuật_viên = t3.id kỹ_thuật_viên order by t2.xếp_hạng chất_lượng	machine_repair
select t3.tên from phân_công sửa_chữa as t1 join máy_móc as t2 on t1.id máy = t2.id máy join kỹ_thuật_viên as t3 on t1.id kỹ_thuật_viên = t3.id kỹ_thuật_viên where t2.điểm giá_trị > 70	machine_repair
select t3.tên from phân_công sửa_chữa as t1 join máy_móc as t2 on t1.id máy = t2.id máy join kỹ_thuật_viên as t3 on t1.id kỹ_thuật_viên = t3.id kỹ_thuật_viên where t2.điểm giá_trị > 70	machine_repair
select t2.tên , count ( * ) from phân_công sửa_chữa as t1 join kỹ_thuật_viên as t2 on t1.id kỹ_thuật_viên = t2.id kỹ_thuật_viên group by t2.tên	machine_repair
select t2.tên , count ( * ) from phân_công sửa_chữa as t1 join kỹ_thuật_viên as t2 on t1.id kỹ_thuật_viên = t2.id kỹ_thuật_viên group by t2.tên	machine_repair
select tên from kỹ_thuật_viên where id kỹ_thuật_viên not in ( select id kỹ_thuật_viên from phân_công sửa_chữa )	machine_repair
select tên from kỹ_thuật_viên where id kỹ_thuật_viên not in ( select id kỹ_thuật_viên from phân_công sửa_chữa )	machine_repair
select năm bắt_đầu from kỹ_thuật_viên where đội = "CLE" intersect select năm bắt_đầu from kỹ_thuật_viên where đội = "CWS"	machine_repair
select năm bắt_đầu from kỹ_thuật_viên where đội = "CLE" intersect select năm bắt_đầu from kỹ_thuật_viên where đội = "CWS"	machine_repair
select count ( * ) from ống_kính máy_ảnh where độ dài tiêu_cự theo mm > 15	mountain_photos
select nhãn_hiệu , tên from ống_kính máy_ảnh order by khẩu_độ tối_đa desc	mountain_photos
select id , màu_sắc , tên from ảnh	mountain_photos
select max ( chiều cao ) , avg ( chiều cao ) from núi	mountain_photos
select avg ( độ nổi ) from núi where quốc_gia = "Morocco"	mountain_photos
select tên , chiều cao , độ nổi from núi where dãy núi != "Aberdare Range"	mountain_photos
select t1.id , t1.tên from núi as t1 join ảnh as t2 on t1.id = t2.id núi where t1.chiều cao > 4000	mountain_photos
select t1.id , t1.tên from núi as t1 join ảnh as t2 on t1.id = t2.id núi group by t1.id having count ( * ) >= 2	mountain_photos
select t2.tên from ảnh as t1 join ống_kính máy_ảnh as t2 on t1.id ống_kính máy_ảnh = t2.id group by t2.id order by count ( * ) desc limit 1	mountain_photos
select t1.tên from ống_kính máy_ảnh as t1 join ảnh as t2 on t2.id ống_kính máy_ảnh = t1.id where t1.nhãn_hiệu = "Sigma" or t1.nhãn_hiệu = "Olympus"	mountain_photos
select count ( distinct nhãn_hiệu ) from ống_kính máy_ảnh	mountain_photos
select count ( * ) from ống_kính máy_ảnh where id not in ( select id ống_kính máy_ảnh from ảnh )	mountain_photos
select count ( distinct t2.id ống_kính máy_ảnh ) from núi as t1 join ảnh as t2 on t1.id = t2.id núi where t1.quốc_gia = "Ethiopia"	mountain_photos
select t3.nhãn_hiệu from núi as t1 join ảnh as t2 on t1.id = t2.id núi join ống_kính máy_ảnh as t3 on t2.id ống_kính máy_ảnh = t3.id where t1.dãy núi = "Toubkal Atlas" intersect select t3.nhãn_hiệu from núi as t1 join ảnh as t2 on t1.id = t2.id núi join ống_kính máy_ảnh as t3 on t2.id ống_kính máy_ảnh = t3.id where t1.dãy núi = "Lasta Massif"	mountain_photos
select tên , độ nổi from núi except select t1.tên , t1.độ nổi from núi as t1 join ảnh as t2 on t1.id = t2.id núi join ống_kính máy_ảnh as t3 on t2.id ống_kính máy_ảnh = t3.id where t3.nhãn_hiệu = "Sigma"	mountain_photos
select tên from ống_kính máy_ảnh where tên like "%Digital%"	mountain_photos
select t1.tên , count ( * ) from ống_kính máy_ảnh as t1 join ảnh as t2 on t1.id = t2.id ống_kính máy_ảnh group by t1.id order by count ( * )	mountain_photos
select count ( * ) from ban nhạc	music_2
select count ( * ) from ban nhạc	music_2
select distinct hãng thu âm from album	music_2
select distinct hãng thu âm from album	music_2
select * from album where năm = 2012	music_2
select * from album where năm = 2012	music_2
select distinct t1.vị_trí trên sân_khấu from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where tên = "Solveig"	music_2
select distinct t1.vị_trí trên sân_khấu from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where tên = "Solveig"	music_2
select count ( * ) from bài hát	music_2
select count ( * ) from bài hát	music_2
select t3.tiêu_đề from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.họ = "Heilo"	music_2
select t3.tiêu_đề from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.họ = "Heilo"	music_2
select count ( * ) from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Flash"	music_2
select count ( * ) from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Flash"	music_2
select t3.tiêu_đề from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.tên = "Marianne"	music_2
select t3.tiêu_đề from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.tên = "Marianne"	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Badlands"	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Badlands"	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Badlands" and t1.vị_trí trên sân_khấu = "back"	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Badlands" and t1.vị_trí trên sân_khấu = "back"	music_2
select count ( distinct hãng thu âm ) from album	music_2
select count ( distinct hãng thu âm ) from album	music_2
select hãng thu âm from album group by hãng thu âm order by count ( * ) desc limit 1	music_2
select hãng thu âm from album group by hãng thu âm order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where vị_trí trên sân_khấu = "back" group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where vị_trí trên sân_khấu = "back" group by họ order by count ( * ) desc limit 1	music_2
select tiêu_đề from bài hát where tiêu_đề like "% the %"	music_2
select tiêu_đề from bài hát where tiêu_đề like "% the %"	music_2
select distinct nhạc_cụ from nhạc_cụ	music_2
select distinct nhạc_cụ from nhạc_cụ	music_2
select t4.nhạc_cụ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc_cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu_đề = "Le Pop"	music_2
select t4.nhạc_cụ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc_cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu_đề = "Le Pop"	music_2
select nhạc_cụ from nhạc_cụ group by nhạc_cụ order by count ( * ) desc limit 1	music_2
select nhạc_cụ from nhạc_cụ group by nhạc_cụ order by count ( * ) desc limit 1	music_2
select count ( * ) from nhạc_cụ where nhạc_cụ = "drums"	music_2
select count ( * ) from nhạc_cụ where nhạc_cụ = "drums"	music_2
select nhạc_cụ from nhạc_cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select nhạc_cụ from nhạc_cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select count ( distinct nhạc_cụ ) from nhạc_cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select count ( distinct nhạc_cụ ) from nhạc_cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select count ( distinct nhạc_cụ ) from nhạc_cụ as t1 join ban nhạc as t2 on t1.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select count ( distinct nhạc_cụ ) from nhạc_cụ as t1 join ban nhạc as t2 on t1.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select nhạc_cụ from nhạc_cụ as t1 join ban nhạc as t2 on t1.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select nhạc_cụ from nhạc_cụ as t1 join ban nhạc as t2 on t1.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát group by t1.id bài hát order by count ( * ) desc limit 1	music_2
select tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát group by t1.id bài hát order by count ( * ) desc limit 1	music_2
select loại from giọng hát group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where họ = "Heilo" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where họ = "Heilo" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Demon Kitty Rag"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Demon Kitty Rag"	music_2
select count ( distinct tiêu_đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select count ( distinct tiêu_đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ_sĩ trong ban nhạc = t3.id where t3.tên = "Solveig" and t2.tiêu_đề = "A Bar In Amsterdam"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ_sĩ trong ban nhạc = t3.id where t3.tên = "Solveig" and t2.tiêu_đề = "A Bar In Amsterdam"	music_2
select distinct tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select distinct tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select distinct loại from giọng hát	music_2
select distinct loại from giọng hát	music_2
select * from album where năm = 2010	music_2
select * from album where năm = 2010	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Le Pop"	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Le Pop"	music_2
select t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t4.nhạc_cụ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc_cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu_đề = "Badlands"	music_2
select t4.nhạc_cụ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc_cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ_sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu_đề = "Badlands"	music_2
select count ( distinct nhạc_cụ ) from nhạc_cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Badlands"	music_2
select count ( distinct nhạc_cụ ) from nhạc_cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Badlands"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Badlands"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Badlands"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu_đề = "Le Pop"	music_2
select count ( distinct tiêu_đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "shared"	music_2
select count ( distinct tiêu_đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "shared"	music_2
select distinct tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select distinct tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where tên = "Solveig" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where tên = "Solveig" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ_sĩ trong ban nhạc = t3.id where t3.họ = "Heilo" and t2.tiêu_đề = "Der Kapitan"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ_sĩ trong ban nhạc = t3.id where t3.họ = "Heilo" and t2.tiêu_đề = "Der Kapitan"	music_2
select t2.tên from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by tên order by count ( * ) desc limit 1	music_2
select t2.tên from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by tên order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where tên = "Marianne" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id where tên = "Marianne" group by loại order by count ( * ) desc limit 1	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Der Kapitan" and t1.vị_trí trên sân_khấu = "back"	music_2
select t2.tên , t2.họ from buổi biểu_diễn as t1 join ban nhạc as t2 on t1.nghệ_sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu_đề = "Der Kapitan" and t1.vị_trí trên sân_khấu = "back"	music_2
select distinct tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select distinct tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu_đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select t3.tiêu_đề from album as t1 join danh_sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.tiêu_đề = "A Kiss Before You Go: Live in Hamburg"	music_2
select t3.tiêu_đề from album as t1 join danh_sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.tiêu_đề = "A Kiss Before You Go: Live in Hamburg"	music_2
select t3.tiêu_đề from album as t1 join danh_sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.hãng thu âm = "Universal Music Group"	music_2
select t3.tiêu_đề from album as t1 join danh_sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.hãng thu âm = "Universal Music Group"	music_2
select count ( distinct t3.tiêu_đề ) from album as t1 join danh_sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.loại = "Studio"	music_2
select count ( distinct t3.tiêu_đề ) from album as t1 join danh_sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.loại = "Studio"	music_2
select t1.khách_hàng tốt hay xấu from khách_hàng as t1 join phiếu giảm_giá as t2 on t1.id phiếu giảm_giá = t2.id phiếu giảm_giá where t2.số tiền giảm_giá = 500	products_for_hire
select t1.id khách_hàng , t1.tên , count ( * ) from khách_hàng as t1 join lượt đặt mua as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng	products_for_hire
select id khách_hàng , sum ( số tiền đã trả ) from thanh_toán group by id khách_hàng order by sum ( số tiền đã trả ) desc limit 1	products_for_hire
select t1.id đặt mua , t1.số tiền hoàn_trả from lượt đặt mua as t1 join thanh_toán as t2 on t1.id đặt mua = t2.id đặt mua group by t1.id đặt mua order by count ( * ) desc limit 1	products_for_hire
select id sản_phẩm from sản_phẩm được đặt group by id sản_phẩm having count ( * ) = 3	products_for_hire
select t2.mô_tả sản_phẩm from sản_phẩm được đặt as t1 join sản_phẩm cho thuê as t2 on t1.id sản_phẩm = t2.id sản_phẩm where t1.số tiền đã đặt = 102.76	products_for_hire
select t3.ngày bắt_đầu đặt mua , t3.ngày kết_thúc đặt mua from sản_phẩm cho thuê as t1 join sản_phẩm được đặt as t2 on t1.id sản_phẩm = t2.id sản_phẩm join lượt đặt mua as t3 on t2.id đặt mua = t3.id đặt mua where t1.tên sản_phẩm = "Book collection A"	products_for_hire
select t2.tên sản_phẩm from sản_phẩm có sẵn as t1 join sản_phẩm cho thuê as t2 on t1.id sản_phẩm = t2.id sản_phẩm where t1.có sẵn hay không = 1	products_for_hire
select count ( distinct mã loại sản_phẩm ) from sản_phẩm cho thuê	products_for_hire
select tên , họ , giới_tính from khách_hàng where khách_hàng tốt hay xấu = "good" order by họ	products_for_hire
select avg ( số tiền nợ ) from thanh_toán	products_for_hire
select max ( số_lượng đặt mua ) , min ( số_lượng đặt mua ) , avg ( số_lượng đặt mua ) from sản_phẩm được đặt	products_for_hire
select distinct mã loại thanh_toán from thanh_toán	products_for_hire
select chi_phí thuê hàng ngày from sản_phẩm cho thuê where tên sản_phẩm like "%Book%"	products_for_hire
select count ( * ) from sản_phẩm cho thuê where id sản_phẩm not in ( select id sản_phẩm from sản_phẩm được đặt where số tiền đã đặt > 200 )	products_for_hire
select t1.số tiền giảm_giá from phiếu giảm_giá as t1 join khách_hàng as t2 on t1.id phiếu giảm_giá = t2.id phiếu giảm_giá where t2.khách_hàng tốt hay xấu = "good" intersect select t1.số tiền giảm_giá from phiếu giảm_giá as t1 join khách_hàng as t2 on t1.id phiếu giảm_giá = t2.id phiếu giảm_giá where t2.khách_hàng tốt hay xấu = "bad"	products_for_hire
select ngày thanh_toán from thanh_toán where số tiền đã trả > 300 or mã loại thanh_toán = "Check"	products_for_hire
select tên sản_phẩm , mô_tả sản_phẩm from sản_phẩm cho thuê where mã loại sản_phẩm = "Cutlery" and chi_phí thuê hàng ngày < 20	products_for_hire
select tên nhà_hàng from nhà_hàng	restaurant_1
select địa_chỉ from nhà_hàng where tên nhà_hàng = "Subway"	restaurant_1
select đánh_giá xếp_hạng from nhà_hàng where tên nhà_hàng = "Subway"	restaurant_1
select tên loại nhà_hàng from loại nhà_hàng	restaurant_1
select mô_tả về loại nhà_hàng from loại nhà_hàng where tên loại nhà_hàng = "Sandwich"	restaurant_1
select tên nhà_hàng , đánh_giá xếp_hạng from nhà_hàng order by đánh_giá xếp_hạng desc limit 1	restaurant_1
select tuổi from sinh_viên where tên = "Linda" and họ = "Smith"	restaurant_1
select giới_tính from sinh_viên where tên = "Linda" and họ = "Smith"	restaurant_1
select tên , họ from sinh_viên where chuyên_ngành = 600	restaurant_1
select mã thành_phố from sinh_viên where tên = "Linda" and họ = "Smith"	restaurant_1
select count ( * ) from sinh_viên where cố_vấn = 1121	restaurant_1
select cố_vấn , count ( * ) from sinh_viên group by cố_vấn order by count ( cố_vấn ) desc limit 1	restaurant_1
select chuyên_ngành , count ( * ) from sinh_viên group by chuyên_ngành order by count ( chuyên_ngành ) asc limit 1	restaurant_1
select chuyên_ngành , count ( * ) from sinh_viên group by chuyên_ngành having count ( chuyên_ngành ) between 2 and 30	restaurant_1
select tên , họ from sinh_viên where tuổi > 18 and chuyên_ngành = 600	restaurant_1
select tên , họ from sinh_viên where tuổi > 18 and chuyên_ngành != 600 and giới_tính = "F"	restaurant_1
select count ( * ) from nhà_hàng join loại của nhà_hàng on nhà_hàng.id nhà_hàng = loại của nhà_hàng.id nhà_hàng join loại nhà_hàng on loại của nhà_hàng.id loại nhà_hàng = loại nhà_hàng.id loại nhà_hàng group by loại của nhà_hàng.id loại nhà_hàng having loại nhà_hàng.tên loại nhà_hàng = "Sandwich"	restaurant_1
select sum ( thời_gian dành ra ) from sinh_viên join lượt ghé thăm nhà_hàng on sinh_viên.id sinh_viên = lượt ghé thăm nhà_hàng.id sinh_viên where sinh_viên.tên = "Linda" and sinh_viên.họ = "Smith"	restaurant_1
select count ( * ) from sinh_viên join lượt ghé thăm nhà_hàng on sinh_viên.id sinh_viên = lượt ghé thăm nhà_hàng.id sinh_viên join nhà_hàng on lượt ghé thăm nhà_hàng.id nhà_hàng = nhà_hàng.id nhà_hàng where sinh_viên.tên = "Linda" and sinh_viên.họ = "Smith" and nhà_hàng.tên nhà_hàng = "Subway"	restaurant_1
select thời_gian from sinh_viên join lượt ghé thăm nhà_hàng on sinh_viên.id sinh_viên = lượt ghé thăm nhà_hàng.id sinh_viên join nhà_hàng on lượt ghé thăm nhà_hàng.id nhà_hàng = nhà_hàng.id nhà_hàng where sinh_viên.tên = "Linda" and sinh_viên.họ = "Smith" and nhà_hàng.tên nhà_hàng = "Subway"	restaurant_1
select nhà_hàng.tên nhà_hàng , sum ( lượt ghé thăm nhà_hàng.thời_gian dành ra ) from lượt ghé thăm nhà_hàng join nhà_hàng on lượt ghé thăm nhà_hàng.id nhà_hàng = nhà_hàng.id nhà_hàng group by nhà_hàng.id nhà_hàng order by sum ( lượt ghé thăm nhà_hàng.thời_gian dành ra ) asc limit 1	restaurant_1
select sinh_viên.tên , sinh_viên.họ from sinh_viên join lượt ghé thăm nhà_hàng on sinh_viên.id sinh_viên = lượt ghé thăm nhà_hàng.id sinh_viên group by sinh_viên.id sinh_viên order by count ( * ) desc limit 1	restaurant_1
select count ( distinct họ ) from diễn_viên	sakila_1
select count ( distinct họ ) from diễn_viên	sakila_1
select tên from diễn_viên group by tên order by count ( * ) desc limit 1	sakila_1
select tên from diễn_viên group by tên order by count ( * ) desc limit 1	sakila_1
select tên , họ from diễn_viên group by tên , họ order by count ( * ) desc limit 1	sakila_1
select tên , họ from diễn_viên group by tên , họ order by count ( * ) desc limit 1	sakila_1
select quận from địa_chỉ group by quận having count ( * ) >= 2	sakila_1
select quận from địa_chỉ group by quận having count ( * ) >= 2	sakila_1
select số điện_thoại , mã bưu_điện from địa_chỉ where địa_chỉ = "1031 Daugavpils Parkway"	sakila_1
select số điện_thoại , mã bưu_điện from địa_chỉ where địa_chỉ = "1031 Daugavpils Parkway"	sakila_1
select t2.thành_phố , count ( * ) , t1.id thành_phố from địa_chỉ as t1 join thành_phố as t2 on t1.id thành_phố = t2.id thành_phố group by t1.id thành_phố order by count ( * ) desc limit 1	sakila_1
select t2.thành_phố , count ( * ) , t1.id thành_phố from địa_chỉ as t1 join thành_phố as t2 on t1.id thành_phố = t2.id thành_phố group by t1.id thành_phố order by count ( * ) desc limit 1	sakila_1
select count ( * ) from địa_chỉ where quận = "California"	sakila_1
select count ( * ) from địa_chỉ where quận = "California"	sakila_1
select tiêu_đề , id phim from phim where giá cho thuê = 0.99 intersect select t1.tiêu_đề , t1.id phim from phim as t1 join hàng tồn_kho as t2 on t1.id phim = t2.id phim group by t1.id phim having count ( * ) < 3	sakila_1
select tiêu_đề , id phim from phim where giá cho thuê = 0.99 intersect select t1.tiêu_đề , t1.id phim from phim as t1 join hàng tồn_kho as t2 on t1.id phim = t2.id phim group by t1.id phim having count ( * ) < 3	sakila_1
select count ( * ) from thành_phố as t1 join quốc_gia as t2 on t1.id quốc_gia = t2.id quốc_gia where t2.quốc_gia = "Australia"	sakila_1
select count ( * ) from thành_phố as t1 join quốc_gia as t2 on t1.id quốc_gia = t2.id quốc_gia where t2.quốc_gia = "Australia"	sakila_1
select t2.quốc_gia from thành_phố as t1 join quốc_gia as t2 on t1.id quốc_gia = t2.id quốc_gia group by t2.id quốc_gia having count ( * ) >= 3	sakila_1
select t2.quốc_gia from thành_phố as t1 join quốc_gia as t2 on t1.id quốc_gia = t2.id quốc_gia group by t2.id quốc_gia having count ( * ) >= 3	sakila_1
select ngày thanh_toán from khoản thanh_toán where số tiền > 10 union select t1.ngày thanh_toán from khoản thanh_toán as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Elsa"	sakila_1
select ngày thanh_toán from khoản thanh_toán where số tiền > 10 union select t1.ngày thanh_toán from khoản thanh_toán as t1 join nhân_viên as t2 on t1.id nhân_viên = t2.id nhân_viên where t2.tên = "Elsa"	sakila_1
select count ( * ) from khách_hàng where có hoạt_động không = "1"	sakila_1
select count ( * ) from khách_hàng where có hoạt_động không = "1"	sakila_1
select tiêu_đề , giá cho thuê from phim order by giá cho thuê desc limit 1	sakila_1
select tiêu_đề , giá cho thuê from phim order by giá cho thuê desc limit 1	sakila_1
select t2.tiêu_đề , t2.id phim , t2.mô_tả from diễn_viên điện_ảnh as t1 join phim as t2 on t1.id phim = t2.id phim group by t2.id phim order by count ( * ) desc limit 1	sakila_1
select t2.tiêu_đề , t2.id phim , t2.mô_tả from diễn_viên điện_ảnh as t1 join phim as t2 on t1.id phim = t2.id phim group by t2.id phim order by count ( * ) desc limit 1	sakila_1
select t2.tên , t2.họ , t2.id diễn_viên from diễn_viên điện_ảnh as t1 join diễn_viên as t2 on t1.id diễn_viên = t2.id diễn_viên group by t2.id diễn_viên order by count ( * ) desc limit 1	sakila_1
select t2.tên , t2.họ , t2.id diễn_viên from diễn_viên điện_ảnh as t1 join diễn_viên as t2 on t1.id diễn_viên = t2.id diễn_viên group by t2.id diễn_viên order by count ( * ) desc limit 1	sakila_1
select t2.tên , t2.họ from diễn_viên điện_ảnh as t1 join diễn_viên as t2 on t1.id diễn_viên = t2.id diễn_viên group by t2.id diễn_viên having count ( * ) > 30	sakila_1
select t2.tên , t2.họ from diễn_viên điện_ảnh as t1 join diễn_viên as t2 on t1.id diễn_viên = t2.id diễn_viên group by t2.id diễn_viên having count ( * ) > 30	sakila_1
select id cửa_hàng from hàng tồn_kho group by id cửa_hàng order by count ( * ) desc limit 1	sakila_1
select id cửa_hàng from hàng tồn_kho group by id cửa_hàng order by count ( * ) desc limit 1	sakila_1
select sum ( số tiền ) from khoản thanh_toán	sakila_1
select sum ( số tiền ) from khoản thanh_toán	sakila_1
select t1.tên , t1.họ , t1.id khách_hàng from khách_hàng as t1 join khoản thanh_toán as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng order by sum ( số tiền ) asc limit 1	sakila_1
select t1.tên , t1.họ , t1.id khách_hàng from khách_hàng as t1 join khoản thanh_toán as t2 on t1.id khách_hàng = t2.id khách_hàng group by t1.id khách_hàng order by sum ( số tiền ) asc limit 1	sakila_1
select t1.tên from danh_mục as t1 join danh_mục phim as t2 on t1.id danh_mục = t2.id danh_mục join phim as t3 on t2.id phim = t3.id phim where t3.tiêu_đề = "HUNGER ROOF"	sakila_1
select t1.tên from danh_mục as t1 join danh_mục phim as t2 on t1.id danh_mục = t2.id danh_mục join phim as t3 on t2.id phim = t3.id phim where t3.tiêu_đề = "HUNGER ROOF"	sakila_1
select t2.tên , t1.id danh_mục , count ( * ) from danh_mục phim as t1 join danh_mục as t2 on t1.id danh_mục = t2.id danh_mục group by t1.id danh_mục	sakila_1
select t2.tên , t1.id danh_mục , count ( * ) from danh_mục phim as t1 join danh_mục as t2 on t1.id danh_mục = t2.id danh_mục group by t1.id danh_mục	sakila_1
select t1.tiêu_đề , t1.id phim from phim as t1 join hàng tồn_kho as t2 on t1.id phim = t2.id phim group by t1.id phim order by count ( * ) desc limit 1	sakila_1
select t1.tiêu_đề , t1.id phim from phim as t1 join hàng tồn_kho as t2 on t1.id phim = t2.id phim group by t1.id phim order by count ( * ) desc limit 1	sakila_1
select t1.tiêu_đề , t2.id hàng tồn_kho from phim as t1 join hàng tồn_kho as t2 on t1.id phim = t2.id phim join lượt cho thuê as t3 on t2.id hàng tồn_kho = t3.id hàng tồn_kho group by t2.id hàng tồn_kho order by count ( * ) desc limit 1	sakila_1
select t1.tiêu_đề , t2.id hàng tồn_kho from phim as t1 join hàng tồn_kho as t2 on t1.id phim = t2.id phim join lượt cho thuê as t3 on t2.id hàng tồn_kho = t3.id hàng tồn_kho group by t2.id hàng tồn_kho order by count ( * ) desc limit 1	sakila_1
select count ( distinct id ngôn_ngữ ) from phim	sakila_1
select count ( distinct id ngôn_ngữ ) from phim	sakila_1
select tiêu_đề from phim where đánh_giá xếp_hạng = "R"	sakila_1
select tiêu_đề from phim where đánh_giá xếp_hạng = "R"	sakila_1
select t2.địa_chỉ from cửa_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ = t2.id địa_chỉ where id cửa_hàng = 1	sakila_1
select t2.địa_chỉ from cửa_hàng as t1 join địa_chỉ as t2 on t1.id địa_chỉ = t2.id địa_chỉ where id cửa_hàng = 1	sakila_1
select t1.tên , t1.họ , t1.id nhân_viên from nhân_viên as t1 join khoản thanh_toán as t2 on t1.id nhân_viên = t2.id nhân_viên group by t1.id nhân_viên order by count ( * ) asc limit 1	sakila_1
select t1.tên , t1.họ , t1.id nhân_viên from nhân_viên as t1 join khoản thanh_toán as t2 on t1.id nhân_viên = t2.id nhân_viên group by t1.id nhân_viên order by count ( * ) asc limit 1	sakila_1
select t2.tên from phim as t1 join ngôn_ngữ as t2 on t1.id ngôn_ngữ = t2.id ngôn_ngữ where t1.tiêu_đề = "AIRPORT POLLOCK"	sakila_1
select t2.tên from phim as t1 join ngôn_ngữ as t2 on t1.id ngôn_ngữ = t2.id ngôn_ngữ where t1.tiêu_đề = "AIRPORT POLLOCK"	sakila_1
select count ( * ) from cửa_hàng	sakila_1
select count ( * ) from cửa_hàng	sakila_1
select count ( distinct đánh_giá xếp_hạng ) from phim	sakila_1
select count ( distinct đánh_giá xếp_hạng ) from phim	sakila_1
select tiêu_đề from phim where tính_năng đặc_biệt like "%Deleted Scenes%"	sakila_1
select tiêu_đề from phim where tính_năng đặc_biệt like "%Deleted Scenes%"	sakila_1
select count ( * ) from hàng tồn_kho where id cửa_hàng = 1	sakila_1
select count ( * ) from hàng tồn_kho where id cửa_hàng = 1	sakila_1
select ngày thanh_toán from khoản thanh_toán order by ngày thanh_toán asc limit 1	sakila_1
select ngày thanh_toán from khoản thanh_toán order by ngày thanh_toán asc limit 1	sakila_1
select t2.địa_chỉ , t1.email from khách_hàng as t1 join địa_chỉ as t2 on t2.id địa_chỉ = t1.id địa_chỉ where t1.tên = "LINDA"	sakila_1
select t2.địa_chỉ , t1.email from khách_hàng as t1 join địa_chỉ as t2 on t2.id địa_chỉ = t1.id địa_chỉ where t1.tên = "LINDA"	sakila_1
select tiêu_đề from phim where thời_lượng phim > 100 or đánh_giá xếp_hạng = "PG" except select tiêu_đề from phim where giá thay_thế > 200	sakila_1
select tiêu_đề from phim where thời_lượng phim > 100 or đánh_giá xếp_hạng = "PG" except select tiêu_đề from phim where giá thay_thế > 200	sakila_1
select t1.tên , t1.họ from khách_hàng as t1 join lượt cho thuê as t2 on t1.id khách_hàng = t2.id khách_hàng order by t2.ngày cho thuê asc limit 1	sakila_1
select t1.tên , t1.họ from khách_hàng as t1 join lượt cho thuê as t2 on t1.id khách_hàng = t2.id khách_hàng order by t2.ngày cho thuê asc limit 1	sakila_1
select distinct t1.tên , t1.họ from nhân_viên as t1 join lượt cho thuê as t2 on t1.id nhân_viên = t2.id nhân_viên join khách_hàng as t3 on t2.id khách_hàng = t3.id khách_hàng where t3.tên = "APRIL" and t3.họ = "BURNS"	sakila_1
select distinct t1.tên , t1.họ from nhân_viên as t1 join lượt cho thuê as t2 on t1.id nhân_viên = t2.id nhân_viên join khách_hàng as t3 on t2.id khách_hàng = t3.id khách_hàng where t3.tên = "APRIL" and t3.họ = "BURNS"	sakila_1
select id cửa_hàng from khách_hàng group by id cửa_hàng order by count ( * ) desc limit 1	sakila_1
select id cửa_hàng from khách_hàng group by id cửa_hàng order by count ( * ) desc limit 1	sakila_1
select số tiền from khoản thanh_toán order by số tiền desc limit 1	sakila_1
select số tiền from khoản thanh_toán order by số tiền desc limit 1	sakila_1
select t2.địa_chỉ from nhân_viên as t1 join địa_chỉ as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t1.tên = "Elsa"	sakila_1
select t2.địa_chỉ from nhân_viên as t1 join địa_chỉ as t2 on t1.id địa_chỉ = t2.id địa_chỉ where t1.tên = "Elsa"	sakila_1
select tên from khách_hàng where id khách_hàng not in ( select id khách_hàng from lượt cho thuê where ngày cho thuê > "2005-08-23 02:06:01" )	sakila_1
select tên from khách_hàng where id khách_hàng not in ( select id khách_hàng from lượt cho thuê where ngày cho thuê > "2005-08-23 02:06:01" )	sakila_1
select count ( * ) from tài_xế	school_bus
select tên , thành_phố quê_hương , tuổi from tài_xế	school_bus
select đảng , count ( * ) from tài_xế group by đảng	school_bus
select tên from tài_xế order by tuổi desc	school_bus
select distinct thành_phố quê_hương from tài_xế	school_bus
select thành_phố quê_hương from tài_xế group by thành_phố quê_hương order by count ( * ) desc limit 1	school_bus
select đảng from tài_xế where thành_phố quê_hương = "Hartford" and tuổi > 40	school_bus
select thành_phố quê_hương from tài_xế where tuổi > 40 group by thành_phố quê_hương having count ( * ) >= 2	school_bus
select thành_phố quê_hương from tài_xế except select thành_phố quê_hương from tài_xế where tuổi > 40	school_bus
select tên from tài_xế where id tài_xế not in ( select id tài_xế from xe_buýt của trường_học )	school_bus
select loại_hình from trường_học group by loại_hình having count ( * ) = 2	school_bus
select t2.trường_học , t3.tên from xe_buýt của trường_học as t1 join trường_học as t2 on t1.id trường_học = t2.id trường_học join tài_xế as t3 on t1.id tài_xế = t3.id tài_xế	school_bus
select max ( số năm làm_việc ) , min ( số năm làm_việc ) , avg ( số năm làm_việc ) from xe_buýt của trường_học	school_bus
select trường_học , loại_hình from trường_học where id trường_học not in ( select id trường_học from xe_buýt của trường_học )	school_bus
select t2.loại_hình , count ( * ) from xe_buýt của trường_học as t1 join trường_học as t2 on t1.id trường_học = t2.id trường_học group by t2.loại_hình	school_bus
select count ( * ) from tài_xế where thành_phố quê_hương = "Hartford" or tuổi < 40	school_bus
select tên from tài_xế where thành_phố quê_hương = "Hartford" and tuổi < 40	school_bus
select t1.tên from tài_xế as t1 join xe_buýt của trường_học as t2 on t1.id tài_xế = t2.id tài_xế order by số năm làm_việc desc limit 1	school_bus
select count ( * ) from trường_học	school_player
select count ( * ) from trường_học	school_player
select địa_điểm from trường_học order by số_lượng nhập_học asc	school_player
select địa_điểm from trường_học order by số_lượng nhập_học asc	school_player
select địa_điểm from trường_học order by năm thành_lập desc	school_player
select địa_điểm from trường_học order by năm thành_lập desc	school_player
select số_lượng nhập_học from trường_học where tôn_giáo != "Catholic"	school_player
select số_lượng nhập_học from trường_học where tôn_giáo != "Catholic"	school_player
select avg ( số_lượng nhập_học ) from trường_học	school_player
select avg ( số_lượng nhập_học ) from trường_học	school_player
select đội from cầu_thủ order by đội asc	school_player
select đội from cầu_thủ order by đội asc	school_player
select count ( distinct vị_trí ) from cầu_thủ	school_player
select count ( distinct vị_trí ) from cầu_thủ	school_player
select đội from cầu_thủ order by tuổi desc limit 1	school_player
select đội from cầu_thủ order by tuổi desc limit 1	school_player
select đội from cầu_thủ order by tuổi desc limit 5	school_player
select đội from cầu_thủ order by tuổi desc limit 5	school_player
select t1.đội , t2.địa_điểm from cầu_thủ as t1 join trường_học as t2 on t1.id_trường = t2.id_trường	school_player
select t1.đội , t2.địa_điểm from cầu_thủ as t1 join trường_học as t2 on t1.id_trường = t2.id_trường	school_player
select t2.địa_điểm from cầu_thủ as t1 join trường_học as t2 on t1.id_trường = t2.id_trường group by t1.id_trường having count ( * ) > 1	school_player
select t2.địa_điểm from cầu_thủ as t1 join trường_học as t2 on t1.id_trường = t2.id_trường group by t1.id_trường having count ( * ) > 1	school_player
select t2.tôn_giáo from cầu_thủ as t1 join trường_học as t2 on t1.id_trường = t2.id_trường group by t1.id_trường order by count ( * ) desc limit 1	school_player
select t2.tôn_giáo from cầu_thủ as t1 join trường_học as t2 on t1.id_trường = t2.id_trường group by t1.id_trường order by count ( * ) desc limit 1	school_player
select t1.địa_điểm , t2.biệt_danh from trường_học as t1 join chi_tiết trường_học as t2 on t1.id_trường = t2.id_trường	school_player
select t1.địa_điểm , t2.biệt_danh from trường_học as t1 join chi_tiết trường_học as t2 on t1.id_trường = t2.id_trường	school_player
select tôn_giáo , count ( * ) from trường_học group by tôn_giáo	school_player
select tôn_giáo , count ( * ) from trường_học group by tôn_giáo	school_player
select tôn_giáo , count ( * ) from trường_học group by tôn_giáo order by count ( * ) desc	school_player
select tôn_giáo , count ( * ) from trường_học group by tôn_giáo order by count ( * ) desc	school_player
select màu của_trường from trường_học order by số_lượng nhập_học desc limit 1	school_player
select màu của_trường from trường_học order by số_lượng nhập_học desc limit 1	school_player
select địa_điểm from trường_học where id_trường not in ( select id_trường from cầu_thủ )	school_player
select địa_điểm from trường_học where id_trường not in ( select id_trường from cầu_thủ )	school_player
select tôn_giáo from trường_học where năm thành_lập < 1890 intersect select tôn_giáo from trường_học where năm thành_lập > 1900	school_player
select tôn_giáo from trường_học where năm thành_lập < 1890 intersect select tôn_giáo from trường_học where năm thành_lập > 1900	school_player
select biệt_danh from chi_tiết trường_học where phân_hạng != "Division 1"	school_player
select biệt_danh from chi_tiết trường_học where phân_hạng != "Division 1"	school_player
select tôn_giáo from trường_học group by tôn_giáo having count ( * ) > 1	school_player
select tôn_giáo from trường_học group by tôn_giáo having count ( * ) > 1	school_player
select t1.tên , t2.tên from quốc_gia as t1 join giải đấu as t2 on t1.id = t2.id quốc_gia	soccer_1
select count ( * ) from quốc_gia as t1 join giải đấu as t2 on t1.id = t2.id quốc_gia where t1.tên = "England"	soccer_1
select avg ( cân nặng ) from cầu_thủ	soccer_1
select max ( cân nặng ) , min ( cân nặng ) from cầu_thủ	soccer_1
select distinct t1.tên cầu_thủ from cầu_thủ as t1 join đặc_điểm của cầu_thủ as t2 on t1.id cầu_thủ api = t2.id cầu_thủ api where t2.đánh_giá tổng_thể > ( select avg ( đánh_giá tổng_thể ) from đặc_điểm của cầu_thủ )	soccer_1
select distinct t1.tên cầu_thủ from cầu_thủ as t1 join đặc_điểm của cầu_thủ as t2 on t1.id cầu_thủ api = t2.id cầu_thủ api where t2.rê bóng = ( select max ( đánh_giá tổng_thể ) from đặc_điểm của cầu_thủ )	soccer_1
select distinct t1.tên cầu_thủ from cầu_thủ as t1 join đặc_điểm của cầu_thủ as t2 on t1.id cầu_thủ api = t2.id cầu_thủ api where t2.tạt bóng > 90 and t2.chân thuận = "right"	soccer_1
select distinct t1.tên cầu_thủ from cầu_thủ as t1 join đặc_điểm của cầu_thủ as t2 on t1.id cầu_thủ api = t2.id cầu_thủ api where t2.chân thuận = "left" and t2.đánh_giá tổng_thể >= 85 and t2.đánh_giá tổng_thể <= 90	soccer_1
select chân thuận , avg ( đánh_giá tổng_thể ) from đặc_điểm của cầu_thủ group by chân thuận	soccer_1
select chân thuận , count ( * ) from đặc_điểm của cầu_thủ where đánh_giá tổng_thể > 80 group by chân thuận	soccer_1
select id cầu_thủ api from cầu_thủ where chiều cao >= 180 intersect select id cầu_thủ api from đặc_điểm của cầu_thủ where đánh_giá tổng_thể > 85	soccer_1
select id cầu_thủ api from cầu_thủ where chiều cao >= 180 and chiều cao <= 190 intersect select id cầu_thủ api from đặc_điểm của cầu_thủ where chân thuận = "left"	soccer_1
select distinct t1.tên cầu_thủ from cầu_thủ as t1 join đặc_điểm của cầu_thủ as t2 on t1.id cầu_thủ api = t2.id cầu_thủ api order by đánh_giá tổng_thể desc limit 3	soccer_1
select distinct t1.tên cầu_thủ , t1.ngày_sinh from cầu_thủ as t1 join đặc_điểm của cầu_thủ as t2 on t1.id cầu_thủ api = t2.id cầu_thủ api order by tiềm_năng desc limit 5	soccer_1
select distinct tên quận from quận order by diện_tích của các thành_phố desc	store_product
select distinct tên quận from quận order by diện_tích của các thành_phố desc	store_product
select kích_thước trang tối_đa from sản_phẩm group by kích_thước trang tối_đa having count ( * ) > 3	store_product
select kích_thước trang tối_đa from sản_phẩm group by kích_thước trang tối_đa having count ( * ) > 3	store_product
select tên quận , dân_số thành_phố from quận where dân_số thành_phố between 200000 and 2000000	store_product
select tên quận , dân_số thành_phố from quận where dân_số thành_phố between 200000 and 2000000	store_product
select tên quận from quận where diện_tích của các thành_phố > 10 or dân_số thành_phố > 100000	store_product
select tên quận from quận where diện_tích của các thành_phố > 10 or dân_số thành_phố > 100000	store_product
select tên quận from quận order by dân_số thành_phố desc limit 1	store_product
select tên quận from quận order by dân_số thành_phố desc limit 1	store_product
select tên quận from quận order by diện_tích của các thành_phố asc limit 1	store_product
select tên quận from quận order by diện_tích của các thành_phố asc limit 1	store_product
select sum ( dân_số thành_phố ) from quận order by diện_tích của các thành_phố desc limit 3	store_product
select sum ( dân_số thành_phố ) from quận order by diện_tích của các thành_phố desc limit 3	store_product
select loại , count ( * ) from cửa_hàng group by loại	store_product
select loại , count ( * ) from cửa_hàng group by loại	store_product
select t1.tên cửa_hàng from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t3.tên quận = "Khanewal District"	store_product
select t1.tên cửa_hàng from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t3.tên quận = "Khanewal District"	store_product
select t1.tên cửa_hàng from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng where id quận = ( select id quận from quận order by dân_số thành_phố desc limit 1 )	store_product
select t1.tên cửa_hàng from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng where id quận = ( select id quận from quận order by dân_số thành_phố desc limit 1 )	store_product
select t3.thành_phố của các trụ_sở from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t1.tên cửa_hàng = "Blackville"	store_product
select t3.thành_phố của các trụ_sở from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t1.tên cửa_hàng = "Blackville"	store_product
select t3.thành_phố của các trụ_sở , count ( * ) from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành_phố của các trụ_sở	store_product
select t3.thành_phố của các trụ_sở , count ( * ) from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành_phố của các trụ_sở	store_product
select t3.thành_phố của các trụ_sở from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành_phố của các trụ_sở order by count ( * ) desc limit 1	store_product
select t3.thành_phố của các trụ_sở from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành_phố của các trụ_sở order by count ( * ) desc limit 1	store_product
select avg ( số trang màu trên từng phút ) from sản_phẩm	store_product
select avg ( số trang màu trên từng phút ) from sản_phẩm	store_product
select t1.sản_phẩm from sản_phẩm as t1 join sản_phẩm của cửa_hàng as t2 on t1.id sản_phẩm = t2.id sản_phẩm join cửa_hàng as t3 on t2.id cửa_hàng = t3.id cửa_hàng where t3.tên cửa_hàng = "Miramichi"	store_product
select t1.sản_phẩm from sản_phẩm as t1 join sản_phẩm của cửa_hàng as t2 on t1.id sản_phẩm = t2.id sản_phẩm join cửa_hàng as t3 on t2.id cửa_hàng = t3.id cửa_hàng where t3.tên cửa_hàng = "Miramichi"	store_product
select sản_phẩm from sản_phẩm where kích_thước trang tối_đa = "A4" and số trang màu trên từng phút < 5	store_product
select sản_phẩm from sản_phẩm where kích_thước trang tối_đa = "A4" and số trang màu trên từng phút < 5	store_product
select sản_phẩm from sản_phẩm where kích_thước trang tối_đa = "A4" or số trang màu trên từng phút < 5	store_product
select sản_phẩm from sản_phẩm where kích_thước trang tối_đa = "A4" or số trang màu trên từng phút < 5	store_product
select sản_phẩm from sản_phẩm where sản_phẩm like "%Scanner%"	store_product
select sản_phẩm from sản_phẩm where sản_phẩm like "%Scanner%"	store_product
select kích_thước trang tối_đa from sản_phẩm group by kích_thước trang tối_đa order by count ( * ) desc limit 1	store_product
select kích_thước trang tối_đa from sản_phẩm group by kích_thước trang tối_đa order by count ( * ) desc limit 1	store_product
select sản_phẩm from sản_phẩm where sản_phẩm != ( select kích_thước trang tối_đa from sản_phẩm group by kích_thước trang tối_đa order by count ( * ) desc limit 1 )	store_product
select sản_phẩm from sản_phẩm where sản_phẩm != ( select kích_thước trang tối_đa from sản_phẩm group by kích_thước trang tối_đa order by count ( * ) desc limit 1 )	store_product
select sum ( dân_số thành_phố ) from quận where diện_tích của các thành_phố > ( select avg ( diện_tích của các thành_phố ) from quận )	store_product
select sum ( dân_số thành_phố ) from quận where diện_tích của các thành_phố > ( select avg ( diện_tích của các thành_phố ) from quận )	store_product
select t3.tên quận from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "City Mall" intersect select t3.tên quận from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "Village Store"	store_product
select t3.tên quận from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "City Mall" intersect select t3.tên quận from cửa_hàng as t1 join quận của cửa_hàng as t2 on t1.id cửa_hàng = t2.id cửa_hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "Village Store"	store_product
select count ( * ) from khu_vực	storm_record
select count ( * ) from khu_vực	storm_record
select mã khu_vực , tên khu_vực from khu_vực order by mã khu_vực	storm_record
select mã khu_vực , tên khu_vực from khu_vực order by mã khu_vực	storm_record
select tên khu_vực from khu_vực order by tên khu_vực	storm_record
select tên khu_vực from khu_vực order by tên khu_vực	storm_record
select tên khu_vực from khu_vực where tên khu_vực != "Denmark"	storm_record
select tên khu_vực from khu_vực where tên khu_vực != "Denmark"	storm_record
select count ( * ) from bão where số_lượng người chết > 0	storm_record
select count ( * ) from bão where số_lượng người chết > 0	storm_record
select tên , ngày hoạt_động , số_lượng người chết from bão where số_lượng người chết >= 1	storm_record
select tên , ngày hoạt_động , số_lượng người chết from bão where số_lượng người chết >= 1	storm_record
select avg ( thiệt_hại theo triệu usd ) , max ( thiệt_hại theo triệu usd ) from bão where tốc_độ tối_đa > 1000	storm_record
select avg ( thiệt_hại theo triệu usd ) , max ( thiệt_hại theo triệu usd ) from bão where tốc_độ tối_đa > 1000	storm_record
select sum ( số_lượng người chết ) , sum ( thiệt_hại theo triệu usd ) from bão where tốc_độ tối_đa > ( select avg ( tốc_độ tối_đa ) from bão )	storm_record
select sum ( số_lượng người chết ) , sum ( thiệt_hại theo triệu usd ) from bão where tốc_độ tối_đa > ( select avg ( tốc_độ tối_đa ) from bão )	storm_record
select tên , thiệt_hại theo triệu usd from bão order by tốc_độ tối_đa desc	storm_record
select tên , thiệt_hại theo triệu usd from bão order by tốc_độ tối_đa desc	storm_record
select count ( distinct id khu_vực ) from khu_vực bị ảnh_hưởng	storm_record
select count ( distinct id khu_vực ) from khu_vực bị ảnh_hưởng	storm_record
select tên khu_vực from khu_vực where id khu_vực not in ( select id khu_vực from khu_vực bị ảnh_hưởng )	storm_record
select tên khu_vực from khu_vực where id khu_vực not in ( select id khu_vực from khu_vực bị ảnh_hưởng )	storm_record
select t1.tên khu_vực , count ( * ) from khu_vực as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id khu_vực = t2.id khu_vực group by t1.id khu_vực	storm_record
select t1.tên khu_vực , count ( * ) from khu_vực as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id khu_vực = t2.id khu_vực group by t1.id khu_vực	storm_record
select t1.tên , count ( * ) from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão	storm_record
select t1.tên , count ( * ) from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão	storm_record
select t1.tên , t1.tốc_độ tối_đa from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão order by count ( * ) desc limit 1	storm_record
select t1.tên , t1.tốc_độ tối_đa from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão order by count ( * ) desc limit 1	storm_record
select tên from bão where id cơn bão not in ( select id bão from khu_vực bị ảnh_hưởng )	storm_record
select tên from bão where id cơn bão not in ( select id bão from khu_vực bị ảnh_hưởng )	storm_record
select t1.tên from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2 intersect select t1.tên from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having sum ( t2.số thành_phố bị ảnh_hưởng ) >= 10	storm_record
select t1.tên from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2 intersect select t1.tên from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having sum ( t2.số thành_phố bị ảnh_hưởng ) >= 10	storm_record
select tên from bão except select t1.tên from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2	storm_record
select tên from bão except select t1.tên from bão as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2	storm_record
select t2.tên khu_vực from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t3.số_lượng người chết >= 10	storm_record
select t2.tên khu_vực from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t3.số_lượng người chết >= 10	storm_record
select t3.tên from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu_vực = "Denmark"	storm_record
select t3.tên from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu_vực = "Denmark"	storm_record
select t1.tên khu_vực from khu_vực as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id khu_vực = t2.id khu_vực group by t1.id khu_vực having count ( * ) >= 2	storm_record
select t1.tên khu_vực from khu_vực as t1 join khu_vực bị ảnh_hưởng as t2 on t1.id khu_vực = t2.id khu_vực group by t1.id khu_vực having count ( * ) >= 2	storm_record
select t2.tên khu_vực from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão order by t3.số_lượng người chết desc limit 1	storm_record
select t2.tên khu_vực from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão order by t3.số_lượng người chết desc limit 1	storm_record
select t3.tên from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu_vực = "Afghanistan" intersect select t3.tên from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu_vực = "Albania"	storm_record
select t3.tên from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu_vực = "Afghanistan" intersect select t3.tên from khu_vực bị ảnh_hưởng as t1 join khu_vực as t2 on t1.id khu_vực = t2.id khu_vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu_vực = "Albania"	storm_record
select count ( * ) from danh_sách	student_1
select count ( * ) from danh_sách	student_1
select họ from danh_sách where phòng học = 111	student_1
select họ from danh_sách where phòng học = 111	student_1
select tên from danh_sách where phòng học = 108	student_1
select tên from danh_sách where phòng học = 108	student_1
select distinct tên from danh_sách where phòng học = 107	student_1
select distinct tên from danh_sách where phòng học = 107	student_1
select distinct phòng học , khối lớp from danh_sách	student_1
select distinct phòng học , khối lớp from danh_sách	student_1
select distinct khối lớp from danh_sách where phòng học = 103	student_1
select distinct khối lớp from danh_sách where phòng học = 103	student_1
select distinct khối lớp from danh_sách where phòng học = 105	student_1
select distinct khối lớp from danh_sách where phòng học = 105	student_1
select distinct phòng học from danh_sách where khối lớp = 4	student_1
select distinct phòng học from danh_sách where khối lớp = 4	student_1
select distinct phòng học from danh_sách where khối lớp = 5	student_1
select distinct phòng học from danh_sách where khối lớp = 5	student_1
select distinct t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 5	student_1
select distinct t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 5	student_1
select distinct t2.tên from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 1	student_1
select distinct t2.tên from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 1	student_1
select tên from giáo_viên where phòng học = 110	student_1
select tên from giáo_viên where phòng học = 110	student_1
select họ from giáo_viên where phòng học = 109	student_1
select họ from giáo_viên where phòng học = 109	student_1
select distinct tên , họ from giáo_viên	student_1
select distinct tên , họ from giáo_viên	student_1
select distinct tên , họ from danh_sách	student_1
select distinct tên , họ from danh_sách	student_1
select t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "MARROTTE" and t2.họ = "KIRK"	student_1
select t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "MARROTTE" and t2.họ = "KIRK"	student_1
select t2.tên , t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "EVELINA" and t1.họ = "BROMLEY"	student_1
select t2.tên , t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "EVELINA" and t1.họ = "BROMLEY"	student_1
select t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "GELL" and t1.họ = "TAMI"	student_1
select t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "GELL" and t1.họ = "TAMI"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "LORIA" and t2.họ = "ONDERSMA"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "LORIA" and t2.họ = "ONDERSMA"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "KAWA" and t2.họ = "GORDON"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "KAWA" and t2.họ = "GORDON"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "TARRING" and t2.họ = "LEIA"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "TARRING" and t2.họ = "LEIA"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "CHRISSY" and t1.họ = "NABOZNY"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "CHRISSY" and t1.họ = "NABOZNY"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "MADLOCK" and t1.họ = "RAY"	student_1
select count ( * ) from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "MADLOCK" and t1.họ = "RAY"	student_1
select distinct t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 1 except select t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select distinct t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 1 except select t1.tên , t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select distinct t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 3 and t2.tên != "COVIN" and t2.họ != "JEROME"	student_1
select distinct t1.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 3 and t2.tên != "COVIN" and t2.họ != "JEROME"	student_1
select khối lớp , count ( distinct phòng học ) , count ( * ) from danh_sách group by khối lớp	student_1
select khối lớp , count ( distinct phòng học ) , count ( * ) from danh_sách group by khối lớp	student_1
select phòng học , count ( distinct khối lớp ) from danh_sách group by phòng học	student_1
select phòng học , count ( distinct khối lớp ) from danh_sách group by phòng học	student_1
select phòng học from danh_sách group by phòng học order by count ( * ) desc limit 1	student_1
select phòng học from danh_sách group by phòng học order by count ( * ) desc limit 1	student_1
select phòng học , count ( * ) from danh_sách group by phòng học	student_1
select phòng học , count ( * ) from danh_sách group by phòng học	student_1
select phòng học , count ( * ) from danh_sách where khối lớp = "0" group by phòng học	student_1
select phòng học , count ( * ) from danh_sách where khối lớp = "0" group by phòng học	student_1
select phòng học , count ( * ) from danh_sách where khối lớp = "4" group by phòng học	student_1
select phòng học , count ( * ) from danh_sách where khối lớp = "4" group by phòng học	student_1
select t2.tên , t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học group by t2.tên , t2.họ order by count ( * ) desc limit 1	student_1
select t2.tên , t2.họ from danh_sách as t1 join giáo_viên as t2 on t1.phòng học = t2.phòng học group by t2.tên , t2.họ order by count ( * ) desc limit 1	student_1
select count ( * ) , phòng học from danh_sách group by phòng học	student_1
select count ( * ) , phòng học from danh_sách group by phòng học	student_1
select t1.tên khoá học from khoá học as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học group by t1.id khoá học order by count ( * ) desc limit 1	student_assessment
select t1.tên khoá học from khoá học as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học group by t1.id khoá học order by count ( * ) desc limit 1	student_assessment
select id sinh_viên from lượt đăng_ký khoá học của sinh_viên group by id sinh_viên order by count ( * ) limit 1	student_assessment
select id sinh_viên from lượt đăng_ký khoá học của sinh_viên group by id sinh_viên order by count ( * ) limit 1	student_assessment
select t2.tên , t2.họ from ứng_cử_viên as t1 join cá_nhân as t2 on t1.id ứng_cử_viên = t2.id cá_nhân	student_assessment
select t2.tên , t2.họ from ứng_cử_viên as t1 join cá_nhân as t2 on t1.id ứng_cử_viên = t2.id cá_nhân	student_assessment
select id sinh_viên from sinh_viên where id sinh_viên not in ( select id sinh_viên from lần tham_dự khoá học của sinh_viên )	student_assessment
select id sinh_viên from sinh_viên where id sinh_viên not in ( select id sinh_viên from lần tham_dự khoá học của sinh_viên )	student_assessment
select id sinh_viên from lần tham_dự khoá học của sinh_viên	student_assessment
select id sinh_viên from lần tham_dự khoá học của sinh_viên	student_assessment
select t1.id sinh_viên , t2.tên khoá học from lượt đăng_ký khoá học của sinh_viên as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học	student_assessment
select t2.chi_tiết sinh_viên from lượt đăng_ký khoá học của sinh_viên as t1 join sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên order by t1.ngày đăng_kí desc limit 1	student_assessment
select t2.chi_tiết sinh_viên from lượt đăng_ký khoá học của sinh_viên as t1 join sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên order by t1.ngày đăng_kí desc limit 1	student_assessment
select count ( * ) from khoá học as t1 join lần tham_dự khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "English"	student_assessment
select count ( * ) from khoá học as t1 join lần tham_dự khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "English"	student_assessment
select count ( * ) from khoá học as t1 join lần tham_dự khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t2.id sinh_viên = 171	student_assessment
select count ( * ) from khoá học as t1 join lần tham_dự khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t2.id sinh_viên = 171	student_assessment
select t2.id ứng_cử_viên from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id ứng_cử_viên where t1.địa chỉ email = "stanley.monahan@example.org"	student_assessment
select t2.id ứng_cử_viên from cá_nhân as t1 join ứng_cử_viên as t2 on t1.id cá_nhân = t2.id ứng_cử_viên where t1.địa chỉ email = "stanley.monahan@example.org"	student_assessment
select id ứng_cử_viên from đánh_giá ứng_cử_viên order by ngày đánh_giá desc limit 1	student_assessment
select id ứng_cử_viên from đánh_giá ứng_cử_viên order by ngày đánh_giá desc limit 1	student_assessment
select t1.chi_tiết sinh_viên from sinh_viên as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên group by t1.id sinh_viên order by count ( * ) desc limit 1	student_assessment
select t1.chi_tiết sinh_viên from sinh_viên as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên group by t1.id sinh_viên order by count ( * ) desc limit 1	student_assessment
select t1.id sinh_viên , count ( * ) from sinh_viên as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên group by t1.id sinh_viên	student_assessment
select t1.id sinh_viên , count ( * ) from sinh_viên as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên group by t1.id sinh_viên	student_assessment
select t3.tên khoá học , count ( * ) from sinh_viên as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên join khoá học as t3 on t2.id khoá học = t3.id khoá học group by t2.id khoá học	student_assessment
select t3.tên khoá học , count ( * ) from sinh_viên as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id sinh_viên = t2.id sinh_viên join khoá học as t3 on t2.id khoá học = t3.id khoá học group by t2.id khoá học	student_assessment
select id ứng_cử_viên from đánh_giá ứng_cử_viên where mã kết_quả đánh_giá = "Pass"	student_assessment
select id ứng_cử_viên from đánh_giá ứng_cử_viên where mã kết_quả đánh_giá = "Pass"	student_assessment
select t3.số di_động from ứng_cử_viên as t1 join đánh_giá ứng_cử_viên as t2 on t1.id ứng_cử_viên = t2.id ứng_cử_viên join cá_nhân as t3 on t1.id ứng_cử_viên = t3.id cá_nhân where t2.mã kết_quả đánh_giá = "Fail"	student_assessment
select t3.số di_động from ứng_cử_viên as t1 join đánh_giá ứng_cử_viên as t2 on t1.id ứng_cử_viên = t2.id ứng_cử_viên join cá_nhân as t3 on t1.id ứng_cử_viên = t3.id cá_nhân where t2.mã kết_quả đánh_giá = "Fail"	student_assessment
select id sinh_viên from lần tham_dự khoá học của sinh_viên where id khoá học = 301	student_assessment
select id sinh_viên from lần tham_dự khoá học của sinh_viên where id khoá học = 301	student_assessment
select id sinh_viên from lần tham_dự khoá học của sinh_viên where id khoá học = 301 order by ngày tham_dự desc limit 1	student_assessment
select id sinh_viên from lần tham_dự khoá học của sinh_viên where id khoá học = 301 order by ngày tham_dự desc limit 1	student_assessment
select distinct t1.thành_phố from địa_chỉ as t1 join địa_chỉ cá_nhân as t2 on t1.id địa_chỉ = t2.id địa_chỉ	student_assessment
select distinct t1.thành_phố from địa_chỉ as t1 join địa_chỉ cá_nhân as t2 on t1.id địa_chỉ = t2.id địa_chỉ	student_assessment
select distinct t1.thành_phố from địa_chỉ as t1 join địa_chỉ cá_nhân as t2 on t1.id địa_chỉ = t2.id địa_chỉ join sinh_viên as t3 on t2.id cá_nhân = t3.id sinh_viên	student_assessment
select distinct t1.thành_phố from địa_chỉ as t1 join địa_chỉ cá_nhân as t2 on t1.id địa_chỉ = t2.id địa_chỉ join sinh_viên as t3 on t2.id cá_nhân = t3.id sinh_viên	student_assessment
select tên khoá học from khoá học order by tên khoá học	student_assessment
select tên khoá học from khoá học order by tên khoá học	student_assessment
select tên from cá_nhân order by tên	student_assessment
select tên from cá_nhân order by tên	student_assessment
select id sinh_viên from lượt đăng_ký khoá học của sinh_viên union select id sinh_viên from lần tham_dự khoá học của sinh_viên	student_assessment
select id sinh_viên from lượt đăng_ký khoá học của sinh_viên union select id sinh_viên from lần tham_dự khoá học của sinh_viên	student_assessment
select id khoá học from lượt đăng_ký khoá học của sinh_viên where id sinh_viên = 121 union select id khoá học from lần tham_dự khoá học của sinh_viên where id sinh_viên = 121	student_assessment
select id khoá học from lượt đăng_ký khoá học của sinh_viên where id sinh_viên = 121 union select id khoá học from lần tham_dự khoá học của sinh_viên where id sinh_viên = 121	student_assessment
select * from lượt đăng_ký khoá học của sinh_viên where id sinh_viên not in ( select id sinh_viên from lần tham_dự khoá học của sinh_viên )	student_assessment
select * from lượt đăng_ký khoá học của sinh_viên where id sinh_viên not in ( select id sinh_viên from lần tham_dự khoá học của sinh_viên )	student_assessment
select t2.id sinh_viên from khoá học as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày đăng_kí	student_assessment
select t2.id sinh_viên from khoá học as t1 join lượt đăng_ký khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày đăng_kí	student_assessment
select t2.id sinh_viên from khoá học as t1 join lần tham_dự khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày tham_dự	student_assessment
select t2.id sinh_viên from khoá học as t1 join lần tham_dự khoá học của sinh_viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày tham_dự	student_assessment
select count ( * ) from lượt nộp bài	workshop_paper
select count ( * ) from lượt nộp bài	workshop_paper
select tác_giả from lượt nộp bài order by số điểm asc	workshop_paper
select tác_giả from lượt nộp bài order by số điểm asc	workshop_paper
select tác_giả , trường đại_học from lượt nộp bài	workshop_paper
select tác_giả , trường đại_học from lượt nộp bài	workshop_paper
select tác_giả from lượt nộp bài where trường đại_học = "Florida" or trường đại_học = "Temple"	workshop_paper
select tác_giả from lượt nộp bài where trường đại_học = "Florida" or trường đại_học = "Temple"	workshop_paper
select avg ( số điểm ) from lượt nộp bài	workshop_paper
select avg ( số điểm ) from lượt nộp bài	workshop_paper
select tác_giả from lượt nộp bài order by số điểm desc limit 1	workshop_paper
select tác_giả from lượt nộp bài order by số điểm desc limit 1	workshop_paper
select trường đại_học , count ( * ) from lượt nộp bài group by trường đại_học	workshop_paper
select trường đại_học , count ( * ) from lượt nộp bài group by trường đại_học	workshop_paper
select trường đại_học from lượt nộp bài group by trường đại_học order by count ( * ) desc limit 1	workshop_paper
select trường đại_học from lượt nộp bài group by trường đại_học order by count ( * ) desc limit 1	workshop_paper
select trường đại_học from lượt nộp bài where số điểm > 90 intersect select trường đại_học from lượt nộp bài where số điểm < 80	workshop_paper
select trường đại_học from lượt nộp bài where số điểm > 90 intersect select trường đại_học from lượt nộp bài where số điểm < 80	workshop_paper
select t2.tác_giả , t1.kết_quả from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài	workshop_paper
select t2.tác_giả , t1.kết_quả from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài	workshop_paper
select t1.kết_quả from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài order by t2.số điểm desc limit 1	workshop_paper
select t1.kết_quả from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài order by t2.số điểm desc limit 1	workshop_paper
select t2.tác_giả , count ( distinct t1.id hội_thảo ) from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác_giả	workshop_paper
select t2.tác_giả , count ( distinct t1.id hội_thảo ) from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác_giả	workshop_paper
select t2.tác_giả from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác_giả having count ( distinct t1.id hội_thảo ) > 1	workshop_paper
select t2.tác_giả from chấp_thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác_giả having count ( distinct t1.id hội_thảo ) > 1	workshop_paper
select ngày , địa_điểm from hội_thảo order by địa_điểm	workshop_paper
select ngày , địa_điểm from hội_thảo order by địa_điểm	workshop_paper
select tác_giả from lượt nộp bài where id lượt nộp bài not in ( select id lượt nộp bài from chấp_thuận )	workshop_paper
select tác_giả from lượt nộp bài where id lượt nộp bài not in ( select id lượt nộp bài from chấp_thuận )	workshop_paper
select tên from doanh_nghiệp where đánh_giá xếp_hạng > 4.5	yelp
select tên from doanh_nghiệp where đánh_giá xếp_hạng = 3.5	yelp
select id người tiêu_dùng from người tiêu_dùng where tên = "Michelle"	yelp
select tiểu_bang from doanh_nghiệp where tên = "Whataburger"	yelp
select t1.thành_phố from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "MGM Grand Buffet" and t2.tên loại_hình = "category_category_name0"	yelp
select thành_phố from doanh_nghiệp where đánh_giá xếp_hạng < 1.5	yelp
select thành_phố from doanh_nghiệp where tên = "Taj Mahal"	yelp
select văn_bản from đánh_giá where đánh_giá xếp_hạng < 1	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.đánh_giá xếp_hạng > 3.5 and t2.tên loại_hình = "restaurant"	yelp
select t1.thành_phố from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Taj Mahal" and t2.tên loại_hình = "restaurant"	yelp
select t1.văn_bản from người tiêu_dùng as t2 join đánh_giá as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t2.tên = "Niloofar"	yelp
select t1.tên from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t3.tên = "Niloofar"	yelp
select t1.tên from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t2.đánh_giá xếp_hạng = 5 and t3.tên = "Niloofar"	yelp
select t4.văn_bản from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t4 on t4.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t5 on t5.id người tiêu_dùng = t4.id người tiêu_dùng where t2.tên loại_hình = "Italian" and t3.tên loại_hình = "category_category_name1" and t5.tên = "Michelle"	yelp
select count ( distinct t3.văn_bản ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Cafe Zinho" and t1.tiểu_bang = "Texas" and t2.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.đánh_giá xếp_hạng = 5 and t2.tên loại_hình = "Italian" and t3.tên loại_hình = "restaurant"	yelp
select t1.tên khu_phố lân_cận from loại_hình as t3 join doanh_nghiệp as t2 on t3.id doanh_nghiệp = t2.id doanh_nghiệp join loại_hình as t4 on t4.id doanh_nghiệp = t2.id doanh_nghiệp join khu_vực lân_cận as t1 on t1.id doanh_nghiệp = t2.id doanh_nghiệp where t2.thành_phố = "Madison" and t3.tên loại_hình = "Italian" and t4.tên loại_hình = "restaurant"	yelp
select t1.tên khu_phố lân_cận from loại_hình as t3 join doanh_nghiệp as t2 on t3.id doanh_nghiệp = t2.id doanh_nghiệp join loại_hình as t4 on t4.id doanh_nghiệp = t2.id doanh_nghiệp join khu_vực lân_cận as t1 on t1.id doanh_nghiệp = t2.id doanh_nghiệp where t2.thành_phố = "Madison" and t2.đánh_giá xếp_hạng < 2.5 and t3.tên loại_hình = "Italian" and t4.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tiểu_bang = "Pennsylvania" and t2.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tiểu_bang = "Pennsylvania" and t2.tên loại_hình = "restaurant"	yelp
select t3.văn_bản from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.số_lượng đánh_giá > 100 and t2.tên loại_hình = "Pet Groomers"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "breweries"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "breweries"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "breweries"	yelp
select t4.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t1.tên = "Mesa Grill" and t2.tên loại_hình = "restaurant"	yelp
select địa_chỉ đầy_đủ from doanh_nghiệp where thành_phố = "Los Angeles" and tên = "Walmart"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t1.thành_phố = "Dallas" and t2.tên loại_hình = "restaurant" and t4.tên = "Patrick"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t1.thành_phố = "Dallas" and t2.tên loại_hình = "restaurant" and t4.tên = "Patrick"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t2.tên loại_hình = "Bars" and t4.tên = "Patrick"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t1.đánh_giá xếp_hạng >= 3 and t2.tên loại_hình = "Bars" and t4.tên = "Patrick"	yelp
select t3.tên from khoản tiền boa as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t1.tên = "Barrio Cafe" and t2.năm = 2015	yelp
select tên from doanh_nghiệp where đánh_giá xếp_hạng < 2 and tiểu_bang = "Texas"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "Seafood" and t3.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "Seafood" and t3.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "Seafood" and t3.tên loại_hình = "restaurant"	yelp
select t1.văn_bản from người tiêu_dùng as t2 join đánh_giá as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t1.đánh_giá xếp_hạng > 4 and t2.tên = "Patrick"	yelp
select id doanh_nghiệp from doanh_nghiệp where thành_phố = "Los Angeles" and tên = "Apple Store"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Dallas" and t1.đánh_giá xếp_hạng > 4.5 and t2.tên loại_hình = "restaurant"	yelp
select t1.tên khu_phố lân_cận from loại_hình as t3 join doanh_nghiệp as t2 on t3.id doanh_nghiệp = t2.id doanh_nghiệp join khu_vực lân_cận as t1 on t1.id doanh_nghiệp = t2.id doanh_nghiệp where t2.tên = "Flat Top Grill" and t3.tên loại_hình = "category_category_name0"	yelp
select t2.văn_bản from khoản tiền boa as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Vintner Grill" and t2.số lượt thích > 9	yelp
select t2.văn_bản from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Kabob Palace" and t2.năm = 2014	yelp
select t3.tên from khoản tiền boa as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t1.thành_phố = "Dallas"	yelp
select t1.thành_phố from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "MGM Grand Buffet" and t1.tiểu_bang = "Texas" and t2.tên loại_hình = "restaurant"	yelp
select t4.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join khoản tiền boa as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t2.tên loại_hình = "Pet Groomers"	yelp
select t2.văn_bản from khoản tiền boa as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Cafe Zinho" and t1.tiểu_bang = "Texas"	yelp
select t4.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t2.tên loại_hình = "restaurant"	yelp
select t2.văn_bản from khoản tiền boa as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Cafe Zinho" and t1.tiểu_bang = "Pennsylvania" and t2.năm = 2010	yelp
select t4.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t2.tên loại_hình = "restaurant" and t3.năm = 2010	yelp
select t2.văn_bản from người tiêu_dùng as t3 join đánh_giá as t1 on t3.id người tiêu_dùng = t1.id người tiêu_dùng join khoản tiền boa as t2 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t1.năm = 2012	yelp
select t2.văn_bản from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.đánh_giá xếp_hạng = 2.5	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Madison" and t2.tên loại_hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Madison" and t2.tên loại_hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Madison" and t2.tên loại_hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Madison" and t2.tên loại_hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Madison" and t2.tên loại_hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.đánh_giá xếp_hạng > 3.5 and t2.tên loại_hình = "restaurant"	yelp
select sum ( t4.số_lượng ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join lượt đăng_ký as t4 on t4.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "restaurant" and t3.tên loại_hình = "Moroccan"	yelp
select sum ( t4.số_lượng ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join lượt đăng_ký as t4 on t4.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "Moroccan" and t3.tên loại_hình = "restaurant" and t4.ngày = "Friday"	yelp
select t4.ngày , sum ( t4.số_lượng ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join lượt đăng_ký as t4 on t4.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t2.tên loại_hình = "Moroccan" and t3.tên loại_hình = "restaurant" group by t4.ngày	yelp
select t1.tiểu_bang , sum ( t4.số_lượng ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join lượt đăng_ký as t4 on t4.id doanh_nghiệp = t1.id doanh_nghiệp where t2.tên loại_hình = "Italian" and t3.tên loại_hình = "Delis" and t4.ngày = "Sunday" group by t1.tiểu_bang	yelp
select count ( distinct t1.văn_bản ) from người tiêu_dùng as t2 join đánh_giá as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t1.năm = 2015 and t2.tên = "Niloofar"	yelp
select avg ( t1.đánh_giá xếp_hạng ) from người tiêu_dùng as t2 join đánh_giá as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t2.tên = "Michelle"	yelp
select t2.số_lượng from lượt đăng_ký as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Cafe Zinho" and t2.ngày = "Friday"	yelp
select count ( distinct t3.tên ) from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t1.thành_phố = "Pittsburgh" and t1.tên = "Sushi Too"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Pittsburgh" and t1.đánh_giá xếp_hạng = 4.5 and t2.tên loại_hình = "restaurant"	yelp
select count ( distinct văn_bản ) from khoản tiền boa where năm = 2015	yelp
select sum ( t1.số lượt thích ) from người tiêu_dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t2.tên = "Niloofar"	yelp
select sum ( t2.số lượt thích ) from khoản tiền boa as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Cafe Zinho"	yelp
select sum ( t2.số lượt thích ) from khoản tiền boa as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t1.tên = "Cafe Zinho" and t3.tên = "Niloofar"	yelp
select count ( distinct t1.văn_bản ) from người tiêu_dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t1.năm = 2010 and t2.tên = "Michelle"	yelp
select count ( distinct t1.văn_bản ) from người tiêu_dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t1.năm = 2010 and t2.tên = "Michelle"	yelp
select count ( distinct t1.văn_bản ) from người tiêu_dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t1.tháng = "April" and t2.tên = "Michelle"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tiểu_bang = "Texas" and t2.tên loại_hình = "restaurant"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Dallas" and t1.đánh_giá xếp_hạng > 3.5 and t2.tên loại_hình = "Bars"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Dallas" and t1.đánh_giá xếp_hạng > 3.5 and t2.tên loại_hình = "Bars"	yelp
select count ( distinct t4.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t1.thành_phố = "Dallas" and t1.tên = "Texas de Brazil" and t1.tiểu_bang = "Texas" and t2.tên loại_hình = "restaurant"	yelp
select count ( distinct t3.tên ) from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t1.tên = "Bistro Di Napoli" and t2.năm = 2015	yelp
select count ( distinct t1.tên ) from loại_hình as t3 join doanh_nghiệp as t1 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join khu_vực lân_cận as t2 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Dallas" and t3.tên loại_hình = "restaurant" and t2.tên khu_phố lân_cận = "Hazelwood"	yelp
select count ( distinct id doanh_nghiệp ) from doanh_nghiệp where thành_phố = "Dallas" and tên = "Starbucks" and tiểu_bang = "Texas"	yelp
select số_lượng đánh_giá from doanh_nghiệp where tên = "Acacia Cafe"	yelp
select avg ( t3.số_lượng ) , t3.ngày from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join lượt đăng_ký as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tên = "Barrio Cafe" and t2.tên loại_hình = "restaurant" group by t3.ngày	yelp
select count ( distinct t1.tên ) from khu_vực lân_cận as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Madison" and t2.tên khu_phố lân_cận = "Stone Meadows"	yelp
select count ( distinct t1.văn_bản ) from người tiêu_dùng as t2 join đánh_giá as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t2.tên = "Adrienne"	yelp
select count ( distinct t1.văn_bản ) from người tiêu_dùng as t2 join đánh_giá as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t1.tháng = "March" and t1.năm = 2014 and t2.tên = "Michelle"	yelp
select count ( distinct t1.tên ) from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t2.năm = 2010 and t3.tên = "Michelle"	yelp
select count ( distinct t1.tên ) from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t3 on t3.id người tiêu_dùng = t2.id người tiêu_dùng where t1.thành_phố = "San Diego" and t2.năm = 2010 and t3.tên = "Christine"	yelp
select count ( distinct id doanh_nghiệp ) from doanh_nghiệp where thành_phố = "Los Angeles" and tên = "Target"	yelp
select count ( distinct t4.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t1.thành_phố = "Dallas" and t2.tên loại_hình = "Irish Pub"	yelp
select avg ( đánh_giá xếp_hạng ) from đánh_giá where năm = 2014	yelp
select count ( distinct t4.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join người tiêu_dùng as t4 on t4.id người tiêu_dùng = t3.id người tiêu_dùng where t1.tên = "Vintner Grill" and t2.tên loại_hình = "category_category_name0" and t3.năm = 2010	yelp
select count ( distinct t3.văn_bản ) from khu_vực lân_cận as t1 join doanh_nghiệp as t2 on t1.id doanh_nghiệp = t2.id doanh_nghiệp join đánh_giá as t3 on t3.id doanh_nghiệp = t2.id doanh_nghiệp where t1.tên khu_phố lân_cận = "South Summerlin"	yelp
select count ( distinct tên ) from người tiêu_dùng where tên = "Michelle"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t2.tên loại_hình = "restaurant"	yelp
select count ( distinct thành_phố ) from doanh_nghiệp where tên = "Panda Express"	yelp
select count ( distinct t1.văn_bản ) from người tiêu_dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng where t2.tên = "Michelle"	yelp
select sum ( t3.số_lượng ) from lượt đăng_ký as t3 join doanh_nghiệp as t1 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join khu_vực lân_cận as t2 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t2.tên khu_phố lân_cận = "Brighton Heights"	yelp
select count ( distinct văn_bản ) from đánh_giá where tháng = "March"	yelp
select count ( distinct văn_bản ) , tháng from khoản tiền boa group by tháng	yelp
select count ( distinct t1.tên khu_phố lân_cận ) from khu_vực lân_cận as t1 join doanh_nghiệp as t2 on t1.id doanh_nghiệp = t2.id doanh_nghiệp where t2.thành_phố = "Madison" and t2.đánh_giá xếp_hạng = 5	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.tiểu_bang = "Texas" and t2.tên loại_hình = "Moroccan" and t3.tên loại_hình = "restaurant"	yelp
select t1.tên from lượt đăng_ký as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp group by t1.tên order by sum ( t2.số_lượng ) desc limit 1	yelp
select t1.tên khu_phố lân_cận from khu_vực lân_cận as t1 join doanh_nghiệp as t2 on t1.id doanh_nghiệp = t2.id doanh_nghiệp where t2.thành_phố = "Madison" group by t1.tên khu_phố lân_cận order by count ( distinct t2.tên ) desc limit 1	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Dallas" and t1.đánh_giá xếp_hạng > 3.5 and t2.tên loại_hình = "Mexican" and t3.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Dallas" and t1.đánh_giá xếp_hạng > 3.5 and t2.tên loại_hình = "Mexican" and t3.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Dallas" and t1.tiểu_bang = "Texas" and t2.tên loại_hình = "Valet Service" and t3.tên loại_hình = "restaurant"	yelp
select t1.tên from loại_hình as t3 join doanh_nghiệp as t1 on t3.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t4 on t4.id doanh_nghiệp = t1.id doanh_nghiệp join khu_vực lân_cận as t2 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Madison" and t3.tên loại_hình = "Italian" and t4.tên loại_hình = "restaurant" and t2.tên khu_phố lân_cận = "Meadowood"	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Los Angeles" and t1.đánh_giá xếp_hạng > 3 and t1.số_lượng đánh_giá > 30 and t2.tên loại_hình = "Bars"	yelp
select count ( distinct t1.tên ) from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp join loại_hình as t3 on t3.id doanh_nghiệp = t1.id doanh_nghiệp where t1.thành_phố = "Edinburgh" and t2.tên loại_hình = "restaurant" and t3.tên loại_hình = "Egyptian"	yelp
select t2.tên from người tiêu_dùng as t2 join đánh_giá as t1 on t2.id người tiêu_dùng = t1.id người tiêu_dùng group by t2.tên having avg ( t1.đánh_giá xếp_hạng ) < 3	yelp
select t1.tên from đánh_giá as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp where t2.tháng = "April" group by t1.tên order by count ( distinct t2.văn_bản ) desc limit 1	yelp
select t1.tên from loại_hình as t2 join doanh_nghiệp as t1 on t2.id doanh_nghiệp = t1.id doanh_nghiệp group by t1.tên order by count ( distinct t2.tên loại_hình ) desc limit 1	yelp
