-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema reviews
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `reviews` ;

-- -----------------------------------------------------
-- Schema reviews
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reviews` DEFAULT CHARACTER SET utf8 ;
USE `reviews`;

-- -----------------------------------------------------
-- Table `company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company` ;

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `company_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `company_location` ;

CREATE TABLE IF NOT EXISTS `company_location` (
  `company_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  
  CONSTRAINT `cl_company_id` FOREIGN KEY (company_id) REFERENCES company (company_id),
  CONSTRAINT `cl_location_id` FOREIGN KEY (location_id) REFERENCES location (location_id)
);
  

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `location_id` INT NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `sate` VARCHAR(50) NULL,
  `country` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`location_id`));


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review`;

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` INT PRIMARY KEY AUTO_INCREMENT,
  `review_text` VARCHAR(2000) NULL,
  `rating` INT NOT NULL,
  `return_offer` BOOLEAN NULL,
  `would_work_again` BOOLEAN NULL,
  `user_id` INT,
  `company_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `num_interviews` INT,
  `position` varchar(50) NOT NULL,
  
  CONSTRAINT `r_user_id` FOREIGN KEY (user_id) REFERENCES user (user_id),
  CONSTRAINT `r_company_id` FOREIGN KEY (company_id) REFERENCES company (company_id),
  CONSTRAINT `r_location_id` FOREIGN KEY (location_id) REFERENCES location (location_id));

-- -----------------------------------------------------
-- Table `major`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `major` ;

CREATE TABLE IF NOT EXISTS `major` (
  `major_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`major_id`));

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(50) NOT NULL UNIQUE,
  `firstname` VARCHAR(50),
  `lastname` VARCHAR(50),
  `year` INT,
  `email` VARCHAR(50),
  `num_coops` INT NOT NULL,
  `major_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),

  CONSTRAINT `u_major_id` FOREIGN KEY (major_id) REFERENCES major (major_id));
  
  
  
-- -----------------------------------------------------
-- Sample data inserts
-- -----------------------------------------------------  
-- company
insert into company values
(1, 'Telefonica'),
(2, 'Boston Consulting Group'),
(3, 'Gems Sensors'),
(4, 'Momenta Pharmaceuticals'),
(5, 'Massachusetts General Hospital'),
(6, 'Brigham and Womens Hospital'),
(7, 'Boston Consulting Group'),
(8, 'Boston Childrens Hospital'),
(9, 'New England Baptist Hospital'),
(10, 'Microsoft'),
(11, 'Doble Engineering'),
(12, 'Harvard Medical School'),
(13, 'Runkeeper'),
(14, 'Intuit'),
(15, 'SourceOne'),
(16, 'Orig3n'),
(17, 'Apple'),
(18, 'Amazon'),
(19, 'Datadog'),
(20, 'Google'),
(21, 'Facebook');

-- location
insert into location values
(1, 'Madrid', 'Madrid', 'Spain'),
(2, 'Boston', 'Massachusetts', 'United States'),
(3, 'Plainville', 'Connecticut', 'United States'),
(4, 'Cambridge', 'Massachusetts', 'United States'),
(5, 'Waltham', 'Massachusetts', 'United States'),
(6, 'Redmond', 'Washington', 'United States'),
(7, 'Watertown', 'Massachusetts', 'United States'),
(8, 'San Diego', 'California', 'United States'),
(9, 'Mountain View', 'California', 'United States'),
(10, 'San Francisco', 'California', 'United States'),
(11, 'New York City', 'New York', 'United States'),
(12, 'Seattle', 'Washington', 'United States'),
(13, 'Austin', 'Texas', 'United States'),
(14, 'Los Angeles', 'California', 'United States');

-- position
-- insert into position values
-- (1, 'Web Developer Co-op'),
-- (2, 'Marketing Co-op'),
-- (3, 'Treasury Analyst Co-op'),
-- (4, 'Manufacturing Engineering Co-op'),
-- (5, 'Analytical Development Co-op'),
-- (6, 'Pharmacy Intern'),
-- (7, 'OR Pharmacy Technician Co-op'),
-- (8, 'Global Social Media Co-op'),
-- (9, 'Clinical Assistant Co-op'),
-- (10, 'Explore Program Internship'),
-- (11, 'Software Engineer Co-op'),
-- (12, 'Research Assistant Co-op'),
-- (13, 'Business Analyst Co-op'),
-- (14, 'Web Developer Co-op'),
-- (15, 'Web Developer Co-op'),
-- (16, 'Web Developer Co-op');

-- major
insert into major values
(1, 'Behavioral Neuroscience'),
(2, 'Business'),
(3, 'Computer Science'),
(4, 'Combined Computer Science and Biology'),
(5, 'Combined Computer Science and Design'),
(6, 'Mechanical Engineering'),
(7, 'Electrical Engineering'),
(8, 'Pharmacy'),
(9, 'Unknown');

-- company_location
insert into company_location values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 6),
(11, 7),
(12, 2),
(7, 2),
(13, 2),
(14, 8),
(14, 9),
(15, 2),
(16, 2);

-- user
-- CREATE TABLE IF NOT EXISTS `user` (
--   `user_id` INT NOT NULL,
--   `username` VARCHAR(50) NOT NULL UNIQUE,
--   `firstname` VARCHAR(50),
--   `lastname` VARCHAR(50),
--   `year` INT NULL,
--   `email` VARCHAR(50),
--   `num_coops` INT NOT NULL,
--   `major_id` INT NOT NULL,
--   PRIMARY KEY (`user_id`),

--   CONSTRAINT `u_major_id` FOREIGN KEY (major_id) REFERENCES major (major_id));

insert into user values
(1, 'hurtadodelacuesta.i', 'Isabel', 'Hurtado', 5, 'hurtadodelacuesta.i@husky.neu.edu', 1, 9),
(2, 'WoodyTanglaocharoen', 'Woody', 'Tanglaocharoen', 4, null, 1, 9),
(3, 'landekar.p', 'Prathamesh', 'Landekar', null, 'landekar.p@husky.neu.edu', 1, 9),
(4, 'anonymous1', 'anon', 'anon', 5, null, 1, 9),
(5, 'eibye.e', 'Emma', 'Eibye', 3, 'eibye.e@gmail.com', 1, 9),
(6, 'ou.e', 'Emily', null, 3, 'ou.e@husky.neu.edu', 1, 9),
(7, 'anonymous2', 'anon', 'anon', 4, null, 1, 9),
(8, 'gee.mi', 'Michaela', 'Gee', 5, 'gee.mi@husky.neu.edu', 1, 9),
(9, 'anonymous3', null, null, 4, null, 1, 9),
(10, 'isabelbolger', 'Isabel', 'Bolger', 2, 'isabelbolger@hotmail.com', 3, 3),
(11, 'alexander.jas', 'Jason', 'Alexander', 3, 'alexander.jas@husky.neu.edu', 2, 3),
(12, 'yusuf.h', 'Tobi', 'Yusuf', 4, 'yusuf.h@husky.neu.edu', 1, 1),
(13, 'wu.fa', 'Fang', 'Wu', 3, 'wu.fa@husky.neu.edu', 1, 3),
(14, 'lucascalero', 'Lucas', null, 3, 'lucascalero@gmail.com', 1, 3),
(15, 'criley', 'Colin', 'Riley', 3, 'riley.colin5@husky.neu.edu', 1, 3),
(16, 'rajagopalan.rag', 'Raghavprasanna', 'Rajagopalan', 4, 'rajagopalan.rag@husky.neu.edu', 3, 4),
(17, 'gift.e', 'Eric', 'Gift', 5, 'gift.e@husky.neu.edu', 4, 3),
(18, 'amy', 'Amy', null, 3, null, 2, 5);


-- review
-- CREATE TABLE IF NOT EXISTS `review` (
--   `review_id` INT PRIMARY KEY AUTO_INCREMENT,
--   `review_text` VARCHAR(2000) NULL,
--   `rating` INT NOT NULL,
--   `return_offer` BOOLEAN NULL,
--   `user_id` INT NOT NULL,
--   `company_id` INT NOT NULL,
--   `location_id` INT NOT NULL,
--   `num_interviews` INT NOT NULL,
--   `position` varchar(50) NOT NULL,
--   
--   CONSTRAINT `r_user_id` FOREIGN KEY (user_id) REFERENCES user (user_id),
--   CONSTRAINT `r_company_id` FOREIGN KEY (company_id) REFERENCES company (company_id),
--   CONSTRAINT `r_location_id` FOREIGN KEY (location_id) REFERENCES location (location_id));
-- insert into review values
-- (1, 'test anon', 8, false, true, null, 1, 1, 1, 'Marketing Co-op'); add null for anon users

insert into review values
(1, 'It was a good experience', 8, false, true, 1, 1, 1, 1, 'Marketing Co-op'),
(2, null, 8, false, false, 2, 2, 2, 1, 'Treasury Analyst Co-op'),
(3, null, 9, false, true, 3, 3, 3, 2, 'Manufacturing Engineering Co-op'),
(4, null, 10, false, true, 4, 4, 4, 1, 'Analytical Development Co-op'),
(5, 'I loved working in the outpatient pharmacy. It was a great working environment that nurtured learning and was accepting of all types of people.', 10, true, true, 5, 5, 5, 1, 'Pharmacy Intern'),
(6, 'Great educational experience with a stressful but fun environment', 7, true, true, 6, 6, 2, 1, 'OR Pharmacy Technician Co-op'),
(7, 'My team was amazing and I got to create and promote a ton of content.', 10, true, true, 7, 7, 2, 1, 'Global Social Media Co-op'),
(8, 'As a nursing major, I learned so much about patient care and the workings of illness in the human body. I learned how to interact with children as patients, as well as parents at the bedside. I feel like I have gained so much knowledge, as well as how to adapt to 12 hour shifts. The nurses I work with are fantastic, supportive, and always willing to help and teach.', 9, true, true, 8, 8, 2, 1, 'Clinical Assistant Co-op'),
(9, null, 6, true, false, 9, 9, 2, 1, 'Clinical Assistant Co-op'),
(10, 'It was a fantastic experience, and my mentors were great. I learned a lot about being a Program Manager and Software Engineer. ', 10, true, true, 10, 10, 6, 1, 'Explore Program Internship'),
(11, 'They did not care a lot about what I did. But, they did ramp me up pretty well and I was able to learn a wide range of things from AngularJS to prototyping an app. Overall, I learned a lot about coding in a professional environment, but would want a co-op that cares more making me a part of the team.', 6, true, false, 11, 11, 7, 1, 'Software Engineer Co-op'),
(12, 'The description of the Co-op fit the actual duties that I had to do. The experience was fine but it is not something that I felt passionate about. I also did not really have a good relationship with the advisor, I did with other people there.', 6, false, false, 12, 12, 2, 1, 'Research Assistant Co-op'),
(13, 'Overall great experience with a really smart and helpful team', 10, true, true, 13, 1, 2, 1, 'Business Analyst Co-op'),
(14, 'Amazing Experience! I was able to work with all the teams in the fitness division and I was taught so much during the weekly tech talks. ', 10, true, true, 14, 13, 2, 3, 'QA Mobile Engineer Co-op'),
(15, 'I absolutely loved my co-op experience at Intuit. The company has a strong co-op program, so I had a lot of support making sure that I was having the best experience possible. My managers were very good as they ensured I was always challenged and was always learning. I started the co-op not knowing that much and fearful of making a mistake, but my managers and my team helped me learn by giving me small tasks and then giving me larger, more complex ones as I learned more. I got the opportunity to do frontend dev, backend dev, QA, dev ops, and work with databases. Pretty much everything I know now as I software engineer I learned from that co-op. I highly recommend it!', 10, true, true, 15, 14, 8, 2, 'Software Engineer Co-op'),
(16, 'I had a great time there - I learned a lot from my team, and the project I was working on felt very startup-y. Learned a lot, and felt like a full time member of the team. Also being in the Bay Area was nice!', 9, true, true, 16, 14, 9, 3, 'Software Engineer Co-op'),
(17, 'Cool website to work on, but the management had leadership issues and the code was quite messy.  I enjoyed the people I worked with but the headaches from the other issues gave me an overall negative experience.', 3, true, false, 17, 15, 2, null, 'Web Developer Co-op'),
(18, 'Avoid like the plague', 3, false, false, 18, 16, 2, 3, 'Web Developer Co-op');

select c.name as company, avg(r.rating) as avg_rating 
from review as r
join company as c using (company_id)
group by c.company_id
having avg_rating > 7
order by avg_rating desc;

select c.name as company, avg(r.rating) as avg_rating, r.review_text as review
from review as r
join company as c using (company_id)
group by c.company_id
having avg_rating < 4
order by avg_rating desc;

select * from company;






