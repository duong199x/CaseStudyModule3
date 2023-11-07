# create database and table
CREATE DATABASE shoeshoponline;
use shoeshoponline;
create table user
(
    id       int primary key auto_increment,
    email    varchar(255) not null unique,
    password varchar(255) not null,
    nickname varchar(255) not null,
    phone    varchar(11) unique,
    address  varchar(255),
    role     int
);
create table `order`
(
    id     int primary key auto_increment,
    time   datetime,
    total  double,
    userId int,
    FOREIGN KEY (userId) REFERENCES user (id)
);
create table category
(
    íd   int primary key auto_increment,
    name varchar(255) not null
);
create table product
(
    id          int primary key auto_increment,
    name        varchar(255) not null,
    price       double       not null,
    description text,
    status      boolean,
    categoryId  int,
    foreign key (categoryId) references category (íd)
);
create table size
(
    id        int primary key auto_increment,
    size      double,
    quantity  int,
    productId int,
    foreign key (productId) references product (id)
);
create table image
(
    id        int primary key auto_increment,
    image     text,
    productId int,
    foreign key (productId) references product (id)
);
create table orderDetail
(
    orderId     int,
    productId   int,
    quantityBuy int,
    status      int,
    foreign key (orderId) references `order` (id),
    foreign key (productId) references product (id)
);
# create data in table
# user
insert into user(email, password, nickname, phone, address, role)
values ('admin@gmail.com', '123456', 'admin', '', '', 1);
# order
# category
insert into category(name)
values ('nike');
insert into category(name)
values ('adidas');
insert into category(name)
values ('vans');
# product
# size
# image
# orderdetail
# data query
alter table orderdetail drop column status;
alter table `order` add column (status int);
update `order` set status = 1 where id = 1;
ALTER TABLE category
    RENAME COLUMN íd to id;
#thay đổi kiểu dữ liệu size
ALTER TABLE size
    MODIFY COLUMN size varchar(10);
# thêm cột deleteFlag
ALTER TABLE product
    ADD productFlag boolean;
alter table product
RENAME COLUMN productFlag to deleteFlag;
# tạo trigger thêm product tự tạo size
DELIMITER //
create trigger InsertSize
    AFTER INSERT ON product
    for each row
    begin
    insert into size(size, quantity, productId) values (38,null,NEW.id);
    insert into size(size, quantity, productId) values (39,null,NEW.id);
    insert into size(size, quantity, productId) values (40,null,NEW.id);
    insert into size(size, quantity, productId) values (41,null,NEW.id);
    insert into size(size, quantity, productId) values (42,null,NEW.id);
    insert into size(size, quantity, productId) values (43,null,NEW.id);
    insert into size(size, quantity, productId) values (44,null,NEW.id);
    insert into size(size, quantity, productId) values (45,null,NEW.id);
        end;
        //
DELIMITER ;
DELIMITER //
create trigger InsertImage
    AFTER INSERT ON product
    for each row
begin
    insert into image(image, productId) values ('',NEW.id);
    insert into image(image, productId) values ('',NEW.id);
    insert into image(image, productId) values ('',NEW.id);
end;
//
DELIMITER ;
alter table product add originImage text;
#tạo bảng giỏ hàng
create table cart(
    id int auto_increment primary key,
    productId int,
    userId int,
    sizeId int,
    foreign key (productId) references product (id),
    foreign key (userId) references user (id),
    foreign key (sizeId) references size (id)
);
alter table orderdetail add sizeId int;
alter table orderdetail add foreign key (sizeId) references size (id);
alter table orderdetail add id int primary key  auto_increment;
alter table orderdetail drop column quantityBuy;
drop database shoeshoponline;
