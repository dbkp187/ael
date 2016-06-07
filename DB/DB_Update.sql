ALTER TABLE `ael`.`nhathau` 
ADD COLUMN `address` VARCHAR(45) NULL AFTER `type`,
ADD COLUMN `code` VARCHAR(45) NULL AFTER `address`;
ALTER TABLE truckingservice
	ADD COLUMN `contactDelivery` VARCHAR(255),
	ADD COLUMN `infoInvoice` VARCHAR(255);
ALTER TABLE `ael`.`exfeetable` 
ADD COLUMN `total` decimal(20,2) NULL AFTER `checkByAdmin`
	----------- Truckingdetail
ALTER TABLE truckingdetail
	ADD COLUMN `phuthau1` bigint(20),
	ADD COLUMN `phuthau2` bigint(20);
	
ALTER TABLE truckingdetail ADD FOREIGN KEY (phuthau1) REFERENCES nhathau(id);
ALTER TABLE truckingdetail ADD FOREIGN KEY (phuthau2) REFERENCES nhathau(id);
-----------PackageInfo
ALTER TABLE packageinfo MODIFY COLUMN freeDemDate int;
ALTER TABLE packageinfo MODIFY COLUMN freeDetDate int;

-------------------Truckingdetail
ALTER TABLE `ael`.`truckingdetail` 
	ADD COLUMN `phuthu` decimal(20,2),
	ADD COLUMN `noContractUp` int,
	ADD COLUMN `noContractDown` int;
	
------------COnfig
INSERT INTO `ael`.`configuration`
	VALUES(288,'Chi ph� n�ng',19,'chi phi nang',1,null);
INSERT INTO `ael`.`configuration`
	VALUES(289,'Chi ph� h?',19,'chi phi ha',1,null);
	

-------------------Package info
ALTER TABLE `ael`.`packageinfo` 
ADD COLUMN `contNo` VARCHAR(100) NULL AFTER `bookingNo`;

INSERT INTO `ael`.`role` (`description`, `name`) VALUES ('Configuration', 'ROLE_CONFIG');
INSERT INTO `ael`.`nhathau` (`id`, `type`) VALUES ('-1', '1');

------------------- Realattachment
ALTER TABLE `ael`.`realattachment` 
ADD COLUMN `extension` VARCHAR(5) NULL DEFAULT 'pdf' AFTER `attachment`;

ALTER TABLE `ael`.`docsgeneral` 
ADD COLUMN `docsgeneralcol` VARCHAR(45) NULL AFTER `contactReceive`,
ADD COLUMN `sochuyen` INT(10) NULL AFTER `docsgeneralcol`,
ADD COLUMN `nameVehicle` VARCHAR(255) NULL AFTER `sochuyen`;

ALTER TABLE `ael`.`inland` 
DROP COLUMN `nameVehicle`;

ALTER TABLE `ael`.`packageinfo` 
DROP COLUMN `nameVehicle`;
----------------------------

ALTER TABLE `ael`.`docsgeneral` 
CHANGE COLUMN `sochuyen` `sochuyen` VARCHAR(45) NULL DEFAULT NULL ;

ALTER TABLE `ael`.`truckingdetail` 
CHANGE COLUMN `noOfVehicle` `noOfVehicle` VARCHAR(45) NULL DEFAULT NULL ;
ALTER TABLE `ael`.`truckingdetail` 
ADD COLUMN `accountingPrice` DECIMAL(20,2) NULL AFTER `noContractDown`,
ADD COLUMN `otherFees` DECIMAL(20,2) NULL AFTER `accountingPrice`;

ALTER TABLE `ael`.`inland` 
DROP COLUMN `otherFees`,
DROP COLUMN `accountingPrice`,
DROP INDEX `priceItemAcc_idx` ;

ALTER TABLE `ael`.`truckingdetail` 
ADD COLUMN `payForNhaThau` BIGINT(20) NULL AFTER `otherFees`;

ALTER TABLE `ael`.`truckingdetail` 
ADD INDEX `payforNhathau_idx` (`payForNhaThau` ASC);
ALTER TABLE `ael`.`truckingdetail` 
ADD CONSTRAINT `payforNhathau`
  FOREIGN KEY (`payForNhaThau`)
  REFERENCES `ael`.`nhathau` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `ael`.`truckingdetail` 
CHANGE COLUMN `noContractUp` `noContractUp` VARCHAR(45) NULL DEFAULT NULL ,
CHANGE COLUMN `noContractDown` `noContractDown` VARCHAR(45) NULL DEFAULT NULL ;

ALTER TABLE `ael`.`truckingdetail` 
DROP FOREIGN KEY `truckingdetail_ibfk_2`,
DROP FOREIGN KEY `truckingdetail_ibfk_1`;
ALTER TABLE `ael`.`truckingdetail` 
DROP COLUMN `phuthau2`,
DROP COLUMN `phuthau1`,
DROP INDEX `phuthau2` ,
DROP INDEX `phuthau1` ;
ALTER TABLE `ael`.`truckingdetail` 
DROP COLUMN `noContractDown`,
DROP COLUMN `noContractUp`;

ALTER TABLE `ael`.`nhathau` 
CHANGE COLUMN `taxNo` `taxNo` VARCHAR(45) NULL DEFAULT NULL ,
ADD COLUMN `info` VARCHAR(1000) NULL AFTER `code`;
-----PackageInfo
ALTER TABLE `ael`.`packageinfo`
	ADD COLUMN `dateRevOrgDoc` datetime ,
	ADD COLUMN `dateRevOrgTax` datetime ,
	ADD COLUMN `dateFinCustom` datetime ,
	ADD COLUMN `dateSend` datetime,
	ADD COLUMN `dateActualDev` datetime;

ALTER TABLE `ael`.`packageinfo`
	ADD COLUMN `dateStartECus` datetime;

INSERT INTO `ael`.`role` (`description`, `name`) VALUES ('Report Nhathau', 'ROLE_NHATHAU');

ALTER TABLE `ael`.`exfeetable`
	ADD COLUMN `refund` bigint(20);
	
ALTER TABLE `ael`.`exfeetable`
	ADD CONSTRAINT `toRefund`
	  FOREIGN KEY (`refund`)
	  REFERENCES `ael`.`refund` (`id`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION;

ALTER TABLE `ael`.`refund` 
ADD COLUMN `isPhieuThu` INT(1) NULL DEFAULT NULL AFTER `refNo`;

ALTER TABLE `ael`.`refund` 
ADD COLUMN `isAdmin` INT(1) NULL AFTER `isPhieuThu`;

ALTER TABLE `ael`.`docsgeneral` 
CHANGE COLUMN `cmb` `cmb` DECIMAL(15,3) NULL DEFAULT NULL ;

ALTER TABLE `ael`.`exhibition` 
CHANGE COLUMN `exName` `exName` BIGINT(10) NULL DEFAULT NULL ,
ADD INDEX `toExName_idx` (`exName` ASC);
ALTER TABLE `ael`.`exhibition` 
ADD CONSTRAINT `toExName`
  FOREIGN KEY (`exName`)
  REFERENCES `ael`.`configuration` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

----27052015
ALTER TABLE `ael`.`accountingcusdetail` 
ADD COLUMN `unitPrice` DECIMAL(20,2) NULL AFTER `quantityOt`;

----03062015
ALTER TABLE `ael`.`exfeetable` 
ADD COLUMN `exhUsd` DECIMAL(20,2) NULL AFTER `refund`;

----04042015
ALTER TABLE truckingdetail 
ADD COLUMN  placeGetCont VARCHAR(255) NULL,
ADD COLUMN placePutCont VARCHAR(255) NULL
----07062015
ALTER TABLE `ael`.`advanceform` 
ADD COLUMN `isAdmin` INT(1) NULL AFTER `payReason`;

update advanceform 
set isAdmin = 0
where id>0;

ALTER TABLE `ael`.`refund` 
ADD COLUMN `isRAdmin` INT(1) NULL AFTER `isAdmin`;
--------------------- 13062015

ALTER TABLE `ael`.`accountingcus` 
ADD UNIQUE INDEX `refNo_UNIQUE` (`refNo` ASC);

ALTER TABLE `ael`.`docsgeneral` 
ADD COLUMN `isCollectMoney` INT(1) DEFAULT 0;

CREATE TABLE `ael`.`transreportext` (
  `id` BIGINT(20) NOT NULL,
  `priceUnit` DECIMAL(20,2) NULL,
  `price` DECIMAL(20,2) NULL,
  `vat` DECIMAL(10,2) NULL,
  `vatValue` DECIMAL(20,2) NULL,
  `truckingDetail` BIGINT(20) NULL,
  PRIMARY KEY (`id`),
  INDEX `reportToTruckDetail_idx` (`truckingDetail` ASC),
  CONSTRAINT `reportToTruckDetail`
    FOREIGN KEY (`truckingDetail`)
    REFERENCES `ael`.`truckingdetail` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `ael`.`transreportext` 
CHANGE COLUMN `id` `id` BIGINT(20) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `ael`.`transreportext` 
ADD COLUMN `note` VARCHAR(250) NULL AFTER `truckingDetail`;

--------------------- 18062015
ALTER TABLE `ael`.`refunddetail` 
ADD COLUMN `approved` INT(1) NULL AFTER `oAmount`,
ADD COLUMN `checkByAdmin` INT(1) NULL AFTER `approved`;

ALTER TABLE `ael`.`accountingcusdetail` 
ADD COLUMN `vatAmountexfeetable` DECIMAL(20,2) NULL AFTER `unitPrice`;

ALTER TABLE `ael`.`exfeetable` 
ADD COLUMN `vatAmount` DECIMAL(20,2) NULL AFTER `exhUsd`;


-------- 2606
ALTER TABLE `ael`.`truckingservice` 
DROP FOREIGN KEY `truckingdocs`;
ALTER TABLE `ael`.`truckingservice` 
CHANGE COLUMN `docsgeneral` `docsgeneral` BIGINT(20) NOT NULL ,
ADD UNIQUE INDEX `docsgeneral_UNIQUE` (`docsgeneral` ASC);
ALTER TABLE `ael`.`truckingservice` 
ADD CONSTRAINT `truckingdocs`
  FOREIGN KEY (`docsgeneral`)
  REFERENCES `ael`.`docsgeneral` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `ael`.`nhathau` 
CHANGE COLUMN `code` `code` VARCHAR(45) NOT NULL ;

UPDATE truckingdetail
SET dateDev=DATE_FORMAT(dateDev,'2015-%m-%d') where id>0;

ALTER TABLE `ael`.`transreportext` 
ADD COLUMN `otherFee` DECIMAL(20,2) NULL AFTER `note`;



--------- 2806
ALTER TABLE `ael`.`exfeetable` 
DROP FOREIGN KEY `nameOfFee`,
DROP FOREIGN KEY `toMasterFee`;
ALTER TABLE `ael`.`exfeetable` 
CHANGE COLUMN `name` `name` BIGINT(20) NOT NULL ,
CHANGE COLUMN `masterFee` `masterFee` BIGINT(20) NOT NULL ;
ALTER TABLE `ael`.`exfeetable` 
ADD CONSTRAINT `nameOfFee`
  FOREIGN KEY (`name`)
  REFERENCES `ael`.`configuration` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `toMasterFee`
  FOREIGN KEY (`masterFee`)
  REFERENCES `ael`.`configuration` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

delete from exfeetable where name is null and masterFee is null and total is null;

select * from exfeetable where name is null and masterFee is null and total is null;

ALTER TABLE `ael`.`advancedetail` 
ADD COLUMN `approved` INT(1) NULL AFTER `goodDes`,
ADD COLUMN `checkByAdmin` INT(1) NULL AFTER `approved`;

ALTER TABLE `ael`.`nhathau` 
CHANGE COLUMN `address` `address` VARCHAR(500) NULL DEFAULT NULL ;

---- 0307
DELETE FROM ael.truckingdetail where trucking is null;
ALTER TABLE `ael`.`truckingdetail` 
DROP FOREIGN KEY `toTruckingFD`;
ALTER TABLE `ael`.`truckingdetail` 
CHANGE COLUMN `trucking` `trucking` BIGINT(20) NOT NULL ;
ALTER TABLE `ael`.`truckingdetail` 
ADD CONSTRAINT `toTruckingFD`
  FOREIGN KEY (`trucking`)
  REFERENCES `ael`.`truckingservice` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;
