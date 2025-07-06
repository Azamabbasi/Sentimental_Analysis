USE proj


CREATE TABLE `twitter_data_2` (
   `Tweet_Date` datetime DEFAULT NULL,
   `Tweet_ID` bigint DEFAULT NULL,
   `Tweet_Text` mediumtext,
   `User_ID` bigint DEFAULT NULL,
   `followers` int(11) DEFAULT NULL,
   `friends` int(11) DEFAULT NULL,
   `fav` int(11) DEFAULT NULL,
   `stats` int(11) DEFAULT NULL,
   `created` varchar(45) DEFAULT NULL,
   `Retweet_ID` bigint DEFAULT NULL,
   `Pos_Sent` int(11) DEFAULT NULL,
  `Neg_Sent` int(11) DEFAULT NULL,
  `Avg_Sent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#SET SQL_SAFE_UPDATES = 0;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Group_(14).txt' IGNORE
INTO TABLE twitter_data_2
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n' 
(@var1, Tweet_ID, Tweet_Text, User_ID, followers, friends, fav, stats, created, Retweet_ID, Pos_Sent, Neg_Sent)
SET Tweet_Date = STR_TO_DATE(@var1, '%Y-%m-%d %H:%i:%s')


SELECT Tweet_Date, Tweet_ID, Tweet_Text, User_ID, followers, friends, fav, stats, created, Retweet_ID, Pos_Sent, Neg_Sent , (Pos_Sent + Neg_Sent) / (2) AS Average
FROM twitter_data
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Projfile.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/Projfile.csv' IGNORE
INTO TABLE twitter_data_2
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n' 
(@var1, Tweet_ID, Tweet_Text, User_ID, followers, friends, fav, stats, created, Retweet_ID, Pos_Sent, Neg_Sent, Avg_Sent)
SET Tweet_Date = STR_TO_DATE(@var1, '%Y-%m-%d %H:%i:%s')

Select * from twitter_data_2

SELECT * FROM twitter_data_2 WHERE Tweet_Text LIKE '%Police%' OR Tweet_Text LIKE '%FBI%'
Select *,(Pos_Sent + Neg_Sent)/(2) AS Avg_Sent FROM twitter_data_2
SELECT AVG(Avg_Sent) FROM twitter_data_2 WHERE Tweet_Text LIKE '%Trump%' 
SELECT AVG(Avg_Sent) FROM twitter_data_2 WHERE Tweet_Text LIKE '%HILLARY%' 
SELECT * FROM twitter_data_2




