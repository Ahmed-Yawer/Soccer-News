-- Ahmed Yawer 
--If the script gives any errors check that the tables don't already exist in your database.
-- 

-- 1 referee table
CREATE TABLE  referee (
r_id NUMBER(10) NOT  NULL ,
fname NVARCHAR2(20) NULL,
lname NVARCHAR2(20) NULL,
country NVARCHAR2(20) NULL,
dof date NULL,
date_start date NULL,
PRIMARY KEY(r_id)
);

-- 2 league Organization table
CREATE TABLE  Leagueorg (
lo_id NUMBER(10) NOT  NULL ,
name NVARCHAR2(20) NULL,
date_founded date NULL,
descrption NVARCHAR2(200) NULL,
PRIMARY KEY(lo_id)
);

-- 3 news table
CREATE TABLE  news (
n_id NUMBER(10) NOT  NULL ,
title NVARCHAR2(20) NULL,
artical_date date NULL,
body NVARCHAR2(300) NULL,
PRIMARY KEY(n_id)
);


-- 4  Stadium table
CREATE TABLE  stadiumz (
s_id NUMBER(10) NOT  NULL ,
name NVARCHAR2(20) NULL,
city NVARCHAR2(20) NULL,
year NUMBER(4) NULL,
seat_num NUMBER(10) NULL,
field_size NUMBER(10) NULL,
PRIMARY KEY(s_id)
);


-- 5 player table
CREATE TABLE  player (
p_id NUMBER(10) NOT  NULL ,
fname NVARCHAR2(20) NULL,
lname NVARCHAR2(20) NULL,
dof date NULL,
position NVARCHAR2(20) NULL,
player_num NUMBER(2) NULL,
foot NVARCHAR2(20) NULL,
PRIMARY KEY(p_id)
);



-- 6 team table
CREATE TABLE  team (
t_id NUMBER(10) NOT  NULL ,
name NVARCHAR2(20) NULL,
type NVARCHAR2(20) NULL,
country NVARCHAR2(20) NULL,
establish_date date NULL,
website NVARCHAR2(20) NULL,
stadium_id NUMBER(10) NOT NULL ,
PRIMARY KEY(t_id),
FOREIGN KEY(stadium_id)
REFERENCES stadiumz (s_id)
);


-- 7 league table
CREATE TABLE  league (
l_id NUMBER(10) NOT  NULL ,
name NVARCHAR2(20) NULL,
region NVARCHAR2(20) NULL,
l_level NVARCHAR2(20) NULL,
leagueorg_id NUMBER(10) NOT NULL ,
PRIMARY KEY(l_id),
FOREIGN KEY(leagueorg_id )
REFERENCES leagueorg (lo_id)
);


-- 8 match table
CREATE TABLE  match (
m_id NUMBER(10) NOT  NULL ,
match_date date NULL,
stage NVARCHAR2(20) NULL,
home_away NVARCHAR2(20) NULL,
stadium_id NUMBER(10) NOT NULL ,
referee_id NUMBER(10) NOT  NULL ,
league_id NUMBER(10)  NULL ,
PRIMARY KEY(m_id),
FOREIGN KEY(stadium_id)
REFERENCES stadiumz (s_id),
FOREIGN KEY(referee_id )
REFERENCES referee(r_id),
FOREIGN KEY(league_id  )
REFERENCES league (l_id)
);



-------------------------------------------------
-- the junction tables:-

-- 1 team-player junction table
CREATE TABLE  tp (
team_id NUMBER(10) NOT NULL ,
player_id NUMBER(10) NOT NULL ,
PRIMARY KEY(team_id ,player_id ),
FOREIGN KEY(team_id )
REFERENCES team (t_id),
FOREIGN KEY(player_id )
REFERENCES player (p_id)
);


-- 2 team-league junction table
CREATE TABLE  tl(
team_id NUMBER(10) NOT NULL ,
league_id NUMBER(10) NOT NULL ,
PRIMARY KEY(team_id ,league_id ),
FOREIGN KEY(team_id )
REFERENCES team (t_id),
FOREIGN KEY(league_id)
REFERENCES league (l_id)
);


-- 3 team-match junction table
CREATE TABLE  tm(
team_id NUMBER(10) NOT NULL ,
match_id NUMBER(10) NOT NULL ,
PRIMARY KEY(team_id , match_id ),
FOREIGN KEY(team_id )
REFERENCES team (t_id),
FOREIGN KEY(match_id )
REFERENCES match (m_id)
);


-- 4 team-news junction table
CREATE TABLE  tn(
team_id NUMBER(10) NOT NULL ,
news_id NUMBER(10) NOT NULL ,
PRIMARY KEY(team_id , news_id ),
FOREIGN KEY(team_id )
REFERENCES team (t_id),
FOREIGN KEY(news_id )
REFERENCES news (n_id)
);


-- 5 player-news junction table
CREATE TABLE  pn(
player_id NUMBER(10) NOT NULL ,
news_id NUMBER(10) NOT NULL ,
PRIMARY KEY(player_id  , news_id ),
FOREIGN KEY( player_id  )
REFERENCES player (p_id),
FOREIGN KEY(news_id )
REFERENCES news (n_id)
);


-- 6 match-news junction table
CREATE TABLE  mn(
match_id NUMBER(10) NOT NULL ,
news_id NUMBER(10) NOT NULL ,
PRIMARY KEY(match_id    , news_id ),
FOREIGN KEY( match_id )
REFERENCES match (m_id),
FOREIGN KEY(news_id )
REFERENCES news (n_id)
);





INSERT INTO referee  VALUES ( 1,'John1', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 2,'John2', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee VALUES ( 3,'John3', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 4,'John4', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 5,'John5', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 6,'Johnr6', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 7,'John7', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 8,'John8', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 9,'John9', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');
INSERT INTO referee  VALUES ( 10,'John10', 'Smith', 'ireland', '15/nov/1987', '15/nov/1999');



INSERT INTO Leagueorg VALUES ( 1, 'uefa' , '15/nov/1987' ,  'the UEFA head org' );
INSERT INTO Leagueorg VALUES ( 2, 'eeee' , '15/nov/1987' ,  'the eeee head org' );
INSERT INTO Leagueorg VALUES ( 3, 'rfs' , '15/nov/1987' ,  'the rfs head org' );
INSERT INTO Leagueorg VALUES ( 4, 'gssf' , '15/nov/1987' ,  'the gssf head org' );
INSERT INTO Leagueorg VALUES ( 5, 'sdfs' , '15/nov/1987' ,  'the sdfs head org' );
INSERT INTO Leagueorg VALUES ( 6, 'rrt' , '15/nov/1987' ,  'the rrt head org' );
INSERT INTO Leagueorg VALUES ( 7, 'yyhj' , '15/nov/1987' ,  'the yyhj head org' );
INSERT INTO Leagueorg VALUES ( 8, 'ddrf' , '15/nov/1987' ,  'the ddrf head org' );
INSERT INTO Leagueorg VALUES ( 9, 'dfg' , '15/nov/1987' ,  'the dfg head org' );
INSERT INTO Leagueorg VALUES ( 10, 'adf' , '15/nov/1987' ,  'the adf head org' );


INSERT INTO news VALUES ( 1, 'the final mtach 1' , '15/nov/1987' ,  'title 1 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 2, 'the final mtach 2' , '15/nov/1987' ,  'title 2  the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 3, 'the final mtach 3' , '15/nov/1987' ,  'title 3 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 4, 'the final mtach 4' , '15/nov/1987' ,  'title 4 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 5, 'the final mtach 5' , '15/nov/1987' ,  'title  5 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 6, 'the final mtach 6' , '15/nov/1987' ,  'title  6 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 7, 'the final mtach 7' , '15/nov/1987' ,  'title  7 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 8, 'the final mtach 8' , '15/nov/1987' ,  'title  8 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 9, 'the final mtach 9' , '15/nov/1987' ,  'title  9 the match will be  ....... enjoy the game ' );
INSERT INTO news VALUES ( 10, 'the final mtach 10' , '15/nov/1987' ,  'title  10 the match will be  ....... enjoy the game ' );



INSERT INTO stadiumz VALUES ( 1, 'the red field' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 2, ' teh blue field ' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 3, ' the castle ' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 4, 'the fire ' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 5, 'the night sky' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 6, 'the moon ' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 7, 'the earth' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 8, 'the revir' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 9, 'the black stadium' , ' Dublin' , 1965 , 60000, 105 );
INSERT INTO stadiumz VALUES ( 10, 'the big stadium' , ' Dublin' , 1965 , 60000, 105 );



INSERT INTO player VALUES ( 1, 'mick1' , 'james' , '15/nov/1987' , 'defender' , 4 , 'left'  );
INSERT INTO player VALUES ( 2, 'mick2' , 'james' , '15/nov/1987' , 'defender' , 2 , 'left'  );
INSERT INTO player VALUES ( 3, 'mick3' , 'james' , '15/nov/1987' , 'defender' , 3 , 'left'  );
INSERT INTO player VALUES ( 4, 'mick4' , 'james' , '15/nov/1987' , 'defender' , 5 , 'left'  );
INSERT INTO player VALUES ( 5, 'mick5' , 'james' , '15/nov/1987' , 'defender' , 7 , 'left'  );
INSERT INTO player VALUES ( 6, 'mick6' , 'james' , '15/nov/1987' , 'defender' , 8 , 'left'  );
INSERT INTO player VALUES ( 7, 'mick7' , 'james' , '15/nov/1987' , 'defender' , 9 , 'left'  );
INSERT INTO player VALUES ( 8, 'mick8' , 'james' , '15/nov/1987' , 'defender' , 4 , 'left'  );
INSERT INTO player VALUES ( 9, 'mick9' , 'james' , '15/nov/1987' , 'defender' , 15 , 'left'  );
INSERT INTO player VALUES ( 10, 'mick10' , 'james' , '15/nov/1987' , 'defender' , 17 , 'left'  );
INSERT INTO player VALUES ( 11, 'heny11' , 'james' , '15/nov/1987' , 'defender' , 19, 'left'  );



INSERT INTO team VALUES ( 1, 'Real Madrid' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 1  );
INSERT INTO team VALUES ( 2, 'purtogal' , 'national team' , 'purtogal' , '15/nov/1902', 'www.purtogalteam.com' , 2  );
INSERT INTO team VALUES ( 3, 'Real bities' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 3  );
INSERT INTO team VALUES ( 4, 'Real malaca', 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 4  );
INSERT INTO team VALUES ( 5, 'man uni' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 5  );
INSERT INTO team VALUES ( 6, 'juve' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 6  );
INSERT INTO team VALUES ( 7, 'arse' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 7  );
INSERT INTO team VALUES ( 8, 'valanc' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 8  );
INSERT INTO team VALUES ( 9, 'liver pool' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 9  );
INSERT INTO team VALUES ( 10, 'psg' , 'club' , 'Spain' , '15/nov/1902', 'www.realmadrid.com' , 10  );



INSERT INTO league VALUES ( 1, 'spain clubs' , 'Spain' , 'first'  , 1  );
INSERT INTO league VALUES ( 2, 'spain local' , 'Spain' , 'first'  , 1  );
INSERT INTO league VALUES ( 3, 'teenage clubs' , 'Spain' , 'first'  , 2  );
INSERT INTO league VALUES ( 4, 'spain clubs4' , 'Spain' , 'first'  , 3  );
INSERT INTO league VALUES ( 5, 'spain clubs5' , 'Spain' , 'first'  , 4  );
INSERT INTO league VALUES ( 6, 'spain clubs6' , 'Spain' , 'first'  , 5 );
INSERT INTO league VALUES ( 7, 'spain clubs7' , 'Spain' , 'first'  , 6  );
INSERT INTO league VALUES ( 8, 'spain clubs8' , 'Spain' , 'first'  , 7  );
INSERT INTO league VALUES ( 9, 'spain clubs9' , 'Spain' , 'first'  , 8  );
INSERT INTO league VALUES ( 10, 'spain clubs10' , 'Spain' , 'first'  , 9  );
INSERT INTO league VALUES ( 11, 'spain clubs11' , 'Spain' , 'first'  , 10  );



INSERT INTO match VALUES ( 1, '15/nov/2016', '4th round',  'home', 1, 1, 1 );
INSERT INTO match VALUES ( 2, '15/nov/2016', '4th round',  'home', 2, 1, 1 );
INSERT INTO match VALUES ( 3, '15/nov/2016', '4th round',  'home', 1, 4, 1 );
INSERT INTO match VALUES ( 4, '15/nov/2016', '4th round',  'home', 1, 5, 1 );
INSERT INTO match VALUES ( 5, '15/nov/2016', '4th round',  'home', 4, 7, 1 );
INSERT INTO match VALUES ( 6, '15/nov/2016', '4th round',  'home', 5, 1, 2 );
INSERT INTO match (m_id, match_date, stage, home_away,stadium_id,referee_id) VALUES ( 7, '15/nov/2016', '4th round',  'home', 1, 1 );
INSERT INTO match VALUES ( 8, '15/nov/2016', '4th round',  'home', 1, 1, 1 );
INSERT INTO match VALUES ( 9, '15/nov/2016', '4th round',  'home', 1, 7, 1 );
INSERT INTO match VALUES ( 10, '15/nov/2016', '4th round',  'home', 1, 1, 1 );
INSERT INTO match VALUES ( 11, '16/nov/2016', '4th round',  'home', 1, 1, 1 );
INSERT INTO match VALUES ( 12, '15/nov/2016', '5th round',  'home', 1, 1, 1 );




INSERT INTO tp VALUES ( 1 , 1 );
INSERT INTO tp VALUES ( 1 , 2 );
INSERT INTO tp VALUES ( 2 , 1 );
INSERT INTO tp VALUES ( 2 , 2 );
INSERT INTO tp VALUES ( 3 , 9 );
INSERT INTO tp VALUES ( 4 , 5 );
INSERT INTO tp VALUES ( 5 , 8 );
INSERT INTO tp VALUES ( 6 , 10 );
INSERT INTO tp VALUES ( 7 , 11 );
INSERT INTO tp VALUES ( 8 , 4 );
INSERT INTO tp VALUES ( 9 , 6 );
INSERT INTO tp VALUES ( 10 , 7 );



INSERT INTO tl VALUES ( 1 , 3 );
INSERT INTO tl VALUES ( 1 , 1 );
INSERT INTO tl VALUES ( 2 , 1 );
INSERT INTO tl VALUES ( 3 , 1 );
INSERT INTO tl VALUES ( 4 , 2 );
INSERT INTO tl VALUES ( 5 , 2 );
INSERT INTO tl VALUES ( 6 , 2 );
INSERT INTO tl VALUES ( 7 , 3 );
INSERT INTO tl VALUES ( 8 , 3 );
INSERT INTO tl VALUES ( 9 , 3 );





INSERT INTO tm VALUES ( 1 , 1 );
INSERT INTO tm VALUES ( 1 , 2 );
INSERT INTO tm VALUES ( 2 , 3 );
INSERT INTO tm VALUES ( 3 , 4 );
INSERT INTO tm VALUES ( 4 , 5 );
INSERT INTO tm VALUES ( 5 , 6 );
INSERT INTO tm VALUES ( 5 , 7 );
INSERT INTO tm VALUES ( 7 , 8 );
INSERT INTO tm VALUES ( 8 , 9 );
INSERT INTO tm VALUES ( 9 , 10 );
INSERT INTO tm VALUES ( 2 , 1 );




INSERT INTO tn VALUES ( 1 , 1 );
INSERT INTO tn VALUES ( 1 , 2 );
INSERT INTO tn VALUES ( 1 , 3 );
INSERT INTO tn VALUES ( 2 , 1 );
INSERT INTO tn VALUES ( 2 , 2 );
INSERT INTO tn VALUES ( 2 , 3 );
INSERT INTO tn VALUES ( 2 , 4 );
INSERT INTO tn VALUES ( 2 , 5 );
INSERT INTO tn VALUES ( 2 , 5 );
INSERT INTO tn VALUES ( 2 , 5 );





INSERT INTO pn VALUES ( 1 , 1 );
INSERT INTO pn VALUES ( 1 , 2 );
INSERT INTO pn VALUES ( 1 , 3 );
INSERT INTO pn VALUES ( 2 , 1 );
INSERT INTO pn VALUES ( 2 , 2 );
INSERT INTO pn VALUES ( 2 , 3 );
INSERT INTO pn VALUES ( 3 , 4 );
INSERT INTO pn VALUES ( 3 , 5 );
INSERT INTO pn VALUES ( 3 , 6 );
INSERT INTO pn VALUES ( 3 , 7 );




INSERT INTO mn VALUES ( 1 , 1 );
INSERT INTO mn VALUES ( 1 , 2 );
INSERT INTO mn VALUES ( 1 , 3 );
INSERT INTO mn VALUES ( 2 , 4 );
INSERT INTO mn VALUES ( 2 , 5 );
INSERT INTO mn VALUES ( 2 , 6 );
INSERT INTO mn VALUES ( 3 , 7 );
INSERT INTO mn VALUES ( 3 , 8 );
INSERT INTO mn VALUES ( 3 , 9 );
INSERT INTO mn VALUES ( 3 , 10 );
---------------------------------------------------------------

--inner join
-- join 1
--This query to view all the matched in each league. 
select * from league l join match m  on l.l_id=m.league_id; 


--join 2
-- This query to view the stadium and the team that own it.
select * from stadiumz join team on s_id=stadium_id;

-- join 3
-- For each team show all the player (name and p_id)
select team.name, player.p_id, player.fname from team join tp on team_id=t_id join player on p_id = player_id;

-- join 4
-- for each league show the league organization the manage it. Show only (league name, leangue org name).
select league.name, leagueorg.name from league join leagueorg on lo_id = leagueorg_id ;
-------------------------------------------------------------------------------

-- outer join
-- join 1
-- Left join - Show list of the referees id and names with all the matches dates that they manage, when a referee not assign to any match the referee name will also showed.
select referee.r_id, referee.fname, match.match_date from referee left outer join match on r_id = referee_id;

--join 2
-- Left join - Show all the match dates form match table with all the league names from league table that it belong to. The match date will be shown even if it friendly match and dose not belong to any league.
select match.match_date, league.name from match left outer join league on league_id = l_id;

-- join 3
-- Full join – show all the news titles from news table with all the correspond player name from player table that the news is about them, also show all the news that the not about a player and all the player that there is no any news article about them.
select news.title, player.fname from news full outer join pn on n_id=news_id full outer join player on p_id = player_id;


-- join 4
-- Full join – show all the team name from team table with all the league name and id from league table in full outer join so also the teams with not league and the league with no teams will be shown.
select team.name, league.l_id, league.name as league_id from team full outer join tl on t_id=team_id full outer join league on  l_id = league_id;


-- join 5
--Right join- To view the title of all the news articles and the team if it is about a team. 
select team.name, news.title as article_title from team right outer join tn on t_id=team_id full outer join news on  n_id = news_id;

-- join 6
-- Right join To view all the teams name and the date when that team will play if it will play a game.
select team.name, match.match_date from team right  outer join tm on t_id=team_id full outer join match on  m_id = match_id;
---------------------------------------------------------------

-- the rollup query
--For each match stage show match date rolled up.
--I have added to new rows to match table for the purpose of clarify the use of this command.
INSERT INTO match VALUES ( 11, '16/nov/2016', '4th round',  'home', 1, 1, 1 );
INSERT INTO match VALUES ( 12, '15/nov/2016', '5th round',  'home', 1, 1, 1 );

select stage, match_date from match
group by rollup ( stage, match_date ) ;
----------------------------------------------------------


-- the sub quert
--1- Select the news article that newest than last registered match
select title from news 
where artical_date < ( select  max(match_date) from match) ;

--2-Select the players that they were born after the team establishment.
select fname from player  
where dof  > ( select  max(establish_date) from team) ;


--3- List all the team that are based in the same region as the first league from the league table. 
select name from team
where country  = ( select region from league where l_id = 1) ;


--4- Select all the teams that belong to a country same as name as the city of the stadium 10  
select name from team
where country  = ( select city from stadium where s_id = 10) ;
-------------------------------------------------------



--the procetures
--1-  The method used to change the date of a match in the case the match been postponed. It takes one parameter the date then modified it and then return it back to the main block to update the table with the new value.
--The cod:-
	CREATE OR REPLACE PROCEDURE date_change (temp in out date)
    IS
    BEGIN
      SELECT ( temp + 7 ) into temp FROM DUAL;
      DBMS_OUTPUT.PUT_LINE( ' match date been postpond 7 days to' || temp);

    END;
    /

declare
   temp date;
begin
   select match_date into temp from match where m_id = 1;
   date_change (temp);
   UPDATE match
   SET match_date = temp
   WHERE  m_id = 1;  
end;
/ 



--2- This procedure print out the title of the most recent 4 news article.
-- The cod:-
CREATE OR REPLACE PROCEDURE newest_article
    IS
   temp number;
   i number;
   temp_title NVARCHAR2(20);
       BEGIN
      select count(*) into temp from news;
      for i in (temp-4)..temp loop
         select title into temp_title from news where n_id = i;
         DBMS_OUTPUT.PUT_LINE( ' the title of article no'|| i || 'is ' || temp_title );
     end loop;
  END newest_article;
    /

begin
    newest_article () ;    
end;
/

--3- This procetur list all the stadiums information using cursor
-- The code:-
CREATE OR REPLACE PROCEDURE stadiums_list
    IS
   CURSOR cur_stadium IS SELECT name, city, year, seat_num FROM stadium;
   stadium_row cur_stadium %ROWTYPE;

       BEGIN
       OPEN cur_stadium ;
       FETCH cur_stadium INTO stadium_row;
       WHILE cur_stadium%FOUND LOOP
            DBMS_OUTPUT.PUT_LINE(' the stadium (' || stadium_row.name || ') in ' || stadium_row.city || ' were built in ' || stadium_row.year || ' with capacity over than ' || stadium_row.seat_num || ' seats.' );
            FETCH cur_stadium INTO stadium_row;
       END LOOP;
       CLOSE cur_stadium;
  END stadiums_list;
    /

begin
    stadiums_list () ;    
end;
/




--4- This procedure swap two the referee of the matches m-id that send as parameters and commit that, while update but roll back the referee of the third parameter.
-- The code:-
CREATE OR REPLACE PROCEDURE referee_change(t1 in number, t2 in number, t3 in number) 
    IS
       BEGIN
           UPDATE match SET referee_id = 1 WHERE  m_id = t1;
           UPDATE match SET referee_id = 7 WHERE  m_id = t2;
           COMMIT;
           UPDATE match SET referee_id = 8 WHERE  m_id = t3;
           ROLLBACK;
  END referee_change ;
    /

begin
    referee_change (5,6,9) ;    
end;
/

select * from match where m_id = 5 or m_id = 6 or m_id = 9 ;



--5- 5-	This procedure move player from one team to another, it take two param (the new team id and the player id) using save point.
-- The code:-
CREATE OR REPLACE PROCEDURE move_player  (t1 in number, t2 in number)
    IS
    BEGIN
           UPDATE  tp SET team_id = t1 WHERE  player_id = t2;
           SAVEPOINT first;
    END move_player;
    /

  set autocommit off;
begin
    move_player (3,7) ;
    ROLLBACK TO first;    
end;
/

