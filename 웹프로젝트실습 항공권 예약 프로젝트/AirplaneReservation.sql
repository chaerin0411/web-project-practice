-- (AirplaneReservation.sql)
-- mysql 8.0 이상 버전 이용, ID: root, PW: admin

DROP SCHEMA IF EXISTS `tripdb`;
CREATE SCHEMA `tripdb` DEFAULT CHARACTER SET utf8 ;
use tripdb;

-- 회원(회원아이디, 비밀번호, 이름, 생년월일, 전화번호, 이메일, 주소)
-- 공항(공항번호, 공항이름, 국가)
-- 비행기(비행기번호, 항공사이름, 총좌석수)
-- 좌석(좌석번호, 비행기번호, 등급, 좌석수)
-- 예약좌석(예약좌석번호, 좌석번호, 비행기번호)
-- 일정(일정번호, 출발시간, 도착시간, 출발지, 도착지, 비행기번호, 가격)
-- 예약(예약번호, 회원아이디, 탑승일, 일정번호, 좌석번호, 운임료)
-- 상품(상품번호, 상품이름, 위치, 상품상세, 평점, 리뷰수, 상품구분, 이용시간, 전화번호, 경로)  
-- 장바구니(장바구니번호, 상품번호, 회원아이디)

-- member(member_id, member_pwd, member_name, member_birth, member_tel, member_email, member_addr)
-- airport(airport_no, port_name, nation)
-- airplane(airplane_no, airline_name, total_seatnum)
-- seat(seat_no, airplane_no, grade, seatnum)
-- serve_seat(serve_seat_no, seat_no, airplane_no)
-- reservation(reservation_no, member_id, date, schedule_no, serve_seat_no, ticket_price)
-- product(product_no, product_name, location, product_detail, ratings, review, distinguishing, time, tel, src)
-- cart(cart_no, product_no, member_id)

-- 테이블 삭제
drop table if exists cart;
drop table if exists product;
drop table if exists reservation;
drop table if exists schedule;
drop table if exists serve_seat;
drop table if exists seat;
drop table if exists airplane;
drop table if exists airport;
drop table if exists member;

-- 테이블 생성
-- 회원(회원아이디, 비밀번호, 이름, 생년월일, 전화번호, 이메일, 주소)
-- member(member_id, member_pwd, member_name, member_birth, member_tel, member_email, member_addr)
create table member (
    member_id	 	varchar(10) not null,
    member_pwd		varchar(15),
    member_name		varchar(15),
    member_birth	varchar(10),
    member_tel		varchar(13),
    member_email	varchar(50),
    member_addr		varchar(100),
    primary key(member_id)
);

-- 공항(공항번호, 공항이름, 국가)
-- airport(airport_no, port_name, nation)
create table airport (
	airport_no	char(3) not null,
    port_name	varchar(30),
    nation		varchar(30),
    primary key(airport_no)
);

-- 비행기(비행기번호, 항공사이름, 총좌석수)
-- airplane(airplane_no, airline_name, total_seatnum)
create table airplane (
	airplane_no		char(2) not null,
    airline_name	varchar(30),
    total_seatnum	int,
    primary key(airplane_no)
);

-- 좌석(좌석번호, 비행기번호, 등급, 좌석수)
-- seat(seat_no, airplane_no, grade, seatnum)
create table seat (
	seat_no		int		not null,
    airplane_no	char(2)	not null,
    grade		varchar(30),
    seatnum		int,
    primary key(seat_no, airplane_no),
    foreign key(airplane_no) references airplane(airplane_no)
);

-- 예약좌석(예약좌석번호, 좌석번호, 비행기번호)
-- serve_seat(serve_seat_no, seat_no, airplane_no)
create table serve_seat (
	serve_seat_no char(4) not null,
    seat_no		  int,
    airplane_no	  char(2),
    primary key(serve_seat_no),
    foreign key(seat_no) references seat(seat_no),
    foreign key(airplane_no) references seat(airplane_no)
);

-- 일정(일정번호, 출발시간, 도착시간, 출발지, 도착지, 비행기번호, 운임료)
-- schedule(schedule_no, departure_time, arrival_time, start_port, end_port, airplane_no, freightfee)
create table schedule (
	schedule_no		varchar(11) not null,
    departure_time	char(5),
    arrival_time	char(5),
    start_port		char(3),
    end_port		char(3),
    airplane_no		char(2),
    freightfee  	int,
    primary key(schedule_no),
    foreign key(start_port) references airport(airport_no),
    foreign key(end_port) references airport(airport_no)
);

-- 예약(예약번호, 회원아이디, 탑승일, 일정번호, 좌석번호, 운임료)
-- reservation(reservation_no, member_id, date, schedule_no, serve_seat_no, ticket_price)
create table reservation (
    reservation_no	int not null AUTO_INCREMENT,
    member_id		varchar(10),
    date			char(10),
    schedule_no		varchar(11),
    serve_seat_no	char(4),
    ticket_price	int,
    primary key(reservation_no),
    foreign key(member_id) references member(member_id),
    foreign key(schedule_no) references schedule(schedule_no),
    foreign key(serve_seat_no) references serve_seat(serve_seat_no)
);

-- 상품(상품번호, 상품이름, 위치, 상품상세, 평점, 리뷰수, 상품구분, 이용시간, 전화번호, 경로)  
-- product(product_no, product_name, location, product_detail, ratings, review, distinguishing, time, tel, src)
create table product (
    product_no		varchar(4) not null,
    product_name	varchar(20),
    location		varchar(50),
    product_detail	varchar(50),
    ratings			varchar(10),
    review			int,
    distinguishing 	varchar(10),
    time 			varchar(30),
    tel 			varchar(20),
    src 			varchar(20),
    primary key(product_no)
);

-- 장바구니(장바구니번호, 상품번호, 회원아이디)
-- cart(cart_no, product_no, member_id)
create table cart (
    cart_no			int not null AUTO_INCREMENT,
    product_no		varchar(4),
    member_id		varchar(10),
    primary key(cart_no),
    foreign key(product_no) references product(product_no),
    foreign key(member_id) references member(member_id)
);

-- 데이터 입력
-- 회원(회원아이디, 비밀번호, 이름, 생년월일, 전화번호, 이메일, 주소)
-- member(member_id, member_pwd, member_name, member_birth, member_tel, member_email, member_addr)
insert into member values('admin', 'admin', '관리자', '2001-01-01', '010-1234-5678', 'admin@naver.com', '서울시 구로구 고척동 163 1호관 301호');
insert into member values ('lemon', 'lemon', '레몬', '2000-01-01', '010-1234-5678', 'lemon@nate.com', '서울시 구로구 고척동 83-2 정선아파트 101동 101호');
insert into member values ('cotton', 'cotton', '솜', '1999-09-09', '010-1111-2222', 'cotton@naver.com', '서울시 구로구 고척동 83-17 한일빌라 4동 5층 502호');
insert into member values ('shushu', 'shushu', '슈슈', '1998-08-08', '010-3333-4444', 'shushu@daum.net', '서울시 마포구 신수동 62-3 201호');
insert into member values ('kong', 'kong', '콩', '2002-02-02', '010-5555-6666', 'kong@gmail.com', '서울시 영등포구 영등포동 4가 89호');

-- 공항(공항번호, 공항이름, 국가)
-- airport(airport_no, port_name, nation)
insert into airport values ('ICN', '인천', '대한민국');
insert into airport values ('GMP', '김포', '대한민국');
insert into airport values ('CJU', '제주', '대한민국');
insert into airport values ('PUS', '부산', '대한민국');
insert into airport values ('KIX', '오사카', '일본');
insert into airport values ('NRT', '도쿄', '일본');
insert into airport values ('PEK', '베이징', '중국');
insert into airport values ('HKG', '홍콩', '홍콩');
insert into airport values ('BKK', '방콕', '태국');
insert into airport values ('CDG', '파리', '프랑스');
insert into airport values ('LHR', '런던', '영국');
insert into airport values ('JFK', '뉴욕', '미국');
insert into airport values ('HNL', '하와이', '미국');
insert into airport values ('GRU', '상파울로', '브라질');

-- 비행기(비행기번호, 항공사이름, 총좌석수)
-- airplane(airplane_no, airline_name, total_seatnum)
insert into airplane values ('AA', '아시아나항공', 550);
insert into airplane values ('TW', '티웨이항공', 400);
insert into airplane values ('JJ', '제주항공', 350);
insert into airplane values ('JA', '진에어', 300);
insert into airplane values ('AS', '에어서울', 250);
insert into airplane values ('AP', '에어부산', 200);
insert into airplane values ('AI', '에어인천', 180);
insert into airplane values ('ET', '이스타항공', 150);
insert into airplane values ('FK', '플라이강원', 70);

-- 좌석(좌석번호, 비행기번호, 등급, 좌석수)
-- seat(seat_no, airplane_no, grade, seatnum)
insert into seat values (1, 'AA', '이코노미', 450);
insert into seat values (2, 'AA', '비즈니스', 75);
insert into seat values (3, 'AA', '퍼스트', 25);
insert into seat values (1, 'TW', '이코노미', 320);
insert into seat values (2, 'TW', '비즈니스', 65);
insert into seat values (3, 'TW', '퍼스트', 15);
insert into seat values (1, 'JJ', '이코노미', 300);
insert into seat values (2, 'JJ', '비즈니스', 30);
insert into seat values (3, 'JJ', '퍼스트', 20);
insert into seat values (1, 'JA', '이코노미', 280);
insert into seat values (2, 'JA', '비즈니스', 8);
insert into seat values (3, 'JA', '퍼스트', 2);
insert into seat values (1, 'AS', '이코노미', 220);
insert into seat values (2, 'AS', '비즈니스', 25);
insert into seat values (3, 'AS', '퍼스트', 5);
insert into seat values (1, 'AP', '이코노미', 170);
insert into seat values (2, 'AP', '비즈니스', 20);
insert into seat values (3, 'AP', '퍼스트', 10);
insert into seat values (1, 'AI', '이코노미', 100);
insert into seat values (2, 'AI', '비즈니스', 60);
insert into seat values (3, 'AI', '퍼스트', 20);
insert into seat values (1, 'ET', '이코노미', 110);
insert into seat values (2, 'ET', '비즈니스', 35);
insert into seat values (3, 'ET', '퍼스트', 5);
insert into seat values (1, 'FK', '이코노미', 40);
insert into seat values (2, 'FK', '비즈니스', 20);
insert into seat values (3, 'FK', '퍼스트', 10);

-- 예약좌석(예약좌석번호, 좌석번호, 비행기번호)
-- serve_seat(serve_seat_no, seat_no, airplane_no)
-- 아시아나 항공 예약좌석 insert 코드 시작
insert into serve_seat values ('AA01', 1, 'AA');
insert into serve_seat values ('AA02', 1, 'AA');
insert into serve_seat values ('AA03', 1, 'AA');
insert into serve_seat values ('AA04', 1, 'AA');
insert into serve_seat values ('AA05', 1, 'AA');
insert into serve_seat values ('AA06', 1, 'AA');
insert into serve_seat values ('AA07', 1, 'AA');
insert into serve_seat values ('AA08', 1, 'AA');
insert into serve_seat values ('AA09', 1, 'AA');
insert into serve_seat values ('AA10', 1, 'AA');
insert into serve_seat values ('AA11', 1, 'AA');
insert into serve_seat values ('AA12', 1, 'AA');
insert into serve_seat values ('AA13', 1, 'AA');
insert into serve_seat values ('AA14', 1, 'AA');
insert into serve_seat values ('AA15', 1, 'AA');
insert into serve_seat values ('AA16', 1, 'AA');
insert into serve_seat values ('AA17', 1, 'AA');
insert into serve_seat values ('AA18', 1, 'AA');
insert into serve_seat values ('AA19', 1, 'AA');
insert into serve_seat values ('AA20', 1, 'AA');
insert into serve_seat values ('AA21', 1, 'AA');
insert into serve_seat values ('AA22', 1, 'AA');
insert into serve_seat values ('AA23', 1, 'AA');
insert into serve_seat values ('AA24', 1, 'AA');
insert into serve_seat values ('AA25', 1, 'AA');
insert into serve_seat values ('AB01', 1, 'AA');
insert into serve_seat values ('AB02', 1, 'AA');
insert into serve_seat values ('AB03', 1, 'AA');
insert into serve_seat values ('AB04', 1, 'AA');
insert into serve_seat values ('AB05', 1, 'AA');
insert into serve_seat values ('AB06', 1, 'AA');
insert into serve_seat values ('AB07', 1, 'AA');
insert into serve_seat values ('AB08', 1, 'AA');
insert into serve_seat values ('AB09', 1, 'AA');
insert into serve_seat values ('AB10', 1, 'AA');
insert into serve_seat values ('AB11', 1, 'AA');
insert into serve_seat values ('AB12', 1, 'AA');
insert into serve_seat values ('AB13', 1, 'AA');
insert into serve_seat values ('AB14', 1, 'AA');
insert into serve_seat values ('AB15', 1, 'AA');
insert into serve_seat values ('AB16', 1, 'AA');
insert into serve_seat values ('AB17', 1, 'AA');
insert into serve_seat values ('AB18', 1, 'AA');
insert into serve_seat values ('AB19', 1, 'AA');
insert into serve_seat values ('AB20', 1, 'AA');
insert into serve_seat values ('AB21', 1, 'AA');
insert into serve_seat values ('AB22', 1, 'AA');
insert into serve_seat values ('AB23', 1, 'AA');
insert into serve_seat values ('AB24', 1, 'AA');
insert into serve_seat values ('AB25', 1, 'AA');
insert into serve_seat values ('AC01', 1, 'AA');
insert into serve_seat values ('AC02', 1, 'AA');
insert into serve_seat values ('AC03', 1, 'AA');
insert into serve_seat values ('AC04', 1, 'AA');
insert into serve_seat values ('AC05', 1, 'AA');
insert into serve_seat values ('AC06', 1, 'AA');
insert into serve_seat values ('AC07', 1, 'AA');
insert into serve_seat values ('AC08', 1, 'AA');
insert into serve_seat values ('AC09', 1, 'AA');
insert into serve_seat values ('AC10', 1, 'AA');
insert into serve_seat values ('AC11', 1, 'AA');
insert into serve_seat values ('AC12', 1, 'AA');
insert into serve_seat values ('AC13', 1, 'AA');
insert into serve_seat values ('AC14', 1, 'AA');
insert into serve_seat values ('AC15', 1, 'AA');
insert into serve_seat values ('AC16', 1, 'AA');
insert into serve_seat values ('AC17', 1, 'AA');
insert into serve_seat values ('AC18', 1, 'AA');
insert into serve_seat values ('AC19', 1, 'AA');
insert into serve_seat values ('AC20', 1, 'AA');
insert into serve_seat values ('AC21', 1, 'AA');
insert into serve_seat values ('AC22', 1, 'AA');
insert into serve_seat values ('AC23', 1, 'AA');
insert into serve_seat values ('AC24', 1, 'AA');
insert into serve_seat values ('AC25', 1, 'AA');
insert into serve_seat values ('AD01', 1, 'AA');
insert into serve_seat values ('AD02', 1, 'AA');
insert into serve_seat values ('AD03', 1, 'AA');
insert into serve_seat values ('AD04', 1, 'AA');
insert into serve_seat values ('AD05', 1, 'AA');
insert into serve_seat values ('AD06', 1, 'AA');
insert into serve_seat values ('AD07', 1, 'AA');
insert into serve_seat values ('AD08', 1, 'AA');
insert into serve_seat values ('AD09', 1, 'AA');
insert into serve_seat values ('AD10', 1, 'AA');
insert into serve_seat values ('AD11', 1, 'AA');
insert into serve_seat values ('AD12', 1, 'AA');
insert into serve_seat values ('AD13', 1, 'AA');
insert into serve_seat values ('AD14', 1, 'AA');
insert into serve_seat values ('AD15', 1, 'AA');
insert into serve_seat values ('AD16', 1, 'AA');
insert into serve_seat values ('AD17', 1, 'AA');
insert into serve_seat values ('AD18', 1, 'AA');
insert into serve_seat values ('AD19', 1, 'AA');
insert into serve_seat values ('AD20', 1, 'AA');
insert into serve_seat values ('AD21', 1, 'AA');
insert into serve_seat values ('AD22', 1, 'AA');
insert into serve_seat values ('AD23', 1, 'AA');
insert into serve_seat values ('AD24', 1, 'AA');
insert into serve_seat values ('AD25', 1, 'AA');
insert into serve_seat values ('AE01', 1, 'AA');
insert into serve_seat values ('AE02', 1, 'AA');
insert into serve_seat values ('AE03', 1, 'AA');
insert into serve_seat values ('AE04', 1, 'AA');
insert into serve_seat values ('AE05', 1, 'AA');
insert into serve_seat values ('AE06', 1, 'AA');
insert into serve_seat values ('AE07', 1, 'AA');
insert into serve_seat values ('AE08', 1, 'AA');
insert into serve_seat values ('AE09', 1, 'AA');
insert into serve_seat values ('AE10', 1, 'AA');
insert into serve_seat values ('AE11', 1, 'AA');
insert into serve_seat values ('AE12', 1, 'AA');
insert into serve_seat values ('AE13', 1, 'AA');
insert into serve_seat values ('AE14', 1, 'AA');
insert into serve_seat values ('AE15', 1, 'AA');
insert into serve_seat values ('AE16', 1, 'AA');
insert into serve_seat values ('AE17', 1, 'AA');
insert into serve_seat values ('AE18', 1, 'AA');
insert into serve_seat values ('AE19', 1, 'AA');
insert into serve_seat values ('AE20', 1, 'AA');
insert into serve_seat values ('AE21', 1, 'AA');
insert into serve_seat values ('AE22', 1, 'AA');
insert into serve_seat values ('AE23', 1, 'AA');
insert into serve_seat values ('AE24', 1, 'AA');
insert into serve_seat values ('AE25', 1, 'AA');
insert into serve_seat values ('AF01', 1, 'AA');
insert into serve_seat values ('AF02', 1, 'AA');
insert into serve_seat values ('AF03', 1, 'AA');
insert into serve_seat values ('AF04', 1, 'AA');
insert into serve_seat values ('AF05', 1, 'AA');
insert into serve_seat values ('AF06', 1, 'AA');
insert into serve_seat values ('AF07', 1, 'AA');
insert into serve_seat values ('AF08', 1, 'AA');
insert into serve_seat values ('AF09', 1, 'AA');
insert into serve_seat values ('AF10', 1, 'AA');
insert into serve_seat values ('AF11', 1, 'AA');
insert into serve_seat values ('AF12', 1, 'AA');
insert into serve_seat values ('AF13', 1, 'AA');
insert into serve_seat values ('AF14', 1, 'AA');
insert into serve_seat values ('AF15', 1, 'AA');
insert into serve_seat values ('AF16', 1, 'AA');
insert into serve_seat values ('AF17', 1, 'AA');
insert into serve_seat values ('AF18', 1, 'AA');
insert into serve_seat values ('AF19', 1, 'AA');
insert into serve_seat values ('AF20', 1, 'AA');
insert into serve_seat values ('AF21', 1, 'AA');
insert into serve_seat values ('AF22', 1, 'AA');
insert into serve_seat values ('AF23', 1, 'AA');
insert into serve_seat values ('AF24', 1, 'AA');
insert into serve_seat values ('AF25', 1, 'AA');
insert into serve_seat values ('AG01', 1, 'AA');
insert into serve_seat values ('AG02', 1, 'AA');
insert into serve_seat values ('AG03', 1, 'AA');
insert into serve_seat values ('AG04', 1, 'AA');
insert into serve_seat values ('AG05', 1, 'AA');
insert into serve_seat values ('AG06', 1, 'AA');
insert into serve_seat values ('AG07', 1, 'AA');
insert into serve_seat values ('AG08', 1, 'AA');
insert into serve_seat values ('AG09', 1, 'AA');
insert into serve_seat values ('AG10', 1, 'AA');
insert into serve_seat values ('AG11', 1, 'AA');
insert into serve_seat values ('AG12', 1, 'AA');
insert into serve_seat values ('AG13', 1, 'AA');
insert into serve_seat values ('AG14', 1, 'AA');
insert into serve_seat values ('AG15', 1, 'AA');
insert into serve_seat values ('AG16', 1, 'AA');
insert into serve_seat values ('AG17', 1, 'AA');
insert into serve_seat values ('AG18', 1, 'AA');
insert into serve_seat values ('AG19', 1, 'AA');
insert into serve_seat values ('AG20', 1, 'AA');
insert into serve_seat values ('AG21', 1, 'AA');
insert into serve_seat values ('AG22', 1, 'AA');
insert into serve_seat values ('AG23', 1, 'AA');
insert into serve_seat values ('AG24', 1, 'AA');
insert into serve_seat values ('AG25', 1, 'AA');
insert into serve_seat values ('AH01', 1, 'AA');
insert into serve_seat values ('AH02', 1, 'AA');
insert into serve_seat values ('AH03', 1, 'AA');
insert into serve_seat values ('AH04', 1, 'AA');
insert into serve_seat values ('AH05', 1, 'AA');
insert into serve_seat values ('AH06', 1, 'AA');
insert into serve_seat values ('AH07', 1, 'AA');
insert into serve_seat values ('AH08', 1, 'AA');
insert into serve_seat values ('AH09', 1, 'AA');
insert into serve_seat values ('AH10', 1, 'AA');
insert into serve_seat values ('AH11', 1, 'AA');
insert into serve_seat values ('AH12', 1, 'AA');
insert into serve_seat values ('AH13', 1, 'AA');
insert into serve_seat values ('AH14', 1, 'AA');
insert into serve_seat values ('AH15', 1, 'AA');
insert into serve_seat values ('AH16', 1, 'AA');
insert into serve_seat values ('AH17', 1, 'AA');
insert into serve_seat values ('AH18', 1, 'AA');
insert into serve_seat values ('AH19', 1, 'AA');
insert into serve_seat values ('AH20', 1, 'AA');
insert into serve_seat values ('AH21', 1, 'AA');
insert into serve_seat values ('AH22', 1, 'AA');
insert into serve_seat values ('AH23', 1, 'AA');
insert into serve_seat values ('AH24', 1, 'AA');
insert into serve_seat values ('AH25', 1, 'AA');
insert into serve_seat values ('AI01', 1, 'AA');
insert into serve_seat values ('AI02', 1, 'AA');
insert into serve_seat values ('AI03', 1, 'AA');
insert into serve_seat values ('AI04', 1, 'AA');
insert into serve_seat values ('AI05', 1, 'AA');
insert into serve_seat values ('AI06', 1, 'AA');
insert into serve_seat values ('AI07', 1, 'AA');
insert into serve_seat values ('AI08', 1, 'AA');
insert into serve_seat values ('AI09', 1, 'AA');
insert into serve_seat values ('AI10', 1, 'AA');
insert into serve_seat values ('AI11', 1, 'AA');
insert into serve_seat values ('AI12', 1, 'AA');
insert into serve_seat values ('AI13', 1, 'AA');
insert into serve_seat values ('AI14', 1, 'AA');
insert into serve_seat values ('AI15', 1, 'AA');
insert into serve_seat values ('AI16', 1, 'AA');
insert into serve_seat values ('AI17', 1, 'AA');
insert into serve_seat values ('AI18', 1, 'AA');
insert into serve_seat values ('AI19', 1, 'AA');
insert into serve_seat values ('AI20', 1, 'AA');
insert into serve_seat values ('AI21', 1, 'AA');
insert into serve_seat values ('AI22', 1, 'AA');
insert into serve_seat values ('AI23', 1, 'AA');
insert into serve_seat values ('AI24', 1, 'AA');
insert into serve_seat values ('AI25', 1, 'AA');
insert into serve_seat values ('AJ01', 1, 'AA');
insert into serve_seat values ('AJ02', 1, 'AA');
insert into serve_seat values ('AJ03', 1, 'AA');
insert into serve_seat values ('AJ04', 1, 'AA');
insert into serve_seat values ('AJ05', 1, 'AA');
insert into serve_seat values ('AJ06', 1, 'AA');
insert into serve_seat values ('AJ07', 1, 'AA');
insert into serve_seat values ('AJ08', 1, 'AA');
insert into serve_seat values ('AJ09', 1, 'AA');
insert into serve_seat values ('AJ10', 1, 'AA');
insert into serve_seat values ('AJ11', 1, 'AA');
insert into serve_seat values ('AJ12', 1, 'AA');
insert into serve_seat values ('AJ13', 1, 'AA');
insert into serve_seat values ('AJ14', 1, 'AA');
insert into serve_seat values ('AJ15', 1, 'AA');
insert into serve_seat values ('AJ16', 1, 'AA');
insert into serve_seat values ('AJ17', 1, 'AA');
insert into serve_seat values ('AJ18', 1, 'AA');
insert into serve_seat values ('AJ19', 1, 'AA');
insert into serve_seat values ('AJ20', 1, 'AA');
insert into serve_seat values ('AJ21', 1, 'AA');
insert into serve_seat values ('AJ22', 1, 'AA');
insert into serve_seat values ('AJ23', 1, 'AA');
insert into serve_seat values ('AJ24', 1, 'AA');
insert into serve_seat values ('AJ25', 1, 'AA');
insert into serve_seat values ('AK01', 1, 'AA');
insert into serve_seat values ('AK02', 1, 'AA');
insert into serve_seat values ('AK03', 1, 'AA');
insert into serve_seat values ('AK04', 1, 'AA');
insert into serve_seat values ('AK05', 1, 'AA');
insert into serve_seat values ('AK06', 1, 'AA');
insert into serve_seat values ('AK07', 1, 'AA');
insert into serve_seat values ('AK08', 1, 'AA');
insert into serve_seat values ('AK09', 1, 'AA');
insert into serve_seat values ('AK10', 1, 'AA');
insert into serve_seat values ('AK11', 1, 'AA');
insert into serve_seat values ('AK12', 1, 'AA');
insert into serve_seat values ('AK13', 1, 'AA');
insert into serve_seat values ('AK14', 1, 'AA');
insert into serve_seat values ('AK15', 1, 'AA');
insert into serve_seat values ('AK16', 1, 'AA');
insert into serve_seat values ('AK17', 1, 'AA');
insert into serve_seat values ('AK18', 1, 'AA');
insert into serve_seat values ('AK19', 1, 'AA');
insert into serve_seat values ('AK20', 1, 'AA');
insert into serve_seat values ('AK21', 1, 'AA');
insert into serve_seat values ('AK22', 1, 'AA');
insert into serve_seat values ('AK23', 1, 'AA');
insert into serve_seat values ('AK24', 1, 'AA');
insert into serve_seat values ('AK25', 1, 'AA');
insert into serve_seat values ('AL01', 1, 'AA');
insert into serve_seat values ('AL02', 1, 'AA');
insert into serve_seat values ('AL03', 1, 'AA');
insert into serve_seat values ('AL04', 1, 'AA');
insert into serve_seat values ('AL05', 1, 'AA');
insert into serve_seat values ('AL06', 1, 'AA');
insert into serve_seat values ('AL07', 1, 'AA');
insert into serve_seat values ('AL08', 1, 'AA');
insert into serve_seat values ('AL09', 1, 'AA');
insert into serve_seat values ('AL10', 1, 'AA');
insert into serve_seat values ('AL11', 1, 'AA');
insert into serve_seat values ('AL12', 1, 'AA');
insert into serve_seat values ('AL13', 1, 'AA');
insert into serve_seat values ('AL14', 1, 'AA');
insert into serve_seat values ('AL15', 1, 'AA');
insert into serve_seat values ('AL16', 1, 'AA');
insert into serve_seat values ('AL17', 1, 'AA');
insert into serve_seat values ('AL18', 1, 'AA');
insert into serve_seat values ('AL19', 1, 'AA');
insert into serve_seat values ('AL20', 1, 'AA');
insert into serve_seat values ('AL21', 1, 'AA');
insert into serve_seat values ('AL22', 1, 'AA');
insert into serve_seat values ('AL23', 1, 'AA');
insert into serve_seat values ('AL24', 1, 'AA');
insert into serve_seat values ('AL25', 1, 'AA');
insert into serve_seat values ('AM01', 1, 'AA');
insert into serve_seat values ('AM02', 1, 'AA');
insert into serve_seat values ('AM03', 1, 'AA');
insert into serve_seat values ('AM04', 1, 'AA');
insert into serve_seat values ('AM05', 1, 'AA');
insert into serve_seat values ('AM06', 1, 'AA');
insert into serve_seat values ('AM07', 1, 'AA');
insert into serve_seat values ('AM08', 1, 'AA');
insert into serve_seat values ('AM09', 1, 'AA');
insert into serve_seat values ('AM10', 1, 'AA');
insert into serve_seat values ('AM11', 1, 'AA');
insert into serve_seat values ('AM12', 1, 'AA');
insert into serve_seat values ('AM13', 1, 'AA');
insert into serve_seat values ('AM14', 1, 'AA');
insert into serve_seat values ('AM15', 1, 'AA');
insert into serve_seat values ('AM16', 1, 'AA');
insert into serve_seat values ('AM17', 1, 'AA');
insert into serve_seat values ('AM18', 1, 'AA');
insert into serve_seat values ('AM19', 1, 'AA');
insert into serve_seat values ('AM20', 1, 'AA');
insert into serve_seat values ('AM21', 1, 'AA');
insert into serve_seat values ('AM22', 1, 'AA');
insert into serve_seat values ('AM23', 1, 'AA');
insert into serve_seat values ('AM24', 1, 'AA');
insert into serve_seat values ('AM25', 1, 'AA');
insert into serve_seat values ('AN01', 1, 'AA');
insert into serve_seat values ('AN02', 1, 'AA');
insert into serve_seat values ('AN03', 1, 'AA');
insert into serve_seat values ('AN04', 1, 'AA');
insert into serve_seat values ('AN05', 1, 'AA');
insert into serve_seat values ('AN06', 1, 'AA');
insert into serve_seat values ('AN07', 1, 'AA');
insert into serve_seat values ('AN08', 1, 'AA');
insert into serve_seat values ('AN09', 1, 'AA');
insert into serve_seat values ('AN10', 1, 'AA');
insert into serve_seat values ('AN11', 1, 'AA');
insert into serve_seat values ('AN12', 1, 'AA');
insert into serve_seat values ('AN13', 1, 'AA');
insert into serve_seat values ('AN14', 1, 'AA');
insert into serve_seat values ('AN15', 1, 'AA');
insert into serve_seat values ('AN16', 1, 'AA');
insert into serve_seat values ('AN17', 1, 'AA');
insert into serve_seat values ('AN18', 1, 'AA');
insert into serve_seat values ('AN19', 1, 'AA');
insert into serve_seat values ('AN20', 1, 'AA');
insert into serve_seat values ('AN21', 1, 'AA');
insert into serve_seat values ('AN22', 1, 'AA');
insert into serve_seat values ('AN23', 1, 'AA');
insert into serve_seat values ('AN24', 1, 'AA');
insert into serve_seat values ('AN25', 1, 'AA');
insert into serve_seat values ('AO01', 1, 'AA');
insert into serve_seat values ('AO02', 1, 'AA');
insert into serve_seat values ('AO03', 1, 'AA');
insert into serve_seat values ('AO04', 1, 'AA');
insert into serve_seat values ('AO05', 1, 'AA');
insert into serve_seat values ('AO06', 1, 'AA');
insert into serve_seat values ('AO07', 1, 'AA');
insert into serve_seat values ('AO08', 1, 'AA');
insert into serve_seat values ('AO09', 1, 'AA');
insert into serve_seat values ('AO10', 1, 'AA');
insert into serve_seat values ('AO11', 1, 'AA');
insert into serve_seat values ('AO12', 1, 'AA');
insert into serve_seat values ('AO13', 1, 'AA');
insert into serve_seat values ('AO14', 1, 'AA');
insert into serve_seat values ('AO15', 1, 'AA');
insert into serve_seat values ('AO16', 1, 'AA');
insert into serve_seat values ('AO17', 1, 'AA');
insert into serve_seat values ('AO18', 1, 'AA');
insert into serve_seat values ('AO19', 1, 'AA');
insert into serve_seat values ('AO20', 1, 'AA');
insert into serve_seat values ('AO21', 1, 'AA');
insert into serve_seat values ('AO22', 1, 'AA');
insert into serve_seat values ('AO23', 1, 'AA');
insert into serve_seat values ('AO24', 1, 'AA');
insert into serve_seat values ('AO25', 1, 'AA');
insert into serve_seat values ('AP01', 1, 'AA');
insert into serve_seat values ('AP02', 1, 'AA');
insert into serve_seat values ('AP03', 1, 'AA');
insert into serve_seat values ('AP04', 1, 'AA');
insert into serve_seat values ('AP05', 1, 'AA');
insert into serve_seat values ('AP06', 1, 'AA');
insert into serve_seat values ('AP07', 1, 'AA');
insert into serve_seat values ('AP08', 1, 'AA');
insert into serve_seat values ('AP09', 1, 'AA');
insert into serve_seat values ('AP10', 1, 'AA');
insert into serve_seat values ('AP11', 1, 'AA');
insert into serve_seat values ('AP12', 1, 'AA');
insert into serve_seat values ('AP13', 1, 'AA');
insert into serve_seat values ('AP14', 1, 'AA');
insert into serve_seat values ('AP15', 1, 'AA');
insert into serve_seat values ('AP16', 1, 'AA');
insert into serve_seat values ('AP17', 1, 'AA');
insert into serve_seat values ('AP18', 1, 'AA');
insert into serve_seat values ('AP19', 1, 'AA');
insert into serve_seat values ('AP20', 1, 'AA');
insert into serve_seat values ('AP21', 1, 'AA');
insert into serve_seat values ('AP22', 1, 'AA');
insert into serve_seat values ('AP23', 1, 'AA');
insert into serve_seat values ('AP24', 1, 'AA');
insert into serve_seat values ('AP25', 1, 'AA');
insert into serve_seat values ('AQ01', 1, 'AA');
insert into serve_seat values ('AQ02', 1, 'AA');
insert into serve_seat values ('AQ03', 1, 'AA');
insert into serve_seat values ('AQ04', 1, 'AA');
insert into serve_seat values ('AQ05', 1, 'AA');
insert into serve_seat values ('AQ06', 1, 'AA');
insert into serve_seat values ('AQ07', 1, 'AA');
insert into serve_seat values ('AQ08', 1, 'AA');
insert into serve_seat values ('AQ09', 1, 'AA');
insert into serve_seat values ('AQ10', 1, 'AA');
insert into serve_seat values ('AQ11', 1, 'AA');
insert into serve_seat values ('AQ12', 1, 'AA');
insert into serve_seat values ('AQ13', 1, 'AA');
insert into serve_seat values ('AQ14', 1, 'AA');
insert into serve_seat values ('AQ15', 1, 'AA');
insert into serve_seat values ('AQ16', 1, 'AA');
insert into serve_seat values ('AQ17', 1, 'AA');
insert into serve_seat values ('AQ18', 1, 'AA');
insert into serve_seat values ('AQ19', 1, 'AA');
insert into serve_seat values ('AQ20', 1, 'AA');
insert into serve_seat values ('AQ21', 1, 'AA');
insert into serve_seat values ('AQ22', 1, 'AA');
insert into serve_seat values ('AQ23', 1, 'AA');
insert into serve_seat values ('AQ24', 1, 'AA');
insert into serve_seat values ('AQ25', 1, 'AA');
insert into serve_seat values ('AR01', 1, 'AA');
insert into serve_seat values ('AR02', 1, 'AA');
insert into serve_seat values ('AR03', 1, 'AA');
insert into serve_seat values ('AR04', 1, 'AA');
insert into serve_seat values ('AR05', 1, 'AA');
insert into serve_seat values ('AR06', 1, 'AA');
insert into serve_seat values ('AR07', 1, 'AA');
insert into serve_seat values ('AR08', 1, 'AA');
insert into serve_seat values ('AR09', 1, 'AA');
insert into serve_seat values ('AR10', 1, 'AA');
insert into serve_seat values ('AR11', 1, 'AA');
insert into serve_seat values ('AR12', 1, 'AA');
insert into serve_seat values ('AR13', 1, 'AA');
insert into serve_seat values ('AR14', 1, 'AA');
insert into serve_seat values ('AR15', 1, 'AA');
insert into serve_seat values ('AR16', 1, 'AA');
insert into serve_seat values ('AR17', 1, 'AA');
insert into serve_seat values ('AR18', 1, 'AA');
insert into serve_seat values ('AR19', 1, 'AA');
insert into serve_seat values ('AR20', 1, 'AA');
insert into serve_seat values ('AR21', 1, 'AA');
insert into serve_seat values ('AR22', 1, 'AA');
insert into serve_seat values ('AR23', 1, 'AA');
insert into serve_seat values ('AR24', 1, 'AA');
insert into serve_seat values ('AR25', 1, 'AA');
insert into serve_seat values ('AS01', 2, 'AA');
insert into serve_seat values ('AS02', 2, 'AA');
insert into serve_seat values ('AS03', 2, 'AA');
insert into serve_seat values ('AS04', 2, 'AA');
insert into serve_seat values ('AS05', 2, 'AA');
insert into serve_seat values ('AS06', 2, 'AA');
insert into serve_seat values ('AS07', 2, 'AA');
insert into serve_seat values ('AS08', 2, 'AA');
insert into serve_seat values ('AS09', 2, 'AA');
insert into serve_seat values ('AS10', 2, 'AA');
insert into serve_seat values ('AS11', 2, 'AA');
insert into serve_seat values ('AS12', 2, 'AA');
insert into serve_seat values ('AS13', 2, 'AA');
insert into serve_seat values ('AS14', 2, 'AA');
insert into serve_seat values ('AS15', 2, 'AA');
insert into serve_seat values ('AS16', 2, 'AA');
insert into serve_seat values ('AS17', 2, 'AA');
insert into serve_seat values ('AS18', 2, 'AA');
insert into serve_seat values ('AS19', 2, 'AA');
insert into serve_seat values ('AS20', 2, 'AA');
insert into serve_seat values ('AS21', 2, 'AA');
insert into serve_seat values ('AS22', 2, 'AA');
insert into serve_seat values ('AS23', 2, 'AA');
insert into serve_seat values ('AS24', 2, 'AA');
insert into serve_seat values ('AS25', 2, 'AA');
insert into serve_seat values ('AT01', 2, 'AA');
insert into serve_seat values ('AT02', 2, 'AA');
insert into serve_seat values ('AT03', 2, 'AA');
insert into serve_seat values ('AT04', 2, 'AA');
insert into serve_seat values ('AT05', 2, 'AA');
insert into serve_seat values ('AT06', 2, 'AA');
insert into serve_seat values ('AT07', 2, 'AA');
insert into serve_seat values ('AT08', 2, 'AA');
insert into serve_seat values ('AT09', 2, 'AA');
insert into serve_seat values ('AT10', 2, 'AA');
insert into serve_seat values ('AT11', 2, 'AA');
insert into serve_seat values ('AT12', 2, 'AA');
insert into serve_seat values ('AT13', 2, 'AA');
insert into serve_seat values ('AT14', 2, 'AA');
insert into serve_seat values ('AT15', 2, 'AA');
insert into serve_seat values ('AT16', 2, 'AA');
insert into serve_seat values ('AT17', 2, 'AA');
insert into serve_seat values ('AT18', 2, 'AA');
insert into serve_seat values ('AT19', 2, 'AA');
insert into serve_seat values ('AT20', 2, 'AA');
insert into serve_seat values ('AT21', 2, 'AA');
insert into serve_seat values ('AT22', 2, 'AA');
insert into serve_seat values ('AT23', 2, 'AA');
insert into serve_seat values ('AT24', 2, 'AA');
insert into serve_seat values ('AT25', 2, 'AA');
insert into serve_seat values ('AU01', 2, 'AA');
insert into serve_seat values ('AU02', 2, 'AA');
insert into serve_seat values ('AU03', 2, 'AA');
insert into serve_seat values ('AU04', 2, 'AA');
insert into serve_seat values ('AU05', 2, 'AA');
insert into serve_seat values ('AU06', 2, 'AA');
insert into serve_seat values ('AU07', 2, 'AA');
insert into serve_seat values ('AU08', 2, 'AA');
insert into serve_seat values ('AU09', 2, 'AA');
insert into serve_seat values ('AU10', 2, 'AA');
insert into serve_seat values ('AU11', 2, 'AA');
insert into serve_seat values ('AU12', 2, 'AA');
insert into serve_seat values ('AU13', 2, 'AA');
insert into serve_seat values ('AU14', 2, 'AA');
insert into serve_seat values ('AU15', 2, 'AA');
insert into serve_seat values ('AU16', 2, 'AA');
insert into serve_seat values ('AU17', 2, 'AA');
insert into serve_seat values ('AU18', 2, 'AA');
insert into serve_seat values ('AU19', 2, 'AA');
insert into serve_seat values ('AU20', 2, 'AA');
insert into serve_seat values ('AU21', 2, 'AA');
insert into serve_seat values ('AU22', 2, 'AA');
insert into serve_seat values ('AU23', 2, 'AA');
insert into serve_seat values ('AU24', 2, 'AA');
insert into serve_seat values ('AU25', 2, 'AA');
insert into serve_seat values ('AV01', 3, 'AA');
insert into serve_seat values ('AV02', 3, 'AA');
insert into serve_seat values ('AV03', 3, 'AA');
insert into serve_seat values ('AV04', 3, 'AA');
insert into serve_seat values ('AV05', 3, 'AA');
insert into serve_seat values ('AV06', 3, 'AA');
insert into serve_seat values ('AV07', 3, 'AA');
insert into serve_seat values ('AV08', 3, 'AA');
insert into serve_seat values ('AV09', 3, 'AA');
insert into serve_seat values ('AV10', 3, 'AA');
insert into serve_seat values ('AV11', 3, 'AA');
insert into serve_seat values ('AV12', 3, 'AA');
insert into serve_seat values ('AV13', 3, 'AA');
insert into serve_seat values ('AV14', 3, 'AA');
insert into serve_seat values ('AV15', 3, 'AA');
insert into serve_seat values ('AV16', 3, 'AA');
insert into serve_seat values ('AV17', 3, 'AA');
insert into serve_seat values ('AV18', 3, 'AA');
insert into serve_seat values ('AV19', 3, 'AA');
insert into serve_seat values ('AV20', 3, 'AA');
insert into serve_seat values ('AV21', 3, 'AA');
insert into serve_seat values ('AV22', 3, 'AA');
insert into serve_seat values ('AV23', 3, 'AA');
insert into serve_seat values ('AV24', 3, 'AA');
insert into serve_seat values ('AV25', 3, 'AA');
-- 아시아나 항공 예약좌석 insert 코드 끝
-- 플라이강원 항공 예약좌석 insert 코드 시작
insert into serve_seat values ('KA01', 1, 'FK');
insert into serve_seat values ('KA02', 1, 'FK');
insert into serve_seat values ('KA03', 1, 'FK');
insert into serve_seat values ('KA04', 1, 'FK');
insert into serve_seat values ('KA05', 1, 'FK');
insert into serve_seat values ('KA06', 1, 'FK');
insert into serve_seat values ('KA07', 1, 'FK');
insert into serve_seat values ('KA08', 1, 'FK');
insert into serve_seat values ('KA09', 1, 'FK');
insert into serve_seat values ('KA10', 1, 'FK');
insert into serve_seat values ('KB01', 1, 'FK');
insert into serve_seat values ('KB02', 1, 'FK');
insert into serve_seat values ('KB03', 1, 'FK');
insert into serve_seat values ('KB04', 1, 'FK');
insert into serve_seat values ('KB05', 1, 'FK');
insert into serve_seat values ('KB06', 1, 'FK');
insert into serve_seat values ('KB07', 1, 'FK');
insert into serve_seat values ('KB08', 1, 'FK');
insert into serve_seat values ('KB09', 1, 'FK');
insert into serve_seat values ('KB10', 1, 'FK');
insert into serve_seat values ('KC01', 1, 'FK');
insert into serve_seat values ('KC02', 1, 'FK');
insert into serve_seat values ('KC03', 1, 'FK');
insert into serve_seat values ('KC04', 1, 'FK');
insert into serve_seat values ('KC05', 1, 'FK');
insert into serve_seat values ('KC06', 1, 'FK');
insert into serve_seat values ('KC07', 1, 'FK');
insert into serve_seat values ('KC08', 1, 'FK');
insert into serve_seat values ('KC09', 1, 'FK');
insert into serve_seat values ('KC10', 1, 'FK');
insert into serve_seat values ('KD01', 1, 'FK');
insert into serve_seat values ('KD02', 1, 'FK');
insert into serve_seat values ('KD03', 1, 'FK');
insert into serve_seat values ('KD04', 1, 'FK');
insert into serve_seat values ('KD05', 1, 'FK');
insert into serve_seat values ('KD06', 1, 'FK');
insert into serve_seat values ('KD07', 1, 'FK');
insert into serve_seat values ('KD08', 1, 'FK');
insert into serve_seat values ('KD09', 1, 'FK');
insert into serve_seat values ('KD10', 1, 'FK');
insert into serve_seat values ('KE01', 2, 'FK');
insert into serve_seat values ('KE02', 2, 'FK');
insert into serve_seat values ('KE03', 2, 'FK');
insert into serve_seat values ('KE04', 2, 'FK');
insert into serve_seat values ('KE05', 2, 'FK');
insert into serve_seat values ('KE06', 2, 'FK');
insert into serve_seat values ('KE07', 2, 'FK');
insert into serve_seat values ('KE08', 2, 'FK');
insert into serve_seat values ('KE09', 2, 'FK');
insert into serve_seat values ('KE10', 2, 'FK');
insert into serve_seat values ('KF01', 2, 'FK');
insert into serve_seat values ('KF02', 2, 'FK');
insert into serve_seat values ('KF03', 2, 'FK');
insert into serve_seat values ('KF04', 2, 'FK');
insert into serve_seat values ('KF05', 2, 'FK');
insert into serve_seat values ('KF06', 2, 'FK');
insert into serve_seat values ('KF07', 2, 'FK');
insert into serve_seat values ('KF08', 2, 'FK');
insert into serve_seat values ('KF09', 2, 'FK');
insert into serve_seat values ('KF10', 2, 'FK');
insert into serve_seat values ('KG01', 3, 'FK');
insert into serve_seat values ('KG02', 3, 'FK');
insert into serve_seat values ('KG03', 3, 'FK');
insert into serve_seat values ('KG04', 3, 'FK');
insert into serve_seat values ('KG05', 3, 'FK');
insert into serve_seat values ('KG06', 3, 'FK');
insert into serve_seat values ('KG07', 3, 'FK');
insert into serve_seat values ('KG08', 3, 'FK');
insert into serve_seat values ('KG09', 3, 'FK');
insert into serve_seat values ('KG10', 3, 'FK');
-- 플라이강원 항공 예약좌석 insert 코드 끝

-- 일정(일정번호, 출발시간, 도착시간, 출발지, 도착지, 비행기번호, 운임료)
-- schedule(schedule_no, departure_time, arrival_time, start_port, end_port, airplane_no, freightfee)
insert into schedule values ('01081001051', '08:45', '10:30', 'ICN', 'KIX', 'AA', 336000);
insert into schedule values ('02091101053', '09:15', '11:00', 'ICN', 'KIX', 'JJ', 275900);
insert into schedule values ('03181701132', '18:00', '17:35', 'ICN', 'HNL', 'TW', 702300);
insert into schedule values ('04202301085', '20:00', '23:10', 'ICN', 'HKG', 'AS', 385600);
insert into schedule values ('05001601148', '00:25', '16:50', 'ICN', 'GRU', 'ET', 577412);
insert into schedule values ('06070802041', '07:00', '08:05', 'GMP', 'PUS', 'AA', 52800);
insert into schedule values ('07070802046', '07:30', '08:25', 'GMP', 'PUS', 'AP', 37700);
insert into schedule values ('08080902042', '08:05', '09:05', 'GMP', 'PUS', 'TW', 33200);
insert into schedule values ('09080902045', '08:35', '09:35', 'GMP', 'PUS', 'AS', 41700);
insert into schedule values ('10091002044', '09:25', '10:30', 'GMP', 'PUS', 'JA', 40470);
insert into schedule values ('11091002043', '09:40', '10:35', 'GMP', 'PUS', 'JJ', 40700);
insert into schedule values ('12101102045', '10:10', '11:05', 'GMP', 'PUS', 'AS', 40200);
insert into schedule values ('13101102042', '10:40', '11:30', 'GMP', 'PUS', 'TW', 43470);
insert into schedule values ('14111202047', '11:25', '12:30', 'GMP', 'PUS', 'AI', 74800);
insert into schedule values ('15111202041', '11:30', '12:30', 'GMP', 'PUS', 'AA', 87500);
insert into schedule values ('16131402049', '13:25', '14:30', 'GMP', 'PUS', 'FK', 44470);
insert into schedule values ('17141502048', '14:00', '15:05', 'GMP', 'PUS', 'ET', 65800);
insert into schedule values ('18151602046', '15:10', '16:05', 'GMP', 'PUS', 'AP', 100800);
insert into schedule values ('19151602041', '15:55', '16:55', 'GMP', 'PUS', 'AA', 98670);
insert into schedule values ('20161702045', '16:30', '17:25', 'GMP', 'PUS', 'AS', 90800);
insert into schedule values ('21171802043', '17:05', '18:05', 'GMP', 'PUS', 'JJ', 52700);
insert into schedule values ('22171802046', '17:35', '18:40', 'GMP', 'PUS', 'AP', 70800);
insert into schedule values ('23181902041', '18:20', '19:10', 'GMP', 'PUS', 'AA', 62700);
insert into schedule values ('24192002048', '19:25', '20:20', 'GMP', 'PUS', 'ET', 69570);
insert into schedule values ('25202102049', '20:00', '21:00', 'GMP', 'PUS', 'FK', 98670);
insert into schedule values ('26212202042', '21:10', '22:05', 'GMP', 'PUS', 'TW', 98800);

-- 예약(예약번호, 회원아이디, 탑승일, 일정번호, 좌석번호, 운임료)
-- reservation(reservation_no, member_id, date, schedule_no, serve_seat_no, ticket_price)
insert into reservation values(1, 'shushu', '2021-12-01', '25202102049', 'KA01', 105000);
insert into reservation values(2, 'shushu', '2021-12-01', '25202102049', 'KA02', 105000);
insert into reservation values(3, 'lemon', '2021-12-08', '06070802041', 'AA02', 52800);

-- 상품(상품번호, 상품이름, 위치, 상품상세, 평점, 리뷰수, 상품구분, 이용시간, 전화번호, 경로)  
-- product(product_no, product_name, location, product_detail, ratings, review, distinguishing, time, tel, src)
insert into product values('P001', '광안대교', '부산 수영구 남천동과 해운대구 우동', '밤에 가면 더 예쁜 야경 맛집 다리', '4.5', 252, '관광명소', '평일 00:00 - 24:00 (연중무휴)', '1670-8114', 'img/bridge.JPG');
insert into product values('P002', '더베이101', '부산광역시 해운대구 동백로 52', '인생샷 필수 복합 문화예술공간', '4.8', 124, '관광명소', '평일 00:00 - 24:00 (연중무휴)', '051-635-1234',  'img/thebay.jpg');
insert into product values('P003', '수정동', '부산광역시 동구 홍곡로 75', '일본식 가옥', '4.1', 156, '관광명소','평일 00:00 - 24:00 (연중무휴)', '051-987-1234',  'img/sujung.jpg');
insert into product values('P004', '수변최고돼지국밥', '부산 수영구 광안해변로370번길 9-32', '수변 30년 전통의 돼지국밥 맛집', '4.2', 115, '맛집', '평일 00:00 - 24:00 (연중무휴)', '051-754-9222',  'img/gukbab.png');
insert into product values('P005', '메그네이트', '부산광역시 남구 진남로 135 B동 1층', '인생샷 건지는 분위기 좋은 카페', '3.9', 257, '맛집', '평일 10:00 - 22:00 (연중무휴)', '051-635-5005',  'img/magnate.png');
insert into product values('P006', '이재모피자', '부산 중구 광복중앙로 31', '치즈가 듬뿍 들어간 30년 전통의 로컬 피자 맛집', '4.5', 571, '맛집', '평일 11:00 - 22:00 (일요일 휴무)', '051-245-1478', 'img/pizza.jpg');

-- 장바구니(장바구니번호, 상품번호, 회원아이디)
-- cart(cart_no, product_no, member_id)
insert into cart values(1, 'P006', 'admin');
insert into cart values(2, 'P001', 'shushu');
insert into cart values(3, 'P002', 'shushu');

-- 데이터 검색
select * from member;
select * from airport;
select * from airplane;
select * from seat;
select * from serve_seat;
select * from schedule;
select * from reservation;

select  a.reservation_no, a.member_id, a.date, a.schedule_no,
        b.departure_time, b.arrival_time, b.start_port, b.end_port, 
        a.serve_seat_no, a.ticket_price, c.airplane_no, d.grade
from reservation a join schedule b
					  on a.schedule_no = b.schedule_no
                   join serve_seat c
					  on a.serve_seat_no = c.serve_seat_no
				   join seat d
                      on c.seat_no = d.seat_no and c.airplane_no = d.airplane_no;

select * from product;
select * from cart; 
select b.cart_no, a.product_no, a.product_name, a.location, a.product_detail, a.ratings, a.review, a.distinguishing, a.time, a.tel, a.src, b.member_id
from product a join cart b
on a.product_no = b.product_no;