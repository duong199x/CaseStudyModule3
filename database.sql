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
insert into user(email, password, nickname, phone, address, role)
values ('duong@gmail.com', '123456789', 'duong', '0321575891', 'hanoi', 2);
# order
insert into `order`(time, total, userId)
values ('2008-11-11 13:23:44', 200000.0, 2);
# category
insert into category(name)
values ('nike');
insert into category(name)
values ('adidas');
insert into category(name)
values ('vans');
# product
insert into product(name, price, description, status, categoryId)
values ('Yeezy 350', 200000, 'đỏ đen', true, 2);
insert into product(name, price, description, status, categoryId)
values ('air force 1', 300000, 'trắng đỏ', true, 1);
insert into product(name, price, description, status, categoryId)
values ('vans old school', 100000, 'trắng đen', true, 3);
# size
insert into size(size, quantity, productId)
values (40, 10, 2);
insert into size(size, quantity, productId)
values (42, 20, 2);
insert into size(size, quantity, productId)
values (43, 30, 1);
insert into size(size, quantity, productId)
values (39, 0, 3);
# image
insert into image(image, productId)
values ('abc.jpg', 1);
insert into image(image, productId)
values ('abc.jpg', 2);
insert into image(image, productId)
values ('abc.jpg', 3);
# orderdetail
insert into orderdetail(orderId, productId, quantityBuy, status)
values (1, 1, 2, 1);
# data query
alter table orderdetail drop column status;
alter table `order` add column (status int);
update `order` set status = 1 where id = 1;
select product.*,c.name as brand from product join category c on product.categoryId = c.íd;
insert into product(name, price, description, status, categoryId)
values ('nike jordan', 50000, 'đen trắng', false, 1);
insert into product(name, price, description, status, categoryId) values (?,?,?,?,?);
select * from category;
ALTER TABLE category
    RENAME COLUMN íd to id;
select product.*,c.name as brand from product join category c on product.categoryId = c.id where product.id=1;
insert into size(size, quantity, productId) values (?,?,?);
#thay đổi kiểu dữ liệu size
ALTER TABLE size
    MODIFY COLUMN size varchar(10);
# thêm cột deleteFlag
ALTER TABLE product
    ADD productFlag boolean;
alter table product
RENAME COLUMN productFlag to deleteFlag;
select product.*,c.name as brand from product join category c on product.categoryId = c.id and product.deleteFlag = 0;
update product set product.deleteFlag = 1 where id = ?;
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
insert into product(name, price, description, status, categoryId,deleteFlag) values ('nike2',3000000,'đen trắng đỏ',0,1,0);
update size set size=?, quantity=? , productId =? where id =?;
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