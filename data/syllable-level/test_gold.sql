select t1.id tài sản , t1.chi tiết tài sản from tài sản as t1 join bộ phận của tài sản as t2 on t1.id tài sản = t2.id tài sản group by t1.id tài sản having count ( * ) = 2 intersect select t1.id tài sản , t1.chi tiết tài sản from tài sản as t1 join nhật ký lỗi as t2 on t1.id tài sản = t2.id tài sản group by t1.id tài sản having count ( * ) < 2	assets_maintenance
select count ( * ) , t1.id hợp đồng bảo trì from hợp đồng bảo trì as t1 join tài sản as t2 on t1.id hợp đồng bảo trì = t2.id hợp đồng bảo trì group by t1.id hợp đồng bảo trì	assets_maintenance
select count ( * ) , t1.id công ty from công ty bên thứ ba as t1 join tài sản as t2 on t1.id công ty = t2.id công ty cung cấp group by t1.id công ty	assets_maintenance
select t1.id công ty , t1.tên công ty from công ty bên thứ ba as t1 join kỹ sư bảo trì as t2 on t1.id công ty = t2.id công ty group by t1.id công ty having count ( * ) >= 2 union select t3.id công ty , t3.tên công ty from công ty bên thứ ba as t3 join hợp đồng bảo trì as t4 on t3.id công ty = t4.id hợp đồng bảo trì của công ty group by t3.id công ty having count ( * ) >= 2	assets_maintenance
select t1.tên nhân viên , t1.id nhân viên from nhân viên as t1 join nhật ký lỗi as t2 on t1.id nhân viên = t2.được ghi lại bởi nhân viên có id except select t3.tên nhân viên , t3.id nhân viên from nhân viên as t3 join chuyến thăm của kỹ sư as t4 on t3.id nhân viên = t4.id nhân viên liên lạc	assets_maintenance
select t1.id kỹ sư , t1.tên , t1.họ from kỹ sư bảo trì as t1 join chuyến thăm của kỹ sư as t2 group by t1.id kỹ sư order by count ( * ) desc limit 1	assets_maintenance
select t1.tên bộ phận , t1.id bộ phận from bộ phận as t1 join lỗi bộ phận as t2 on t1.id bộ phận = t2.id bộ phận group by t1.id bộ phận having count ( * ) > 2	assets_maintenance
select t1.tên , t1.họ , t1.những chi tiết khác , t3.mô tả về kỹ năng from kỹ sư bảo trì as t1 join kỹ năng của kỹ sư as t2 on t1.id kỹ sư = t2.id kỹ sư join kỹ năng as t3 on t2.id kỹ năng = t3.id kỹ năng	assets_maintenance
select t1.tên viết tắt của lỗi , t3.mô tả về kỹ năng from lỗi bộ phận as t1 join kỹ năng cần để sửa chữa as t2 on t1.id bộ phận bị lỗi = t2.id bộ phận bị lỗi join kỹ năng as t3 on t2.id kỹ năng = t3.id kỹ năng	assets_maintenance
select t1.tên bộ phận , count ( * ) from bộ phận as t1 join bộ phận của tài sản as t2 on t1.id bộ phận = t2.id bộ phận group by t1.tên bộ phận	assets_maintenance
select t1.mô tả về lỗi , t2.tình trạng lỗi from nhật ký lỗi as t1 join nhật ký của lỗi bộ phận as t2 on t1.id mục nhập của nhật ký lỗi = t2.id mục nhập của nhật ký lỗi	assets_maintenance
select count ( * ) , t1.id mục nhập của nhật ký lỗi from nhật ký lỗi as t1 join chuyến thăm của kỹ sư as t2 on t1.id mục nhập của nhật ký lỗi = t2.id mục nhập của nhật ký lỗi group by t1.id mục nhập của nhật ký lỗi order by count ( * ) desc limit 1	assets_maintenance
select distinct họ from kỹ sư bảo trì	assets_maintenance
select distinct tình trạng lỗi from nhật ký của lỗi bộ phận	assets_maintenance
select tên , họ from kỹ sư bảo trì where id kỹ sư not in ( select id kỹ sư from chuyến thăm của kỹ sư )	assets_maintenance
select id tài sản , chi tiết tài sản , thương hiệu tài sản , mẫu mã tài sản from tài sản	assets_maintenance
select ngày mua tài sản from tài sản order by ngày mua tài sản asc limit 1	assets_maintenance
select t1.id bộ phận , t1.tên bộ phận from bộ phận as t1 join lỗi bộ phận as t2 on t1.id bộ phận = t2.id bộ phận join kỹ năng cần để sửa chữa as t3 on t2.id bộ phận bị lỗi = t3.id bộ phận bị lỗi group by t1.id bộ phận order by count ( * ) desc limit 1	assets_maintenance
select t1.tên bộ phận from bộ phận as t1 join lỗi bộ phận as t2 on t1.id bộ phận = t2.id bộ phận group by t1.tên bộ phận order by count ( * ) asc limit 1	assets_maintenance
select t1.id kỹ sư , t1.tên , t1.họ from kỹ sư bảo trì as t1 join chuyến thăm của kỹ sư as t2 on t1.id kỹ sư = t2.id kỹ sư group by t1.id kỹ sư order by count ( * ) asc limit 1	assets_maintenance
select t1.tên nhân viên , t3.tên , t3.họ from nhân viên as t1 join chuyến thăm của kỹ sư as t2 on t1.id nhân viên = t2.id nhân viên liên lạc join kỹ sư bảo trì as t3 on t2.id kỹ sư = t3.id kỹ sư	assets_maintenance
select t1.id mục nhập của nhật ký lỗi , t1.mô tả về lỗi , t1.thời gian mục nhập của nhật ký lỗi from nhật ký lỗi as t1 join nhật ký của lỗi bộ phận as t2 on t1.id mục nhập của nhật ký lỗi = t2.id mục nhập của nhật ký lỗi group by t1.id mục nhập của nhật ký lỗi order by count ( * ) desc limit 1	assets_maintenance
select t1.id kỹ năng , t1.mô tả về kỹ năng from kỹ năng as t1 join kỹ năng cần để sửa chữa as t2 on t1.id kỹ năng = t2.id kỹ năng group by t1.id kỹ năng order by count ( * ) desc limit 1	assets_maintenance
select distinct mẫu mã tài sản from tài sản	assets_maintenance
select thương hiệu tài sản , mẫu mã tài sản , chi tiết tài sản from tài sản order by ngày thanh lý tài sản asc	assets_maintenance
select id bộ phận , số tiền phải trả from bộ phận order by số tiền phải trả asc limit 1	assets_maintenance
select t1.tên công ty from công ty bên thứ ba as t1 join hợp đồng bảo trì as t2 on t1.id công ty = t2.id hợp đồng bảo trì của công ty order by t2.ngày bắt đầu hợp đồng asc limit 1	assets_maintenance
select t1.tên công ty from công ty bên thứ ba as t1 join hợp đồng bảo trì as t2 on t1.id công ty = t2.id hợp đồng bảo trì của công ty order by t2.ngày kết thúc hợp đồng desc limit 1	assets_maintenance
select giới tính from nhân viên group by giới tính order by count ( * ) desc limit 1	assets_maintenance
select t1.tên nhân viên , count ( * ) from nhân viên as t1 join chuyến thăm của kỹ sư as t2 on t1.id nhân viên = t2.id nhân viên liên lạc group by t1.tên nhân viên	assets_maintenance
select mẫu mã tài sản from tài sản where id tài sản not in (select id tài sản from nhật ký lỗi)	assets_maintenance
select count ( * ) from sách	book_2
select tác giả from sách order by tác giả asc	book_2
select tiêu đề from sách order by số lượng phát hành asc	book_2
select tiêu đề from sách where tác giả != "Elaine Lee"	book_2
select tiêu đề , số lượng phát hành from sách	book_2
select ngày xuất bản from ấn phẩm order by giá bán desc	book_2
select distinct nhà xuất bản from ấn phẩm where giá bán > 5000000	book_2
select nhà xuất bản from ấn phẩm order by giá bán desc limit 1	book_2
select ngày xuất bản from ấn phẩm order by giá bán asc limit 3	book_2
select t1.tiêu đề , t2.ngày xuất bản from sách as t1 join ấn phẩm as t2 on t1.id sách = t2.id sách	book_2
select t1.tác giả from sách as t1 join ấn phẩm as t2 on t1.id sách = t2.id sách where t2.giá bán > 4000000	book_2
select t1.tiêu đề from sách as t1 join ấn phẩm as t2 on t1.id sách = t2.id sách order by t2.giá bán desc	book_2
select nhà xuất bản from ấn phẩm group by nhà xuất bản having count ( * ) > 1	book_2
select nhà xuất bản , count ( * ) from ấn phẩm group by nhà xuất bản	book_2
select ngày xuất bản from ấn phẩm group by ngày xuất bản order by count ( * ) desc limit 1	book_2
select tác giả from sách group by tác giả having count ( * ) > 1	book_2
select tiêu đề from sách where id sách not in ( select id sách from ấn phẩm )	book_2
select nhà xuất bản from ấn phẩm where giá bán > 10000000 intersect select nhà xuất bản from ấn phẩm where giá bán < 5000000	book_2
select count ( distinct ngày xuất bản ) from ấn phẩm	book_2
select count ( distinct ngày xuất bản ) from ấn phẩm	book_2
select giá bán from ấn phẩm where nhà xuất bản = "Person" or nhà xuất bản = "Wiley"	book_2
select tên bộ phận from bộ phận order by ngày bắt đầu quản lý	company_1
select tên người phụ thuộc from người phụ thuộc where mối quan hệ = "Spouse"	company_1
select count ( * ) from người phụ thuộc where giới tính = "F"	company_1
select t1.tên bộ phận from bộ phận as t1 join địa điểm của bộ phận as t2 on t1.mã số bộ phận = t2.mã số bộ phận where t2.địa điểm bộ phận = "Houston"	company_1
select tên , họ from nhân viên where lương > 30000	company_1
select count ( * ) , giới tính from nhân viên where lương < 50000 group by giới tính	company_1
select tên , họ , địa chỉ from nhân viên order by ngày sinh	company_1
select count ( * ) from giáo viên	course_teach
select count ( * ) from giáo viên	course_teach
select tên from giáo viên order by tuổi asc	course_teach
select tên from giáo viên order by tuổi asc	course_teach
select tuổi , quê quán from giáo viên	course_teach
select tuổi , quê quán from giáo viên	course_teach
select tên from giáo viên where quê quán != "Little Lever Urban Distric"	course_teach
select tên from giáo viên where quê quán != "Little Lever Urban Distric"	course_teach
select tên from giáo viên where tuổi = 32 or tuổi = 33	course_teach
select tên from giáo viên where tuổi = 32 or tuổi = 33	course_teach
select quê quán from giáo viên order by tuổi asc limit 1	course_teach
select quê quán from giáo viên order by tuổi asc limit 1	course_teach
select quê quán , count ( * ) from giáo viên group by quê quán	course_teach
select quê quán , count ( * ) from giáo viên group by quê quán	course_teach
select quê quán from giáo viên group by quê quán order by count ( * ) desc limit 1	course_teach
select quê quán from giáo viên group by quê quán order by count ( * ) desc limit 1	course_teach
select quê quán from giáo viên group by quê quán having count ( * ) >= 2	course_teach
select quê quán from giáo viên group by quê quán having count ( * ) >= 2	course_teach
select t3.tên , t2.khoá học from sắp xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo viên as t3 on t1.id giáo viên = t3.id giáo viên	course_teach
select t3.tên , t2.khoá học from sắp xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo viên as t3 on t1.id giáo viên = t3.id giáo viên	course_teach
select t3.tên , t2.khoá học from sắp xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo viên as t3 on t1.id giáo viên = t3.id giáo viên order by t3.tên	course_teach
select t3.tên , t2.khoá học from sắp xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo viên as t3 on t1.id giáo viên = t3.id giáo viên order by t3.tên	course_teach
select t3.tên from sắp xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo viên as t3 on t1.id giáo viên = t3.id giáo viên where t2.khoá học = "Math"	course_teach
select t3.tên from sắp xếp khoá học as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học join giáo viên as t3 on t1.id giáo viên = t3.id giáo viên where t2.khoá học = "Math"	course_teach
select t2.tên , count ( * ) from sắp xếp khoá học as t1 join giáo viên as t2 on t1.id giáo viên = t2.id giáo viên group by t2.tên	course_teach
select t2.tên , count ( * ) from sắp xếp khoá học as t1 join giáo viên as t2 on t1.id giáo viên = t2.id giáo viên group by t2.tên	course_teach
select t2.tên from sắp xếp khoá học as t1 join giáo viên as t2 on t1.id giáo viên = t2.id giáo viên group by t2.tên having count ( * ) >= 2	course_teach
select t2.tên from sắp xếp khoá học as t1 join giáo viên as t2 on t1.id giáo viên = t2.id giáo viên group by t2.tên having count ( * ) >= 2	course_teach
select tên from giáo viên where id giáo viên not in ( select id giáo viên from sắp xếp khoá học )	course_teach
select tên from giáo viên where id giáo viên not in ( select id giáo viên from sắp xếp khoá học )	course_teach
select count ( * ) from thành viên	decoration_competition
select tên from thành viên order by tên asc	decoration_competition
select tên , quốc gia from thành viên	decoration_competition
select tên from thành viên where quốc gia = "United States" or quốc gia = "Canada"	decoration_competition
select quốc gia , count ( * ) from thành viên group by quốc gia	decoration_competition
select quốc gia from thành viên group by quốc gia order by count ( * ) desc limit 1	decoration_competition
select quốc gia from thành viên group by quốc gia having count ( * ) > 2	decoration_competition
select tên lãnh đạo , địa điểm trường đại học from trường đại học	decoration_competition
select t2.tên , t1.tên from trường đại học as t1 join thành viên as t2 on t1.id đại học = t2.id đại học	decoration_competition
select t2.tên , t1.địa điểm trường đại học from trường đại học as t1 join thành viên as t2 on t1.id đại học = t2.id đại học order by t2.tên asc	decoration_competition
select distinct t1.tên lãnh đạo from trường đại học as t1 join thành viên as t2 on t1.id đại học = t2.id đại học where t2.quốc gia = "Canada"	decoration_competition
select t1.tên , t2.chủ đề trang trí from thành viên as t1 join vòng as t2 on t1.id thành viên = t2.id thành viên	decoration_competition
select t1.tên from thành viên as t1 join vòng as t2 on t1.id thành viên = t2.id thành viên where t2.xếp hạng từng vòng > 3	decoration_competition
select t1.tên from thành viên as t1 join vòng as t2 on t1.id thành viên = t2.id thành viên order by xếp hạng từng vòng asc	decoration_competition
select tên from thành viên where id thành viên not in ( select id thành viên from vòng )	decoration_competition
select count ( * ) from cuộc bầu cử	election_representative
select số lượng phiếu bầu from cuộc bầu cử order by số lượng phiếu bầu desc	election_representative
select ngày , tỉ lệ phiếu bầu from cuộc bầu cử	election_representative
select min ( tỉ lệ phiếu bầu ) , max ( tỉ lệ phiếu bầu ) from cuộc bầu cử	election_representative
select tên , đảng from đại diện	election_representative
select tên from đại diện where đảng != "Republican"	election_representative
select tuổi thọ from đại diện where tiểu bang = "New York" or tiểu bang = "Indiana"	election_representative
select t2.tên , t1.ngày from cuộc bầu cử as t1 join đại diện as t2 on t1.id đại diện = t2.id đại diện	election_representative
select t2.tên from cuộc bầu cử as t1 join đại diện as t2 on t1.id đại diện = t2.id đại diện where số lượng phiếu bầu > 10000	election_representative
select t2.tên from cuộc bầu cử as t1 join đại diện as t2 on t1.id đại diện = t2.id đại diện order by số lượng phiếu bầu desc	election_representative
select t2.đảng from cuộc bầu cử as t1 join đại diện as t2 on t1.id đại diện = t2.id đại diện order by số lượng phiếu bầu asc limit 1	election_representative
select t2.tuổi thọ from cuộc bầu cử as t1 join đại diện as t2 on t1.id đại diện = t2.id đại diện order by tỉ lệ phiếu bầu desc	election_representative
select avg ( t1.số lượng phiếu bầu ) from cuộc bầu cử as t1 join đại diện as t2 on t1.id đại diện = t2.id đại diện where t2.đảng = "Republican"	election_representative
select đảng , count ( * ) from đại diện group by đảng	election_representative
select đảng , count ( * ) from đại diện group by đảng order by count ( * ) desc limit 1	election_representative
select đảng from đại diện group by đảng having count ( * ) >= 3	election_representative
select tiểu bang from đại diện group by tiểu bang having count ( * ) >= 2	election_representative
select tên from đại diện where id đại diện not in ( select id đại diện from cuộc bầu cử )	election_representative
select đảng from đại diện where tiểu bang = "New York" intersect select đảng from đại diện where tiểu bang = "Pennsylvania"	election_representative
select count ( distinct đảng ) from đại diện	election_representative
select count ( * ) from quốc gia	match_season
select count ( * ) from quốc gia	match_season
select tên quốc gia , thủ đô from quốc gia	match_season
select tên quốc gia , thủ đô from quốc gia	match_season
select ngôn ngữ bản địa chính thức from quốc gia where ngôn ngữ bản địa chính thức like "%English%"	match_season
select ngôn ngữ bản địa chính thức from quốc gia where ngôn ngữ bản địa chính thức like "%English%"	match_season
select distinct vị trí from trận đấu trong mùa giải	match_season
select distinct vị trí from trận đấu trong mùa giải	match_season
select cầu thủ from trận đấu trong mùa giải where trường đại học = "UCLA"	match_season
select cầu thủ from trận đấu trong mùa giải where trường đại học = "UCLA"	match_season
select distinct vị trí from trận đấu trong mùa giải where trường đại học = "UCLA" or trường đại học = "Duke"	match_season
select distinct vị trí from trận đấu trong mùa giải where trường đại học = "UCLA" or trường đại học = "Duke"	match_season
select mã số tuyển chọn tân binh , mùa tuyển chọn from trận đấu trong mùa giải where vị trí = "Defender"	match_season
select mã số tuyển chọn tân binh , mùa tuyển chọn from trận đấu trong mùa giải where vị trí = "Defender"	match_season
select count ( distinct đội ) from trận đấu trong mùa giải	match_season
select count ( distinct đội ) from trận đấu trong mùa giải	match_season
select cầu thủ , số năm đã chơi from cầu thủ	match_season
select cầu thủ , số năm đã chơi from cầu thủ	match_season
select tên from đội	match_season
select tên from đội	match_season
select t2.mùa giải , t2.cầu thủ , t1.tên quốc gia from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia	match_season
select t2.mùa giải , t2.cầu thủ , t1.tên quốc gia from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia	match_season
select t2.cầu thủ from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t1.tên quốc gia = "Indonesia"	match_season
select t2.cầu thủ from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t1.tên quốc gia = "Indonesia"	match_season
select distinct t2.vị trí from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t1.thủ đô = "Dublin"	match_season
select distinct t2.vị trí from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t1.thủ đô = "Dublin"	match_season
select t1.ngôn ngữ bản địa chính thức from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.trường đại học = "Maryland" or t2.trường đại học = "Duke"	match_season
select t1.ngôn ngữ bản địa chính thức from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.trường đại học = "Maryland" or t2.trường đại học = "Duke"	match_season
select count ( distinct t1.ngôn ngữ bản địa chính thức ) from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.vị trí = "Defender"	match_season
select count ( distinct t1.ngôn ngữ bản địa chính thức ) from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.vị trí = "Defender"	match_season
select t1.mùa giải , t1.cầu thủ , t2.tên from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội	match_season
select t1.mùa giải , t1.cầu thủ , t2.tên from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội	match_season
select t1.vị trí from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Ryley Goldner"	match_season
select t1.vị trí from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Ryley Goldner"	match_season
select count ( distinct t1.trường đại học ) from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select count ( distinct t1.trường đại học ) from trận đấu trong mùa giải as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select t1.cầu thủ , t1.số năm đã chơi from cầu thủ as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select t1.cầu thủ , t1.số năm đã chơi from cầu thủ as t1 join đội as t2 on t1.đội = t2.id đội where t2.tên = "Columbus Crew"	match_season
select vị trí , count ( * ) from trận đấu trong mùa giải group by vị trí	match_season
select vị trí , count ( * ) from trận đấu trong mùa giải group by vị trí	match_season
select tên quốc gia , count ( * ) from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia group by t1.tên quốc gia	match_season
select tên quốc gia , count ( * ) from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia group by t1.tên quốc gia	match_season
select cầu thủ from trận đấu trong mùa giải order by trường đại học asc	match_season
select cầu thủ from trận đấu trong mùa giải order by trường đại học asc	match_season
select vị trí from trận đấu trong mùa giải group by vị trí order by count ( * ) desc limit 1	match_season
select vị trí from trận đấu trong mùa giải group by vị trí order by count ( * ) desc limit 1	match_season
select trường đại học from trận đấu trong mùa giải group by trường đại học order by count ( * ) desc limit 3	match_season
select trường đại học from trận đấu trong mùa giải group by trường đại học order by count ( * ) desc limit 3	match_season
select trường đại học from trận đấu trong mùa giải group by trường đại học having count ( * ) >= 2	match_season
select trường đại học from trận đấu trong mùa giải group by trường đại học having count ( * ) >= 2	match_season
select trường đại học from trận đấu trong mùa giải group by trường đại học having count ( * ) >= 2 order by trường đại học desc	match_season
select trường đại học from trận đấu trong mùa giải group by trường đại học having count ( * ) >= 2 order by trường đại học desc	match_season
select tên from đội where id đội not in ( select đội from trận đấu trong mùa giải )	match_season
select tên from đội where id đội not in ( select đội from trận đấu trong mùa giải )	match_season
select t1.tên quốc gia from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.vị trí = "Forward" intersect select t1.tên quốc gia from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.vị trí = "Defender"	match_season
select t1.tên quốc gia from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.vị trí = "Forward" intersect select t1.tên quốc gia from quốc gia as t1 join trận đấu trong mùa giải as t2 on t1.id quốc gia = t2.quốc gia where t2.vị trí = "Defender"	match_season
select trường đại học from trận đấu trong mùa giải where vị trí = "Midfielder" intersect select trường đại học from trận đấu trong mùa giải where vị trí = "Defender"	match_season
select trường đại học from trận đấu trong mùa giải where vị trí = "Midfielder" intersect select trường đại học from trận đấu trong mùa giải where vị trí = "Defender"	match_season
select count ( * ) from tội phạm	perpetrator
select ngày from tội phạm order by số người bị giết desc	perpetrator
select số người bị thương from tội phạm order by số người bị thương asc	perpetrator
select avg ( số người bị thương ) from tội phạm	perpetrator
select địa điểm from tội phạm order by số người bị giết desc limit 1	perpetrator
select tên from cá nhân order by chiều cao asc	perpetrator
select t1.tên from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân	perpetrator
select t1.tên from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân where t2.quốc gia != "China"	perpetrator
select t1.tên from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân order by t1.cân nặng desc limit 1	perpetrator
select sum ( t2.số người bị giết ) from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân where t1.chiều cao > 1.84	perpetrator
select t1.tên from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân where t2.quốc gia = "China" or t2.quốc gia = "Japan"	perpetrator
select t1.chiều cao from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân order by t2.số người bị thương desc	perpetrator
select quốc gia , count ( * ) from tội phạm group by quốc gia	perpetrator
select quốc gia , count ( * ) from tội phạm group by quốc gia order by count ( * ) desc limit 1	perpetrator
select quốc gia , count ( * ) from tội phạm group by quốc gia having count ( * ) >= 2	perpetrator
select t1.tên from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân order by t2.năm desc	perpetrator
select tên from cá nhân where id cá nhân not in ( select id cá nhân from tội phạm )	perpetrator
select quốc gia from tội phạm where số người bị thương > 50 intersect select quốc gia from tội phạm where số người bị thương < 20	perpetrator
select count ( distinct địa điểm ) from tội phạm	perpetrator
select t2.ngày from cá nhân as t1 join tội phạm as t2 on t1.id cá nhân = t2.id cá nhân order by t1.chiều cao desc limit 1	perpetrator
select max ( năm ) from tội phạm	perpetrator
select chính quyền địa phương , dịch vụ from nhà ga	station_weather
select số hiệu tàu , tên from tàu hoả order by thời gian	station_weather
select thời gian , số hiệu tàu from tàu hoả where điểm đến = "Chennai" order by thời gian	station_weather
select count ( * ) from tàu hoả where tên like "%Express%"	station_weather
select số hiệu tàu , thời gian from tàu hoả where điểm khởi hành = "Chennai" and điểm đến = "Guruvayur"	station_weather
select điểm khởi hành , count ( * ) from tàu hoả group by điểm khởi hành	station_weather
select t1.tên from tàu hoả as t1 join lộ trình as t2 on t1.id = t2.id tàu group by t2.id tàu order by count ( * ) desc limit 1	station_weather
select count ( * ) , t1.tên mạng lưới , t1.dịch vụ from nhà ga as t1 join lộ trình as t2 on t1.id = t2.id nhà ga group by t2.id nhà ga	station_weather
select avg ( nhiệt độ cao ) , ngày trong tuần from thời tiết hàng tuần group by ngày trong tuần	station_weather
select max ( t1.nhiệt độ thấp ) , avg ( t1.lượng mưa ) from thời tiết hàng tuần as t1 join nhà ga as t2 on t1.id nhà ga = t2.id where t2.tên mạng lưới = "Amersham"	station_weather
select t3.tên , t3.thời gian from nhà ga as t1 join lộ trình as t2 on t1.id = t2.id nhà ga join tàu hoả as t3 on t2.id tàu = t3.id where t1.chính quyền địa phương = "Chiltern"	station_weather
select count ( distinct dịch vụ ) from nhà ga	station_weather
select t2.id , t2.chính quyền địa phương from thời tiết hàng tuần as t1 join nhà ga as t2 on t1.id nhà ga = t2.id group by t1.id nhà ga order by avg ( nhiệt độ cao ) desc limit 1	station_weather
select t2.id , t2.chính quyền địa phương from thời tiết hàng tuần as t1 join nhà ga as t2 on t1.id nhà ga = t2.id group by t1.id nhà ga having max ( t1.lượng mưa ) > 50	station_weather
select min ( nhiệt độ thấp ) , max ( tốc độ gió mph ) from thời tiết hàng tuần	station_weather
select điểm khởi hành from tàu hoả group by điểm khởi hành having count ( * ) > 1	station_weather
select count ( * ) from nhà thờ where ngày mở cửa < 1850	wedding
select tên , ngày mở cửa , được tổ chức bởi from nhà thờ	wedding
select tên from nhà thờ order by ngày mở cửa desc	wedding
select ngày mở cửa from nhà thờ group by ngày mở cửa having count ( * ) >= 2	wedding
select được tổ chức bởi , tên from nhà thờ where ngày mở cửa between 1830 and 1840	wedding
select ngày mở cửa , count ( * ) from nhà thờ group by ngày mở cửa	wedding
select tên , ngày mở cửa from nhà thờ order by ngày mở cửa desc limit 3	wedding
select count ( * ) from cá nhân where là nam hay nữ = "F" and tuổi > 30	wedding
select quốc gia from cá nhân where tuổi < 25 intersect select quốc gia from cá nhân where tuổi > 30	wedding
select min ( tuổi ) , max ( tuổi ) , avg ( tuổi ) from cá nhân	wedding
select tên , quốc gia from cá nhân where tuổi < ( select avg ( tuổi ) from cá nhân )	wedding
select t2.tên , t3.tên from lễ cưới as t1 join cá nhân as t2 on t1.id nam = t2.id cá nhân join cá nhân as t3 on t1.id nữ = t3.id cá nhân where t1.năm > 2014	wedding
select tên , tuổi from cá nhân where là nam hay nữ = "T" and id cá nhân not in ( select id nam from lễ cưới )	wedding
select tên from nhà thờ except select t1.tên from nhà thờ as t1 join lễ cưới as t2 on t1.id nhà thờ = t2.id nhà thờ where t2.năm = 2015	wedding
select t1.tên from nhà thờ as t1 join lễ cưới as t2 on t1.id nhà thờ = t2.id nhà thờ group by t1.id nhà thờ having count ( * ) >= 2	wedding
select t2.tên from lễ cưới as t1 join cá nhân as t2 on t1.id nữ = t2.id cá nhân where t1.năm = 2016 and t2.là nam hay nữ = "F" and t2.quốc gia = "Canada"	wedding
select count ( * ) from lễ cưới where năm = 2016	wedding
select t4.tên from lễ cưới as t1 join cá nhân as t2 on t1.id nam = t2.id cá nhân join cá nhân as t3 on t1.id nữ = t3.id cá nhân join nhà thờ as t4 on t4.id nhà thờ = t1.id nhà thờ where t2.tuổi > 30 or t3.tuổi > 30	wedding
select quốc gia , count ( * ) from cá nhân group by quốc gia	wedding
select count ( distinct id nhà thờ ) from lễ cưới where năm = 2016	wedding
select count ( * ) from giảng viên	activity_1
select count ( * ) from giảng viên	activity_1
select distinct ngạch from giảng viên	activity_1
select distinct ngạch from giảng viên	activity_1
select distinct toà nhà from giảng viên	activity_1
select distinct toà nhà from giảng viên	activity_1
select ngạch , tên , họ from giảng viên	activity_1
select ngạch , tên , họ from giảng viên	activity_1
select tên , họ , số điện thoại from giảng viên where giới tính = "F"	activity_1
select tên , họ , số điện thoại from giảng viên where giới tính = "F"	activity_1
select id giảng viên from giảng viên where giới tính = "M"	activity_1
select id giảng viên from giảng viên where giới tính = "M"	activity_1
select count ( * ) from giảng viên where giới tính = "F" and ngạch = "Professor"	activity_1
select count ( * ) from giảng viên where giới tính = "F" and ngạch = "Professor"	activity_1
select số điện thoại , số phòng , toà nhà from giảng viên where tên = "Jerry" and họ = "Prince"	activity_1
select số điện thoại , số phòng , toà nhà from giảng viên where tên = "Jerry" and họ = "Prince"	activity_1
select count ( * ) from giảng viên where ngạch = "Professor" and toà nhà = "NEB"	activity_1
select count ( * ) from giảng viên where ngạch = "Professor" and toà nhà = "NEB"	activity_1
select tên , họ from giảng viên where ngạch = "Instructor"	activity_1
select tên , họ from giảng viên where ngạch = "Instructor"	activity_1
select toà nhà , count ( * ) from giảng viên group by toà nhà	activity_1
select toà nhà , count ( * ) from giảng viên group by toà nhà	activity_1
select toà nhà from giảng viên group by toà nhà order by count ( * ) desc limit 1	activity_1
select toà nhà from giảng viên group by toà nhà order by count ( * ) desc limit 1	activity_1
select toà nhà from giảng viên where ngạch = "Professor" group by toà nhà having count ( * ) >= 10	activity_1
select toà nhà from giảng viên where ngạch = "Professor" group by toà nhà having count ( * ) >= 10	activity_1
select ngạch , count ( * ) from giảng viên group by ngạch	activity_1
select ngạch , count ( * ) from giảng viên group by ngạch	activity_1
select ngạch , giới tính , count ( * ) from giảng viên group by ngạch , giới tính	activity_1
select ngạch , giới tính , count ( * ) from giảng viên group by ngạch , giới tính	activity_1
select ngạch from giảng viên group by ngạch order by count ( * ) asc limit 1	activity_1
select ngạch from giảng viên group by ngạch order by count ( * ) asc limit 1	activity_1
select giới tính , count ( * ) from giảng viên where ngạch = "AsstProf" group by giới tính	activity_1
select giới tính , count ( * ) from giảng viên where ngạch = "AsstProf" group by giới tính	activity_1
select t1.tên , t1.họ from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn where t2.tên = "Linda" and t2.họ = "Smith"	activity_1
select t1.tên , t1.họ from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn where t2.tên = "Linda" and t2.họ = "Smith"	activity_1
select t2.id sinh viên from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn where t1.ngạch = "Professor"	activity_1
select t2.id sinh viên from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn where t1.ngạch = "Professor"	activity_1
select t2.tên , t2.họ from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn where t1.tên = "Michael" and t1.họ = "Goodrich"	activity_1
select t2.tên , t2.họ from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn where t1.tên = "Michael" and t1.họ = "Goodrich"	activity_1
select t1.id giảng viên , count ( * ) from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.id giảng viên	activity_1
select t1.id giảng viên , count ( * ) from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.id giảng viên	activity_1
select t1.ngạch , count ( * ) from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.ngạch	activity_1
select t1.ngạch , count ( * ) from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.ngạch	activity_1
select t1.tên , t1.họ from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.id giảng viên order by count ( * ) desc limit 1	activity_1
select t1.tên , t1.họ from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.id giảng viên order by count ( * ) desc limit 1	activity_1
select t1.id giảng viên from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.id giảng viên having count ( * ) >= 2	activity_1
select t1.id giảng viên from giảng viên as t1 join sinh viên as t2 on t1.id giảng viên = t2.cố vấn group by t1.id giảng viên having count ( * ) >= 2	activity_1
select id giảng viên from giảng viên except select cố vấn from sinh viên	activity_1
select id giảng viên from giảng viên except select cố vấn from sinh viên	activity_1
select tên hoạt động from hoạt động	activity_1
select tên hoạt động from hoạt động	activity_1
select count ( * ) from hoạt động	activity_1
select count ( * ) from hoạt động	activity_1
select count ( distinct id giảng viên ) from giảng viên tham gia vào	activity_1
select count ( distinct id giảng viên ) from giảng viên tham gia vào	activity_1
select id giảng viên from giảng viên except select id giảng viên from giảng viên tham gia vào	activity_1
select id giảng viên from giảng viên except select id giảng viên from giảng viên tham gia vào	activity_1
select id giảng viên from giảng viên tham gia vào intersect select cố vấn from sinh viên	activity_1
select id giảng viên from giảng viên tham gia vào intersect select cố vấn from sinh viên	activity_1
select count ( * ) from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select count ( * ) from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select t3.tên hoạt động from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t3.id hoạt động = t2.id hoạt động where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select t3.tên hoạt động from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t3.id hoạt động = t2.id hoạt động where t1.tên = "Mark" and t1.họ = "Giuliano"	activity_1
select t1.tên , t1.họ , count ( * ) , t1.id giảng viên from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên group by t1.id giảng viên	activity_1
select t1.tên , t1.họ , count ( * ) , t1.id giảng viên from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên group by t1.id giảng viên	activity_1
select t1.tên hoạt động , count ( * ) from hoạt động as t1 join giảng viên tham gia vào as t2 on t1.id hoạt động = t2.id hoạt động group by t1.id hoạt động	activity_1
select t1.tên hoạt động , count ( * ) from hoạt động as t1 join giảng viên tham gia vào as t2 on t1.id hoạt động = t2.id hoạt động group by t1.id hoạt động	activity_1
select t1.tên , t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên group by t1.id giảng viên order by count ( * ) desc limit 1	activity_1
select t1.tên , t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên group by t1.id giảng viên order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt động from hoạt động as t1 join giảng viên tham gia vào as t2 on t1.id hoạt động = t2.id hoạt động group by t1.id hoạt động order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt động from hoạt động as t1 join giảng viên tham gia vào as t2 on t1.id hoạt động = t2.id hoạt động group by t1.id hoạt động order by count ( * ) desc limit 1	activity_1
select id sinh viên from sinh viên except select id sinh viên from tham gia vào	activity_1
select id sinh viên from sinh viên except select id sinh viên from tham gia vào	activity_1
select id sinh viên from tham gia vào intersect select id sinh viên from sinh viên where tuổi < 20	activity_1
select id sinh viên from tham gia vào intersect select id sinh viên from sinh viên where tuổi < 20	activity_1
select t1.tên , t1.họ from sinh viên as t1 join tham gia vào as t2 on t1.id sinh viên = t2.id sinh viên group by t1.id sinh viên order by count ( * ) desc limit 1	activity_1
select t1.tên , t1.họ from sinh viên as t1 join tham gia vào as t2 on t1.id sinh viên = t2.id sinh viên group by t1.id sinh viên order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt động from hoạt động as t1 join tham gia vào as t2 on t1.id hoạt động = t2.id hoạt động group by t1.id hoạt động order by count ( * ) desc limit 1	activity_1
select t1.tên hoạt động from hoạt động as t1 join tham gia vào as t2 on t1.id hoạt động = t2.id hoạt động group by t1.id hoạt động order by count ( * ) desc limit 1	activity_1
select distinct t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Canoeing" or t3.tên hoạt động = "Kayaking"	activity_1
select distinct t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Canoeing" or t3.tên hoạt động = "Kayaking"	activity_1
select họ from giảng viên where ngạch = "Professor" except select distinct t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Canoeing" or t3.tên hoạt động = "Kayaking"	activity_1
select họ from giảng viên where ngạch = "Professor" except select distinct t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Canoeing" or t3.tên hoạt động = "Kayaking"	activity_1
select t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Canoeing" intersect select t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Kayaking"	activity_1
select t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Canoeing" intersect select t1.họ from giảng viên as t1 join giảng viên tham gia vào as t2 on t1.id giảng viên = t2.id giảng viên join hoạt động as t3 on t2.id hoạt động = t2.id hoạt động where t3.tên hoạt động = "Kayaking"	activity_1
select t1.id sinh viên from tham gia vào as t1 join hoạt động as t2 on t2.id hoạt động = t2.id hoạt động where t2.tên hoạt động = "Canoeing" intersect select t1.id sinh viên from tham gia vào as t1 join hoạt động as t2 on t2.id hoạt động = t2.id hoạt động where t2.tên hoạt động = "Kayaking"	activity_1
select t1.id sinh viên from tham gia vào as t1 join hoạt động as t2 on t2.id hoạt động = t2.id hoạt động where t2.tên hoạt động = "Canoeing" intersect select t1.id sinh viên from tham gia vào as t1 join hoạt động as t2 on t2.id hoạt động = t2.id hoạt động where t2.tên hoạt động = "Kayaking"	activity_1
select count ( * ) from người luyện thể hình	body_builder
select tổng from người luyện thể hình order by tổng asc	body_builder
select cử giật , cử đẩy from người luyện thể hình order by cử giật asc	body_builder
select avg ( cử giật ) from người luyện thể hình	body_builder
select cử đẩy from người luyện thể hình order by tổng desc limit 1	body_builder
select ngày sinh from cá nhân order by chiều cao asc	body_builder
select t2.tên from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân	body_builder
select t2.tên from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân where t1.tổng > 300	body_builder
select t2.tên from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân order by t2.cân nặng desc limit 1	body_builder
select t2.ngày sinh , t2.nơi sinh from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân order by t1.tổng desc limit 1	body_builder
select t2.chiều cao from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân where t1.tổng < 315	body_builder
select avg ( t1.tổng ) from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân where t2.chiều cao > 200	body_builder
select t2.tên from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân order by t1.tổng desc	body_builder
select nơi sinh , count ( * ) from cá nhân group by nơi sinh	body_builder
select nơi sinh from cá nhân group by nơi sinh order by count ( * ) desc limit 1	body_builder
select nơi sinh from cá nhân group by nơi sinh having count ( * ) >= 2	body_builder
select chiều cao , cân nặng from cá nhân order by chiều cao desc	body_builder
select * from người luyện thể hình	body_builder
select tên , nơi sinh from cá nhân except select t1.tên , t1.nơi sinh from cá nhân as t1 join người luyện thể hình as t2 on t1.id cá nhân = t2.id cá nhân	body_builder
select count ( distinct nơi sinh ) from cá nhân	body_builder
select count ( * ) from cá nhân where id cá nhân not in ( select id cá nhân from người luyện thể hình )	body_builder
select t2.cân nặng from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân where t1.cử giật > 140 or t2.chiều cao > 200	body_builder
select t1.tổng from người luyện thể hình as t1 join cá nhân as t2 on t1.id cá nhân = t2.id cá nhân where t2.ngày sinh like "%January%"	body_builder
select min ( cử giật ) from người luyện thể hình	body_builder
select count ( * ) from ứng cử viên	candidate_poll
select count ( * ) from ứng cử viên	candidate_poll
select nguồn thăm dò ý kiến from ứng cử viên group by nguồn thăm dò ý kiến order by count ( * ) desc limit 1	candidate_poll
select nguồn thăm dò ý kiến from ứng cử viên group by nguồn thăm dò ý kiến order by count ( * ) desc limit 1	candidate_poll
select tỷ lệ ủng hộ from ứng cử viên order by tỷ lệ ủng hộ desc limit 3	candidate_poll
select tỷ lệ ủng hộ from ứng cử viên order by tỷ lệ ủng hộ desc limit 3	candidate_poll
select id ứng cử viên from ứng cử viên order by tỷ lệ phản đối limit 1	candidate_poll
select id ứng cử viên from ứng cử viên order by tỷ lệ phản đối limit 1	candidate_poll
select tỷ lệ ủng hộ , tỷ lệ xem xét , tỷ lệ phản đối from ứng cử viên order by tỷ lệ không chắc chắn	candidate_poll
select tỷ lệ ủng hộ , tỷ lệ xem xét , tỷ lệ phản đối from ứng cử viên order by tỷ lệ không chắc chắn	candidate_poll
select nguồn thăm dò ý kiến from ứng cử viên order by tỷ lệ phản đối desc limit 1	candidate_poll
select nguồn thăm dò ý kiến from ứng cử viên order by tỷ lệ phản đối desc limit 1	candidate_poll
select tên from cá nhân order by ngày sinh	candidate_poll
select tên from cá nhân order by ngày sinh	candidate_poll
select avg ( chiều cao ) , avg ( cân nặng ) from cá nhân where giới tính = "M"	candidate_poll
select avg ( chiều cao ) , avg ( cân nặng ) from cá nhân where giới tính = "M"	candidate_poll
select tên from cá nhân where chiều cao > 200 or chiều cao < 190	candidate_poll
select tên from cá nhân where chiều cao > 200 or chiều cao < 190	candidate_poll
select avg ( cân nặng ) , min ( cân nặng ) , giới tính from cá nhân group by giới tính	candidate_poll
select avg ( cân nặng ) , min ( cân nặng ) , giới tính from cá nhân group by giới tính	candidate_poll
select t1.tên , t1.giới tính from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân order by t2.tỷ lệ ủng hộ desc limit 1	candidate_poll
select t1.tên , t1.giới tính from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân order by t2.tỷ lệ ủng hộ desc limit 1	candidate_poll
select t1.tên , t1.giới tính , min ( tỷ lệ phản đối ) from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân group by t1.giới tính	candidate_poll
select t1.tên , t1.giới tính , min ( tỷ lệ phản đối ) from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân group by t1.giới tính	candidate_poll
select t1.giới tính from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân group by t1.giới tính order by avg ( t2.tỷ lệ không chắc chắn ) desc limit 1	candidate_poll
select t1.giới tính from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân group by t1.giới tính order by avg ( t2.tỷ lệ không chắc chắn ) desc limit 1	candidate_poll
select tên from cá nhân where id cá nhân not in ( select id cá nhân from ứng cử viên )	candidate_poll
select tên from cá nhân where id cá nhân not in ( select id cá nhân from ứng cử viên )	candidate_poll
select t1.tên from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân where t2.tỷ lệ ủng hộ < t2.tỷ lệ phản đối	candidate_poll
select t1.tên from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân where t2.tỷ lệ ủng hộ < t2.tỷ lệ phản đối	candidate_poll
select count ( * ) , giới tính from cá nhân where cân nặng > 85 group by giới tính	candidate_poll
select count ( * ) , giới tính from cá nhân where cân nặng > 85 group by giới tính	candidate_poll
select max ( tỷ lệ ủng hộ ) , min ( tỷ lệ xem xét ) , min ( tỷ lệ phản đối ) from ứng cử viên	candidate_poll
select max ( tỷ lệ ủng hộ ) , min ( tỷ lệ xem xét ) , min ( tỷ lệ phản đối ) from ứng cử viên	candidate_poll
select t1.tên from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân where t1.giới tính = "F" order by t1.tên	candidate_poll
select t1.tên from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id cá nhân where t1.giới tính = "F" order by t1.tên	candidate_poll
select tên from cá nhân where chiều cao < ( select avg ( chiều cao ) from cá nhân )	candidate_poll
select tên from cá nhân where chiều cao < ( select avg ( chiều cao ) from cá nhân )	candidate_poll
select * from cá nhân	candidate_poll
select * from cá nhân	candidate_poll
select thành phố chủ nhà from thành phố chủ nhà order by năm desc limit 1	city_record
select thành phố chủ nhà from thành phố chủ nhà order by năm desc limit 1	city_record
select id trận đấu from trận đấu where giải đấu = "1994 FIFA World Cup qualification"	city_record
select id trận đấu from trận đấu where giải đấu = "1994 FIFA World Cup qualification"	city_record
select t1.thành phố from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà where t2.năm > 2010	city_record
select t1.thành phố from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà where t2.năm > 2010	city_record
select t1.thành phố from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà group by t2.thành phố chủ nhà order by count ( * ) desc limit 1	city_record
select t1.thành phố from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà group by t2.thành phố chủ nhà order by count ( * ) desc limit 1	city_record
select t3.địa điểm from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà join trận đấu as t3 on t2.id trận đấu = t3.id trận đấu where t1.thành phố = "Nanjing ( Jiangsu )" and t3.giải đấu = "1994 FIFA World Cup qualification"	city_record
select t3.địa điểm from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà join trận đấu as t3 on t2.id trận đấu = t3.id trận đấu where t1.thành phố = "Nanjing ( Jiangsu )" and t3.giải đấu = "1994 FIFA World Cup qualification"	city_record
select t2.tháng một from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t1.thành phố = "Shanghai"	city_record
select t2.tháng một from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t1.thành phố = "Shanghai"	city_record
select t2.năm from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà where t1.thành phố = "Taizhou ( Zhejiang )"	city_record
select t2.năm from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà where t1.thành phố = "Taizhou ( Zhejiang )"	city_record
select thành phố from thành phố order by dân số khu vực desc limit 3	city_record
select thành phố from thành phố order by dân số khu vực desc limit 3	city_record
select thành phố , gdp from thành phố order by gdp limit 1	city_record
select thành phố , gdp from thành phố order by gdp limit 1	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố order by t2.tháng hai desc limit 1	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố order by t2.tháng hai desc limit 1	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng ba < t2.tháng bảy or t2.tháng ba > t2.tháng mười	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng ba < t2.tháng bảy or t2.tháng ba > t2.tháng mười	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng ba < t2.tháng bảy intersect select t3.thành phố from thành phố as t3 join thành phố chủ nhà as t4 on t3.id thành phố = t4.thành phố chủ nhà	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng ba < t2.tháng bảy intersect select t3.thành phố from thành phố as t3 join thành phố chủ nhà as t4 on t3.id thành phố = t4.thành phố chủ nhà	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng ba < t2.tháng mười hai except select t3.thành phố from thành phố as t3 join thành phố chủ nhà as t4 on t3.id thành phố = t4.thành phố chủ nhà	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng ba < t2.tháng mười hai except select t3.thành phố from thành phố as t3 join thành phố chủ nhà as t4 on t3.id thành phố = t4.thành phố chủ nhà	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng hai > t2.tháng sáu union select t3.thành phố from thành phố as t3 join thành phố chủ nhà as t4 on t3.id thành phố = t4.thành phố chủ nhà	city_record
select t1.thành phố from thành phố as t1 join nhiệt độ as t2 on t1.id thành phố = t2.id thành phố where t2.tháng hai > t2.tháng sáu union select t3.thành phố from thành phố as t3 join thành phố chủ nhà as t4 on t3.id thành phố = t4.thành phố chủ nhà	city_record
select thành phố from thành phố where dân số khu vực > 10000000	city_record
select thành phố from thành phố where dân số khu vực > 10000000	city_record
select thành phố from thành phố where dân số khu vực > 10000000 union select thành phố from thành phố where dân số khu vực < 5000000	city_record
select thành phố from thành phố where dân số khu vực > 10000000 union select thành phố from thành phố where dân số khu vực < 5000000	city_record
select count ( * ) , giải đấu from trận đấu group by giải đấu	city_record
select count ( * ) , giải đấu from trận đấu group by giải đấu	city_record
select địa điểm from trận đấu order by ngày desc	city_record
select địa điểm from trận đấu order by ngày desc	city_record
select gdp from thành phố order by dân số khu vực desc limit 1	city_record
select gdp from thành phố order by dân số khu vực desc limit 1	city_record
select t1.gdp , t1.dân số khu vực from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà group by t2.thành phố chủ nhà having count ( * ) > 1	city_record
select t1.gdp , t1.dân số khu vực from thành phố as t1 join thành phố chủ nhà as t2 on t1.id thành phố = t2.thành phố chủ nhà group by t2.thành phố chủ nhà having count ( * ) > 1	city_record
select count ( * ) from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Accounting"	college_1
select count ( * ) from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Accounting"	college_1
select count ( distinct mã số nhân viên của giáo sư ) from lớp học where mã khoá học = "ACCT-211"	college_1
select count ( distinct mã số nhân viên của giáo sư ) from lớp học where mã khoá học = "ACCT-211"	college_1
select t3.tên của nhân viên , t3.họ của nhân viên from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa join nhân viên as t3 on t1.mã số nhân viên = t3.mã số nhân viên where tên khoa = "Biology"	college_1
select t3.tên của nhân viên , t3.họ của nhân viên from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa join nhân viên as t3 on t1.mã số nhân viên = t3.mã số nhân viên where tên khoa = "Biology"	college_1
select distinct t1.tên của nhân viên , t1.ngày sinh của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where mã khoá học = "ACCT-211"	college_1
select distinct t1.tên của nhân viên , t1.ngày sinh của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where mã khoá học = "ACCT-211"	college_1
select count ( * ) from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where t1.họ của nhân viên = "Graztevski"	college_1
select count ( * ) from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where t1.họ của nhân viên = "Graztevski"	college_1
select mã trường from khoa where tên khoa = "Accounting"	college_1
select mã trường from khoa where tên khoa = "Accounting"	college_1
select số lượng tín chỉ của khoá học , mô tả về khoá học from khoá học where mã khoá học = "CIS-220"	college_1
select số lượng tín chỉ của khoá học , mô tả về khoá học from khoá học where mã khoá học = "CIS-220"	college_1
select địa chỉ khoa from khoa where tên khoa = "History"	college_1
select địa chỉ khoa from khoa where tên khoa = "History"	college_1
select count ( distinct địa chỉ khoa ) from khoa where mã trường = "BUS"	college_1
select count ( distinct địa chỉ khoa ) from khoa where mã trường = "BUS"	college_1
select count ( distinct địa chỉ khoa ) , mã trường from khoa group by mã trường	college_1
select count ( distinct địa chỉ khoa ) , mã trường from khoa group by mã trường	college_1
select số lượng tín chỉ của khoá học , mô tả về khoá học from khoá học where mã khoá học = "QM-261"	college_1
select số lượng tín chỉ của khoá học , mô tả về khoá học from khoá học where mã khoá học = "QM-261"	college_1
select count ( distinct tên khoa ) , mã trường from khoa group by mã trường	college_1
select count ( distinct tên khoa ) , mã trường from khoa group by mã trường	college_1
select count ( distinct tên khoa ) , mã trường from khoa group by mã trường having count ( distinct tên khoa ) < 5	college_1
select count ( distinct tên khoa ) , mã trường from khoa group by mã trường having count ( distinct tên khoa ) < 5	college_1
select count ( * ) , mã khoá học from lớp học group by mã khoá học	college_1
select count ( * ) , mã khoá học from lớp học group by mã khoá học	college_1
select sum ( số lượng tín chỉ của khoá học ) , mã khoa from khoá học group by mã khoa	college_1
select sum ( số lượng tín chỉ của khoá học ) , mã khoa from khoá học group by mã khoa	college_1
select count ( * ) , phòng học from lớp học group by phòng học having count ( * ) >= 2	college_1
select count ( * ) , phòng học from lớp học group by phòng học having count ( * ) >= 2	college_1
select count ( * ) , mã khoa from lớp học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học group by mã khoa	college_1
select count ( * ) , mã khoa from lớp học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học group by mã khoa	college_1
select count ( * ) , t3.mã trường from lớp học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t2.mã khoa = t3.mã khoa group by t3.mã trường	college_1
select count ( * ) , t3.mã trường from lớp học as t1 join khoá học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t2.mã khoa = t3.mã khoa group by t3.mã trường	college_1
select count ( * ) , t1.mã trường from khoa as t1 join giáo sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã trường	college_1
select count ( * ) , t1.mã trường from khoa as t1 join giáo sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã trường	college_1
select mã công việc của nhân viên , count ( * ) from nhân viên group by mã công việc của nhân viên order by count ( * ) desc limit 1	college_1
select mã công việc của nhân viên , count ( * ) from nhân viên group by mã công việc của nhân viên order by count ( * ) desc limit 1	college_1
select t1.mã trường from khoa as t1 join giáo sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã trường order by count ( * ) limit 1	college_1
select t1.mã trường from khoa as t1 join giáo sư as t2 on t1.mã khoa = t2.mã khoa group by t1.mã trường order by count ( * ) limit 1	college_1
select count ( * ) , mã khoa from giáo sư where bằng cấp cao nhất = "Ph.D." group by mã khoa	college_1
select count ( * ) , mã khoa from giáo sư where bằng cấp cao nhất = "Ph.D." group by mã khoa	college_1
select count ( * ) , mã khoa from sinh viên group by mã khoa	college_1
select count ( * ) , mã khoa from sinh viên group by mã khoa	college_1
select sum ( giờ học của sinh viên ) , mã khoa from sinh viên group by mã khoa	college_1
select sum ( giờ học của sinh viên ) , mã khoa from sinh viên group by mã khoa	college_1
select max ( gpa của sinh viên ) , avg ( gpa của sinh viên ) , min ( gpa của sinh viên ) , mã khoa from sinh viên group by mã khoa	college_1
select max ( gpa của sinh viên ) , avg ( gpa của sinh viên ) , min ( gpa của sinh viên ) , mã khoa from sinh viên group by mã khoa	college_1
select t2.tên khoa , avg ( t1.gpa của sinh viên ) from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by avg ( t1.gpa của sinh viên ) desc limit 1	college_1
select t2.tên khoa , avg ( t1.gpa của sinh viên ) from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by avg ( t1.gpa của sinh viên ) desc limit 1	college_1
select count ( distinct mã trường ) from khoa	college_1
select count ( distinct mã trường ) from khoa	college_1
select count ( distinct mã lớp học ) from lớp học	college_1
select count ( distinct mã lớp học ) from lớp học	college_1
select count ( distinct mã khoá học ) from lớp học	college_1
select count ( distinct mã khoá học ) from lớp học	college_1
select count ( distinct tên khoa ) from khoa	college_1
select count ( distinct tên khoa ) from khoa	college_1
select count ( * ) from khoa as t1 join khoá học as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Computer Info. Systems"	college_1
select count ( * ) from khoa as t1 join khoá học as t2 on t1.mã khoa = t2.mã khoa where tên khoa = "Computer Info. Systems"	college_1
select count ( distinct lớp học phần ) from lớp học where mã khoá học = "ACCT-211"	college_1
select count ( distinct lớp học phần ) from lớp học where mã khoá học = "ACCT-211"	college_1
select sum ( t1.số lượng tín chỉ của khoá học ) , t1.mã khoa from khoá học as t1 join lớp học as t2 on t1.mã khoá học = t2.mã khoá học group by t1.mã khoa	college_1
select sum ( t1.số lượng tín chỉ của khoá học ) , t1.mã khoa from khoá học as t1 join lớp học as t2 on t1.mã khoá học = t2.mã khoá học group by t1.mã khoa	college_1
select t3.tên khoa from khoá học as t1 join lớp học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t1.mã khoa = t3.mã khoa group by t1.mã khoa order by sum ( t1.số lượng tín chỉ của khoá học ) desc limit 1	college_1
select t3.tên khoa from khoá học as t1 join lớp học as t2 on t1.mã khoá học = t2.mã khoá học join khoa as t3 on t1.mã khoa = t3.mã khoa group by t1.mã khoa order by sum ( t1.số lượng tín chỉ của khoá học ) desc limit 1	college_1
select count ( * ) from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp where t1.mã khoá học = "ACCT-211"	college_1
select count ( * ) from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp where t1.mã khoá học = "ACCT-211"	college_1
select t3.tên của sinh viên from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t2.mã số sinh viên = t3.mã số sinh viên where t1.mã khoá học = "ACCT-211"	college_1
select t3.tên của sinh viên from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t2.mã số sinh viên = t3.mã số sinh viên where t1.mã khoá học = "ACCT-211"	college_1
select t3.tên của sinh viên from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t2.mã số sinh viên = t3.mã số sinh viên where t1.mã khoá học = "ACCT-211" and t2.điểm số = "C"	college_1
select t3.tên của sinh viên from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t2.mã số sinh viên = t3.mã số sinh viên where t1.mã khoá học = "ACCT-211" and t2.điểm số = "C"	college_1
select count ( * ) from nhân viên	college_1
select count ( * ) from nhân viên	college_1
select count ( * ) from giáo sư where bằng cấp cao nhất = "Ph.D."	college_1
select count ( * ) from giáo sư where bằng cấp cao nhất = "Ph.D."	college_1
select count ( * ) from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa where t4.tên khoa = "Accounting"	college_1
select count ( * ) from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa where t4.tên khoa = "Accounting"	college_1
select t4.tên khoa from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa group by t3.mã khoa order by count ( * ) desc limit 1	college_1
select t4.tên khoa from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join khoa as t4 on t3.mã khoa = t4.mã khoa group by t3.mã khoa order by count ( * ) desc limit 1	college_1
select tên khoa from khoa order by tên khoa	college_1
select tên khoa from khoa order by tên khoa	college_1
select mã lớp học from lớp học where phòng học = "KLR209"	college_1
select mã lớp học from lớp học where phòng học = "KLR209"	college_1
select tên của nhân viên from nhân viên where mã công việc của nhân viên = "PROF" order by ngày sinh của nhân viên	college_1
select tên của nhân viên from nhân viên where mã công việc của nhân viên = "PROF" order by ngày sinh của nhân viên	college_1
select t2.tên của nhân viên , t1.văn phòng giáo sư from giáo sư as t1 join nhân viên as t2 on t1.mã số nhân viên = t2.mã số nhân viên order by t2.tên của nhân viên	college_1
select t2.tên của nhân viên , t1.văn phòng giáo sư from giáo sư as t1 join nhân viên as t2 on t1.mã số nhân viên = t2.mã số nhân viên order by t2.tên của nhân viên	college_1
select tên của nhân viên , họ của nhân viên from nhân viên order by ngày sinh của nhân viên limit 1	college_1
select tên của nhân viên , họ của nhân viên from nhân viên order by ngày sinh của nhân viên limit 1	college_1
select tên của sinh viên , họ của sinh viên , gpa của sinh viên from sinh viên where gpa của sinh viên > 3 order by ngày sinh của sinh viên desc limit 1	college_1
select tên của sinh viên , họ của sinh viên , gpa của sinh viên from sinh viên where gpa của sinh viên > 3 order by ngày sinh của sinh viên desc limit 1	college_1
select distinct tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên where điểm số = "C"	college_1
select distinct tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên where điểm số = "C"	college_1
select t2.tên khoa from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) limit 1	college_1
select t2.tên khoa from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) limit 1	college_1
select t2.tên khoa , t1.mã khoa from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.bằng cấp cao nhất = "Ph.D." group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select t2.tên khoa , t1.mã khoa from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.bằng cấp cao nhất = "Ph.D." group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select tên của nhân viên from nhân viên where mã công việc của nhân viên = "PROF" except select t1.tên của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư	college_1
select tên của nhân viên from nhân viên where mã công việc của nhân viên = "PROF" except select t1.tên của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư	college_1
select t1.tên của nhân viên from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History" except select t4.tên của nhân viên from nhân viên as t4 join lớp học as t5 on t4.mã số nhân viên = t5.mã số nhân viên của giáo sư	college_1
select t1.tên của nhân viên from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History" except select t4.tên của nhân viên from nhân viên as t4 join lớp học as t5 on t4.mã số nhân viên = t5.mã số nhân viên của giáo sư	college_1
select t1.họ của nhân viên , t2.văn phòng giáo sư from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History"	college_1
select t1.họ của nhân viên , t2.văn phòng giáo sư from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t3.tên khoa = "History"	college_1
select t3.tên khoa , t2.văn phòng giáo sư from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t1.họ của nhân viên = "Heffington"	college_1
select t3.tên khoa , t2.văn phòng giáo sư from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t2.mã khoa = t3.mã khoa where t1.họ của nhân viên = "Heffington"	college_1
select t1.họ của nhân viên , t1.ngày bắt đầu công việc của nhân viên from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên where t2.văn phòng giáo sư = "DRE 102"	college_1
select t1.họ của nhân viên , t1.ngày bắt đầu công việc của nhân viên from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên where t2.văn phòng giáo sư = "DRE 102"	college_1
select t1.mã khoá học from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t3.mã số sinh viên = t2.mã số sinh viên where t3.họ của sinh viên = "Smithson"	college_1
select t1.mã khoá học from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t3.mã số sinh viên = t2.mã số sinh viên where t3.họ của sinh viên = "Smithson"	college_1
select t4.mô tả về khoá học , t4.số lượng tín chỉ của khoá học from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t3.mã số sinh viên = t2.mã số sinh viên join khoá học as t4 on t4.mã khoá học = t1.mã khoá học where t3.họ của sinh viên = "Smithson"	college_1
select t4.mô tả về khoá học , t4.số lượng tín chỉ của khoá học from lớp học as t1 join đăng ký khoá học as t2 on t1.mã lớp học = t2.mã lớp join sinh viên as t3 on t3.mã số sinh viên = t2.mã số sinh viên join khoá học as t4 on t4.mã khoá học = t1.mã khoá học where t3.họ của sinh viên = "Smithson"	college_1
select count ( * ) from giáo sư where bằng cấp cao nhất = "Ph.D." or bằng cấp cao nhất = "MA"	college_1
select count ( * ) from giáo sư where bằng cấp cao nhất = "Ph.D." or bằng cấp cao nhất = "MA"	college_1
select count ( * ) from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t2.tên khoa = "Accounting" or t2.tên khoa = "Biology"	college_1
select count ( * ) from giáo sư as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t2.tên khoa = "Accounting" or t2.tên khoa = "Biology"	college_1
select t1.tên của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where mã khoá học = "CIS-220" intersect select t1.tên của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where mã khoá học = "QM-261"	college_1
select t1.tên của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where mã khoá học = "CIS-220" intersect select t1.tên của nhân viên from nhân viên as t1 join lớp học as t2 on t1.mã số nhân viên = t2.mã số nhân viên của giáo sư where mã khoá học = "QM-261"	college_1
select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Accounting" intersect select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Computer Info. Systems"	college_1
select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Accounting" intersect select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học join khoa as t5 on t5.mã khoa = t4.mã khoa where t5.tên khoa = "Computer Info. Systems"	college_1
select avg ( t2.gpa của sinh viên ) from đăng ký khoá học as t1 join sinh viên as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t1.mã lớp = t3.mã lớp học where t3.mã khoá học = "ACCT-211"	college_1
select avg ( t2.gpa của sinh viên ) from đăng ký khoá học as t1 join sinh viên as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t1.mã lớp = t3.mã lớp học where t3.mã khoá học = "ACCT-211"	college_1
select gpa của sinh viên , số điện thoại của sinh viên , tên của sinh viên from sinh viên order by gpa của sinh viên desc limit 5	college_1
select gpa của sinh viên , số điện thoại của sinh viên , tên của sinh viên from sinh viên order by gpa của sinh viên desc limit 5	college_1
select t2.tên khoa from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa order by gpa của sinh viên limit 1	college_1
select t2.tên khoa from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa order by gpa của sinh viên limit 1	college_1
select tên của sinh viên , gpa của sinh viên from sinh viên where gpa của sinh viên < ( select avg ( gpa của sinh viên ) from sinh viên )	college_1
select tên của sinh viên , gpa của sinh viên from sinh viên where gpa của sinh viên < ( select avg ( gpa của sinh viên ) from sinh viên )	college_1
select t2.tên khoa , t2.địa chỉ khoa from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select t2.tên khoa , t2.địa chỉ khoa from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 1	college_1
select t2.tên khoa , t2.địa chỉ khoa , count ( * ) from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 3	college_1
select t2.tên khoa , t2.địa chỉ khoa , count ( * ) from sinh viên as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa group by t1.mã khoa order by count ( * ) desc limit 3	college_1
select t1.tên của nhân viên , t2.văn phòng giáo sư from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t3.mã khoa = t2.mã khoa where t3.tên khoa = "History" and t2.bằng cấp cao nhất = "Ph.D."	college_1
select t1.tên của nhân viên , t2.văn phòng giáo sư from nhân viên as t1 join giáo sư as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t3.mã khoa = t2.mã khoa where t3.tên khoa = "History" and t2.bằng cấp cao nhất = "Ph.D."	college_1
select t2.tên của nhân viên , t1.mã khoá học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên	college_1
select t2.tên của nhân viên , t1.mã khoá học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên	college_1
select t2.tên của nhân viên , t3.mô tả về khoá học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học	college_1
select t2.tên của nhân viên , t3.mô tả về khoá học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học	college_1
select t2.tên của nhân viên , t4.văn phòng giáo sư , t3.mô tả về khoá học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo sư as t4 on t2.mã số nhân viên = t4.mã số nhân viên	college_1
select t2.tên của nhân viên , t4.văn phòng giáo sư , t3.mô tả về khoá học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo sư as t4 on t2.mã số nhân viên = t4.mã số nhân viên	college_1
select t2.tên của nhân viên , t4.văn phòng giáo sư , t3.mô tả về khoá học , t5.tên khoa from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo sư as t4 on t2.mã số nhân viên = t4.mã số nhân viên join khoa as t5 on t4.mã khoa = t5.mã khoa	college_1
select t2.tên của nhân viên , t4.văn phòng giáo sư , t3.mô tả về khoá học , t5.tên khoa from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join khoá học as t3 on t1.mã khoá học = t3.mã khoá học join giáo sư as t4 on t2.mã số nhân viên = t4.mã số nhân viên join khoa as t5 on t4.mã khoa = t5.mã khoa	college_1
select t1.tên của sinh viên , t1.họ của sinh viên , t4.mô tả về khoá học from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học	college_1
select t1.tên của sinh viên , t1.họ của sinh viên , t4.mô tả về khoá học from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học join khoá học as t4 on t3.mã khoá học = t4.mã khoá học	college_1
select t1.tên của sinh viên , t1.họ của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên where t2.điểm số = "C" or t2.điểm số = "A"	college_1
select t1.tên của sinh viên , t1.họ của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên where t2.điểm số = "C" or t2.điểm số = "A"	college_1
select t2.tên của nhân viên , t1.phòng học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join giáo sư as t3 on t2.mã số nhân viên = t3.mã số nhân viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Accounting"	college_1
select t2.tên của nhân viên , t1.phòng học from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join giáo sư as t3 on t2.mã số nhân viên = t3.mã số nhân viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Accounting"	college_1
select distinct t2.tên của nhân viên , t3.bằng cấp cao nhất from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join giáo sư as t3 on t2.mã số nhân viên = t3.mã số nhân viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Computer Info. Systems"	college_1
select distinct t2.tên của nhân viên , t3.bằng cấp cao nhất from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên join giáo sư as t3 on t2.mã số nhân viên = t3.mã số nhân viên join khoa as t4 on t4.mã khoa = t3.mã khoa where t4.tên khoa = "Computer Info. Systems"	college_1
select t1.họ của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên where t2.điểm số = "A" and t2.mã lớp = 10018	college_1
select t1.họ của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên where t2.điểm số = "A" and t2.mã lớp = 10018	college_1
select t2.tên của nhân viên , t1.văn phòng giáo sư from giáo sư as t1 join nhân viên as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t1.mã khoa = t3.mã khoa where t3.tên khoa = "History" and t1.bằng cấp cao nhất != "Ph.D."	college_1
select t2.tên của nhân viên , t1.văn phòng giáo sư from giáo sư as t1 join nhân viên as t2 on t1.mã số nhân viên = t2.mã số nhân viên join khoa as t3 on t1.mã khoa = t3.mã khoa where t3.tên khoa = "History" and t1.bằng cấp cao nhất != "Ph.D."	college_1
select t2.tên của nhân viên from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên group by t1.mã số nhân viên của giáo sư having count ( * ) > 1	college_1
select t2.tên của nhân viên from lớp học as t1 join nhân viên as t2 on t1.mã số nhân viên của giáo sư = t2.mã số nhân viên group by t1.mã số nhân viên của giáo sư having count ( * ) > 1	college_1
select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên group by t2.mã số sinh viên having count ( * ) = 1	college_1
select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên group by t2.mã số sinh viên having count ( * ) = 1	college_1
select t2.tên khoa from khoá học as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.mô tả về khoá học like "%Statistics%"	college_1
select t2.tên khoa from khoá học as t1 join khoa as t2 on t1.mã khoa = t2.mã khoa where t1.mô tả về khoá học like "%Statistics%"	college_1
select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học where t3.mã khoá học = "ACCT-211" and t1.họ của sinh viên like "S%"	college_1
select t1.tên của sinh viên from sinh viên as t1 join đăng ký khoá học as t2 on t1.mã số sinh viên = t2.mã số sinh viên join lớp học as t3 on t2.mã lớp = t3.mã lớp học where t3.mã khoá học = "ACCT-211" and t1.họ của sinh viên like "S%"	college_1
select mã trạng thái tài liệu from trạng thái của tài liệu	cre_Doc_Control_Systems
select mô tả về trạng thái tài liệu from trạng thái của tài liệu where mã trạng thái tài liệu = "working"	cre_Doc_Control_Systems
select mã loại tài liệu from loại tài liệu	cre_Doc_Control_Systems
select mô tả về loại tài liệu from loại tài liệu where mã loại tài liệu = "Paper"	cre_Doc_Control_Systems
select tên đại lý vận chuyển from đại lý vận chuyển tài liệu	cre_Doc_Control_Systems
select mã đại lý vận chuyển from đại lý vận chuyển tài liệu where tên đại lý vận chuyển = "UPS"	cre_Doc_Control_Systems
select mã vai trò from vai trò	cre_Doc_Control_Systems
select mô tả về vai trò from vai trò where mã vai trò = "ED"	cre_Doc_Control_Systems
select count ( * ) from nhân viên	cre_Doc_Control_Systems
select t1.mô tả về vai trò from vai trò as t1 join nhân viên as t2 on t1.mã vai trò = t2.mã vai trò where t2.tên nhân viên = "Koby"	cre_Doc_Control_Systems
select id tài liệu , ngày lập biên lai from tài liệu	cre_Doc_Control_Systems
select t1.mô tả về vai trò , t2.mã vai trò , count ( * ) from vai trò as t1 join nhân viên as t2 on t1.mã vai trò = t2.mã vai trò group by t2.mã vai trò	cre_Doc_Control_Systems
select vai trò.mô tả về vai trò , count ( nhân viên.id nhân viên ) from vai trò join nhân viên on nhân viên.mã vai trò = vai trò.mã vai trò group by nhân viên.mã vai trò having count ( nhân viên.id nhân viên ) > 1	cre_Doc_Control_Systems
select trạng thái của tài liệu.mô tả về trạng thái tài liệu from trạng thái của tài liệu join tài liệu on tài liệu.mã trạng thái tài liệu = trạng thái của tài liệu.mã trạng thái tài liệu where tài liệu.id tài liệu = 1	cre_Doc_Control_Systems
select count ( * ) from tài liệu where mã trạng thái tài liệu = "done"	cre_Doc_Control_Systems
select mã loại tài liệu from tài liệu where id tài liệu = 2	cre_Doc_Control_Systems
select id tài liệu from tài liệu where mã trạng thái tài liệu = "done" and mã loại tài liệu = "Paper"	cre_Doc_Control_Systems
select đại lý vận chuyển tài liệu.tên đại lý vận chuyển from đại lý vận chuyển tài liệu join tài liệu on tài liệu.mã đại lý vận chuyển = đại lý vận chuyển tài liệu.mã đại lý vận chuyển where tài liệu.id tài liệu = 2	cre_Doc_Control_Systems
select count ( * ) from đại lý vận chuyển tài liệu join tài liệu on tài liệu.mã đại lý vận chuyển = đại lý vận chuyển tài liệu.mã đại lý vận chuyển where đại lý vận chuyển tài liệu.tên đại lý vận chuyển = "USPS"	cre_Doc_Control_Systems
select đại lý vận chuyển tài liệu.tên đại lý vận chuyển , count ( tài liệu.id tài liệu ) from đại lý vận chuyển tài liệu join tài liệu on tài liệu.mã đại lý vận chuyển = đại lý vận chuyển tài liệu.mã đại lý vận chuyển group by đại lý vận chuyển tài liệu.mã đại lý vận chuyển order by count ( tài liệu.id tài liệu ) desc limit 1	cre_Doc_Control_Systems
select ngày lập biên lai from tài liệu where id tài liệu = 3	cre_Doc_Control_Systems
select địa chỉ.chi tiết địa chỉ from địa chỉ join tài liệu được gửi on tài liệu được gửi.gửi đến địa chỉ có id = địa chỉ.id địa chỉ where id tài liệu = 4	cre_Doc_Control_Systems
select ngày gửi from tài liệu được gửi where id tài liệu = 7	cre_Doc_Control_Systems
select id tài liệu from tài liệu where mã trạng thái tài liệu = "done" and mã loại tài liệu = "Paper" except select id tài liệu from tài liệu join đại lý vận chuyển tài liệu on tài liệu.mã đại lý vận chuyển = đại lý vận chuyển tài liệu.mã đại lý vận chuyển where đại lý vận chuyển tài liệu.tên đại lý vận chuyển = "USPS"	cre_Doc_Control_Systems
select id tài liệu from tài liệu where mã trạng thái tài liệu = "done" and mã loại tài liệu = "Paper" intersect select id tài liệu from tài liệu join đại lý vận chuyển tài liệu on tài liệu.mã đại lý vận chuyển = đại lý vận chuyển tài liệu.mã đại lý vận chuyển where đại lý vận chuyển tài liệu.tên đại lý vận chuyển = "USPS"	cre_Doc_Control_Systems
select chi tiết dự thảo from bản dự thảo của tài liệu where id tài liệu = 7	cre_Doc_Control_Systems
select count ( * ) from bản sao where id tài liệu = 2	cre_Doc_Control_Systems
select id tài liệu , count ( số lượng bản sao ) from bản sao group by id tài liệu order by count ( số lượng bản sao ) desc limit 1	cre_Doc_Control_Systems
select id tài liệu , count ( * ) from bản sao group by id tài liệu having count ( * ) > 1	cre_Doc_Control_Systems
select nhân viên.tên nhân viên from nhân viên join lịch sử lưu hành on lịch sử lưu hành.id nhân viên = nhân viên.id nhân viên where lịch sử lưu hành.id tài liệu = 1	cre_Doc_Control_Systems
select tên nhân viên from nhân viên except select nhân viên.tên nhân viên from nhân viên join lịch sử lưu hành on lịch sử lưu hành.id nhân viên = nhân viên.id nhân viên	cre_Doc_Control_Systems
select nhân viên.tên nhân viên , count ( * ) from nhân viên join lịch sử lưu hành on lịch sử lưu hành.id nhân viên = nhân viên.id nhân viên group by lịch sử lưu hành.id tài liệu , lịch sử lưu hành.số lượng dự thảo , lịch sử lưu hành.số lượng bản sao order by count ( * ) desc limit 1	cre_Doc_Control_Systems
select id tài liệu , count ( distinct id nhân viên ) from lịch sử lưu hành group by id tài liệu	cre_Doc_Control_Systems
select count ( * ) from lượt đặt hàng	cre_Drama_Workshop_Groups
select count ( * ) from lượt đặt hàng	cre_Drama_Workshop_Groups
select ngày đặt hàng from lượt đặt hàng	cre_Drama_Workshop_Groups
select ngày đặt hàng from lượt đặt hàng	cre_Drama_Workshop_Groups
select ngày giao hàng theo kế hoạch , ngày giao hàng thực tế from lượt đặt hàng	cre_Drama_Workshop_Groups
select ngày giao hàng theo kế hoạch , ngày giao hàng thực tế from lượt đặt hàng	cre_Drama_Workshop_Groups
select count ( * ) from khách hàng	cre_Drama_Workshop_Groups
select count ( * ) from khách hàng	cre_Drama_Workshop_Groups
select số điện thoại khách hàng , địa chỉ email khách hàng from khách hàng where tên khách hàng = "Harold"	cre_Drama_Workshop_Groups
select số điện thoại khách hàng , địa chỉ email khách hàng from khách hàng where tên khách hàng = "Harold"	cre_Drama_Workshop_Groups
select tên cửa hàng from nhóm hội thảo kịch	cre_Drama_Workshop_Groups
select tên cửa hàng from nhóm hội thảo kịch	cre_Drama_Workshop_Groups
select min ( số lượng đặt hàng ) , avg ( số lượng đặt hàng ) , max ( số lượng đặt hàng ) from hoá đơn	cre_Drama_Workshop_Groups
select min ( số lượng đặt hàng ) , avg ( số lượng đặt hàng ) , max ( số lượng đặt hàng ) from hoá đơn	cre_Drama_Workshop_Groups
select distinct mã phương thức thanh toán from hoá đơn	cre_Drama_Workshop_Groups
select distinct mã phương thức thanh toán from hoá đơn	cre_Drama_Workshop_Groups
select mô tả về khu vực tiếp thị from khu vực tiếp thị where tên khu vực tiếp thị = "China"	cre_Drama_Workshop_Groups
select mô tả về khu vực tiếp thị from khu vực tiếp thị where tên khu vực tiếp thị = "China"	cre_Drama_Workshop_Groups
select distinct tên sản phẩm from các sản phẩm where giá sản phẩm > ( select avg ( giá sản phẩm ) from các sản phẩm )	cre_Drama_Workshop_Groups
select distinct tên sản phẩm from các sản phẩm where giá sản phẩm > ( select avg ( giá sản phẩm ) from các sản phẩm )	cre_Drama_Workshop_Groups
select tên sản phẩm from các sản phẩm order by giá sản phẩm desc limit 1	cre_Drama_Workshop_Groups
select tên sản phẩm from các sản phẩm order by giá sản phẩm desc limit 1	cre_Drama_Workshop_Groups
select tên sản phẩm from các sản phẩm order by giá sản phẩm asc	cre_Drama_Workshop_Groups
select tên sản phẩm from các sản phẩm order by giá sản phẩm asc	cre_Drama_Workshop_Groups
select số điện thoại khách hàng from người biểu diễn where tên khách hàng = "Ashley"	cre_Drama_Workshop_Groups
select số điện thoại khách hàng from người biểu diễn where tên khách hàng = "Ashley"	cre_Drama_Workshop_Groups
select mã phương thức thanh toán , count ( * ) from hoá đơn group by mã phương thức thanh toán	cre_Drama_Workshop_Groups
select mã phương thức thanh toán , count ( * ) from hoá đơn group by mã phương thức thanh toán	cre_Drama_Workshop_Groups
select mã phương thức thanh toán from hoá đơn group by mã phương thức thanh toán order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select mã phương thức thanh toán from hoá đơn group by mã phương thức thanh toán order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.thành phố thị trấn from địa chỉ as t1 join cửa hàng as t2 on t1.id địa chỉ = t2.id địa chỉ where t2.tên cửa hàng = "FJA Filming"	cre_Drama_Workshop_Groups
select t1.thành phố thị trấn from địa chỉ as t1 join cửa hàng as t2 on t1.id địa chỉ = t2.id địa chỉ where t2.tên cửa hàng = "FJA Filming"	cre_Drama_Workshop_Groups
select t1.quận hạt from địa chỉ as t1 join cửa hàng as t2 on t1.id địa chỉ = t2.id địa chỉ where t2.mã khu vực tiếp thị = "CA"	cre_Drama_Workshop_Groups
select t1.quận hạt from địa chỉ as t1 join cửa hàng as t2 on t1.id địa chỉ = t2.id địa chỉ where t2.mã khu vực tiếp thị = "CA"	cre_Drama_Workshop_Groups
select t1.tên khu vực tiếp thị from khu vực tiếp thị as t1 join cửa hàng as t2 on t1.mã khu vực tiếp thị = t2.mã khu vực tiếp thị where t2.tên cửa hàng = "Rob Dinning"	cre_Drama_Workshop_Groups
select t1.tên khu vực tiếp thị from khu vực tiếp thị as t1 join cửa hàng as t2 on t1.mã khu vực tiếp thị = t2.mã khu vực tiếp thị where t2.tên cửa hàng = "Rob Dinning"	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ where t2.giá sản phẩm > 100	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ where t2.giá sản phẩm > 100	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ , t2.mã loại dịch vụ , count ( * ) from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ group by t2.mã loại dịch vụ	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ , t2.mã loại dịch vụ , count ( * ) from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ group by t2.mã loại dịch vụ	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ , t1.mã loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ group by t1.mã loại dịch vụ order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ , t1.mã loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ group by t1.mã loại dịch vụ order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.số điện thoại cửa hàng , t1.địa chỉ email cửa hàng from nhóm hội thảo kịch as t1 join dịch vụ as t2 on t1.id nhóm hội thảo kịch = t2.id nhóm hội thảo kịch	cre_Drama_Workshop_Groups
select t1.số điện thoại cửa hàng , t1.địa chỉ email cửa hàng from nhóm hội thảo kịch as t1 join dịch vụ as t2 on t1.id nhóm hội thảo kịch = t2.id nhóm hội thảo kịch	cre_Drama_Workshop_Groups
select t1.số điện thoại cửa hàng , t1.địa chỉ email cửa hàng from nhóm hội thảo kịch as t1 join dịch vụ as t2 on t1.id nhóm hội thảo kịch = t2.id nhóm hội thảo kịch where t2.tên sản phẩm = "film"	cre_Drama_Workshop_Groups
select t1.số điện thoại cửa hàng , t1.địa chỉ email cửa hàng from nhóm hội thảo kịch as t1 join dịch vụ as t2 on t1.id nhóm hội thảo kịch = t2.id nhóm hội thảo kịch where t2.tên sản phẩm = "film"	cre_Drama_Workshop_Groups
select tên sản phẩm , avg ( giá sản phẩm ) from các sản phẩm group by tên sản phẩm	cre_Drama_Workshop_Groups
select tên sản phẩm , avg ( giá sản phẩm ) from các sản phẩm group by tên sản phẩm	cre_Drama_Workshop_Groups
select tên sản phẩm from các sản phẩm group by tên sản phẩm having avg ( giá sản phẩm ) < 1000000	cre_Drama_Workshop_Groups
select tên sản phẩm from các sản phẩm group by tên sản phẩm having avg ( giá sản phẩm ) < 1000000	cre_Drama_Workshop_Groups
select sum ( t1.số lượng đặt hàng ) from mặt hàng được đặt as t1 join các sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm where t2.tên sản phẩm = "photo"	cre_Drama_Workshop_Groups
select sum ( t1.số lượng đặt hàng ) from mặt hàng được đặt as t1 join các sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm where t2.tên sản phẩm = "photo"	cre_Drama_Workshop_Groups
select t1.chi tiết khác về mặt hàng from mặt hàng được đặt as t1 join các sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm where t2.giá sản phẩm > 2000	cre_Drama_Workshop_Groups
select t1.chi tiết khác về mặt hàng from mặt hàng được đặt as t1 join các sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm where t2.giá sản phẩm > 2000	cre_Drama_Workshop_Groups
select t1.ngày giao hàng thực tế from lượt đặt hàng của khách hàng as t1 join mặt hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng where t2.số lượng đặt hàng = 1	cre_Drama_Workshop_Groups
select t1.ngày giao hàng thực tế from lượt đặt hàng của khách hàng as t1 join mặt hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng where t2.số lượng đặt hàng = 1	cre_Drama_Workshop_Groups
select t1.ngày đặt hàng from lượt đặt hàng của khách hàng as t1 join mặt hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng join các sản phẩm as t3 on t2.id sản phẩm = t3.id sản phẩm where t3.giá sản phẩm > 1000	cre_Drama_Workshop_Groups
select t1.ngày đặt hàng from lượt đặt hàng của khách hàng as t1 join mặt hàng được đặt as t2 on t1.id đơn hàng = t2.id đơn hàng join các sản phẩm as t3 on t2.id sản phẩm = t3.id sản phẩm where t3.giá sản phẩm > 1000	cre_Drama_Workshop_Groups
select count ( distinct mã tiền tệ ) from nhóm hội thảo kịch	cre_Drama_Workshop_Groups
select count ( distinct mã tiền tệ ) from nhóm hội thảo kịch	cre_Drama_Workshop_Groups
select t2.tên cửa hàng from địa chỉ as t1 join nhóm hội thảo kịch as t2 on t1.id địa chỉ = t2.id địa chỉ where t1.thành phố thị trấn = "Feliciaberg"	cre_Drama_Workshop_Groups
select t2.tên cửa hàng from địa chỉ as t1 join nhóm hội thảo kịch as t2 on t1.id địa chỉ = t2.id địa chỉ where t1.thành phố thị trấn = "Feliciaberg"	cre_Drama_Workshop_Groups
select t2.địa chỉ email cửa hàng from địa chỉ as t1 join nhóm hội thảo kịch as t2 on t1.id địa chỉ = t2.id địa chỉ where t1.quận hạt = "Alaska"	cre_Drama_Workshop_Groups
select t2.địa chỉ email cửa hàng from địa chỉ as t1 join nhóm hội thảo kịch as t2 on t1.id địa chỉ = t2.id địa chỉ where t1.quận hạt = "Alaska"	cre_Drama_Workshop_Groups
select t1.thành phố thị trấn , count ( * ) from địa chỉ as t1 join nhóm hội thảo kịch as t2 on t1.id địa chỉ = t2.id địa chỉ group by t1.thành phố thị trấn	cre_Drama_Workshop_Groups
select t1.thành phố thị trấn , count ( * ) from địa chỉ as t1 join nhóm hội thảo kịch as t2 on t1.id địa chỉ = t2.id địa chỉ group by t1.thành phố thị trấn	cre_Drama_Workshop_Groups
select mã khu vực tiếp thị from nhóm hội thảo kịch group by mã khu vực tiếp thị order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select mã khu vực tiếp thị from nhóm hội thảo kịch group by mã khu vực tiếp thị order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.thành phố thị trấn from địa chỉ as t1 join khách hàng as t2 on t1.id địa chỉ = t2.id địa chỉ except select t1.thành phố thị trấn from địa chỉ as t1 join người biểu diễn as t2 on t1.id địa chỉ = t2.id địa chỉ	cre_Drama_Workshop_Groups
select t1.thành phố thị trấn from địa chỉ as t1 join khách hàng as t2 on t1.id địa chỉ = t2.id địa chỉ except select t1.thành phố thị trấn from địa chỉ as t1 join người biểu diễn as t2 on t1.id địa chỉ = t2.id địa chỉ	cre_Drama_Workshop_Groups
select mã trạng thái from lượt đặt hàng group by mã trạng thái order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select mã trạng thái from lượt đặt hàng group by mã trạng thái order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t2.tên cửa hàng from lượt đặt hàng as t1 join nhóm hội thảo kịch as t2 on t1.id nhóm hội thảo kịch = t2.id nhóm hội thảo kịch where t1.mã trạng thái = "stop"	cre_Drama_Workshop_Groups
select t2.tên cửa hàng from lượt đặt hàng as t1 join nhóm hội thảo kịch as t2 on t1.id nhóm hội thảo kịch = t2.id nhóm hội thảo kịch where t1.mã trạng thái = "stop"	cre_Drama_Workshop_Groups
select tên khách hàng from khách hàng except select t2.tên khách hàng from lượt đặt hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng	cre_Drama_Workshop_Groups
select tên khách hàng from khách hàng except select t2.tên khách hàng from lượt đặt hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng	cre_Drama_Workshop_Groups
select avg ( số lượng đặt hàng ) from hoá đơn where mã phương thức thanh toán = "MasterCard"	cre_Drama_Workshop_Groups
select avg ( số lượng đặt hàng ) from hoá đơn where mã phương thức thanh toán = "MasterCard"	cre_Drama_Workshop_Groups
select id sản phẩm from hoá đơn group by id sản phẩm order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select id sản phẩm from hoá đơn group by id sản phẩm order by count ( * ) desc limit 1	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ where t2.tên sản phẩm = "photo" intersect select t1.mô tả về loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ where t2.tên sản phẩm = "film"	cre_Drama_Workshop_Groups
select t1.mô tả về loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ where t2.tên sản phẩm = "photo" intersect select t1.mô tả về loại dịch vụ from loại dịch vụ as t1 join dịch vụ as t2 on t1.mã loại dịch vụ = t2.mã loại dịch vụ where t2.tên sản phẩm = "film"	cre_Drama_Workshop_Groups
select count ( * ) from tài khoản	customers_and_invoices
select count ( * ) from tài khoản	customers_and_invoices
select count ( distinct id khách hàng ) from tài khoản	customers_and_invoices
select count ( distinct id khách hàng ) from tài khoản	customers_and_invoices
select id tài khoản , ngày mở tài khoản , tên tài khoản , chi tiết khác về tài khoản from tài khoản	customers_and_invoices
select id tài khoản , ngày mở tài khoản , tên tài khoản , chi tiết khác về tài khoản from tài khoản	customers_and_invoices
select t1.id tài khoản , t1.ngày mở tài khoản , t1.tên tài khoản , t1.chi tiết khác về tài khoản from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên khách hàng = "Meaghan"	customers_and_invoices
select t1.id tài khoản , t1.ngày mở tài khoản , t1.tên tài khoản , t1.chi tiết khác về tài khoản from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên khách hàng = "Meaghan"	customers_and_invoices
select t1.tên tài khoản , t1.chi tiết khác về tài khoản from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên khách hàng = "Meaghan" and t2.họ của khách hàng = "Keeling"	customers_and_invoices
select t1.tên tài khoản , t1.chi tiết khác về tài khoản from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên khách hàng = "Meaghan" and t2.họ của khách hàng = "Keeling"	customers_and_invoices
select t2.tên khách hàng , t2.họ của khách hàng from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.tên tài khoản = "900"	customers_and_invoices
select t2.tên khách hàng , t2.họ của khách hàng from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.tên tài khoản = "900"	customers_and_invoices
select count ( * ) from khách hàng where id khách hàng not in ( select id khách hàng from tài khoản )	customers_and_invoices
select count ( * ) from khách hàng where id khách hàng not in ( select id khách hàng from tài khoản )	customers_and_invoices
select distinct t1.tên khách hàng , t1.họ của khách hàng , t1.số điện thoại from khách hàng as t1 join tài khoản as t2 on t1.id khách hàng = t2.id khách hàng	customers_and_invoices
select distinct t1.tên khách hàng , t1.họ của khách hàng , t1.số điện thoại from khách hàng as t1 join tài khoản as t2 on t1.id khách hàng = t2.id khách hàng	customers_and_invoices
select id khách hàng from khách hàng except select id khách hàng from tài khoản	customers_and_invoices
select id khách hàng from khách hàng except select id khách hàng from tài khoản	customers_and_invoices
select count ( * ) , id khách hàng from tài khoản group by id khách hàng	customers_and_invoices
select count ( * ) , id khách hàng from tài khoản group by id khách hàng	customers_and_invoices
select t1.id khách hàng , t2.tên khách hàng , t2.họ của khách hàng from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng order by count ( * ) desc limit 1	customers_and_invoices
select t1.id khách hàng , t2.tên khách hàng , t2.họ của khách hàng from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng order by count ( * ) desc limit 1	customers_and_invoices
select t1.id khách hàng , t2.tên khách hàng , t2.họ của khách hàng , count ( * ) from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng	customers_and_invoices
select t1.id khách hàng , t2.tên khách hàng , t2.họ của khách hàng , count ( * ) from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng	customers_and_invoices
select t2.tên khách hàng , t1.id khách hàng from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng having count ( * ) >= 2	customers_and_invoices
select t2.tên khách hàng , t1.id khách hàng from tài khoản as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng having count ( * ) >= 2	customers_and_invoices
select count ( * ) from khách hàng	customers_and_invoices
select count ( * ) from khách hàng	customers_and_invoices
select giới tính , count ( * ) from khách hàng group by giới tính	customers_and_invoices
select giới tính , count ( * ) from khách hàng group by giới tính	customers_and_invoices
select count ( * ) from giao dịch tài chính	customers_and_invoices
select count ( * ) from giao dịch tài chính	customers_and_invoices
select count ( * ) , id tài khoản from giao dịch tài chính	customers_and_invoices
select count ( * ) , id tài khoản from giao dịch tài chính	customers_and_invoices
select count ( * ) from giao dịch tài chính as t1 join tài khoản as t2 on t1.id tài khoản = t2.id tài khoản where t2.tên tài khoản = "337"	customers_and_invoices
select count ( * ) from giao dịch tài chính as t1 join tài khoản as t2 on t1.id tài khoản = t2.id tài khoản where t2.tên tài khoản = "337"	customers_and_invoices
select avg ( số tiền giao dịch ) , min ( số tiền giao dịch ) , max ( số tiền giao dịch ) , sum ( số tiền giao dịch ) from giao dịch tài chính	customers_and_invoices
select avg ( số tiền giao dịch ) , min ( số tiền giao dịch ) , max ( số tiền giao dịch ) , sum ( số tiền giao dịch ) from giao dịch tài chính	customers_and_invoices
select id giao dịch from giao dịch tài chính where số tiền giao dịch > ( select avg ( số tiền giao dịch ) from giao dịch tài chính )	customers_and_invoices
select id giao dịch from giao dịch tài chính where số tiền giao dịch > ( select avg ( số tiền giao dịch ) from giao dịch tài chính )	customers_and_invoices
select loại giao dịch , sum ( số tiền giao dịch ) from giao dịch tài chính group by loại giao dịch	customers_and_invoices
select loại giao dịch , sum ( số tiền giao dịch ) from giao dịch tài chính group by loại giao dịch	customers_and_invoices
select t2.tên tài khoản , t1.id tài khoản , count ( * ) from giao dịch tài chính as t1 join tài khoản as t2 on t1.id tài khoản = t2.id tài khoản group by t1.id tài khoản	customers_and_invoices
select t2.tên tài khoản , t1.id tài khoản , count ( * ) from giao dịch tài chính as t1 join tài khoản as t2 on t1.id tài khoản = t2.id tài khoản group by t1.id tài khoản	customers_and_invoices
select id tài khoản from giao dịch tài chính group by id tài khoản order by count ( * ) desc limit 1	customers_and_invoices
select id tài khoản from giao dịch tài chính group by id tài khoản order by count ( * ) desc limit 1	customers_and_invoices
select t1.id tài khoản , t2.tên tài khoản from giao dịch tài chính as t1 join tài khoản as t2 on t1.id tài khoản = t2.id tài khoản group by t1.id tài khoản having count ( * ) >= 4	customers_and_invoices
select t1.id tài khoản , t2.tên tài khoản from giao dịch tài chính as t1 join tài khoản as t2 on t1.id tài khoản = t2.id tài khoản group by t1.id tài khoản having count ( * ) >= 4	customers_and_invoices
select distinct kích thước sản phẩm from sản phẩm	customers_and_invoices
select distinct kích thước sản phẩm from sản phẩm	customers_and_invoices
select distinct màu sản phẩm from sản phẩm	customers_and_invoices
select distinct màu sản phẩm from sản phẩm	customers_and_invoices
select số hoá đơn , count ( * ) from giao dịch tài chính group by số hoá đơn	customers_and_invoices
select số hoá đơn , count ( * ) from giao dịch tài chính group by số hoá đơn	customers_and_invoices
select t2.số hoá đơn , t2.ngày lập hoá đơn from giao dịch tài chính as t1 join hoá đơn as t2 on t1.số hoá đơn = t2.số hoá đơn group by t1.số hoá đơn order by count ( * ) desc limit 1	customers_and_invoices
select t2.số hoá đơn , t2.ngày lập hoá đơn from giao dịch tài chính as t1 join hoá đơn as t2 on t1.số hoá đơn = t2.số hoá đơn group by t1.số hoá đơn order by count ( * ) desc limit 1	customers_and_invoices
select count ( * ) from hoá đơn	customers_and_invoices
select count ( * ) from hoá đơn	customers_and_invoices
select t1.ngày lập hoá đơn , t1.id đơn hàng , t2.chi tiết đặt hàng from hoá đơn as t1 join đơn đặt hàng as t2 on t1.id đơn hàng = t2.id đơn hàng	customers_and_invoices
select t1.ngày lập hoá đơn , t1.id đơn hàng , t2.chi tiết đặt hàng from hoá đơn as t1 join đơn đặt hàng as t2 on t1.id đơn hàng = t2.id đơn hàng	customers_and_invoices
select id đơn hàng , count ( * ) from hoá đơn group by id đơn hàng	customers_and_invoices
select id đơn hàng , count ( * ) from hoá đơn group by id đơn hàng	customers_and_invoices
select t2.id đơn hàng , t2.chi tiết đặt hàng from hoá đơn as t1 join đơn đặt hàng as t2 on t1.id đơn hàng = t2.id đơn hàng group by t2.id đơn hàng having count ( * ) > 2	customers_and_invoices
select t2.id đơn hàng , t2.chi tiết đặt hàng from hoá đơn as t1 join đơn đặt hàng as t2 on t1.id đơn hàng = t2.id đơn hàng group by t2.id đơn hàng having count ( * ) > 2	customers_and_invoices
select t2.họ của khách hàng , t1.id khách hàng , t2.số điện thoại from đơn đặt hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng order by count ( * ) desc limit 1	customers_and_invoices
select t2.họ của khách hàng , t1.id khách hàng , t2.số điện thoại from đơn đặt hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng order by count ( * ) desc limit 1	customers_and_invoices
select tên sản phẩm from sản phẩm except select t1.tên sản phẩm from sản phẩm as t1 join mặt hàng được đặt as t2 on t1.id sản phẩm = t2.id sản phẩm	customers_and_invoices
select tên sản phẩm from sản phẩm except select t1.tên sản phẩm from sản phẩm as t1 join mặt hàng được đặt as t2 on t1.id sản phẩm = t2.id sản phẩm	customers_and_invoices
select t2.tên sản phẩm , sum ( t1.số lượng sản phẩm ) from mặt hàng được đặt as t1 join sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm group by t2.tên sản phẩm	customers_and_invoices
select t2.tên sản phẩm , sum ( t1.số lượng sản phẩm ) from mặt hàng được đặt as t1 join sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm group by t2.tên sản phẩm	customers_and_invoices
select id đơn hàng , count ( * ) from mặt hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , count ( * ) from mặt hàng được đặt group by id đơn hàng	customers_and_invoices
select id sản phẩm , count ( distinct id đơn hàng ) from mặt hàng được đặt group by id sản phẩm	customers_and_invoices
select id sản phẩm , count ( distinct id đơn hàng ) from mặt hàng được đặt group by id sản phẩm	customers_and_invoices
select t2.tên sản phẩm , count ( * ) from mặt hàng được đặt as t1 join sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm join đơn đặt hàng as t3 on t3.id đơn hàng = t1.id đơn hàng group by t2.tên sản phẩm	customers_and_invoices
select t2.tên sản phẩm , count ( * ) from mặt hàng được đặt as t1 join sản phẩm as t2 on t1.id sản phẩm = t2.id sản phẩm join đơn đặt hàng as t3 on t3.id đơn hàng = t1.id đơn hàng group by t2.tên sản phẩm	customers_and_invoices
select id đơn hàng , count ( distinct id sản phẩm ) from mặt hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , count ( distinct id sản phẩm ) from mặt hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , sum ( số lượng sản phẩm ) from mặt hàng được đặt group by id đơn hàng	customers_and_invoices
select id đơn hàng , sum ( số lượng sản phẩm ) from mặt hàng được đặt group by id đơn hàng	customers_and_invoices
select count ( * ) from sản phẩm where id sản phẩm not in ( select id sản phẩm from mặt hàng được đặt )	customers_and_invoices
select count ( * ) from sản phẩm where id sản phẩm not in ( select id sản phẩm from mặt hàng được đặt )	customers_and_invoices
select count ( * ) from địa chỉ where quốc gia = "USA"	customers_and_products_contacts
select distinct thành phố from địa chỉ	customers_and_products_contacts
select tiểu bang , count ( * ) from địa chỉ group by tiểu bang	customers_and_products_contacts
select tên khách hàng , điện thoại khách hàng from khách hàng where id khách hàng not in ( select id khách hàng from lịch sử địa chỉ khách hàng )	customers_and_products_contacts
select t1.tên khách hàng from khách hàng as t1 join lượt đặt hàng của khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng order by count ( * ) desc limit 1	customers_and_products_contacts
select mã loại sản phẩm from sản phẩm group by mã loại sản phẩm having count ( * ) >= 2	customers_and_products_contacts
select t1.tên khách hàng from khách hàng as t1 join lượt đặt hàng của khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.mã trạng thái đơn hàng = "Completed" intersect select t1.tên khách hàng from khách hàng as t1 join lượt đặt hàng của khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.mã trạng thái đơn hàng = "Part"	customers_and_products_contacts
select tên khách hàng , điện thoại khách hàng , mã phương thức thanh toán from khách hàng order by mã số khách hàng desc	customers_and_products_contacts
select t1.tên sản phẩm , sum ( t2.số lượng đặt hàng ) from sản phẩm as t1 join mặt hàng được đặt as t2 on t1.id sản phẩm = t2.id sản phẩm group by t1.id sản phẩm	customers_and_products_contacts
select min ( giá sản phẩm ) , max ( giá sản phẩm ) , avg ( giá sản phẩm ) from sản phẩm	customers_and_products_contacts
select count ( * ) from sản phẩm where giá sản phẩm > ( select avg ( giá sản phẩm ) from sản phẩm )	customers_and_products_contacts
select t2.tên khách hàng , t3.thành phố , t1.từ ngày , t1.đến ngày from lịch sử địa chỉ khách hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng join địa chỉ as t3 on t1.id địa chỉ = t3.id địa chỉ	customers_and_products_contacts
select t1.tên khách hàng from khách hàng as t1 join lượt đặt hàng của khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.mã phương thức thanh toán = "Credit Card" group by t1.id khách hàng having count ( * ) > 2	customers_and_products_contacts
select t1.tên khách hàng , t1.điện thoại khách hàng from khách hàng as t1 join lượt đặt hàng của khách hàng as t2 on t1.id khách hàng = t2.id khách hàng join mặt hàng được đặt as t3 on t3.id đơn hàng = t2.id đơn hàng group by t1.id khách hàng order by sum ( t3.số lượng đặt hàng ) desc limit 1	customers_and_products_contacts
select mã loại sản phẩm , tên sản phẩm from sản phẩm where giá sản phẩm > 1000 or giá sản phẩm < 500	customers_and_products_contacts
select count ( * ) from bộ trưởng where tuổi > 56	department_management
select tên , sinh ra ở tiểu bang , tuổi from bộ trưởng order by tuổi	department_management
select năm thành lập , tên , ngân sách tính theo tỷ from các bộ	department_management
select max ( ngân sách tính theo tỷ ) , min ( ngân sách tính theo tỷ ) from các bộ	department_management
select avg ( số lượng nhân viên ) from các bộ where xếp hạng between 10 and 15	department_management
select tên from bộ trưởng where sinh ra ở tiểu bang != "California"	department_management
select distinct t1.năm thành lập from các bộ as t1 join sự quản lý as t2 on t1.id các bộ = t2.id các bộ join bộ trưởng as t3 on t2.id người đứng đầu = t3.id người đứng đầu where t3.sinh ra ở tiểu bang = "Alabama"	department_management
select sinh ra ở tiểu bang from bộ trưởng group by sinh ra ở tiểu bang having count ( * ) >= 3	department_management
select năm thành lập from các bộ group by năm thành lập order by count ( * ) desc limit 1	department_management
select t1.tên , t1.số lượng nhân viên from các bộ as t1 join sự quản lý as t2 on t1.id các bộ = t2.id các bộ where t2.vai trò tạm thời = "Yes"	department_management
select count ( distinct vai trò tạm thời ) from sự quản lý	department_management
select count ( * ) from các bộ where id các bộ not in ( select id các bộ from sự quản lý )	department_management
select distinct t1.tuổi from sự quản lý as t2 join bộ trưởng as t1 on t1.id người đứng đầu = t2.id người đứng đầu where t2.vai trò tạm thời = "Yes"	department_management
select t3.sinh ra ở tiểu bang from các bộ as t1 join sự quản lý as t2 on t1.id các bộ = t2.id các bộ join bộ trưởng as t3 on t2.id người đứng đầu = t3.id người đứng đầu where t1.tên = "Treasury" intersect select t3.sinh ra ở tiểu bang from các bộ as t1 join sự quản lý as t2 on t1.id các bộ = t2.id các bộ join bộ trưởng as t3 on t2.id người đứng đầu = t3.id người đứng đầu where t1.tên = "Homeland Security"	department_management
select t1.id các bộ , t1.tên , count ( * ) from sự quản lý as t2 join các bộ as t1 on t1.id các bộ = t2.id các bộ group by t1.id các bộ having count ( * ) > 1	department_management
select id người đứng đầu , tên from bộ trưởng where tên like "%Ha%"	department_management
select id from xe	driving_school
select id from xe	driving_school
select count ( * ) from xe	driving_school
select count ( * ) from xe	driving_school
select chi tiết về xe from xe where id = 1	driving_school
select chi tiết về xe from xe where id = 1	driving_school
select tên , tên đệm , họ from nhân viên	driving_school
select tên , tên đệm , họ from nhân viên	driving_school
select ngày sinh from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày sinh from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân viên gia nhập from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân viên gia nhập from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân viên rời đi from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select ngày nhân viên rời đi from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select count ( * ) from nhân viên where tên = "Ludie"	driving_school
select count ( * ) from nhân viên where tên = "Ludie"	driving_school
select biệt danh from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select biệt danh from nhân viên where tên = "Janessa" and họ = "Sawayn"	driving_school
select count ( * ) from nhân viên	driving_school
select count ( * ) from nhân viên	driving_school
select t1.thành phố from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.thành phố from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.quốc gia , t1.tiểu bang from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.quốc gia , t1.tiểu bang from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select sum ( t1.giờ học ) from bài giảng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Rylan" and t2.họ = "Goodwin"	driving_school
select sum ( t1.giờ học ) from bài giảng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Rylan" and t2.họ = "Goodwin"	driving_school
select t1.mã bưu điện from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select t1.mã bưu điện from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select count ( * ) from địa chỉ where tiểu bang = "Georgia"	driving_school
select count ( * ) from địa chỉ where tiểu bang = "Georgia"	driving_school
select t2.tên , t2.họ from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t1.thành phố = "Damianfort"	driving_school
select t2.tên , t2.họ from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên where t1.thành phố = "Damianfort"	driving_school
select t1.thành phố , count ( * ) from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên group by t1.thành phố order by count ( * ) desc limit 1	driving_school
select t1.thành phố , count ( * ) from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên group by t1.thành phố order by count ( * ) desc limit 1	driving_school
select t1.tiểu bang from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên group by t1.tiểu bang having count ( * ) between 2 and 4	driving_school
select t1.tiểu bang from địa chỉ as t1 join nhân viên as t2 on t1.id địa chỉ = t2.id địa chỉ nhân viên group by t1.tiểu bang having count ( * ) between 2 and 4	driving_school
select tên , họ from khách hàng	driving_school
select tên , họ from khách hàng	driving_school
select địa chỉ email , ngày sinh from khách hàng where tên = "Carole"	driving_school
select địa chỉ email , ngày sinh from khách hàng where tên = "Carole"	driving_school
select số điện thoại , địa chỉ email from khách hàng where số tiền còn thiếu > 2000	driving_school
select số điện thoại , địa chỉ email from khách hàng where số tiền còn thiếu > 2000	driving_school
select mã trạng thái khách hàng , số điện thoại di động , địa chỉ email from khách hàng where tên = "Marina" or họ = "Kohler"	driving_school
select mã trạng thái khách hàng , số điện thoại di động , địa chỉ email from khách hàng where tên = "Marina" or họ = "Kohler"	driving_school
select ngày sinh from khách hàng where mã trạng thái khách hàng = "Good Customer"	driving_school
select ngày sinh from khách hàng where mã trạng thái khách hàng = "Good Customer"	driving_school
select ngày trở thành khách hàng from khách hàng where tên = "Carole" and họ = "Bernhard"	driving_school
select ngày trở thành khách hàng from khách hàng where tên = "Carole" and họ = "Bernhard"	driving_school
select count ( * ) from khách hàng	driving_school
select count ( * ) from khách hàng	driving_school
select mã trạng thái khách hàng , count ( * ) from khách hàng group by mã trạng thái khách hàng	driving_school
select mã trạng thái khách hàng , count ( * ) from khách hàng group by mã trạng thái khách hàng	driving_school
select mã trạng thái khách hàng from khách hàng group by mã trạng thái khách hàng order by count ( * ) asc limit 1	driving_school
select mã trạng thái khách hàng from khách hàng group by mã trạng thái khách hàng order by count ( * ) asc limit 1	driving_school
select count ( * ) from bài giảng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Rylan" and t2.họ = "Goodwin" and t1.mã trạng thái bài giảng = "Completed"	driving_school
select count ( * ) from bài giảng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Rylan" and t2.họ = "Goodwin" and t1.mã trạng thái bài giảng = "Completed"	driving_school
select max ( số tiền còn thiếu ) , min ( số tiền còn thiếu ) , avg ( số tiền còn thiếu ) from khách hàng	driving_school
select max ( số tiền còn thiếu ) , min ( số tiền còn thiếu ) , avg ( số tiền còn thiếu ) from khách hàng	driving_school
select tên , họ from khách hàng where số tiền còn thiếu between 1000 and 3000	driving_school
select tên , họ from khách hàng where số tiền còn thiếu between 1000 and 3000	driving_school
select t1.tên , t1.họ from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ where t2.thành phố = "Lockmanfurt"	driving_school
select t1.tên , t1.họ from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ where t2.thành phố = "Lockmanfurt"	driving_school
select t2.quốc gia from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.quốc gia from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.mã bưu điện from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.mã bưu điện from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ where t1.tên = "Carole" and t1.họ = "Bernhard"	driving_school
select t2.thành phố from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ group by t2.thành phố order by count ( * ) desc limit 1	driving_school
select t2.thành phố from khách hàng as t1 join địa chỉ as t2 on t1.id địa chỉ khách hàng = t2.id địa chỉ group by t2.thành phố order by count ( * ) desc limit 1	driving_school
select sum ( t1.số tiền thanh toán ) from khoản thanh toán của khách hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Carole" and t2.họ = "Bernhard"	driving_school
select sum ( t1.số tiền thanh toán ) from khoản thanh toán của khách hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Carole" and t2.họ = "Bernhard"	driving_school
select count ( * ) from khách hàng where id khách hàng not in ( select id khách hàng from khoản thanh toán của khách hàng )	driving_school
select count ( * ) from khách hàng where id khách hàng not in ( select id khách hàng from khoản thanh toán của khách hàng )	driving_school
select t2.tên , t2.họ from khoản thanh toán của khách hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng having count ( * ) > 2	driving_school
select t2.tên , t2.họ from khoản thanh toán của khách hàng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng having count ( * ) > 2	driving_school
select mã phương thức thanh toán , count ( * ) from khoản thanh toán của khách hàng group by mã phương thức thanh toán	driving_school
select mã phương thức thanh toán , count ( * ) from khoản thanh toán của khách hàng group by mã phương thức thanh toán	driving_school
select count ( * ) from bài giảng where mã trạng thái bài giảng = "Cancelled"	driving_school
select count ( * ) from bài giảng where mã trạng thái bài giảng = "Cancelled"	driving_school
select t1.id bài giảng from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn" and biệt danh like "%s%"	driving_school
select t1.id bài giảng from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn" and biệt danh like "%s%"	driving_school
select count ( * ) from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên like "%a%"	driving_school
select count ( * ) from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên like "%a%"	driving_school
select sum ( giờ học ) from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select sum ( giờ học ) from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select avg ( giá ) from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select avg ( giá ) from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Janessa" and t2.họ = "Sawayn"	driving_school
select count ( * ) from bài giảng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Ray"	driving_school
select count ( * ) from bài giảng as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.tên = "Ray"	driving_school
select họ from khách hàng intersect select họ from nhân viên	driving_school
select họ from khách hàng intersect select họ from nhân viên	driving_school
select tên from nhân viên except select t2.tên from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên	driving_school
select tên from nhân viên except select t2.tên from bài giảng as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên	driving_school
select t1.id , t1.chi tiết về xe from xe as t1 join bài giảng as t2 on t1.id = t2.id xe group by t1.id order by count ( * ) desc limit 1	driving_school
select count ( * ) from nhân viên	employee_hire_evaluation
select count ( * ) from nhân viên	employee_hire_evaluation
select tên from nhân viên order by tuổi	employee_hire_evaluation
select tên from nhân viên order by tuổi	employee_hire_evaluation
select count ( * ) , thành phố from nhân viên group by thành phố	employee_hire_evaluation
select count ( * ) , thành phố from nhân viên group by thành phố	employee_hire_evaluation
select thành phố from nhân viên where tuổi < 30 group by thành phố having count ( * ) > 1	employee_hire_evaluation
select thành phố from nhân viên where tuổi < 30 group by thành phố having count ( * ) > 1	employee_hire_evaluation
select count ( * ) , địa điểm from cửa hàng group by địa điểm	employee_hire_evaluation
select count ( * ) , địa điểm from cửa hàng group by địa điểm	employee_hire_evaluation
select tên người quản lý , quận from cửa hàng order by số lượng sản phẩm desc limit 1	employee_hire_evaluation
select tên người quản lý , quận from cửa hàng order by số lượng sản phẩm desc limit 1	employee_hire_evaluation
select min ( số lượng sản phẩm ) , max ( số lượng sản phẩm ) from cửa hàng	employee_hire_evaluation
select min ( số lượng sản phẩm ) , max ( số lượng sản phẩm ) from cửa hàng	employee_hire_evaluation
select tên , địa điểm , quận from cửa hàng order by số lượng sản phẩm desc	employee_hire_evaluation
select tên , địa điểm , quận from cửa hàng order by số lượng sản phẩm desc	employee_hire_evaluation
select tên from cửa hàng where số lượng sản phẩm > ( select avg ( số lượng sản phẩm ) from cửa hàng )	employee_hire_evaluation
select tên from cửa hàng where số lượng sản phẩm > ( select avg ( số lượng sản phẩm ) from cửa hàng )	employee_hire_evaluation
select t1.tên from nhân viên as t1 join đánh giá as t2 on t1.id nhân viên = t2.id nhân viên group by t2.id nhân viên order by count ( * ) desc limit 1	employee_hire_evaluation
select t1.tên from nhân viên as t1 join đánh giá as t2 on t1.id nhân viên = t2.id nhân viên group by t2.id nhân viên order by count ( * ) desc limit 1	employee_hire_evaluation
select t1.tên from nhân viên as t1 join đánh giá as t2 on t1.id nhân viên = t2.id nhân viên order by t2.tiền thưởng desc limit 1	employee_hire_evaluation
select t1.tên from nhân viên as t1 join đánh giá as t2 on t1.id nhân viên = t2.id nhân viên order by t2.tiền thưởng desc limit 1	employee_hire_evaluation
select tên from nhân viên where id nhân viên not in ( select id nhân viên from đánh giá )	employee_hire_evaluation
select tên from nhân viên where id nhân viên not in ( select id nhân viên from đánh giá )	employee_hire_evaluation
select t2.tên from tuyển dụng as t1 join cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng group by t1.id cửa hàng order by count ( * ) desc limit 1	employee_hire_evaluation
select t2.tên from tuyển dụng as t1 join cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng group by t1.id cửa hàng order by count ( * ) desc limit 1	employee_hire_evaluation
select tên from cửa hàng where id cửa hàng not in ( select id cửa hàng from tuyển dụng )	employee_hire_evaluation
select tên from cửa hàng where id cửa hàng not in ( select id cửa hàng from tuyển dụng )	employee_hire_evaluation
select count ( * ) , t2.tên from tuyển dụng as t1 join cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng group by t2.tên	employee_hire_evaluation
select count ( * ) , t2.tên from tuyển dụng as t1 join cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng group by t2.tên	employee_hire_evaluation
select sum ( tiền thưởng ) from đánh giá	employee_hire_evaluation
select sum ( tiền thưởng ) from đánh giá	employee_hire_evaluation
select * from tuyển dụng	employee_hire_evaluation
select * from tuyển dụng	employee_hire_evaluation
select quận from cửa hàng where số lượng sản phẩm < 3000 intersect select quận from cửa hàng where số lượng sản phẩm > 10000	employee_hire_evaluation
select quận from cửa hàng where số lượng sản phẩm < 3000 intersect select quận from cửa hàng where số lượng sản phẩm > 10000	employee_hire_evaluation
select count ( distinct địa điểm ) from cửa hàng	employee_hire_evaluation
select count ( distinct địa điểm ) from cửa hàng	employee_hire_evaluation
select quốc gia from hãng hàng không where tên hãng hàng không = "JetBlue Airways"	flight_2
select quốc gia from hãng hàng không where tên hãng hàng không = "JetBlue Airways"	flight_2
select tên viết tắt from hãng hàng không where tên hãng hàng không = "JetBlue Airways"	flight_2
select tên viết tắt from hãng hàng không where tên hãng hàng không = "JetBlue Airways"	flight_2
select tên hãng hàng không , tên viết tắt from hãng hàng không where quốc gia = "USA"	flight_2
select tên hãng hàng không , tên viết tắt from hãng hàng không where quốc gia = "USA"	flight_2
select mã sân bay , tên sân bay from sân bay where thành phố = "Anthony"	flight_2
select mã sân bay , tên sân bay from sân bay where thành phố = "Anthony"	flight_2
select count ( * ) from hãng hàng không	flight_2
select count ( * ) from hãng hàng không	flight_2
select count ( * ) from sân bay	flight_2
select count ( * ) from sân bay	flight_2
select count ( * ) from chuyến bay	flight_2
select count ( * ) from chuyến bay	flight_2
select tên hãng hàng không from hãng hàng không where tên viết tắt = "UAL"	flight_2
select tên hãng hàng không from hãng hàng không where tên viết tắt = "UAL"	flight_2
select count ( * ) from hãng hàng không where quốc gia = "USA"	flight_2
select count ( * ) from hãng hàng không where quốc gia = "USA"	flight_2
select thành phố , quốc gia from sân bay where tên sân bay = "Alton"	flight_2
select thành phố , quốc gia from sân bay where tên sân bay = "Alton"	flight_2
select tên sân bay from sân bay where mã sân bay = "AKO"	flight_2
select tên sân bay from sân bay where mã sân bay = "AKO"	flight_2
select tên sân bay from sân bay where thành phố = "Aberdeen"	flight_2
select tên sân bay from sân bay where thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay where sân bay khởi hành = "APG"	flight_2
select count ( * ) from chuyến bay where sân bay khởi hành = "APG"	flight_2
select count ( * ) from chuyến bay where sân bay đích = "ATO"	flight_2
select count ( * ) from chuyến bay where sân bay đích = "ATO"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay khởi hành = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay khởi hành = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay join sân bay as t3 on t1.sân bay khởi hành = t3.mã sân bay where t2.thành phố = "Ashley" and t3.thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay join sân bay as t3 on t1.sân bay khởi hành = t3.mã sân bay where t2.thành phố = "Ashley" and t3.thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join hãng hàng không as t2 on t1.hãng hàng không = t2.id hãng hàng không where t2.tên hãng hàng không = "JetBlue Airways"	flight_2
select count ( * ) from chuyến bay as t1 join hãng hàng không as t2 on t1.hãng hàng không = t2.id hãng hàng không where t2.tên hãng hàng không = "JetBlue Airways"	flight_2
select count ( * ) from hãng hàng không as t1 join chuyến bay as t2 on t2.hãng hàng không = t1.id hãng hàng không where t1.tên hãng hàng không = "United Airlines" and t2.sân bay đích = "ASY"	flight_2
select count ( * ) from hãng hàng không as t1 join chuyến bay as t2 on t2.hãng hàng không = t1.id hãng hàng không where t1.tên hãng hàng không = "United Airlines" and t2.sân bay đích = "ASY"	flight_2
select count ( * ) from hãng hàng không as t1 join chuyến bay as t2 on t2.hãng hàng không = t1.id hãng hàng không where t1.tên hãng hàng không = "United Airlines" and t2.sân bay khởi hành = "AHD"	flight_2
select count ( * ) from hãng hàng không as t1 join chuyến bay as t2 on t2.hãng hàng không = t1.id hãng hàng không where t1.tên hãng hàng không = "United Airlines" and t2.sân bay khởi hành = "AHD"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay join hãng hàng không as t3 on t3.id hãng hàng không = t1.hãng hàng không where t2.thành phố = "Aberdeen" and t3.tên hãng hàng không = "United Airlines"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay join hãng hàng không as t3 on t3.id hãng hàng không = t1.hãng hàng không where t2.thành phố = "Aberdeen" and t3.tên hãng hàng không = "United Airlines"	flight_2
select t1.thành phố from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay đích group by t1.thành phố order by count ( * ) desc limit 1	flight_2
select t1.thành phố from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay đích group by t1.thành phố order by count ( * ) desc limit 1	flight_2
select t1.thành phố from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay khởi hành group by t1.thành phố order by count ( * ) desc limit 1	flight_2
select t1.thành phố from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay khởi hành group by t1.thành phố order by count ( * ) desc limit 1	flight_2
select t1.mã sân bay from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay đích or t1.mã sân bay = t2.sân bay khởi hành group by t1.mã sân bay order by count ( * ) desc limit 1	flight_2
select t1.mã sân bay from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay đích or t1.mã sân bay = t2.sân bay khởi hành group by t1.mã sân bay order by count ( * ) desc limit 1	flight_2
select t1.mã sân bay from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay đích or t1.mã sân bay = t2.sân bay khởi hành group by t1.mã sân bay order by count ( * ) limit 1	flight_2
select t1.mã sân bay from sân bay as t1 join chuyến bay as t2 on t1.mã sân bay = t2.sân bay đích or t1.mã sân bay = t2.sân bay khởi hành group by t1.mã sân bay order by count ( * ) limit 1	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không order by count ( * ) desc limit 1	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không order by count ( * ) desc limit 1	flight_2
select t1.tên viết tắt , t1.quốc gia from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không order by count ( * ) limit 1	flight_2
select t1.tên viết tắt , t1.quốc gia from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không order by count ( * ) limit 1	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "AHD"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "AHD"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay đích = "AHD"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay đích = "AHD"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "APG" intersect select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "CVO"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "APG" intersect select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "CVO"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "CVO" except select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "APG"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "CVO" except select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không where t2.sân bay khởi hành = "APG"	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không having count ( * ) > 10	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không having count ( * ) > 10	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không having count ( * ) < 200	flight_2
select t1.tên hãng hàng không from hãng hàng không as t1 join chuyến bay as t2 on t1.id hãng hàng không = t2.hãng hàng không group by t1.tên hãng hàng không having count ( * ) < 200	flight_2
select t1.số hiệu chuyến bay from chuyến bay as t1 join hãng hàng không as t2 on t2.id hãng hàng không = t1.hãng hàng không where t2.tên hãng hàng không = "United Airlines"	flight_2
select t1.số hiệu chuyến bay from chuyến bay as t1 join hãng hàng không as t2 on t2.id hãng hàng không = t1.hãng hàng không where t2.tên hãng hàng không = "United Airlines"	flight_2
select số hiệu chuyến bay from chuyến bay where sân bay khởi hành = "APG"	flight_2
select số hiệu chuyến bay from chuyến bay where sân bay khởi hành = "APG"	flight_2
select số hiệu chuyến bay from chuyến bay where sân bay đích = "APG"	flight_2
select số hiệu chuyến bay from chuyến bay where sân bay đích = "APG"	flight_2
select t1.số hiệu chuyến bay from chuyến bay as t1 join sân bay as t2 on t1.sân bay khởi hành = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select t1.số hiệu chuyến bay from chuyến bay as t1 join sân bay as t2 on t1.sân bay khởi hành = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select t1.số hiệu chuyến bay from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select t1.số hiệu chuyến bay from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay where t2.thành phố = "Aberdeen"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay where t2.thành phố = "Aberdeen" or t2.thành phố = "Abilene"	flight_2
select count ( * ) from chuyến bay as t1 join sân bay as t2 on t1.sân bay đích = t2.mã sân bay where t2.thành phố = "Aberdeen" or t2.thành phố = "Abilene"	flight_2
select tên sân bay from sân bay where mã sân bay not in ( select sân bay khởi hành from chuyến bay union select sân bay đích from chuyến bay )	flight_2
select tên sân bay from sân bay where mã sân bay not in ( select sân bay khởi hành from chuyến bay union select sân bay đích from chuyến bay )	flight_2
select count ( * ) from trận đấu where mùa giải > 2007	game_injury
select ngày from trận đấu order by đội chủ nhà desc	game_injury
select mùa giải , đội chủ nhà , đội khách from trận đấu	game_injury
select max ( trận đấu sân nhà ) , min ( trận đấu sân nhà ) , avg ( trận đấu sân nhà ) from sân vận động	game_injury
select số lượng người tham dự trung bình from sân vận động where phần trăm sức chứa > 100	game_injury
select cầu thủ , số lượng trận đấu , nguồn thông tin from chấn thương where chấn thương != "Knee problem"	game_injury
select t1.mùa giải from trận đấu as t1 join chấn thương as t2 on t1.id = t2.id trận đấu where t2.cầu thủ = "Walter Samuel"	game_injury
select t1.id , t1.tỉ số , t1.ngày from trận đấu as t1 join chấn thương as t2 on t2.id trận đấu = t1.id group by t1.id having count ( * ) >= 2	game_injury
select t1.id , t1.tên from sân vận động as t1 join trận đấu as t2 on t1.id = t2.id sân vận động join chấn thương as t3 on t2.id = t3.id trận đấu group by t1.id order by count ( * ) desc limit 1	game_injury
select t1.id , t1.tên from sân vận động as t1 join trận đấu as t2 on t1.id = t2.id sân vận động join chấn thương as t3 on t2.id = t3.id trận đấu group by t1.id order by count ( * ) desc limit 1	game_injury
select t1.mùa giải , t2.tên from trận đấu as t1 join sân vận động as t2 on t1.id sân vận động = t2.id join chấn thương as t3 on t1.id = t3.id trận đấu where t3.chấn thương = "Foot injury" or t3.chấn thương = "Knee problem"	game_injury
select count ( distinct nguồn thông tin ) from chấn thương	game_injury
select count ( * ) from trận đấu where id not in ( select id trận đấu from chấn thương )	game_injury
select count ( distinct t1.chấn thương ) from chấn thương as t1 join trận đấu as t2 on t1.id trận đấu = t2.id where t2.mùa giải > 2010	game_injury
select t2.tên from trận đấu as t1 join sân vận động as t2 on t1.id sân vận động = t2.id join chấn thương as t3 on t1.id = t3.id trận đấu where t3.cầu thủ = "Walter Samuel" intersect select t2.tên from trận đấu as t1 join sân vận động as t2 on t1.id sân vận động = t2.id join chấn thương as t3 on t1.id = t3.id trận đấu where t3.cầu thủ = "Thiago Motta"	game_injury
select tên , số lượng người tham dự trung bình , tổng số người tham dự from sân vận động except select t2.tên , t2.số lượng người tham dự trung bình , t2.tổng số người tham dự from trận đấu as t1 join sân vận động as t2 on t1.id sân vận động = t2.id join chấn thương as t3 on t1.id = t3.id trận đấu	game_injury
select tên from sân vận động where tên like "%Bank%"	game_injury
select t1.id , count ( * ) from sân vận động as t1 join trận đấu as t2 on t1.id = t2.id sân vận động group by t1.id	game_injury
select t1.ngày , t2.cầu thủ from trận đấu as t1 join chấn thương as t2 on t1.id = t2.id trận đấu order by t1.mùa giải desc	game_injury
select năm phát hành from bộ phim where tiêu đề = "The Imitation Game"	imdb
select năm phát hành from bộ phim where tiêu đề = "The Imitation Game"	imdb
select năm sinh from diễn viên where tên = "Benedict Cumberbatch"	imdb
select năm sinh from diễn viên where tên = "Benedict Cumberbatch"	imdb
select quốc tịch from diễn viên where tên = "Christoph Waltz"	imdb
select quốc tịch from diễn viên where tên = "Christoph Waltz"	imdb
select tiêu đề from bộ phim where năm phát hành = 2015	imdb
select tên from diễn viên where nơi sinh = "Tehran"	imdb
select tên from diễn viên where nơi sinh = "Tehran"	imdb
select tên from diễn viên where nơi sinh = "Tehran"	imdb
select tên from diễn viên where quốc tịch = "Afghanistan"	imdb
select tên from diễn viên where quốc tịch = "Afghanistan"	imdb
select tên from diễn viên where quốc tịch = "Afghanistan"	imdb
select tên from diễn viên where năm sinh = 1984	imdb
select năm sinh from diễn viên where tên = "actor name0"	imdb
select năm sinh from diễn viên where tên = "actor name0"	imdb
select nơi sinh from đạo diễn where tên = "director name0"	imdb
select nơi sinh from đạo diễn where tên = "director name0"	imdb
select quốc tịch from đạo diễn where tên = "director name0"	imdb
select ngân sách from bộ phim where tiêu đề = "Finding Nemo"	imdb
select t3.tiêu đề from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Steven Spielberg" and t3.năm phát hành > 2006	imdb
select t2.tên from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu đề = "James Bond"	imdb
select t2.tên from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu đề = "James Bond"	imdb
select t2.tên from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu đề = "James Bond"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu đề = "The Imitation Game"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu đề = "The Imitation Game"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu đề = "The Imitation Game"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu đề = "The Imitation Game"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Alan Turing" and t3.tiêu đề = "The Imitation Game"	imdb
select t2.thể loại from thể loại as t2 join phân loại as t1 on t2.id thể loại = t1.id thể loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu đề = "Jurassic Park"	imdb
select t2.tên from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.năm phát hành = 2015 and t3.tiêu đề = "Joy"	imdb
select t1.tiêu đề from được viết bởi as t3 join bộ phim as t1 on t3.id sê-ri phim = t1.id bộ phim join nhà viết kịch bản as t2 on t3.id nhà viết kịch bản = t2.id nhà viết kịch bản where t2.tên = "Matt Damon"	imdb
select t2.tiêu đề from bộ phim as t2 join được làm bởi as t3 on t2.id bộ phim = t3.id sê-ri phim join nhà sản xuất as t1 on t1.id nhà sản xuất = t3.id nhà sản xuất join được viết bởi as t5 on t5.id sê-ri phim = t2.id bộ phim join nhà viết kịch bản as t4 on t5.id nhà viết kịch bản = t4.id nhà viết kịch bản where t1.tên = "Woody Allen" and t4.tên = "Woody Allen"	imdb
select t2.tiêu đề from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Robin Wright"	imdb
select t2.tiêu đề from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Robin Wright"	imdb
select t2.tiêu đề from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Robin Wright"	imdb
select ngân sách from bộ phim where năm phát hành = 2007 and tiêu đề = "Juno"	imdb
select t3.tiêu đề from thể loại as t2 join phân loại as t1 on t2.id thể loại = t1.id thể loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.thể loại = "Sci-Fi" and t3.năm phát hành = 2010	imdb
select t3.tiêu đề from thể loại as t2 join phân loại as t1 on t2.id thể loại = t1.id thể loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.thể loại = "Sci-Fi" and t3.năm phát hành = 2010	imdb
select tên from diễn viên where nơi sinh = "Austin" and năm sinh > 1980	imdb
select tên from diễn viên where nơi sinh = "Austin" and năm sinh > 1980	imdb
select tên from diễn viên where nơi sinh = "Austin" and năm sinh > 1980	imdb
select t3.tiêu đề from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.nơi sinh = "Los Angeles"	imdb
select tên from diễn viên where nơi sinh = "New York City" and năm sinh = 1984	imdb
select t3.tiêu đề from nhãn as t2 join từ khoá as t1 on t2.id từ khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ khoá = "nuclear weapons"	imdb
select t3.tiêu đề from nhãn as t2 join từ khoá as t1 on t2.id từ khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ khoá = "nuclear weapons"	imdb
select t3.tiêu đề from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Alfred Hitchcock"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo diễn as t3 on t3.id đạo diễn = t2.id đạo diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo diễn as t3 on t3.id đạo diễn = t2.id đạo diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo diễn as t3 on t3.id đạo diễn = t2.id đạo diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join đạo diễn bởi as t2 on t4.id bộ phim = t2.id sê-ri phim join đạo diễn as t3 on t3.id đạo diễn = t2.id đạo diễn where t1.tên = "Taraneh Alidoosti" and t3.tên = "Asghar Farhadi"	imdb
select t2.tiêu đề from nhà sản xuất as t1 join được làm bởi as t3 on t1.id nhà sản xuất = t3.id nhà sản xuất join phim truyền hình nhiều tập as t2 on t2.id sê-ri phim truyền hình = t3.id sê-ri phim where t1.tên = "Shonda Rhimes"	imdb
select t1.tên from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join phim truyền hình nhiều tập as t2 on t2.id sê-ri phim truyền hình = t3.id sê-ri phim where t3.vai diễn = "Olivia Pope" and t2.tiêu đề = "Scandal"	imdb
select t2.tên from được viết bởi as t3 join bộ phim as t1 on t3.id sê-ri phim = t1.id bộ phim join nhà viết kịch bản as t2 on t3.id nhà viết kịch bản = t2.id nhà viết kịch bản where t1.tiêu đề = "The Truman Show"	imdb
select t2.tên from được viết bởi as t3 join bộ phim as t1 on t3.id sê-ri phim = t1.id bộ phim join nhà viết kịch bản as t2 on t3.id nhà viết kịch bản = t2.id nhà viết kịch bản where t1.tiêu đề = "The Truman Show"	imdb
select t2.tiêu đề from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join phim truyền hình nhiều tập as t2 on t2.id sê-ri phim truyền hình = t3.id sê-ri phim where t1.tên = "Scott Foley"	imdb
select t2.tiêu đề from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join phim truyền hình nhiều tập as t2 on t2.id sê-ri phim truyền hình = t3.id sê-ri phim where t1.tên = "Scott Foley"	imdb
select t3.tên from phân vai as t4 join diễn viên as t1 on t4.id diễn viên = t1.id diễn viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join đạo diễn bởi as t2 on t5.id bộ phim = t2.id sê-ri phim join đạo diễn as t3 on t3.id đạo diễn = t2.id đạo diễn where t1.tên = "Kate Winslet"	imdb
select t1.tên from phân vai as t3 join diễn viên as t2 on t3.id diễn viên = t2.id diễn viên join bộ phim as t5 on t5.id bộ phim = t3.id sê-ri phim join được làm bởi as t4 on t5.id bộ phim = t4.id sê-ri phim join nhà sản xuất as t1 on t1.id nhà sản xuất = t4.id nhà sản xuất where t2.tên = "Kate Winslet"	imdb
select t2.tên from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join phim truyền hình nhiều tập as t3 on t3.id sê-ri phim truyền hình = t1.id sê-ri phim where t3.năm phát hành = 2013 and t3.tiêu đề = "House of Cards"	imdb
select tên from diễn viên where nơi sinh = "Austin" and giới tính = "female"	imdb
select tên from diễn viên where năm sinh > 1980 and quốc tịch = "Italy"	imdb
select tên from diễn viên where nơi sinh = "New York City" and năm sinh > 1980 and giới tính = "female"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.giới tính = "female" and t3.tiêu đề = "Saving Private Ryan"	imdb
select tên from đạo diễn where quốc tịch = "Afghanistan"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu đề = "Camp X-Ray"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.quốc tịch = "Canada" and t3.tiêu đề = "James Bond"	imdb
select t2.tiêu đề from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Rowan Atkinson" and t3.vai diễn = "Mr. Bean"	imdb
select t2.nơi sinh from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t3.tiêu đề = "The Past"	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên where t2.vai diễn = "Mr. Bean"	imdb
select t3.thể loại from đạo diễn as t5 join đạo diễn bởi as t2 on t5.id đạo diễn = t2.id đạo diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join phân loại as t1 on t4.id bộ phim = t1.id sê-ri phim join thể loại as t3 on t3.id thể loại = t1.id thể loại where t5.tên = "Asghar Farhadi"	imdb
select t1.tiêu đề from bộ phim as t1 join phân vai as t2 on t1.id bộ phim = t2.id sê-ri phim where t2.vai diễn = "Daffy Duck"	imdb
select t2.vai diễn from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu đề = "Daddy Long Legs"	imdb
select t3.tên from đạo diễn as t3 join đạo diễn bởi as t2 on t3.id đạo diễn = t2.id đạo diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join nhãn as t5 on t5.id sê-ri phim = t4.id bộ phim join từ khoá as t1 on t5.id từ khoá = t1.id where t1.từ khoá = "nuclear weapons"	imdb
select count ( distinct t2.tiêu đề ) from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Jennifer Aniston" and t2.năm phát hành > 2010	imdb
select count ( distinct t1.tên ) from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu đề = "Saving Private Ryan"	imdb
select count ( distinct t1.tên ) from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t3.tiêu đề = "Saving Private Ryan"	imdb
select count ( distinct t3.tiêu đề ) from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Steven Spielberg"	imdb
select count ( distinct tiêu đề ) from bộ phim where năm phát hành = 2013	imdb
select count ( distinct tiêu đề ) from bộ phim where năm phát hành = 2013	imdb
select count ( distinct t3.tiêu đề ) , t3.năm phát hành from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Woody Allen" group by t3.năm phát hành	imdb
select count ( distinct t2.tiêu đề ) from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct t2.tiêu đề ) from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct t2.tiêu đề ) from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct t2.tiêu đề ) from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Shahab Hosseini"	imdb
select count ( distinct tên ) from diễn viên where nơi sinh = "Los Angeles" and năm sinh > 2000	imdb
select count ( distinct t2.tiêu đề ) from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Humphrey Bogart" and t2.năm phát hành < 1942	imdb
select count ( distinct t2.tiêu đề ) , t2.năm phát hành from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.tên = "Brad Pitt" group by t2.năm phát hành	imdb
select count ( distinct t3.tiêu đề ) from nhãn as t2 join từ khoá as t1 on t2.id từ khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ khoá = "Iraq war" and t3.năm phát hành = 2015	imdb
select count ( distinct t3.tiêu đề ) from nhãn as t2 join từ khoá as t1 on t2.id từ khoá = t1.id join bộ phim as t3 on t2.id sê-ri phim = t3.id bộ phim where t1.từ khoá = "Persians" and t3.năm phát hành > 1990	imdb
select count ( distinct t3.tiêu đề ) from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Quentin Tarantino" and t3.năm phát hành > 2010	imdb
select count ( distinct t3.tiêu đề ) from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Quentin Tarantino" and t3.năm phát hành < 2010	imdb
select count ( distinct t4.tiêu đề ) from đạo diễn as t3 join đạo diễn bởi as t2 on t3.id đạo diễn = t2.id đạo diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join được làm bởi as t5 on t4.id bộ phim = t5.id sê-ri phim join nhà sản xuất as t1 on t1.id nhà sản xuất = t5.id nhà sản xuất where t3.tên = "Quentin Tarantino" and t4.năm phát hành < 2010 and t4.năm phát hành > 2002	imdb
select count ( distinct tên ) from diễn viên where nơi sinh = "New York City" and năm sinh > 1980 and giới tính = "female"	imdb
select count ( distinct t1.tên ) from phân vai as t4 join diễn viên as t1 on t4.id diễn viên = t1.id diễn viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join đạo diễn bởi as t2 on t5.id bộ phim = t2.id sê-ri phim join đạo diễn as t3 on t3.id đạo diễn = t2.id đạo diễn where t1.quốc tịch = "Iran" and t3.tên = "Jim Jarmusch"	imdb
select count ( distinct t1.tên ) from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.quốc tịch = "China" and t3.tiêu đề = "Rush Hour 3"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn viên as t2 on t3.id diễn viên = t2.id diễn viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn viên as t2 on t3.id diễn viên = t2.id diễn viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn viên as t2 on t3.id diễn viên = t2.id diễn viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t4.tiêu đề from phân vai as t5 join diễn viên as t1 on t5.id diễn viên = t1.id diễn viên join bộ phim as t4 on t4.id bộ phim = t5.id sê-ri phim join phân vai as t3 on t4.id bộ phim = t3.id sê-ri phim join diễn viên as t2 on t3.id diễn viên = t2.id diễn viên where t1.tên = "Woody Strode" and t2.tên = "Jason Robards"	imdb
select t1.tên from phân vai as t4 join diễn viên as t1 on t4.id diễn viên = t1.id diễn viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join phân vai as t3 on t5.id bộ phim = t3.id sê-ri phim join diễn viên as t2 on t3.id diễn viên = t2.id diễn viên where t2.tên = "Tom Hanks"	imdb
select t3.tiêu đề from đạo diễn as t5 join đạo diễn bởi as t2 on t5.id đạo diễn = t2.id đạo diễn join đạo diễn bởi as t1 on t5.id đạo diễn = t1.id đạo diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t4.tiêu đề = "Revolutionary Road"	imdb
select t3.tiêu đề from thể loại as t2 join phân loại as t1 on t2.id thể loại = t1.id thể loại join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim group by t3.tiêu đề order by count ( distinct t2.thể loại ) desc limit 1	imdb
select t2.tiêu đề from phân vai as t3 join diễn viên as t1 on t3.id diễn viên = t1.id diễn viên join bộ phim as t2 on t2.id bộ phim = t3.id sê-ri phim where t1.quốc tịch = "China" group by t2.tiêu đề order by count ( distinct t1.tên ) desc limit 1	imdb
select t1.tên from phân vai as t4 join diễn viên as t1 on t4.id diễn viên = t1.id diễn viên join bộ phim as t5 on t5.id bộ phim = t4.id sê-ri phim join đạo diễn bởi as t2 on t5.id bộ phim = t2.id sê-ri phim join đạo diễn as t3 on t3.id đạo diễn = t2.id đạo diễn where t3.tên = "Quentin Tarantino" order by t5.năm phát hành desc limit 1	imdb
select t3.ngân sách , t3.tiêu đề from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Quentin Tarantino" order by t3.năm phát hành desc limit 1	imdb
select t3.tiêu đề from đạo diễn as t2 join đạo diễn bởi as t1 on t2.id đạo diễn = t1.id đạo diễn join bộ phim as t3 on t3.id bộ phim = t1.id sê-ri phim where t2.tên = "Jim Jarmusch" order by t3.năm phát hành desc limit 1	imdb
select t1.tên from đạo diễn as t3 join đạo diễn bởi as t2 on t3.id đạo diễn = t2.id đạo diễn join bộ phim as t4 on t4.id bộ phim = t2.id sê-ri phim join được làm bởi as t5 on t4.id bộ phim = t5.id sê-ri phim join nhà sản xuất as t1 on t1.id nhà sản xuất = t5.id nhà sản xuất group by t1.tên order by count ( distinct t3.tên ) desc limit 1	imdb
select t1.tên from phân vai as t2 join diễn viên as t1 on t2.id diễn viên = t1.id diễn viên join bộ phim as t3 on t3.id bộ phim = t2.id sê-ri phim where t1.tên = "Gabriele Ferzetti" order by t3.năm phát hành desc limit 1	imdb
select chi tiết khách hàng from khách hàng order by chi tiết khách hàng	insurance_and_eClaims
select chi tiết khách hàng from khách hàng order by chi tiết khách hàng	insurance_and_eClaims
select mã loại chính sách from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.chi tiết khách hàng = "Dayana Robel"	insurance_and_eClaims
select mã loại chính sách from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t2.chi tiết khách hàng = "Dayana Robel"	insurance_and_eClaims
select mã loại chính sách from chính sách group by mã loại chính sách order by count ( * ) desc limit 1	insurance_and_eClaims
select mã loại chính sách from chính sách group by mã loại chính sách order by count ( * ) desc limit 1	insurance_and_eClaims
select mã loại chính sách from chính sách group by mã loại chính sách having count ( * ) > 2	insurance_and_eClaims
select mã loại chính sách from chính sách group by mã loại chính sách having count ( * ) > 2	insurance_and_eClaims
select sum ( số tiền được trả ) , avg ( số tiền được trả ) from tiêu đề của yêu cầu	insurance_and_eClaims
select sum ( số tiền được trả ) , avg ( số tiền được trả ) from tiêu đề của yêu cầu	insurance_and_eClaims
select sum ( t1.số tiền được yêu cầu ) from tiêu đề của yêu cầu as t1 join tài liệu của yêu cầu as t2 on t1.id tiêu đề của yêu cầu = t2.id yêu cầu where t2.ngày tạo ra = ( select ngày tạo ra from tài liệu của yêu cầu order by ngày tạo ra limit 1 )	insurance_and_eClaims
select sum ( t1.số tiền được yêu cầu ) from tiêu đề của yêu cầu as t1 join tài liệu của yêu cầu as t2 on t1.id tiêu đề của yêu cầu = t2.id yêu cầu where t2.ngày tạo ra = ( select ngày tạo ra from tài liệu của yêu cầu order by ngày tạo ra limit 1 )	insurance_and_eClaims
select t3.chi tiết khách hàng from tiêu đề của yêu cầu as t1 join chính sách as t2 on t1.id chính sách = t2.id chính sách join khách hàng as t3 on t2.id khách hàng = t3.id khách hàng where t1.số tiền được yêu cầu = ( select max ( số tiền được yêu cầu ) from tiêu đề của yêu cầu )	insurance_and_eClaims
select t3.chi tiết khách hàng from tiêu đề của yêu cầu as t1 join chính sách as t2 on t1.id chính sách = t2.id chính sách join khách hàng as t3 on t2.id khách hàng = t3.id khách hàng where t1.số tiền được yêu cầu = ( select max ( số tiền được yêu cầu ) from tiêu đề của yêu cầu )	insurance_and_eClaims
select t3.chi tiết khách hàng from tiêu đề của yêu cầu as t1 join chính sách as t2 on t1.id chính sách = t2.id chính sách join khách hàng as t3 on t2.id khách hàng = t3.id khách hàng where t1.số tiền được trả = ( select min ( số tiền được trả ) from tiêu đề của yêu cầu )	insurance_and_eClaims
select t3.chi tiết khách hàng from tiêu đề của yêu cầu as t1 join chính sách as t2 on t1.id chính sách = t2.id chính sách join khách hàng as t3 on t2.id khách hàng = t3.id khách hàng where t1.số tiền được trả = ( select min ( số tiền được trả ) from tiêu đề của yêu cầu )	insurance_and_eClaims
select chi tiết khách hàng from khách hàng except select t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng	insurance_and_eClaims
select chi tiết khách hàng from khách hàng except select t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng	insurance_and_eClaims
select count ( * ) from giai đoạn xử lý yêu cầu	insurance_and_eClaims
select count ( * ) from giai đoạn xử lý yêu cầu	insurance_and_eClaims
select t2.tên tình trạng yêu cầu from xử lý yêu cầu as t1 join giai đoạn xử lý yêu cầu as t2 on t1.id giai đoạn xử lý yêu cầu = t2.id giai đoạn yêu cầu group by t1.id giai đoạn xử lý yêu cầu order by count ( * ) desc limit 1	insurance_and_eClaims
select t2.tên tình trạng yêu cầu from xử lý yêu cầu as t1 join giai đoạn xử lý yêu cầu as t2 on t1.id giai đoạn xử lý yêu cầu = t2.id giai đoạn yêu cầu group by t1.id giai đoạn xử lý yêu cầu order by count ( * ) desc limit 1	insurance_and_eClaims
select chi tiết khách hàng from khách hàng where chi tiết khách hàng like "%Diana%"	insurance_and_eClaims
select chi tiết khách hàng from khách hàng where chi tiết khách hàng like "%Diana%"	insurance_and_eClaims
select distinct t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.mã loại chính sách = "Deputy"	insurance_and_eClaims
select distinct t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.mã loại chính sách = "Deputy"	insurance_and_eClaims
select distinct t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.mã loại chính sách = "Deputy" or t1.mã loại chính sách = "Uniform"	insurance_and_eClaims
select distinct t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.mã loại chính sách = "Deputy" or t1.mã loại chính sách = "Uniform"	insurance_and_eClaims
select chi tiết khách hàng from khách hàng union select chi tiết nhân viên from nhân viên	insurance_and_eClaims
select chi tiết khách hàng from khách hàng union select chi tiết nhân viên from nhân viên	insurance_and_eClaims
select mã loại chính sách , count ( * ) from chính sách group by mã loại chính sách	insurance_and_eClaims
select mã loại chính sách , count ( * ) from chính sách group by mã loại chính sách	insurance_and_eClaims
select t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t2.chi tiết khách hàng order by count ( * ) desc limit 1	insurance_and_eClaims
select t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng group by t2.chi tiết khách hàng order by count ( * ) desc limit 1	insurance_and_eClaims
select mô tả về tình trạng yêu cầu from giai đoạn xử lý yêu cầu where tên tình trạng yêu cầu = "Open"	insurance_and_eClaims
select mô tả về tình trạng yêu cầu from giai đoạn xử lý yêu cầu where tên tình trạng yêu cầu = "Open"	insurance_and_eClaims
select count ( distinct mã kết quả của yêu cầu ) from xử lý yêu cầu	insurance_and_eClaims
select count ( distinct mã kết quả của yêu cầu ) from xử lý yêu cầu	insurance_and_eClaims
select t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.ngày bắt đầu = ( select max ( ngày bắt đầu ) from chính sách )	insurance_and_eClaims
select t2.chi tiết khách hàng from chính sách as t1 join khách hàng as t2 on t1.id khách hàng = t2.id khách hàng where t1.ngày bắt đầu = ( select max ( ngày bắt đầu ) from chính sách )	insurance_and_eClaims
select t1.chi tiết sự kiện from sự kiện as t1 join dịch vụ as t2 on t1.id dịch vụ = t2.id dịch vụ where t2.mã loại dịch vụ = "Marriage"	local_govt_in_alabama
select t1.id sự kiện , t1.chi tiết sự kiện from sự kiện as t1 join người tham gia sự kiện as t2 on t1.id sự kiện = t2.id sự kiện group by t1.id sự kiện having count ( * ) > 1	local_govt_in_alabama
select t1.id người tham gia , t1.mã loại người tham gia , count ( * ) from người tham gia as t1 join người tham gia sự kiện as t2 on t1.id người tham gia = t2.id người tham gia group by t1.id người tham gia	local_govt_in_alabama
select id người tham gia , mã loại người tham gia , chi tiết người tham gia from người tham gia	local_govt_in_alabama
select count ( * ) from người tham gia where mã loại người tham gia = "Organizer"	local_govt_in_alabama
select mã loại dịch vụ from dịch vụ order by mã loại dịch vụ	local_govt_in_alabama
select id dịch vụ , chi tiết sự kiện from sự kiện	local_govt_in_alabama
select count ( * ) from người tham gia as t1 join người tham gia sự kiện as t2 on t1.id người tham gia = t2.id người tham gia where t1.chi tiết người tham gia like "%Dr.%"	local_govt_in_alabama
select mã loại người tham gia from người tham gia group by mã loại người tham gia order by count ( * ) desc limit 1	local_govt_in_alabama
select t3.id dịch vụ , t4.mã loại dịch vụ from người tham gia as t1 join người tham gia sự kiện as t2 on t1.id người tham gia = t2.id người tham gia join sự kiện as t3 on t2.id sự kiện = t3.id sự kiện join dịch vụ as t4 on t3.id dịch vụ = t4.id dịch vụ group by t3.id dịch vụ order by count ( * ) asc limit 1	local_govt_in_alabama
select id sự kiện from người tham gia sự kiện group by id sự kiện order by count ( * ) desc limit 1	local_govt_in_alabama
select id sự kiện from sự kiện except select t1.id sự kiện from người tham gia sự kiện as t1 join người tham gia as t2 on t1.id người tham gia = t2.id người tham gia where chi tiết người tham gia = "Kenyatta Kuhn"	local_govt_in_alabama
select t1.mã loại dịch vụ from dịch vụ as t1 join sự kiện as t2 on t1.id dịch vụ = t2.id dịch vụ where t2.chi tiết sự kiện = "Success" intersect select t1.mã loại dịch vụ from dịch vụ as t1 join sự kiện as t2 on t1.id dịch vụ = t2.id dịch vụ where t2.chi tiết sự kiện = "Fail"	local_govt_in_alabama
select count ( * ) from sự kiện where id sự kiện not in ( select id sự kiện from người tham gia sự kiện )	local_govt_in_alabama
select count ( distinct id người tham gia ) from người tham gia sự kiện	local_govt_in_alabama
select count ( * ) from kỹ thuật viên	machine_repair
select count ( * ) from kỹ thuật viên	machine_repair
select tên from kỹ thuật viên order by tuổi asc	machine_repair
select tên from kỹ thuật viên order by tuổi asc	machine_repair
select đội , năm bắt đầu from kỹ thuật viên	machine_repair
select đội , năm bắt đầu from kỹ thuật viên	machine_repair
select tên from kỹ thuật viên where đội != "NYY"	machine_repair
select tên from kỹ thuật viên where đội != "NYY"	machine_repair
select tên from kỹ thuật viên where tuổi = 36 or tuổi = 37	machine_repair
select tên from kỹ thuật viên where tuổi = 36 or tuổi = 37	machine_repair
select năm bắt đầu from kỹ thuật viên order by tuổi desc limit 1	machine_repair
select năm bắt đầu from kỹ thuật viên order by tuổi desc limit 1	machine_repair
select đội , count ( * ) from kỹ thuật viên group by đội	machine_repair
select đội , count ( * ) from kỹ thuật viên group by đội	machine_repair
select đội from kỹ thuật viên group by đội order by count ( * ) desc limit 1	machine_repair
select đội from kỹ thuật viên group by đội order by count ( * ) desc limit 1	machine_repair
select đội from kỹ thuật viên group by đội having count ( * ) >= 2	machine_repair
select đội from kỹ thuật viên group by đội having count ( * ) >= 2	machine_repair
select t3.tên , t2.loạt máy from phân công sửa chữa as t1 join máy móc as t2 on t1.id máy = t2.id máy join kỹ thuật viên as t3 on t1.id kỹ thuật viên = t3.id kỹ thuật viên	machine_repair
select t3.tên , t2.loạt máy from phân công sửa chữa as t1 join máy móc as t2 on t1.id máy = t2.id máy join kỹ thuật viên as t3 on t1.id kỹ thuật viên = t3.id kỹ thuật viên	machine_repair
select t3.tên from phân công sửa chữa as t1 join máy móc as t2 on t1.id máy = t2.id máy join kỹ thuật viên as t3 on t1.id kỹ thuật viên = t3.id kỹ thuật viên order by t2.xếp hạng chất lượng	machine_repair
select t3.tên from phân công sửa chữa as t1 join máy móc as t2 on t1.id máy = t2.id máy join kỹ thuật viên as t3 on t1.id kỹ thuật viên = t3.id kỹ thuật viên order by t2.xếp hạng chất lượng	machine_repair
select t3.tên from phân công sửa chữa as t1 join máy móc as t2 on t1.id máy = t2.id máy join kỹ thuật viên as t3 on t1.id kỹ thuật viên = t3.id kỹ thuật viên where t2.điểm giá trị > 70	machine_repair
select t3.tên from phân công sửa chữa as t1 join máy móc as t2 on t1.id máy = t2.id máy join kỹ thuật viên as t3 on t1.id kỹ thuật viên = t3.id kỹ thuật viên where t2.điểm giá trị > 70	machine_repair
select t2.tên , count ( * ) from phân công sửa chữa as t1 join kỹ thuật viên as t2 on t1.id kỹ thuật viên = t2.id kỹ thuật viên group by t2.tên	machine_repair
select t2.tên , count ( * ) from phân công sửa chữa as t1 join kỹ thuật viên as t2 on t1.id kỹ thuật viên = t2.id kỹ thuật viên group by t2.tên	machine_repair
select tên from kỹ thuật viên where id kỹ thuật viên not in ( select id kỹ thuật viên from phân công sửa chữa )	machine_repair
select tên from kỹ thuật viên where id kỹ thuật viên not in ( select id kỹ thuật viên from phân công sửa chữa )	machine_repair
select năm bắt đầu from kỹ thuật viên where đội = "CLE" intersect select năm bắt đầu from kỹ thuật viên where đội = "CWS"	machine_repair
select năm bắt đầu from kỹ thuật viên where đội = "CLE" intersect select năm bắt đầu from kỹ thuật viên where đội = "CWS"	machine_repair
select count ( * ) from ống kính máy ảnh where độ dài tiêu cự theo mm > 15	mountain_photos
select nhãn hiệu , tên from ống kính máy ảnh order by khẩu độ tối đa desc	mountain_photos
select id , màu sắc , tên from ảnh	mountain_photos
select max ( chiều cao ) , avg ( chiều cao ) from núi	mountain_photos
select avg ( độ nổi ) from núi where quốc gia = "Morocco"	mountain_photos
select tên , chiều cao , độ nổi from núi where dãy núi != "Aberdare Range"	mountain_photos
select t1.id , t1.tên from núi as t1 join ảnh as t2 on t1.id = t2.id núi where t1.chiều cao > 4000	mountain_photos
select t1.id , t1.tên from núi as t1 join ảnh as t2 on t1.id = t2.id núi group by t1.id having count ( * ) >= 2	mountain_photos
select t2.tên from ảnh as t1 join ống kính máy ảnh as t2 on t1.id ống kính máy ảnh = t2.id group by t2.id order by count ( * ) desc limit 1	mountain_photos
select t1.tên from ống kính máy ảnh as t1 join ảnh as t2 on t2.id ống kính máy ảnh = t1.id where t1.nhãn hiệu = "Sigma" or t1.nhãn hiệu = "Olympus"	mountain_photos
select count ( distinct nhãn hiệu ) from ống kính máy ảnh	mountain_photos
select count ( * ) from ống kính máy ảnh where id not in ( select id ống kính máy ảnh from ảnh )	mountain_photos
select count ( distinct t2.id ống kính máy ảnh ) from núi as t1 join ảnh as t2 on t1.id = t2.id núi where t1.quốc gia = "Ethiopia"	mountain_photos
select t3.nhãn hiệu from núi as t1 join ảnh as t2 on t1.id = t2.id núi join ống kính máy ảnh as t3 on t2.id ống kính máy ảnh = t3.id where t1.dãy núi = "Toubkal Atlas" intersect select t3.nhãn hiệu from núi as t1 join ảnh as t2 on t1.id = t2.id núi join ống kính máy ảnh as t3 on t2.id ống kính máy ảnh = t3.id where t1.dãy núi = "Lasta Massif"	mountain_photos
select tên , độ nổi from núi except select t1.tên , t1.độ nổi from núi as t1 join ảnh as t2 on t1.id = t2.id núi join ống kính máy ảnh as t3 on t2.id ống kính máy ảnh = t3.id where t3.nhãn hiệu = "Sigma"	mountain_photos
select tên from ống kính máy ảnh where tên like "%Digital%"	mountain_photos
select t1.tên , count ( * ) from ống kính máy ảnh as t1 join ảnh as t2 on t1.id = t2.id ống kính máy ảnh group by t1.id order by count ( * )	mountain_photos
select count ( * ) from ban nhạc	music_2
select count ( * ) from ban nhạc	music_2
select distinct hãng thu âm from album	music_2
select distinct hãng thu âm from album	music_2
select * from album where năm = 2012	music_2
select * from album where năm = 2012	music_2
select distinct t1.vị trí trên sân khấu from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where tên = "Solveig"	music_2
select distinct t1.vị trí trên sân khấu from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where tên = "Solveig"	music_2
select count ( * ) from bài hát	music_2
select count ( * ) from bài hát	music_2
select t3.tiêu đề from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.họ = "Heilo"	music_2
select t3.tiêu đề from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.họ = "Heilo"	music_2
select count ( * ) from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Flash"	music_2
select count ( * ) from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Flash"	music_2
select t3.tiêu đề from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.tên = "Marianne"	music_2
select t3.tiêu đề from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t2.tên = "Marianne"	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Badlands"	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Badlands"	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Badlands" and t1.vị trí trên sân khấu = "back"	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Badlands" and t1.vị trí trên sân khấu = "back"	music_2
select count ( distinct hãng thu âm ) from album	music_2
select count ( distinct hãng thu âm ) from album	music_2
select hãng thu âm from album group by hãng thu âm order by count ( * ) desc limit 1	music_2
select hãng thu âm from album group by hãng thu âm order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where vị trí trên sân khấu = "back" group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where vị trí trên sân khấu = "back" group by họ order by count ( * ) desc limit 1	music_2
select tiêu đề from bài hát where tiêu đề like "% the %"	music_2
select tiêu đề from bài hát where tiêu đề like "% the %"	music_2
select distinct nhạc cụ from nhạc cụ	music_2
select distinct nhạc cụ from nhạc cụ	music_2
select t4.nhạc cụ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu đề = "Le Pop"	music_2
select t4.nhạc cụ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu đề = "Le Pop"	music_2
select nhạc cụ from nhạc cụ group by nhạc cụ order by count ( * ) desc limit 1	music_2
select nhạc cụ from nhạc cụ group by nhạc cụ order by count ( * ) desc limit 1	music_2
select count ( * ) from nhạc cụ where nhạc cụ = "drums"	music_2
select count ( * ) from nhạc cụ where nhạc cụ = "drums"	music_2
select nhạc cụ from nhạc cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select nhạc cụ from nhạc cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select count ( distinct nhạc cụ ) from nhạc cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select count ( distinct nhạc cụ ) from nhạc cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select count ( distinct nhạc cụ ) from nhạc cụ as t1 join ban nhạc as t2 on t1.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select count ( distinct nhạc cụ ) from nhạc cụ as t1 join ban nhạc as t2 on t1.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select nhạc cụ from nhạc cụ as t1 join ban nhạc as t2 on t1.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select nhạc cụ from nhạc cụ as t1 join ban nhạc as t2 on t1.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo"	music_2
select tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát group by t1.id bài hát order by count ( * ) desc limit 1	music_2
select tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát group by t1.id bài hát order by count ( * ) desc limit 1	music_2
select loại from giọng hát group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where họ = "Heilo" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where họ = "Heilo" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Demon Kitty Rag"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Demon Kitty Rag"	music_2
select count ( distinct tiêu đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select count ( distinct tiêu đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ sĩ trong ban nhạc = t3.id where t3.tên = "Solveig" and t2.tiêu đề = "A Bar In Amsterdam"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ sĩ trong ban nhạc = t3.id where t3.tên = "Solveig" and t2.tiêu đề = "A Bar In Amsterdam"	music_2
select distinct tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select distinct tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "lead"	music_2
select distinct loại from giọng hát	music_2
select distinct loại from giọng hát	music_2
select * from album where năm = 2010	music_2
select * from album where năm = 2010	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Le Pop"	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Le Pop"	music_2
select t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by họ order by count ( * ) desc limit 1	music_2
select t4.nhạc cụ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu đề = "Badlands"	music_2
select t4.nhạc cụ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát join nhạc cụ as t4 on t4.id bài hát = t3.id bài hát and t4.id nghệ sĩ trong ban nhạc = t2.id where t2.họ = "Heilo" and t3.tiêu đề = "Badlands"	music_2
select count ( distinct nhạc cụ ) from nhạc cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Badlands"	music_2
select count ( distinct nhạc cụ ) from nhạc cụ as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Badlands"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Badlands"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Badlands"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select count ( * ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where tiêu đề = "Le Pop"	music_2
select count ( distinct tiêu đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "shared"	music_2
select count ( distinct tiêu đề ) from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "shared"	music_2
select distinct tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select distinct tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where tên = "Solveig" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where tên = "Solveig" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ sĩ trong ban nhạc = t3.id where t3.họ = "Heilo" and t2.tiêu đề = "Der Kapitan"	music_2
select loại from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát join ban nhạc as t3 on t1.nghệ sĩ trong ban nhạc = t3.id where t3.họ = "Heilo" and t2.tiêu đề = "Der Kapitan"	music_2
select t2.tên from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by tên order by count ( * ) desc limit 1	music_2
select t2.tên from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát group by tên order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where tên = "Marianne" group by loại order by count ( * ) desc limit 1	music_2
select loại from giọng hát as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id where tên = "Marianne" group by loại order by count ( * ) desc limit 1	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Der Kapitan" and t1.vị trí trên sân khấu = "back"	music_2
select t2.tên , t2.họ from buổi biểu diễn as t1 join ban nhạc as t2 on t1.nghệ sĩ trong ban nhạc = t2.id join bài hát as t3 on t3.id bài hát = t1.id bài hát where t3.tiêu đề = "Der Kapitan" and t1.vị trí trên sân khấu = "back"	music_2
select distinct tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select distinct tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát except select t2.tiêu đề from giọng hát as t1 join bài hát as t2 on t1.id bài hát = t2.id bài hát where loại = "back"	music_2
select t3.tiêu đề from album as t1 join danh sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.tiêu đề = "A Kiss Before You Go: Live in Hamburg"	music_2
select t3.tiêu đề from album as t1 join danh sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.tiêu đề = "A Kiss Before You Go: Live in Hamburg"	music_2
select t3.tiêu đề from album as t1 join danh sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.hãng thu âm = "Universal Music Group"	music_2
select t3.tiêu đề from album as t1 join danh sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.hãng thu âm = "Universal Music Group"	music_2
select count ( distinct t3.tiêu đề ) from album as t1 join danh sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.loại = "Studio"	music_2
select count ( distinct t3.tiêu đề ) from album as t1 join danh sách bài hát as t2 on t1.id album = t2.id album join bài hát as t3 on t2.id bài hát = t3.id bài hát where t1.loại = "Studio"	music_2
select t1.khách hàng tốt hay xấu from khách hàng as t1 join phiếu giảm giá as t2 on t1.id phiếu giảm giá = t2.id phiếu giảm giá where t2.số tiền giảm giá = 500	products_for_hire
select t1.id khách hàng , t1.tên , count ( * ) from khách hàng as t1 join lượt đặt mua as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng	products_for_hire
select id khách hàng , sum ( số tiền đã trả ) from thanh toán group by id khách hàng order by sum ( số tiền đã trả ) desc limit 1	products_for_hire
select t1.id đặt mua , t1.số tiền hoàn trả from lượt đặt mua as t1 join thanh toán as t2 on t1.id đặt mua = t2.id đặt mua group by t1.id đặt mua order by count ( * ) desc limit 1	products_for_hire
select id sản phẩm from sản phẩm được đặt group by id sản phẩm having count ( * ) = 3	products_for_hire
select t2.mô tả sản phẩm from sản phẩm được đặt as t1 join sản phẩm cho thuê as t2 on t1.id sản phẩm = t2.id sản phẩm where t1.số tiền đã đặt = 102.76	products_for_hire
select t3.ngày bắt đầu đặt mua , t3.ngày kết thúc đặt mua from sản phẩm cho thuê as t1 join sản phẩm được đặt as t2 on t1.id sản phẩm = t2.id sản phẩm join lượt đặt mua as t3 on t2.id đặt mua = t3.id đặt mua where t1.tên sản phẩm = "Book collection A"	products_for_hire
select t2.tên sản phẩm from sản phẩm có sẵn as t1 join sản phẩm cho thuê as t2 on t1.id sản phẩm = t2.id sản phẩm where t1.có sẵn hay không = 1	products_for_hire
select count ( distinct mã loại sản phẩm ) from sản phẩm cho thuê	products_for_hire
select tên , họ , giới tính from khách hàng where khách hàng tốt hay xấu = "good" order by họ	products_for_hire
select avg ( số tiền nợ ) from thanh toán	products_for_hire
select max ( số lượng đặt mua ) , min ( số lượng đặt mua ) , avg ( số lượng đặt mua ) from sản phẩm được đặt	products_for_hire
select distinct mã loại thanh toán from thanh toán	products_for_hire
select chi phí thuê hàng ngày from sản phẩm cho thuê where tên sản phẩm like "%Book%"	products_for_hire
select count ( * ) from sản phẩm cho thuê where id sản phẩm not in ( select id sản phẩm from sản phẩm được đặt where số tiền đã đặt > 200 )	products_for_hire
select t1.số tiền giảm giá from phiếu giảm giá as t1 join khách hàng as t2 on t1.id phiếu giảm giá = t2.id phiếu giảm giá where t2.khách hàng tốt hay xấu = "good" intersect select t1.số tiền giảm giá from phiếu giảm giá as t1 join khách hàng as t2 on t1.id phiếu giảm giá = t2.id phiếu giảm giá where t2.khách hàng tốt hay xấu = "bad"	products_for_hire
select ngày thanh toán from thanh toán where số tiền đã trả > 300 or mã loại thanh toán = "Check"	products_for_hire
select tên sản phẩm , mô tả sản phẩm from sản phẩm cho thuê where mã loại sản phẩm = "Cutlery" and chi phí thuê hàng ngày < 20	products_for_hire
select tên nhà hàng from nhà hàng	restaurant_1
select địa chỉ from nhà hàng where tên nhà hàng = "Subway"	restaurant_1
select đánh giá xếp hạng from nhà hàng where tên nhà hàng = "Subway"	restaurant_1
select tên loại nhà hàng from loại nhà hàng	restaurant_1
select mô tả về loại nhà hàng from loại nhà hàng where tên loại nhà hàng = "Sandwich"	restaurant_1
select tên nhà hàng , đánh giá xếp hạng from nhà hàng order by đánh giá xếp hạng desc limit 1	restaurant_1
select tuổi from sinh viên where tên = "Linda" and họ = "Smith"	restaurant_1
select giới tính from sinh viên where tên = "Linda" and họ = "Smith"	restaurant_1
select tên , họ from sinh viên where chuyên ngành = 600	restaurant_1
select mã thành phố from sinh viên where tên = "Linda" and họ = "Smith"	restaurant_1
select count ( * ) from sinh viên where cố vấn = 1121	restaurant_1
select cố vấn , count ( * ) from sinh viên group by cố vấn order by count ( cố vấn ) desc limit 1	restaurant_1
select chuyên ngành , count ( * ) from sinh viên group by chuyên ngành order by count ( chuyên ngành ) asc limit 1	restaurant_1
select chuyên ngành , count ( * ) from sinh viên group by chuyên ngành having count ( chuyên ngành ) between 2 and 30	restaurant_1
select tên , họ from sinh viên where tuổi > 18 and chuyên ngành = 600	restaurant_1
select tên , họ from sinh viên where tuổi > 18 and chuyên ngành != 600 and giới tính = "F"	restaurant_1
select count ( * ) from nhà hàng join loại của nhà hàng on nhà hàng.id nhà hàng = loại của nhà hàng.id nhà hàng join loại nhà hàng on loại của nhà hàng.id loại nhà hàng = loại nhà hàng.id loại nhà hàng group by loại của nhà hàng.id loại nhà hàng having loại nhà hàng.tên loại nhà hàng = "Sandwich"	restaurant_1
select sum ( thời gian dành ra ) from sinh viên join lượt ghé thăm nhà hàng on sinh viên.id sinh viên = lượt ghé thăm nhà hàng.id sinh viên where sinh viên.tên = "Linda" and sinh viên.họ = "Smith"	restaurant_1
select count ( * ) from sinh viên join lượt ghé thăm nhà hàng on sinh viên.id sinh viên = lượt ghé thăm nhà hàng.id sinh viên join nhà hàng on lượt ghé thăm nhà hàng.id nhà hàng = nhà hàng.id nhà hàng where sinh viên.tên = "Linda" and sinh viên.họ = "Smith" and nhà hàng.tên nhà hàng = "Subway"	restaurant_1
select thời gian from sinh viên join lượt ghé thăm nhà hàng on sinh viên.id sinh viên = lượt ghé thăm nhà hàng.id sinh viên join nhà hàng on lượt ghé thăm nhà hàng.id nhà hàng = nhà hàng.id nhà hàng where sinh viên.tên = "Linda" and sinh viên.họ = "Smith" and nhà hàng.tên nhà hàng = "Subway"	restaurant_1
select nhà hàng.tên nhà hàng , sum ( lượt ghé thăm nhà hàng.thời gian dành ra ) from lượt ghé thăm nhà hàng join nhà hàng on lượt ghé thăm nhà hàng.id nhà hàng = nhà hàng.id nhà hàng group by nhà hàng.id nhà hàng order by sum ( lượt ghé thăm nhà hàng.thời gian dành ra ) asc limit 1	restaurant_1
select sinh viên.tên , sinh viên.họ from sinh viên join lượt ghé thăm nhà hàng on sinh viên.id sinh viên = lượt ghé thăm nhà hàng.id sinh viên group by sinh viên.id sinh viên order by count ( * ) desc limit 1	restaurant_1
select count ( distinct họ ) from diễn viên	sakila_1
select count ( distinct họ ) from diễn viên	sakila_1
select tên from diễn viên group by tên order by count ( * ) desc limit 1	sakila_1
select tên from diễn viên group by tên order by count ( * ) desc limit 1	sakila_1
select tên , họ from diễn viên group by tên , họ order by count ( * ) desc limit 1	sakila_1
select tên , họ from diễn viên group by tên , họ order by count ( * ) desc limit 1	sakila_1
select quận from địa chỉ group by quận having count ( * ) >= 2	sakila_1
select quận from địa chỉ group by quận having count ( * ) >= 2	sakila_1
select số điện thoại , mã bưu điện from địa chỉ where địa chỉ = "1031 Daugavpils Parkway"	sakila_1
select số điện thoại , mã bưu điện from địa chỉ where địa chỉ = "1031 Daugavpils Parkway"	sakila_1
select t2.thành phố , count ( * ) , t1.id thành phố from địa chỉ as t1 join thành phố as t2 on t1.id thành phố = t2.id thành phố group by t1.id thành phố order by count ( * ) desc limit 1	sakila_1
select t2.thành phố , count ( * ) , t1.id thành phố from địa chỉ as t1 join thành phố as t2 on t1.id thành phố = t2.id thành phố group by t1.id thành phố order by count ( * ) desc limit 1	sakila_1
select count ( * ) from địa chỉ where quận = "California"	sakila_1
select count ( * ) from địa chỉ where quận = "California"	sakila_1
select tiêu đề , id phim from phim where giá cho thuê = 0.99 intersect select t1.tiêu đề , t1.id phim from phim as t1 join hàng tồn kho as t2 on t1.id phim = t2.id phim group by t1.id phim having count ( * ) < 3	sakila_1
select tiêu đề , id phim from phim where giá cho thuê = 0.99 intersect select t1.tiêu đề , t1.id phim from phim as t1 join hàng tồn kho as t2 on t1.id phim = t2.id phim group by t1.id phim having count ( * ) < 3	sakila_1
select count ( * ) from thành phố as t1 join quốc gia as t2 on t1.id quốc gia = t2.id quốc gia where t2.quốc gia = "Australia"	sakila_1
select count ( * ) from thành phố as t1 join quốc gia as t2 on t1.id quốc gia = t2.id quốc gia where t2.quốc gia = "Australia"	sakila_1
select t2.quốc gia from thành phố as t1 join quốc gia as t2 on t1.id quốc gia = t2.id quốc gia group by t2.id quốc gia having count ( * ) >= 3	sakila_1
select t2.quốc gia from thành phố as t1 join quốc gia as t2 on t1.id quốc gia = t2.id quốc gia group by t2.id quốc gia having count ( * ) >= 3	sakila_1
select ngày thanh toán from khoản thanh toán where số tiền > 10 union select t1.ngày thanh toán from khoản thanh toán as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Elsa"	sakila_1
select ngày thanh toán from khoản thanh toán where số tiền > 10 union select t1.ngày thanh toán from khoản thanh toán as t1 join nhân viên as t2 on t1.id nhân viên = t2.id nhân viên where t2.tên = "Elsa"	sakila_1
select count ( * ) from khách hàng where có hoạt động không = "1"	sakila_1
select count ( * ) from khách hàng where có hoạt động không = "1"	sakila_1
select tiêu đề , giá cho thuê from phim order by giá cho thuê desc limit 1	sakila_1
select tiêu đề , giá cho thuê from phim order by giá cho thuê desc limit 1	sakila_1
select t2.tiêu đề , t2.id phim , t2.mô tả from diễn viên điện ảnh as t1 join phim as t2 on t1.id phim = t2.id phim group by t2.id phim order by count ( * ) desc limit 1	sakila_1
select t2.tiêu đề , t2.id phim , t2.mô tả from diễn viên điện ảnh as t1 join phim as t2 on t1.id phim = t2.id phim group by t2.id phim order by count ( * ) desc limit 1	sakila_1
select t2.tên , t2.họ , t2.id diễn viên from diễn viên điện ảnh as t1 join diễn viên as t2 on t1.id diễn viên = t2.id diễn viên group by t2.id diễn viên order by count ( * ) desc limit 1	sakila_1
select t2.tên , t2.họ , t2.id diễn viên from diễn viên điện ảnh as t1 join diễn viên as t2 on t1.id diễn viên = t2.id diễn viên group by t2.id diễn viên order by count ( * ) desc limit 1	sakila_1
select t2.tên , t2.họ from diễn viên điện ảnh as t1 join diễn viên as t2 on t1.id diễn viên = t2.id diễn viên group by t2.id diễn viên having count ( * ) > 30	sakila_1
select t2.tên , t2.họ from diễn viên điện ảnh as t1 join diễn viên as t2 on t1.id diễn viên = t2.id diễn viên group by t2.id diễn viên having count ( * ) > 30	sakila_1
select id cửa hàng from hàng tồn kho group by id cửa hàng order by count ( * ) desc limit 1	sakila_1
select id cửa hàng from hàng tồn kho group by id cửa hàng order by count ( * ) desc limit 1	sakila_1
select sum ( số tiền ) from khoản thanh toán	sakila_1
select sum ( số tiền ) from khoản thanh toán	sakila_1
select t1.tên , t1.họ , t1.id khách hàng from khách hàng as t1 join khoản thanh toán as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng order by sum ( số tiền ) asc limit 1	sakila_1
select t1.tên , t1.họ , t1.id khách hàng from khách hàng as t1 join khoản thanh toán as t2 on t1.id khách hàng = t2.id khách hàng group by t1.id khách hàng order by sum ( số tiền ) asc limit 1	sakila_1
select t1.tên from danh mục as t1 join danh mục phim as t2 on t1.id danh mục = t2.id danh mục join phim as t3 on t2.id phim = t3.id phim where t3.tiêu đề = "HUNGER ROOF"	sakila_1
select t1.tên from danh mục as t1 join danh mục phim as t2 on t1.id danh mục = t2.id danh mục join phim as t3 on t2.id phim = t3.id phim where t3.tiêu đề = "HUNGER ROOF"	sakila_1
select t2.tên , t1.id danh mục , count ( * ) from danh mục phim as t1 join danh mục as t2 on t1.id danh mục = t2.id danh mục group by t1.id danh mục	sakila_1
select t2.tên , t1.id danh mục , count ( * ) from danh mục phim as t1 join danh mục as t2 on t1.id danh mục = t2.id danh mục group by t1.id danh mục	sakila_1
select t1.tiêu đề , t1.id phim from phim as t1 join hàng tồn kho as t2 on t1.id phim = t2.id phim group by t1.id phim order by count ( * ) desc limit 1	sakila_1
select t1.tiêu đề , t1.id phim from phim as t1 join hàng tồn kho as t2 on t1.id phim = t2.id phim group by t1.id phim order by count ( * ) desc limit 1	sakila_1
select t1.tiêu đề , t2.id hàng tồn kho from phim as t1 join hàng tồn kho as t2 on t1.id phim = t2.id phim join lượt cho thuê as t3 on t2.id hàng tồn kho = t3.id hàng tồn kho group by t2.id hàng tồn kho order by count ( * ) desc limit 1	sakila_1
select t1.tiêu đề , t2.id hàng tồn kho from phim as t1 join hàng tồn kho as t2 on t1.id phim = t2.id phim join lượt cho thuê as t3 on t2.id hàng tồn kho = t3.id hàng tồn kho group by t2.id hàng tồn kho order by count ( * ) desc limit 1	sakila_1
select count ( distinct id ngôn ngữ ) from phim	sakila_1
select count ( distinct id ngôn ngữ ) from phim	sakila_1
select tiêu đề from phim where đánh giá xếp hạng = "R"	sakila_1
select tiêu đề from phim where đánh giá xếp hạng = "R"	sakila_1
select t2.địa chỉ from cửa hàng as t1 join địa chỉ as t2 on t1.id địa chỉ = t2.id địa chỉ where id cửa hàng = 1	sakila_1
select t2.địa chỉ from cửa hàng as t1 join địa chỉ as t2 on t1.id địa chỉ = t2.id địa chỉ where id cửa hàng = 1	sakila_1
select t1.tên , t1.họ , t1.id nhân viên from nhân viên as t1 join khoản thanh toán as t2 on t1.id nhân viên = t2.id nhân viên group by t1.id nhân viên order by count ( * ) asc limit 1	sakila_1
select t1.tên , t1.họ , t1.id nhân viên from nhân viên as t1 join khoản thanh toán as t2 on t1.id nhân viên = t2.id nhân viên group by t1.id nhân viên order by count ( * ) asc limit 1	sakila_1
select t2.tên from phim as t1 join ngôn ngữ as t2 on t1.id ngôn ngữ = t2.id ngôn ngữ where t1.tiêu đề = "AIRPORT POLLOCK"	sakila_1
select t2.tên from phim as t1 join ngôn ngữ as t2 on t1.id ngôn ngữ = t2.id ngôn ngữ where t1.tiêu đề = "AIRPORT POLLOCK"	sakila_1
select count ( * ) from cửa hàng	sakila_1
select count ( * ) from cửa hàng	sakila_1
select count ( distinct đánh giá xếp hạng ) from phim	sakila_1
select count ( distinct đánh giá xếp hạng ) from phim	sakila_1
select tiêu đề from phim where tính năng đặc biệt like "%Deleted Scenes%"	sakila_1
select tiêu đề from phim where tính năng đặc biệt like "%Deleted Scenes%"	sakila_1
select count ( * ) from hàng tồn kho where id cửa hàng = 1	sakila_1
select count ( * ) from hàng tồn kho where id cửa hàng = 1	sakila_1
select ngày thanh toán from khoản thanh toán order by ngày thanh toán asc limit 1	sakila_1
select ngày thanh toán from khoản thanh toán order by ngày thanh toán asc limit 1	sakila_1
select t2.địa chỉ , t1.email from khách hàng as t1 join địa chỉ as t2 on t2.id địa chỉ = t1.id địa chỉ where t1.tên = "LINDA"	sakila_1
select t2.địa chỉ , t1.email from khách hàng as t1 join địa chỉ as t2 on t2.id địa chỉ = t1.id địa chỉ where t1.tên = "LINDA"	sakila_1
select tiêu đề from phim where thời lượng phim > 100 or đánh giá xếp hạng = "PG" except select tiêu đề from phim where giá thay thế > 200	sakila_1
select tiêu đề from phim where thời lượng phim > 100 or đánh giá xếp hạng = "PG" except select tiêu đề from phim where giá thay thế > 200	sakila_1
select t1.tên , t1.họ from khách hàng as t1 join lượt cho thuê as t2 on t1.id khách hàng = t2.id khách hàng order by t2.ngày cho thuê asc limit 1	sakila_1
select t1.tên , t1.họ from khách hàng as t1 join lượt cho thuê as t2 on t1.id khách hàng = t2.id khách hàng order by t2.ngày cho thuê asc limit 1	sakila_1
select distinct t1.tên , t1.họ from nhân viên as t1 join lượt cho thuê as t2 on t1.id nhân viên = t2.id nhân viên join khách hàng as t3 on t2.id khách hàng = t3.id khách hàng where t3.tên = "APRIL" and t3.họ = "BURNS"	sakila_1
select distinct t1.tên , t1.họ from nhân viên as t1 join lượt cho thuê as t2 on t1.id nhân viên = t2.id nhân viên join khách hàng as t3 on t2.id khách hàng = t3.id khách hàng where t3.tên = "APRIL" and t3.họ = "BURNS"	sakila_1
select id cửa hàng from khách hàng group by id cửa hàng order by count ( * ) desc limit 1	sakila_1
select id cửa hàng from khách hàng group by id cửa hàng order by count ( * ) desc limit 1	sakila_1
select số tiền from khoản thanh toán order by số tiền desc limit 1	sakila_1
select số tiền from khoản thanh toán order by số tiền desc limit 1	sakila_1
select t2.địa chỉ from nhân viên as t1 join địa chỉ as t2 on t1.id địa chỉ = t2.id địa chỉ where t1.tên = "Elsa"	sakila_1
select t2.địa chỉ from nhân viên as t1 join địa chỉ as t2 on t1.id địa chỉ = t2.id địa chỉ where t1.tên = "Elsa"	sakila_1
select tên from khách hàng where id khách hàng not in ( select id khách hàng from lượt cho thuê where ngày cho thuê > "2005-08-23 02:06:01" )	sakila_1
select tên from khách hàng where id khách hàng not in ( select id khách hàng from lượt cho thuê where ngày cho thuê > "2005-08-23 02:06:01" )	sakila_1
select count ( * ) from tài xế	school_bus
select tên , thành phố quê hương , tuổi from tài xế	school_bus
select đảng , count ( * ) from tài xế group by đảng	school_bus
select tên from tài xế order by tuổi desc	school_bus
select distinct thành phố quê hương from tài xế	school_bus
select thành phố quê hương from tài xế group by thành phố quê hương order by count ( * ) desc limit 1	school_bus
select đảng from tài xế where thành phố quê hương = "Hartford" and tuổi > 40	school_bus
select thành phố quê hương from tài xế where tuổi > 40 group by thành phố quê hương having count ( * ) >= 2	school_bus
select thành phố quê hương from tài xế except select thành phố quê hương from tài xế where tuổi > 40	school_bus
select tên from tài xế where id tài xế not in ( select id tài xế from xe buýt của trường học )	school_bus
select loại hình from trường học group by loại hình having count ( * ) = 2	school_bus
select t2.trường học , t3.tên from xe buýt của trường học as t1 join trường học as t2 on t1.id trường học = t2.id trường học join tài xế as t3 on t1.id tài xế = t3.id tài xế	school_bus
select max ( số năm làm việc ) , min ( số năm làm việc ) , avg ( số năm làm việc ) from xe buýt của trường học	school_bus
select trường học , loại hình from trường học where id trường học not in ( select id trường học from xe buýt của trường học )	school_bus
select t2.loại hình , count ( * ) from xe buýt của trường học as t1 join trường học as t2 on t1.id trường học = t2.id trường học group by t2.loại hình	school_bus
select count ( * ) from tài xế where thành phố quê hương = "Hartford" or tuổi < 40	school_bus
select tên from tài xế where thành phố quê hương = "Hartford" and tuổi < 40	school_bus
select t1.tên from tài xế as t1 join xe buýt của trường học as t2 on t1.id tài xế = t2.id tài xế order by số năm làm việc desc limit 1	school_bus
select count ( * ) from trường học	school_player
select count ( * ) from trường học	school_player
select địa điểm from trường học order by số lượng nhập học asc	school_player
select địa điểm from trường học order by số lượng nhập học asc	school_player
select địa điểm from trường học order by năm thành lập desc	school_player
select địa điểm from trường học order by năm thành lập desc	school_player
select số lượng nhập học from trường học where tôn giáo != "Catholic"	school_player
select số lượng nhập học from trường học where tôn giáo != "Catholic"	school_player
select avg ( số lượng nhập học ) from trường học	school_player
select avg ( số lượng nhập học ) from trường học	school_player
select đội from cầu thủ order by đội asc	school_player
select đội from cầu thủ order by đội asc	school_player
select count ( distinct vị trí ) from cầu thủ	school_player
select count ( distinct vị trí ) from cầu thủ	school_player
select đội from cầu thủ order by tuổi desc limit 1	school_player
select đội from cầu thủ order by tuổi desc limit 1	school_player
select đội from cầu thủ order by tuổi desc limit 5	school_player
select đội from cầu thủ order by tuổi desc limit 5	school_player
select t1.đội , t2.địa điểm from cầu thủ as t1 join trường học as t2 on t1.id trường = t2.id trường	school_player
select t1.đội , t2.địa điểm from cầu thủ as t1 join trường học as t2 on t1.id trường = t2.id trường	school_player
select t2.địa điểm from cầu thủ as t1 join trường học as t2 on t1.id trường = t2.id trường group by t1.id trường having count ( * ) > 1	school_player
select t2.địa điểm from cầu thủ as t1 join trường học as t2 on t1.id trường = t2.id trường group by t1.id trường having count ( * ) > 1	school_player
select t2.tôn giáo from cầu thủ as t1 join trường học as t2 on t1.id trường = t2.id trường group by t1.id trường order by count ( * ) desc limit 1	school_player
select t2.tôn giáo from cầu thủ as t1 join trường học as t2 on t1.id trường = t2.id trường group by t1.id trường order by count ( * ) desc limit 1	school_player
select t1.địa điểm , t2.biệt danh from trường học as t1 join chi tiết trường học as t2 on t1.id trường = t2.id trường	school_player
select t1.địa điểm , t2.biệt danh from trường học as t1 join chi tiết trường học as t2 on t1.id trường = t2.id trường	school_player
select tôn giáo , count ( * ) from trường học group by tôn giáo	school_player
select tôn giáo , count ( * ) from trường học group by tôn giáo	school_player
select tôn giáo , count ( * ) from trường học group by tôn giáo order by count ( * ) desc	school_player
select tôn giáo , count ( * ) from trường học group by tôn giáo order by count ( * ) desc	school_player
select màu của trường from trường học order by số lượng nhập học desc limit 1	school_player
select màu của trường from trường học order by số lượng nhập học desc limit 1	school_player
select địa điểm from trường học where id trường not in ( select id trường from cầu thủ )	school_player
select địa điểm from trường học where id trường not in ( select id trường from cầu thủ )	school_player
select tôn giáo from trường học where năm thành lập < 1890 intersect select tôn giáo from trường học where năm thành lập > 1900	school_player
select tôn giáo from trường học where năm thành lập < 1890 intersect select tôn giáo from trường học where năm thành lập > 1900	school_player
select biệt danh from chi tiết trường học where phân hạng != "Division 1"	school_player
select biệt danh from chi tiết trường học where phân hạng != "Division 1"	school_player
select tôn giáo from trường học group by tôn giáo having count ( * ) > 1	school_player
select tôn giáo from trường học group by tôn giáo having count ( * ) > 1	school_player
select t1.tên , t2.tên from quốc gia as t1 join giải đấu as t2 on t1.id = t2.id quốc gia	soccer_1
select count ( * ) from quốc gia as t1 join giải đấu as t2 on t1.id = t2.id quốc gia where t1.tên = "England"	soccer_1
select avg ( cân nặng ) from cầu thủ	soccer_1
select max ( cân nặng ) , min ( cân nặng ) from cầu thủ	soccer_1
select distinct t1.tên cầu thủ from cầu thủ as t1 join đặc điểm của cầu thủ as t2 on t1.id cầu thủ api = t2.id cầu thủ api where t2.đánh giá tổng thể > ( select avg ( đánh giá tổng thể ) from đặc điểm của cầu thủ )	soccer_1
select distinct t1.tên cầu thủ from cầu thủ as t1 join đặc điểm của cầu thủ as t2 on t1.id cầu thủ api = t2.id cầu thủ api where t2.rê bóng = ( select max ( đánh giá tổng thể ) from đặc điểm của cầu thủ )	soccer_1
select distinct t1.tên cầu thủ from cầu thủ as t1 join đặc điểm của cầu thủ as t2 on t1.id cầu thủ api = t2.id cầu thủ api where t2.tạt bóng > 90 and t2.chân thuận = "right"	soccer_1
select distinct t1.tên cầu thủ from cầu thủ as t1 join đặc điểm của cầu thủ as t2 on t1.id cầu thủ api = t2.id cầu thủ api where t2.chân thuận = "left" and t2.đánh giá tổng thể >= 85 and t2.đánh giá tổng thể <= 90	soccer_1
select chân thuận , avg ( đánh giá tổng thể ) from đặc điểm của cầu thủ group by chân thuận	soccer_1
select chân thuận , count ( * ) from đặc điểm của cầu thủ where đánh giá tổng thể > 80 group by chân thuận	soccer_1
select id cầu thủ api from cầu thủ where chiều cao >= 180 intersect select id cầu thủ api from đặc điểm của cầu thủ where đánh giá tổng thể > 85	soccer_1
select id cầu thủ api from cầu thủ where chiều cao >= 180 and chiều cao <= 190 intersect select id cầu thủ api from đặc điểm của cầu thủ where chân thuận = "left"	soccer_1
select distinct t1.tên cầu thủ from cầu thủ as t1 join đặc điểm của cầu thủ as t2 on t1.id cầu thủ api = t2.id cầu thủ api order by đánh giá tổng thể desc limit 3	soccer_1
select distinct t1.tên cầu thủ , t1.ngày sinh from cầu thủ as t1 join đặc điểm của cầu thủ as t2 on t1.id cầu thủ api = t2.id cầu thủ api order by tiềm năng desc limit 5	soccer_1
select distinct tên quận from quận order by diện tích của các thành phố desc	store_product
select distinct tên quận from quận order by diện tích của các thành phố desc	store_product
select kích thước trang tối đa from sản phẩm group by kích thước trang tối đa having count ( * ) > 3	store_product
select kích thước trang tối đa from sản phẩm group by kích thước trang tối đa having count ( * ) > 3	store_product
select tên quận , dân số thành phố from quận where dân số thành phố between 200000 and 2000000	store_product
select tên quận , dân số thành phố from quận where dân số thành phố between 200000 and 2000000	store_product
select tên quận from quận where diện tích của các thành phố > 10 or dân số thành phố > 100000	store_product
select tên quận from quận where diện tích của các thành phố > 10 or dân số thành phố > 100000	store_product
select tên quận from quận order by dân số thành phố desc limit 1	store_product
select tên quận from quận order by dân số thành phố desc limit 1	store_product
select tên quận from quận order by diện tích của các thành phố asc limit 1	store_product
select tên quận from quận order by diện tích của các thành phố asc limit 1	store_product
select sum ( dân số thành phố ) from quận order by diện tích của các thành phố desc limit 3	store_product
select sum ( dân số thành phố ) from quận order by diện tích của các thành phố desc limit 3	store_product
select loại , count ( * ) from cửa hàng group by loại	store_product
select loại , count ( * ) from cửa hàng group by loại	store_product
select t1.tên cửa hàng from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t3.tên quận = "Khanewal District"	store_product
select t1.tên cửa hàng from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t3.tên quận = "Khanewal District"	store_product
select t1.tên cửa hàng from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng where id quận = ( select id quận from quận order by dân số thành phố desc limit 1 )	store_product
select t1.tên cửa hàng from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng where id quận = ( select id quận from quận order by dân số thành phố desc limit 1 )	store_product
select t3.thành phố của các trụ sở from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t1.tên cửa hàng = "Blackville"	store_product
select t3.thành phố của các trụ sở from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t1.tên cửa hàng = "Blackville"	store_product
select t3.thành phố của các trụ sở , count ( * ) from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành phố của các trụ sở	store_product
select t3.thành phố của các trụ sở , count ( * ) from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành phố của các trụ sở	store_product
select t3.thành phố của các trụ sở from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành phố của các trụ sở order by count ( * ) desc limit 1	store_product
select t3.thành phố của các trụ sở from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận group by t3.thành phố của các trụ sở order by count ( * ) desc limit 1	store_product
select avg ( số trang màu trên từng phút ) from sản phẩm	store_product
select avg ( số trang màu trên từng phút ) from sản phẩm	store_product
select t1.sản phẩm from sản phẩm as t1 join sản phẩm của cửa hàng as t2 on t1.id sản phẩm = t2.id sản phẩm join cửa hàng as t3 on t2.id cửa hàng = t3.id cửa hàng where t3.tên cửa hàng = "Miramichi"	store_product
select t1.sản phẩm from sản phẩm as t1 join sản phẩm của cửa hàng as t2 on t1.id sản phẩm = t2.id sản phẩm join cửa hàng as t3 on t2.id cửa hàng = t3.id cửa hàng where t3.tên cửa hàng = "Miramichi"	store_product
select sản phẩm from sản phẩm where kích thước trang tối đa = "A4" and số trang màu trên từng phút < 5	store_product
select sản phẩm from sản phẩm where kích thước trang tối đa = "A4" and số trang màu trên từng phút < 5	store_product
select sản phẩm from sản phẩm where kích thước trang tối đa = "A4" or số trang màu trên từng phút < 5	store_product
select sản phẩm from sản phẩm where kích thước trang tối đa = "A4" or số trang màu trên từng phút < 5	store_product
select sản phẩm from sản phẩm where sản phẩm like "%Scanner%"	store_product
select sản phẩm from sản phẩm where sản phẩm like "%Scanner%"	store_product
select kích thước trang tối đa from sản phẩm group by kích thước trang tối đa order by count ( * ) desc limit 1	store_product
select kích thước trang tối đa from sản phẩm group by kích thước trang tối đa order by count ( * ) desc limit 1	store_product
select sản phẩm from sản phẩm where sản phẩm != ( select kích thước trang tối đa from sản phẩm group by kích thước trang tối đa order by count ( * ) desc limit 1 )	store_product
select sản phẩm from sản phẩm where sản phẩm != ( select kích thước trang tối đa from sản phẩm group by kích thước trang tối đa order by count ( * ) desc limit 1 )	store_product
select sum ( dân số thành phố ) from quận where diện tích của các thành phố > ( select avg ( diện tích của các thành phố ) from quận )	store_product
select sum ( dân số thành phố ) from quận where diện tích của các thành phố > ( select avg ( diện tích của các thành phố ) from quận )	store_product
select t3.tên quận from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "City Mall" intersect select t3.tên quận from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "Village Store"	store_product
select t3.tên quận from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "City Mall" intersect select t3.tên quận from cửa hàng as t1 join quận của cửa hàng as t2 on t1.id cửa hàng = t2.id cửa hàng join quận as t3 on t2.id quận = t3.id quận where t1.loại = "Village Store"	store_product
select count ( * ) from khu vực	storm_record
select count ( * ) from khu vực	storm_record
select mã khu vực , tên khu vực from khu vực order by mã khu vực	storm_record
select mã khu vực , tên khu vực from khu vực order by mã khu vực	storm_record
select tên khu vực from khu vực order by tên khu vực	storm_record
select tên khu vực from khu vực order by tên khu vực	storm_record
select tên khu vực from khu vực where tên khu vực != "Denmark"	storm_record
select tên khu vực from khu vực where tên khu vực != "Denmark"	storm_record
select count ( * ) from bão where số lượng người chết > 0	storm_record
select count ( * ) from bão where số lượng người chết > 0	storm_record
select tên , ngày hoạt động , số lượng người chết from bão where số lượng người chết >= 1	storm_record
select tên , ngày hoạt động , số lượng người chết from bão where số lượng người chết >= 1	storm_record
select avg ( thiệt hại theo triệu usd ) , max ( thiệt hại theo triệu usd ) from bão where tốc độ tối đa > 1000	storm_record
select avg ( thiệt hại theo triệu usd ) , max ( thiệt hại theo triệu usd ) from bão where tốc độ tối đa > 1000	storm_record
select sum ( số lượng người chết ) , sum ( thiệt hại theo triệu usd ) from bão where tốc độ tối đa > ( select avg ( tốc độ tối đa ) from bão )	storm_record
select sum ( số lượng người chết ) , sum ( thiệt hại theo triệu usd ) from bão where tốc độ tối đa > ( select avg ( tốc độ tối đa ) from bão )	storm_record
select tên , thiệt hại theo triệu usd from bão order by tốc độ tối đa desc	storm_record
select tên , thiệt hại theo triệu usd from bão order by tốc độ tối đa desc	storm_record
select count ( distinct id khu vực ) from khu vực bị ảnh hưởng	storm_record
select count ( distinct id khu vực ) from khu vực bị ảnh hưởng	storm_record
select tên khu vực from khu vực where id khu vực not in ( select id khu vực from khu vực bị ảnh hưởng )	storm_record
select tên khu vực from khu vực where id khu vực not in ( select id khu vực from khu vực bị ảnh hưởng )	storm_record
select t1.tên khu vực , count ( * ) from khu vực as t1 join khu vực bị ảnh hưởng as t2 on t1.id khu vực = t2.id khu vực group by t1.id khu vực	storm_record
select t1.tên khu vực , count ( * ) from khu vực as t1 join khu vực bị ảnh hưởng as t2 on t1.id khu vực = t2.id khu vực group by t1.id khu vực	storm_record
select t1.tên , count ( * ) from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão	storm_record
select t1.tên , count ( * ) from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão	storm_record
select t1.tên , t1.tốc độ tối đa from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão order by count ( * ) desc limit 1	storm_record
select t1.tên , t1.tốc độ tối đa from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão order by count ( * ) desc limit 1	storm_record
select tên from bão where id cơn bão not in ( select id bão from khu vực bị ảnh hưởng )	storm_record
select tên from bão where id cơn bão not in ( select id bão from khu vực bị ảnh hưởng )	storm_record
select t1.tên from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2 intersect select t1.tên from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having sum ( t2.số thành phố bị ảnh hưởng ) >= 10	storm_record
select t1.tên from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2 intersect select t1.tên from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having sum ( t2.số thành phố bị ảnh hưởng ) >= 10	storm_record
select tên from bão except select t1.tên from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2	storm_record
select tên from bão except select t1.tên from bão as t1 join khu vực bị ảnh hưởng as t2 on t1.id cơn bão = t2.id bão group by t1.id cơn bão having count ( * ) >= 2	storm_record
select t2.tên khu vực from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t3.số lượng người chết >= 10	storm_record
select t2.tên khu vực from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t3.số lượng người chết >= 10	storm_record
select t3.tên from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu vực = "Denmark"	storm_record
select t3.tên from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu vực = "Denmark"	storm_record
select t1.tên khu vực from khu vực as t1 join khu vực bị ảnh hưởng as t2 on t1.id khu vực = t2.id khu vực group by t1.id khu vực having count ( * ) >= 2	storm_record
select t1.tên khu vực from khu vực as t1 join khu vực bị ảnh hưởng as t2 on t1.id khu vực = t2.id khu vực group by t1.id khu vực having count ( * ) >= 2	storm_record
select t2.tên khu vực from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão order by t3.số lượng người chết desc limit 1	storm_record
select t2.tên khu vực from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão order by t3.số lượng người chết desc limit 1	storm_record
select t3.tên from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu vực = "Afghanistan" intersect select t3.tên from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu vực = "Albania"	storm_record
select t3.tên from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu vực = "Afghanistan" intersect select t3.tên from khu vực bị ảnh hưởng as t1 join khu vực as t2 on t1.id khu vực = t2.id khu vực join bão as t3 on t1.id bão = t3.id cơn bão where t2.tên khu vực = "Albania"	storm_record
select count ( * ) from danh sách	student_1
select count ( * ) from danh sách	student_1
select họ from danh sách where phòng học = 111	student_1
select họ from danh sách where phòng học = 111	student_1
select tên from danh sách where phòng học = 108	student_1
select tên from danh sách where phòng học = 108	student_1
select distinct tên from danh sách where phòng học = 107	student_1
select distinct tên from danh sách where phòng học = 107	student_1
select distinct phòng học , khối lớp from danh sách	student_1
select distinct phòng học , khối lớp from danh sách	student_1
select distinct khối lớp from danh sách where phòng học = 103	student_1
select distinct khối lớp from danh sách where phòng học = 103	student_1
select distinct khối lớp from danh sách where phòng học = 105	student_1
select distinct khối lớp from danh sách where phòng học = 105	student_1
select distinct phòng học from danh sách where khối lớp = 4	student_1
select distinct phòng học from danh sách where khối lớp = 4	student_1
select distinct phòng học from danh sách where khối lớp = 5	student_1
select distinct phòng học from danh sách where khối lớp = 5	student_1
select distinct t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 5	student_1
select distinct t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 5	student_1
select distinct t2.tên from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 1	student_1
select distinct t2.tên from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where khối lớp = 1	student_1
select tên from giáo viên where phòng học = 110	student_1
select tên from giáo viên where phòng học = 110	student_1
select họ from giáo viên where phòng học = 109	student_1
select họ from giáo viên where phòng học = 109	student_1
select distinct tên , họ from giáo viên	student_1
select distinct tên , họ from giáo viên	student_1
select distinct tên , họ from danh sách	student_1
select distinct tên , họ from danh sách	student_1
select t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "MARROTTE" and t2.họ = "KIRK"	student_1
select t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "MARROTTE" and t2.họ = "KIRK"	student_1
select t2.tên , t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "EVELINA" and t1.họ = "BROMLEY"	student_1
select t2.tên , t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "EVELINA" and t1.họ = "BROMLEY"	student_1
select t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "GELL" and t1.họ = "TAMI"	student_1
select t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "GELL" and t1.họ = "TAMI"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "LORIA" and t2.họ = "ONDERSMA"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "LORIA" and t2.họ = "ONDERSMA"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "KAWA" and t2.họ = "GORDON"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "KAWA" and t2.họ = "GORDON"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "TARRING" and t2.họ = "LEIA"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "TARRING" and t2.họ = "LEIA"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "CHRISSY" and t1.họ = "NABOZNY"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "CHRISSY" and t1.họ = "NABOZNY"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "MADLOCK" and t1.họ = "RAY"	student_1
select count ( * ) from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.tên = "MADLOCK" and t1.họ = "RAY"	student_1
select distinct t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 1 except select t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select distinct t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 1 except select t1.tên , t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t2.tên = "OTHA" and t2.họ = "MOYER"	student_1
select distinct t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 3 and t2.tên != "COVIN" and t2.họ != "JEROME"	student_1
select distinct t1.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học where t1.khối lớp = 3 and t2.tên != "COVIN" and t2.họ != "JEROME"	student_1
select khối lớp , count ( distinct phòng học ) , count ( * ) from danh sách group by khối lớp	student_1
select khối lớp , count ( distinct phòng học ) , count ( * ) from danh sách group by khối lớp	student_1
select phòng học , count ( distinct khối lớp ) from danh sách group by phòng học	student_1
select phòng học , count ( distinct khối lớp ) from danh sách group by phòng học	student_1
select phòng học from danh sách group by phòng học order by count ( * ) desc limit 1	student_1
select phòng học from danh sách group by phòng học order by count ( * ) desc limit 1	student_1
select phòng học , count ( * ) from danh sách group by phòng học	student_1
select phòng học , count ( * ) from danh sách group by phòng học	student_1
select phòng học , count ( * ) from danh sách where khối lớp = "0" group by phòng học	student_1
select phòng học , count ( * ) from danh sách where khối lớp = "0" group by phòng học	student_1
select phòng học , count ( * ) from danh sách where khối lớp = "4" group by phòng học	student_1
select phòng học , count ( * ) from danh sách where khối lớp = "4" group by phòng học	student_1
select t2.tên , t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học group by t2.tên , t2.họ order by count ( * ) desc limit 1	student_1
select t2.tên , t2.họ from danh sách as t1 join giáo viên as t2 on t1.phòng học = t2.phòng học group by t2.tên , t2.họ order by count ( * ) desc limit 1	student_1
select count ( * ) , phòng học from danh sách group by phòng học	student_1
select count ( * ) , phòng học from danh sách group by phòng học	student_1
select t1.tên khoá học from khoá học as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học group by t1.id khoá học order by count ( * ) desc limit 1	student_assessment
select t1.tên khoá học from khoá học as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học group by t1.id khoá học order by count ( * ) desc limit 1	student_assessment
select id sinh viên from lượt đăng ký khoá học của sinh viên group by id sinh viên order by count ( * ) limit 1	student_assessment
select id sinh viên from lượt đăng ký khoá học của sinh viên group by id sinh viên order by count ( * ) limit 1	student_assessment
select t2.tên , t2.họ from ứng cử viên as t1 join cá nhân as t2 on t1.id ứng cử viên = t2.id cá nhân	student_assessment
select t2.tên , t2.họ from ứng cử viên as t1 join cá nhân as t2 on t1.id ứng cử viên = t2.id cá nhân	student_assessment
select id sinh viên from sinh viên where id sinh viên not in ( select id sinh viên from lần tham dự khoá học của sinh viên )	student_assessment
select id sinh viên from sinh viên where id sinh viên not in ( select id sinh viên from lần tham dự khoá học của sinh viên )	student_assessment
select id sinh viên from lần tham dự khoá học của sinh viên	student_assessment
select id sinh viên from lần tham dự khoá học của sinh viên	student_assessment
select t1.id sinh viên , t2.tên khoá học from lượt đăng ký khoá học của sinh viên as t1 join khoá học as t2 on t1.id khoá học = t2.id khoá học	student_assessment
select t2.chi tiết sinh viên from lượt đăng ký khoá học của sinh viên as t1 join sinh viên as t2 on t1.id sinh viên = t2.id sinh viên order by t1.ngày đăng kí desc limit 1	student_assessment
select t2.chi tiết sinh viên from lượt đăng ký khoá học của sinh viên as t1 join sinh viên as t2 on t1.id sinh viên = t2.id sinh viên order by t1.ngày đăng kí desc limit 1	student_assessment
select count ( * ) from khoá học as t1 join lần tham dự khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "English"	student_assessment
select count ( * ) from khoá học as t1 join lần tham dự khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "English"	student_assessment
select count ( * ) from khoá học as t1 join lần tham dự khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t2.id sinh viên = 171	student_assessment
select count ( * ) from khoá học as t1 join lần tham dự khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t2.id sinh viên = 171	student_assessment
select t2.id ứng cử viên from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id ứng cử viên where t1.địa chỉ email = "stanley.monahan@example.org"	student_assessment
select t2.id ứng cử viên from cá nhân as t1 join ứng cử viên as t2 on t1.id cá nhân = t2.id ứng cử viên where t1.địa chỉ email = "stanley.monahan@example.org"	student_assessment
select id ứng cử viên from đánh giá ứng cử viên order by ngày đánh giá desc limit 1	student_assessment
select id ứng cử viên from đánh giá ứng cử viên order by ngày đánh giá desc limit 1	student_assessment
select t1.chi tiết sinh viên from sinh viên as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id sinh viên = t2.id sinh viên group by t1.id sinh viên order by count ( * ) desc limit 1	student_assessment
select t1.chi tiết sinh viên from sinh viên as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id sinh viên = t2.id sinh viên group by t1.id sinh viên order by count ( * ) desc limit 1	student_assessment
select t1.id sinh viên , count ( * ) from sinh viên as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id sinh viên = t2.id sinh viên group by t1.id sinh viên	student_assessment
select t1.id sinh viên , count ( * ) from sinh viên as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id sinh viên = t2.id sinh viên group by t1.id sinh viên	student_assessment
select t3.tên khoá học , count ( * ) from sinh viên as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id sinh viên = t2.id sinh viên join khoá học as t3 on t2.id khoá học = t3.id khoá học group by t2.id khoá học	student_assessment
select t3.tên khoá học , count ( * ) from sinh viên as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id sinh viên = t2.id sinh viên join khoá học as t3 on t2.id khoá học = t3.id khoá học group by t2.id khoá học	student_assessment
select id ứng cử viên from đánh giá ứng cử viên where mã kết quả đánh giá = "Pass"	student_assessment
select id ứng cử viên from đánh giá ứng cử viên where mã kết quả đánh giá = "Pass"	student_assessment
select t3.số di động from ứng cử viên as t1 join đánh giá ứng cử viên as t2 on t1.id ứng cử viên = t2.id ứng cử viên join cá nhân as t3 on t1.id ứng cử viên = t3.id cá nhân where t2.mã kết quả đánh giá = "Fail"	student_assessment
select t3.số di động from ứng cử viên as t1 join đánh giá ứng cử viên as t2 on t1.id ứng cử viên = t2.id ứng cử viên join cá nhân as t3 on t1.id ứng cử viên = t3.id cá nhân where t2.mã kết quả đánh giá = "Fail"	student_assessment
select id sinh viên from lần tham dự khoá học của sinh viên where id khoá học = 301	student_assessment
select id sinh viên from lần tham dự khoá học của sinh viên where id khoá học = 301	student_assessment
select id sinh viên from lần tham dự khoá học của sinh viên where id khoá học = 301 order by ngày tham dự desc limit 1	student_assessment
select id sinh viên from lần tham dự khoá học của sinh viên where id khoá học = 301 order by ngày tham dự desc limit 1	student_assessment
select distinct t1.thành phố from địa chỉ as t1 join địa chỉ cá nhân as t2 on t1.id địa chỉ = t2.id địa chỉ	student_assessment
select distinct t1.thành phố from địa chỉ as t1 join địa chỉ cá nhân as t2 on t1.id địa chỉ = t2.id địa chỉ	student_assessment
select distinct t1.thành phố from địa chỉ as t1 join địa chỉ cá nhân as t2 on t1.id địa chỉ = t2.id địa chỉ join sinh viên as t3 on t2.id cá nhân = t3.id sinh viên	student_assessment
select distinct t1.thành phố from địa chỉ as t1 join địa chỉ cá nhân as t2 on t1.id địa chỉ = t2.id địa chỉ join sinh viên as t3 on t2.id cá nhân = t3.id sinh viên	student_assessment
select tên khoá học from khoá học order by tên khoá học	student_assessment
select tên khoá học from khoá học order by tên khoá học	student_assessment
select tên from cá nhân order by tên	student_assessment
select tên from cá nhân order by tên	student_assessment
select id sinh viên from lượt đăng ký khoá học của sinh viên union select id sinh viên from lần tham dự khoá học của sinh viên	student_assessment
select id sinh viên from lượt đăng ký khoá học của sinh viên union select id sinh viên from lần tham dự khoá học của sinh viên	student_assessment
select id khoá học from lượt đăng ký khoá học của sinh viên where id sinh viên = 121 union select id khoá học from lần tham dự khoá học của sinh viên where id sinh viên = 121	student_assessment
select id khoá học from lượt đăng ký khoá học của sinh viên where id sinh viên = 121 union select id khoá học from lần tham dự khoá học của sinh viên where id sinh viên = 121	student_assessment
select * from lượt đăng ký khoá học của sinh viên where id sinh viên not in ( select id sinh viên from lần tham dự khoá học của sinh viên )	student_assessment
select * from lượt đăng ký khoá học của sinh viên where id sinh viên not in ( select id sinh viên from lần tham dự khoá học của sinh viên )	student_assessment
select t2.id sinh viên from khoá học as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày đăng kí	student_assessment
select t2.id sinh viên from khoá học as t1 join lượt đăng ký khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày đăng kí	student_assessment
select t2.id sinh viên from khoá học as t1 join lần tham dự khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày tham dự	student_assessment
select t2.id sinh viên from khoá học as t1 join lần tham dự khoá học của sinh viên as t2 on t1.id khoá học = t2.id khoá học where t1.tên khoá học = "statistics" order by t2.ngày tham dự	student_assessment
select count ( * ) from lượt nộp bài	workshop_paper
select count ( * ) from lượt nộp bài	workshop_paper
select tác giả from lượt nộp bài order by số điểm asc	workshop_paper
select tác giả from lượt nộp bài order by số điểm asc	workshop_paper
select tác giả , trường đại học from lượt nộp bài	workshop_paper
select tác giả , trường đại học from lượt nộp bài	workshop_paper
select tác giả from lượt nộp bài where trường đại học = "Florida" or trường đại học = "Temple"	workshop_paper
select tác giả from lượt nộp bài where trường đại học = "Florida" or trường đại học = "Temple"	workshop_paper
select avg ( số điểm ) from lượt nộp bài	workshop_paper
select avg ( số điểm ) from lượt nộp bài	workshop_paper
select tác giả from lượt nộp bài order by số điểm desc limit 1	workshop_paper
select tác giả from lượt nộp bài order by số điểm desc limit 1	workshop_paper
select trường đại học , count ( * ) from lượt nộp bài group by trường đại học	workshop_paper
select trường đại học , count ( * ) from lượt nộp bài group by trường đại học	workshop_paper
select trường đại học from lượt nộp bài group by trường đại học order by count ( * ) desc limit 1	workshop_paper
select trường đại học from lượt nộp bài group by trường đại học order by count ( * ) desc limit 1	workshop_paper
select trường đại học from lượt nộp bài where số điểm > 90 intersect select trường đại học from lượt nộp bài where số điểm < 80	workshop_paper
select trường đại học from lượt nộp bài where số điểm > 90 intersect select trường đại học from lượt nộp bài where số điểm < 80	workshop_paper
select t2.tác giả , t1.kết quả from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài	workshop_paper
select t2.tác giả , t1.kết quả from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài	workshop_paper
select t1.kết quả from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài order by t2.số điểm desc limit 1	workshop_paper
select t1.kết quả from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài order by t2.số điểm desc limit 1	workshop_paper
select t2.tác giả , count ( distinct t1.id hội thảo ) from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác giả	workshop_paper
select t2.tác giả , count ( distinct t1.id hội thảo ) from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác giả	workshop_paper
select t2.tác giả from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác giả having count ( distinct t1.id hội thảo ) > 1	workshop_paper
select t2.tác giả from chấp thuận as t1 join lượt nộp bài as t2 on t1.id lượt nộp bài = t2.id lượt nộp bài group by t2.tác giả having count ( distinct t1.id hội thảo ) > 1	workshop_paper
select ngày , địa điểm from hội thảo order by địa điểm	workshop_paper
select ngày , địa điểm from hội thảo order by địa điểm	workshop_paper
select tác giả from lượt nộp bài where id lượt nộp bài not in ( select id lượt nộp bài from chấp thuận )	workshop_paper
select tác giả from lượt nộp bài where id lượt nộp bài not in ( select id lượt nộp bài from chấp thuận )	workshop_paper
select tên from doanh nghiệp where đánh giá xếp hạng > 4.5	yelp
select tên from doanh nghiệp where đánh giá xếp hạng = 3.5	yelp
select id người tiêu dùng from người tiêu dùng where tên = "Michelle"	yelp
select tiểu bang from doanh nghiệp where tên = "Whataburger"	yelp
select t1.thành phố from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "MGM Grand Buffet" and t2.tên loại hình = "category category name0"	yelp
select thành phố from doanh nghiệp where đánh giá xếp hạng < 1.5	yelp
select thành phố from doanh nghiệp where tên = "Taj Mahal"	yelp
select văn bản from đánh giá where đánh giá xếp hạng < 1	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.đánh giá xếp hạng > 3.5 and t2.tên loại hình = "restaurant"	yelp
select t1.thành phố from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Taj Mahal" and t2.tên loại hình = "restaurant"	yelp
select t1.văn bản from người tiêu dùng as t2 join đánh giá as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t2.tên = "Niloofar"	yelp
select t1.tên from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t3.tên = "Niloofar"	yelp
select t1.tên from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t2.đánh giá xếp hạng = 5 and t3.tên = "Niloofar"	yelp
select t4.văn bản from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t4 on t4.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t5 on t5.id người tiêu dùng = t4.id người tiêu dùng where t2.tên loại hình = "Italian" and t3.tên loại hình = "category category name1" and t5.tên = "Michelle"	yelp
select count ( distinct t3.văn bản ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Cafe Zinho" and t1.tiểu bang = "Texas" and t2.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.đánh giá xếp hạng = 5 and t2.tên loại hình = "Italian" and t3.tên loại hình = "restaurant"	yelp
select t1.tên khu phố lân cận from loại hình as t3 join doanh nghiệp as t2 on t3.id doanh nghiệp = t2.id doanh nghiệp join loại hình as t4 on t4.id doanh nghiệp = t2.id doanh nghiệp join khu vực lân cận as t1 on t1.id doanh nghiệp = t2.id doanh nghiệp where t2.thành phố = "Madison" and t3.tên loại hình = "Italian" and t4.tên loại hình = "restaurant"	yelp
select t1.tên khu phố lân cận from loại hình as t3 join doanh nghiệp as t2 on t3.id doanh nghiệp = t2.id doanh nghiệp join loại hình as t4 on t4.id doanh nghiệp = t2.id doanh nghiệp join khu vực lân cận as t1 on t1.id doanh nghiệp = t2.id doanh nghiệp where t2.thành phố = "Madison" and t2.đánh giá xếp hạng < 2.5 and t3.tên loại hình = "Italian" and t4.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tiểu bang = "Pennsylvania" and t2.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tiểu bang = "Pennsylvania" and t2.tên loại hình = "restaurant"	yelp
select t3.văn bản from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.số lượng đánh giá > 100 and t2.tên loại hình = "Pet Groomers"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "breweries"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "breweries"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "breweries"	yelp
select t4.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t1.tên = "Mesa Grill" and t2.tên loại hình = "restaurant"	yelp
select địa chỉ đầy đủ from doanh nghiệp where thành phố = "Los Angeles" and tên = "Walmart"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t1.thành phố = "Dallas" and t2.tên loại hình = "restaurant" and t4.tên = "Patrick"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t1.thành phố = "Dallas" and t2.tên loại hình = "restaurant" and t4.tên = "Patrick"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t2.tên loại hình = "Bars" and t4.tên = "Patrick"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t1.đánh giá xếp hạng >= 3 and t2.tên loại hình = "Bars" and t4.tên = "Patrick"	yelp
select t3.tên from khoản tiền boa as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t1.tên = "Barrio Cafe" and t2.năm = 2015	yelp
select tên from doanh nghiệp where đánh giá xếp hạng < 2 and tiểu bang = "Texas"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "Seafood" and t3.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "Seafood" and t3.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "Seafood" and t3.tên loại hình = "restaurant"	yelp
select t1.văn bản from người tiêu dùng as t2 join đánh giá as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t1.đánh giá xếp hạng > 4 and t2.tên = "Patrick"	yelp
select id doanh nghiệp from doanh nghiệp where thành phố = "Los Angeles" and tên = "Apple Store"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Dallas" and t1.đánh giá xếp hạng > 4.5 and t2.tên loại hình = "restaurant"	yelp
select t1.tên khu phố lân cận from loại hình as t3 join doanh nghiệp as t2 on t3.id doanh nghiệp = t2.id doanh nghiệp join khu vực lân cận as t1 on t1.id doanh nghiệp = t2.id doanh nghiệp where t2.tên = "Flat Top Grill" and t3.tên loại hình = "category category name0"	yelp
select t2.văn bản from khoản tiền boa as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Vintner Grill" and t2.số lượt thích > 9	yelp
select t2.văn bản from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Kabob Palace" and t2.năm = 2014	yelp
select t3.tên from khoản tiền boa as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t1.thành phố = "Dallas"	yelp
select t1.thành phố from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "MGM Grand Buffet" and t1.tiểu bang = "Texas" and t2.tên loại hình = "restaurant"	yelp
select t4.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join khoản tiền boa as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t2.tên loại hình = "Pet Groomers"	yelp
select t2.văn bản from khoản tiền boa as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Cafe Zinho" and t1.tiểu bang = "Texas"	yelp
select t4.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t2.tên loại hình = "restaurant"	yelp
select t2.văn bản from khoản tiền boa as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Cafe Zinho" and t1.tiểu bang = "Pennsylvania" and t2.năm = 2010	yelp
select t4.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t2.tên loại hình = "restaurant" and t3.năm = 2010	yelp
select t2.văn bản from người tiêu dùng as t3 join đánh giá as t1 on t3.id người tiêu dùng = t1.id người tiêu dùng join khoản tiền boa as t2 on t3.id người tiêu dùng = t2.id người tiêu dùng where t1.năm = 2012	yelp
select t2.văn bản from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.đánh giá xếp hạng = 2.5	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Madison" and t2.tên loại hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Madison" and t2.tên loại hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Madison" and t2.tên loại hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Madison" and t2.tên loại hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Madison" and t2.tên loại hình = "escape games"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.đánh giá xếp hạng > 3.5 and t2.tên loại hình = "restaurant"	yelp
select sum ( t4.số lượng ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join lượt đăng ký as t4 on t4.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "restaurant" and t3.tên loại hình = "Moroccan"	yelp
select sum ( t4.số lượng ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join lượt đăng ký as t4 on t4.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "Moroccan" and t3.tên loại hình = "restaurant" and t4.ngày = "Friday"	yelp
select t4.ngày , sum ( t4.số lượng ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join lượt đăng ký as t4 on t4.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t2.tên loại hình = "Moroccan" and t3.tên loại hình = "restaurant" group by t4.ngày	yelp
select t1.tiểu bang , sum ( t4.số lượng ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join lượt đăng ký as t4 on t4.id doanh nghiệp = t1.id doanh nghiệp where t2.tên loại hình = "Italian" and t3.tên loại hình = "Delis" and t4.ngày = "Sunday" group by t1.tiểu bang	yelp
select count ( distinct t1.văn bản ) from người tiêu dùng as t2 join đánh giá as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t1.năm = 2015 and t2.tên = "Niloofar"	yelp
select avg ( t1.đánh giá xếp hạng ) from người tiêu dùng as t2 join đánh giá as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t2.tên = "Michelle"	yelp
select t2.số lượng from lượt đăng ký as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Cafe Zinho" and t2.ngày = "Friday"	yelp
select count ( distinct t3.tên ) from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t1.thành phố = "Pittsburgh" and t1.tên = "Sushi Too"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Pittsburgh" and t1.đánh giá xếp hạng = 4.5 and t2.tên loại hình = "restaurant"	yelp
select count ( distinct văn bản ) from khoản tiền boa where năm = 2015	yelp
select sum ( t1.số lượt thích ) from người tiêu dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t2.tên = "Niloofar"	yelp
select sum ( t2.số lượt thích ) from khoản tiền boa as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Cafe Zinho"	yelp
select sum ( t2.số lượt thích ) from khoản tiền boa as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t1.tên = "Cafe Zinho" and t3.tên = "Niloofar"	yelp
select count ( distinct t1.văn bản ) from người tiêu dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t1.năm = 2010 and t2.tên = "Michelle"	yelp
select count ( distinct t1.văn bản ) from người tiêu dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t1.năm = 2010 and t2.tên = "Michelle"	yelp
select count ( distinct t1.văn bản ) from người tiêu dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t1.tháng = "April" and t2.tên = "Michelle"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.tiểu bang = "Texas" and t2.tên loại hình = "restaurant"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Dallas" and t1.đánh giá xếp hạng > 3.5 and t2.tên loại hình = "Bars"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Dallas" and t1.đánh giá xếp hạng > 3.5 and t2.tên loại hình = "Bars"	yelp
select count ( distinct t4.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t1.thành phố = "Dallas" and t1.tên = "Texas de Brazil" and t1.tiểu bang = "Texas" and t2.tên loại hình = "restaurant"	yelp
select count ( distinct t3.tên ) from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t1.tên = "Bistro Di Napoli" and t2.năm = 2015	yelp
select count ( distinct t1.tên ) from loại hình as t3 join doanh nghiệp as t1 on t3.id doanh nghiệp = t1.id doanh nghiệp join khu vực lân cận as t2 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Dallas" and t3.tên loại hình = "restaurant" and t2.tên khu phố lân cận = "Hazelwood"	yelp
select count ( distinct id doanh nghiệp ) from doanh nghiệp where thành phố = "Dallas" and tên = "Starbucks" and tiểu bang = "Texas"	yelp
select số lượng đánh giá from doanh nghiệp where tên = "Acacia Cafe"	yelp
select avg ( t3.số lượng ) , t3.ngày from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join lượt đăng ký as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.tên = "Barrio Cafe" and t2.tên loại hình = "restaurant" group by t3.ngày	yelp
select count ( distinct t1.tên ) from khu vực lân cận as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Madison" and t2.tên khu phố lân cận = "Stone Meadows"	yelp
select count ( distinct t1.văn bản ) from người tiêu dùng as t2 join đánh giá as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t2.tên = "Adrienne"	yelp
select count ( distinct t1.văn bản ) from người tiêu dùng as t2 join đánh giá as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t1.tháng = "March" and t1.năm = 2014 and t2.tên = "Michelle"	yelp
select count ( distinct t1.tên ) from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t2.năm = 2010 and t3.tên = "Michelle"	yelp
select count ( distinct t1.tên ) from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t3 on t3.id người tiêu dùng = t2.id người tiêu dùng where t1.thành phố = "San Diego" and t2.năm = 2010 and t3.tên = "Christine"	yelp
select count ( distinct id doanh nghiệp ) from doanh nghiệp where thành phố = "Los Angeles" and tên = "Target"	yelp
select count ( distinct t4.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t1.thành phố = "Dallas" and t2.tên loại hình = "Irish Pub"	yelp
select avg ( đánh giá xếp hạng ) from đánh giá where năm = 2014	yelp
select count ( distinct t4.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp join người tiêu dùng as t4 on t4.id người tiêu dùng = t3.id người tiêu dùng where t1.tên = "Vintner Grill" and t2.tên loại hình = "category category name0" and t3.năm = 2010	yelp
select count ( distinct t3.văn bản ) from khu vực lân cận as t1 join doanh nghiệp as t2 on t1.id doanh nghiệp = t2.id doanh nghiệp join đánh giá as t3 on t3.id doanh nghiệp = t2.id doanh nghiệp where t1.tên khu phố lân cận = "South Summerlin"	yelp
select count ( distinct tên ) from người tiêu dùng where tên = "Michelle"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t2.tên loại hình = "restaurant"	yelp
select count ( distinct thành phố ) from doanh nghiệp where tên = "Panda Express"	yelp
select count ( distinct t1.văn bản ) from người tiêu dùng as t2 join khoản tiền boa as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng where t2.tên = "Michelle"	yelp
select sum ( t3.số lượng ) from lượt đăng ký as t3 join doanh nghiệp as t1 on t3.id doanh nghiệp = t1.id doanh nghiệp join khu vực lân cận as t2 on t2.id doanh nghiệp = t1.id doanh nghiệp where t2.tên khu phố lân cận = "Brighton Heights"	yelp
select count ( distinct văn bản ) from đánh giá where tháng = "March"	yelp
select count ( distinct văn bản ) , tháng from khoản tiền boa group by tháng	yelp
select count ( distinct t1.tên khu phố lân cận ) from khu vực lân cận as t1 join doanh nghiệp as t2 on t1.id doanh nghiệp = t2.id doanh nghiệp where t2.thành phố = "Madison" and t2.đánh giá xếp hạng = 5	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.tiểu bang = "Texas" and t2.tên loại hình = "Moroccan" and t3.tên loại hình = "restaurant"	yelp
select t1.tên from lượt đăng ký as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp group by t1.tên order by sum ( t2.số lượng ) desc limit 1	yelp
select t1.tên khu phố lân cận from khu vực lân cận as t1 join doanh nghiệp as t2 on t1.id doanh nghiệp = t2.id doanh nghiệp where t2.thành phố = "Madison" group by t1.tên khu phố lân cận order by count ( distinct t2.tên ) desc limit 1	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Dallas" and t1.đánh giá xếp hạng > 3.5 and t2.tên loại hình = "Mexican" and t3.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Dallas" and t1.đánh giá xếp hạng > 3.5 and t2.tên loại hình = "Mexican" and t3.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Dallas" and t1.tiểu bang = "Texas" and t2.tên loại hình = "Valet Service" and t3.tên loại hình = "restaurant"	yelp
select t1.tên from loại hình as t3 join doanh nghiệp as t1 on t3.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t4 on t4.id doanh nghiệp = t1.id doanh nghiệp join khu vực lân cận as t2 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Madison" and t3.tên loại hình = "Italian" and t4.tên loại hình = "restaurant" and t2.tên khu phố lân cận = "Meadowood"	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Los Angeles" and t1.đánh giá xếp hạng > 3 and t1.số lượng đánh giá > 30 and t2.tên loại hình = "Bars"	yelp
select count ( distinct t1.tên ) from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp join loại hình as t3 on t3.id doanh nghiệp = t1.id doanh nghiệp where t1.thành phố = "Edinburgh" and t2.tên loại hình = "restaurant" and t3.tên loại hình = "Egyptian"	yelp
select t2.tên from người tiêu dùng as t2 join đánh giá as t1 on t2.id người tiêu dùng = t1.id người tiêu dùng group by t2.tên having avg ( t1.đánh giá xếp hạng ) < 3	yelp
select t1.tên from đánh giá as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp where t2.tháng = "April" group by t1.tên order by count ( distinct t2.văn bản ) desc limit 1	yelp
select t1.tên from loại hình as t2 join doanh nghiệp as t1 on t2.id doanh nghiệp = t1.id doanh nghiệp group by t1.tên order by count ( distinct t2.tên loại hình ) desc limit 1	yelp
