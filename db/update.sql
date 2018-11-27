ALTER TABLE `users` CHANGE `userId` `userId` BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `users` ADD `ENCRYTED_PASSWORD` VARCHAR(128) NOT NULL AFTER `password`;
ALTER TABLE `users` ADD `ENABLED` BIT(1) NOT NULL AFTER `ENCRYTED_PASSWORD`;

-- Create table
create table ROLES
(
  ROLE_ID   BIGINT not null,
  ROLE_NAME VARCHAR(30) not null
) ;
--  
alter table ROLES
  add constraint ROLES_PK primary key (ROLE_ID);
 
alter table ROLES
  add constraint ROLES_UK unique (ROLE_NAME);


 -- Create table
create table USER_ROLE
(
  ID      BIGINT not null,
  USER_ID BIGINT not null,
  ROLE_ID BIGINT not null
);
--  
alter table USER_ROLE
  add constraint USER_ROLE_PK primary key (ID);
 
alter table USER_ROLE
  add constraint USER_ROLE_UK unique (USER_ID, ROLE_ID);


INSERT INTO `users` (`userId`, `userName`, `email`, `password`, `ENCRYTED_PASSWORD`, `ENABLED`) VALUES (NULL, 'liempt', 'ptliem91@gmail.com', '12345', '$2a$10$L2JosoBYgoAkuvscp5WSCuLGReaEyFnNMGgQWlj0HidjuPwkifbi2', b'1');

insert into roles (ROLE_ID, ROLE_NAME)
values (1, 'ROLE_ADMIN');
 
insert into roles (ROLE_ID, ROLE_NAME)
values (2, 'ROLE_USER');

insert into user_role (ID, USER_ID, ROLE_ID)
values (1, 1, 1);
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (2, 1, 2);
 
insert into user_role (ID, USER_ID, ROLE_ID)
values (3, 2, 2);
