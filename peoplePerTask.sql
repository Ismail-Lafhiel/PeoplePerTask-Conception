CREATE TABLE IF NOT EXISTS USERS (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(250) not null,
    email varchar(250) UNIQUE not null,
    password varchar(250) not null,
    other text
);
--@block
insert into USERS (name, email, password, other)
values (
        "ismail",
        "ismail@email.com",
        "cuwuwefwfw",
        "buew uwbfuw uwvfbuw ufwbuf"
    ),
    (
        "jefferson",
        "jefferson.zubair@forkshape.com",
        "cuwuwefwfw",
        "buew uwbfuw uwvfbuw ufwbuf"
    ),
    (
        "ckears2",
        "ckears2@wp.com",
        "cuwuwefwfw",
        "buew uwbfuw uwvfbuw ufwbuf"
    ),
    (
        "ygimenezq",
        "ygimenezq@constantcontact.com",
        "cuwuwefwfw",
        "buew uwbfuw uwvfbuw ufwbuf"
    ),
    (
        "dd3477snx",
        "dd3477snx@contact.com",
        "cuwuwefwfw",
        "buew uwbfuw uwvfbuw ufwbuf"
    )
--@block
select *
from USERS
 --@block
    CREATE TABLE IF NOT EXISTS Categories (
        id int primary key AUTO_INCREMENT,
        name varchar(250) not null
    )
--@block
insert INTO categories (name)
values ("Web developement"),
    ("AI"),
    ("Design"),
    ("Mobile developement"),
    ("Block Chain developement"),
    
--@block
select *
from Categories --@block
    CREATE TABLE if NOT EXISTs Sub_categories (
        id int primary key AUTO_INCREMENT,
        name varchar(250) not null,
        category_id int,
        FOREIGN KEY (category_id) REFERENCES Categories(id)
    )
    
    
--@block
insert INTO Sub_categories (name, category_id)
values ("HTML", 1),
    ("CSS", 2),
    ("JS", 3),
    ("SQL", 4),
    ("PHP", 5) 
    
--@block 
select *
from Sub_categories
    inner join Categories on Sub_categories.category_id = Categories.id;
--@block
    Create Table if not EXISTS   (
        id int primary key AUTO_INCREMENT,
        title varchar(250),
        description text,
        category_id int,
        subCategory_id int,
        user_id int,
        FOREIGN key (category_id) REFERENCES Categories(id),
        FOREIGN key (subCategory_id) REFERENCES Sub_categories(id),
        FOREIGN key (user_id) REFERENCES USERS(id)
    ) 
--@block
select * from Projects as p inner join Sub_categories as sub_c
on p.subCategory_id = sub_c.id inner join Categories as c
on p.category_id = c.id inner join Users as u
on p.user_id = u.id
--@block
insert into Projects (title, description, category_id, subCategory_id, user_id)
values 
(
        "Art site",
        "We use ads to keep our content free for you.
Please allow ads and let sponsors fund your surfing.
Thank you!",
        1,
        2,
        3
    ),
(
        "Facebook",
        "We use ads to keep our content free for you.
Please allow ads and let sponsors fund your surfing.
Thank you!",
        2,
        3,
        4
    ),
(
        "Microsoft.org",
        "We use ads to keep our content free for you.
Please allow ads and let sponsors fund your surfing.
Thank you!",
        3,
        1,
        2
    ),
(
        "SwiftFix",
        "We use ads to keep our content free for you.
Please allow ads and let sponsors fund your surfing.
Thank you!",
        4,
        4,
        1
    ),
(
        "PeoplePerTask",
        "We use ads to keep our content free for you.
Please allow ads and let sponsors fund your surfing.
Thank you!",
        5,
        5,
        5
    )

--@block 
create table if not EXISTS Freelancers
(
    id int primary key AUTO_INCREMENT,
    name varchar(250),
    Competences varchar(250),
    user_id int, 
    FOREIGN key (user_id) REFERENCES Users(id)
)
--@block
Insert into Freelancers (name, Competences, user_id) values
("Ismail Ahmad Kanabawi", "UI/UX Designer and Front-end Developer", 1),
("Mussab Kashmiri", "Back-end Developer", 2),
("Ghoufrane Taamari", "Project Manager", 3),
("Mussab Kashmiri", "Block Chain Developer", 4)
--@block 
select * from freelancers INNER JOIN users
on freelancers.user_id = users.id
--@block
create table if not EXISTS Offres
(
    id int primary key AUTO_INCREMENT,
    montant float,
    delay date,
    freelancer_id int,
    project_id int,
    FOREIGN key (freelancer_id) REFERENCES Freelancers(id),
    FOREIGN key (project_id) REFERENCES Projects(id)

)

--@block
Insert into Offres (montant, delay, freelancer_id, project_id) values

(3000, TIMESTAMP('2023-05-08 14:30:45'), 1, 1),
(13000, TIMESTAMP('2023-010-08 14:30:45'), 2, 2),
(1200, TIMESTAMP('2023-08-10 14:30:45'), 3, 3),
(4000, TIMESTAMP('2023-02-12 14:30:45'), 4, 4),
(13000, TIMESTAMP('2024-05-10 14:30:45'), 5, 5)

--@block 
select * from Offres INNER JOIN freelancers
on Offres.freelancer_id = freelancers.id INNER JOIN Projects
on Offres.project_id = Projects.id;

-- update record
--@block
update offres SET montant = 13570
WHERE id = 1

--delete record
--@block
delete from offres WHERE id = 2