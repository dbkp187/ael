delete from customers where id>0;
load data local infile 'D:\\workspaceAEL\\ael\\DB\\customer.csv' into table customers CHARACTER SET 'utf8' fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
(id,name,address,taxno,tel,fax,contact,email,companyType,country,code,creator,updator,createdDate,lastUpdateDate);

UPDATE `ael`.`customers`
SET
`creator` =-2,
`updator` = -2,
createdDate = null,
lastUpdateDate = null,
taxno='0000'
WHERE `id` >0;

delete from app_user where id>0;
load data local infile 'D:\\workspaceAEL\\ael\\DB\\nhanvien.csv' into table app_user CHARACTER SET 'utf8' fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
(id,account_expired,account_locked,address,city,country,postal_code,province,credentials_expired,email,account_enabled,first_name,last_name,password,password_hint,phone_number,username,version,website);


delete from nhathau where id>0;
load data local infile 'D:\\workspaceAEL\\ael\\DB\\nhathau.csv' into table nhathau CHARACTER SET 'utf8' fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
(id,name,code,info,address,contactName,type,taxNo);

delete from configuration where type = 19 and id>0;
load data local infile 'D:\\workspaceAEL\\ael\\DB\\chiphi.csv' into table configuration CHARACTER SET 'utf8' fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
(id,value,type,description,enabled,implyActions);

load data local infile 'D:\\Projects\\Java\\ael\\DB\\newCus.csv' into table customers CHARACTER SET 'utf8' fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
(id,name,address,taxno,tel,fax,contact,email,companyType,country,code,creator,updator,createdDate,lastUpdateDate);

update customers set createdDate = '2015-05-29 23:09:27' where id>0;
update customers set lastUpdateDate = '2015-05-29 23:09:27' where id>0;
update customers set creator = -2 where id>0;
update customers set updator = -2 where id>0;
update customers set taxno = '000' where id>0;
