-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Kwi 2017, 22:51
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ciesla`
--

DELIMITER $$
--
-- Procedury
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_addCircle` (IN `_IDUser` INT(10), IN `_name` VARCHAR(255), IN `_description` VARCHAR(255))  NO SQL
BEGIN

	INSERT INTO `circle` SELECT NULL, _IDUser, _name, _description, NOW(), 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_addFriend` (IN `_IDMyUser` INT(10), IN `_IDCheckUser` INT(10))  NO SQL
BEGIN

	SET @AreFriend = 0;

	SELECT 1 FROM `friend` WHERE (`friend`.`IDUsertSendReq` = _IDMyUser AND `friend`.`IDReciver` = _IDCheckUser) OR (`friend`.`IDReciver` = _IDMyUser AND `friend`.`IDUsertSendReq` = _IDCheckUser) AND `friend`.`confirmed` = 1 INTO @AreFriend;

    INSERT INTO `friend` SELECT _IDMyUser, _IDCheckUser, NOW(), 0, NOW() WHERE (SELECT @AreFriend <=> 0);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_addPost` (IN `_IDUser` INT(10), IN `_description` VARCHAR(1000), IN `_priavtePolicy` INT(11))  NO SQL
BEGIN

	INSERT INTO `timeline` SELECT NULL, _IDUser, _description, NOW(), _priavtePolicy, 1, NOW();

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_addUserToCircle` (IN `_IDUser` INT(10), IN `_IDCircle` INT(10), IN `_IDaddingUser` INT(10))  NO SQL
BEGIN

	INSERT INTO `friendcircle` SELECT _IDUSER, _IDCircle, _IDaddingUser, NOW(), 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_allFriends` (IN `_IDUser` INT(10))  NO SQL
BEGIN
    
	SELECT * FROM 
    `user` LEFT JOIN 
    `person` ON `user`.`ID` = `person`.`IDUser` LEFT JOIN 
    `friend` ON 
    	`friend`.`IDUsertSendReq` = `user`.`ID` OR 
        `friend`.`IDReciver` = `user`.`ID`
        
    WHERE 
    (`friend`.`IDUsertSendReq` = _IDUser OR 
        `friend`.`IDReciver` = _IDUser) AND `user`.`ID` != _IDUser
        
    GROUP BY `user`.`ID`;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_amountLikes` (IN `_IDPost` INT)  NO SQL
BEGIN

	SELECT COUNT(`IDPost`) FROM `likes` WHERE `likes`.`IDPost` = _IDPost;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_checkFriend` (IN `_IDMyUser` INT(10), IN `_IDCheckUser` INT(10))  NO SQL
BEGIN

	SELECT 1 FROM `friend` WHERE ((`friend`.`IDUsertSendReq` = _IDMyUser AND `friend`.`IDReciver` = _IDCheckUser) OR (`friend`.`IDReciver` = _IDMyUser AND `friend`.`IDUsertSendReq` = _IDCheckUser)) AND `friend`.`confirmed` = 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_confirmFriend` (IN `_IDMyUser` INT, IN `_IDCheckUser` INT)  NO SQL
BEGIN

	SET @AreFriend = 0;

	SELECT 1 FROM `friend` WHERE ((`friend`.`IDReciver` = _IDMyUser AND `friend`.`IDUsertSendReq` = _IDCheckUser)) AND `friend`.`confirmed` = 1 INTO @AreFriend;

    UPDATE `friend` SET `active` = 1 WHERE (`friend`.`IDReciver` = _IDMyUser AND `friend`.`IDUsertSendReq` = _IDCheckUser) AND (SELECT @AreFriend <=> 0);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_deletePost` (IN `_idUser` INT(11), IN `_idPost` INT(100))  NO SQL
BEGIN

	UPDATE `timeline` SET `timeline`.`active` = 0
    WHERE
    `timeline`.`ID` = _idPost AND `timeline`.`IDUser` = _idUser;
  SELECT active FROM `timeline` WHERE `timeline`.`ID` = _IDPost AND `timeline`.`IDUser` = _idUser;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_editPost` (IN `_IDPost` INT(100), IN `_IDUser` INT, IN `_description` VARCHAR(1000), IN `_policy` INT(5), IN `_datePost` VARCHAR(20))  NO SQL
BEGIN
    
    UPDATE `timeline` SET `timeline`.`active` = 0 WHERE `timeline`.`ID` = _IDPost AND `timeline`.`IDUser` = _IDUser;
    INSERT INTO `timeline` SELECT _IDPost, _IDUser, _description, _datePost, _policy, 1, NOW();

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_editProfile` (IN `_IDUser` INT(10), IN `_firstname` VARCHAR(50), IN `_surename` VARCHAR(50), IN `_birthDate` DATE, IN `_password` VARCHAR(50))  NO SQL
BEGIN

	UPDATE `person` SET `activeChange` = 0 WHERE `IDUser` = _IDUser;
    INSERT INTO `person` SELECT _IDUser, _firstname, _surename, _birthDate, 1, NOW(), 1;
    
	UPDATE `user` SET `password` = _password, `date` = NOW() WHERE `ID` = _IDUser;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getInformationProfile` (IN `_ID` INT(10))  NO SQL
BEGIN

	SELECT * FROM `user` LEFT JOIN `person` ON `user`.`ID` = `person`.`IDUser` WHERE `user`.`ID` = _ID AND `person`.`activeChange` = 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getLogs` (IN `_idUser` INT(11))  NO SQL
BEGIN

	SELECT * FROM `login` WHERE `login`.`IDUser` = _idUser;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getUserPosts` (IN `_idUser` INT(11))  NO SQL
BEGIN
 SELECT
	`timeline`.`ID`,
	`timeline`.`IDUser`,
	`timeline`.`description`,
	`timeline`.`datePost`,
	`timeline`.`privatePolicy`,
	`timeline`.`active`,
	`timeline`.`dateCreate`,
    (SELECT IFNULL((SELECT COUNT(*) FROM `likes` WHERE `likes`.`IDPost` = `timeline`.`ID` GROUP BY `likes`.`IDPost`), '0')) as `likes`

  FROM `timeline`
    LEFT JOIN `likes`	ON `likes`.`IDUser` 	= `timeline`.`IDUser`

  WHERE `timeline`.`IDUser` = _IDUser AND `timeline`.`active` = 1

  GROUP BY `timeline`.`ID`
  ORDER BY `timeline`.`datePost` DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_getWall` (IN `_idUser` INT(11))  NO SQL
BEGIN

  SELECT
    `user`.`ID`,
    `person`.`firstname`, `person`.`surename`,
    `timeline`.`ID` as `idPost`, `timeline`.`description`, `timeline`.`datePost`,
    (SELECT IFNULL((SELECT COUNT(*) FROM `likes` WHERE `likes`.`IDPost` = `timeline`.`ID` GROUP BY `likes`.`IDPost`), '0')) as `likes`

  FROM `timeline`
    LEFT JOIN `friend` 	ON `friend`.`IDReciver` = `timeline`.`IDUser`
    LEFT JOIN `user` 	ON `user`.`ID` 			= `timeline`.`IDUser`
    LEFT JOIN `person`	ON `person`.`IDUser` 	= `timeline`.`IDUser`
    LEFT JOIN `likes`	ON `likes`.`IDUser` 	= `timeline`.`IDUser`

  WHERE
    (
      `timeline`.`IDUser` = _IDUser OR `friend`.`IDUsertSendReq` = _IDUser
    ) AND
    `timeline`.`active` = 1 AND
    `person`.`activeChange` = 1

  GROUP BY `timeline`.`ID`
  ORDER BY `timeline`.`datePost` DESC;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_likePost` (IN `_IDUser` INT(10), IN `_IDPost` INT)  NO SQL
BEGIN

	INSERT INTO `likes` SELECT NULL, _IDUser, _IDPost;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_login` (IN `_email` VARCHAR(255), IN `_password` CHAR(128), IN `_IP` VARCHAR(16))  NO SQL
BEGIN

	SET @ID 	= 0;
    SET @error 	= 0;

	SELECT ID FROM `user` u WHERE `u`.`email` = _email AND `u`.`password` = _password INTO @ID;
    SELECT @ID <=> '' INTO @error;
    INSERT INTO `login` SELECT @ID, _IP, NOW() WHERE (SELECT @error <=> 0);
    SELECT @ID as `IDUser`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_registration` (IN `_name` VARCHAR(50), IN `_surname` VARCHAR(50), IN `_dateBirth` DATE, IN `_email` VARCHAR(255), IN `_password` CHAR(128))  NO SQL
BEGIN
    SET @errorMail = 0;
    SET @IDUser = 0;

    SELECT 1 FROM `user` u WHERE `u`.`email`= _email INTO @errorMail;

    SELECT @errorMail as `result`;

    INSERT INTO `user` SELECT NULL, _email, _password, 1, NOW() WHERE (SELECT @errorMail <=> 0);
    SELECT LAST_INSERT_ID() INTO @IDUser;
    INSERT INTO `person` SELECT @IDUser, _name, _surname, _dateBirth, 1, NOW(), 1 WHERE (SELECT @errorMail <=> 0);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_removeFriend` (IN `_IDMyUser` INT, IN `_IDCheckUser` INT)  NO SQL
BEGIN

    DELETE FROM `friend` WHERE
    (
        (`friend`.`IDUsertSendReq` = _IDMyUser AND `friend`.`IDReciver` = _IDCheckUser) OR
        (`friend`.`IDReciver` = _IDMyUser AND `friend`.`IDUsertSendReq` = _IDCheckUser)
    );

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_removePost` (IN `_IDPost` INT)  NO SQL
BEGIN

	UPDATE `timeline` SET `active` = 0 WHERE `ID` = _IDPost;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_searchUser` (IN `_search` VARCHAR(255))  NO SQL
BEGIN

	SELECT * FROM `person` JOIN `user` ON `user`.`ID` = `person`.`IDUser` WHERE
  CONCAT(`person`.`firstname`, ' ', `person`.`surename`, ' ', `user`.`email`) LIKE CONCAT('%', _search, '%')
  AND `user`.`active` = 1 AND `person`.`active` = 1 AND `person`.`activeChange` = 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_showProfile` (IN `_idProfile` INT(11))  NO SQL
BEGIN

	SELECT * FROM `user` LEFT JOIN `person` ON `user`.`ID` = `person`.`IDUser` WHERE `user`.`ID` = _idProfile AND `person`.`activeChange` = 1 AND `user`.`active` = 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_wall` (IN `_IDUser` INT(10))  NO SQL
BEGIN

	SELECT * FROM
    `user` LEFT JOIN `person` ON `user`.`ID` = `person`.`IDUser` LEFT JOIN `friend` ON `user`.`ID` = `friend`.`IDUsertSendReq` OR `user`.`ID` = `friend`.`IDReciver` LEFT JOIN `friendcircle` ON `user`.`ID` = `friendcircle`.`IDUser` LEFT JOIN `circle` ON `friendcircle`.`IDCircle` = `circle`.`ID` LEFT JOIN `timeline` ON `timeline`.`IDUser` = `friend`.`IDUsertSendReq` OR `timeline`.`IDUser` = `friend`.`IDReciver` ORDER BY `timeline`.`dateCreate` DESC;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `circle`
--

CREATE TABLE `circle` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `activer` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `friend`
--

CREATE TABLE `friend` (
  `IDUsertSendReq` int(10) NOT NULL,
  `IDReciver` int(10) NOT NULL,
  `dateSend` datetime NOT NULL,
  `confirmed` int(1) NOT NULL,
  `dateConfirmed` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `friend`
--

INSERT INTO `friend` (`IDUsertSendReq`, `IDReciver`, `dateSend`, `confirmed`, `dateConfirmed`) VALUES
(1, 2, '2017-04-26 22:50:20', 0, '2017-04-26 22:50:20'),
(1, 4, '2017-04-26 22:50:20', 0, '2017-04-26 22:50:20'),
(2, 1, '2017-04-26 22:50:20', 0, '2017-04-26 22:50:20'),
(3, 2, '2017-04-26 22:50:20', 0, '2017-04-26 22:50:20'),
(3, 1, '2017-04-26 22:50:20', 0, '2017-04-26 22:50:20'),
(4, 1, '2017-04-26 22:50:20', 0, '2017-04-26 22:50:20'),
(4, 3, '2017-04-26 22:50:20', 0, '2017-04-26 22:50:20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `friendcircle`
--

CREATE TABLE `friendcircle` (
  `IDUser` int(10) NOT NULL,
  `IDCircle` int(11) NOT NULL,
  `IDUserAdded` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `likes`
--

CREATE TABLE `likes` (
  `ID` int(11) NOT NULL,
  `IDUser` int(10) NOT NULL,
  `IDPost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `login`
--

CREATE TABLE `login` (
  `IDUser` int(10) NOT NULL,
  `IP` varchar(16) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `person`
--

CREATE TABLE `person` (
  `IDUser` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `surename` varchar(50) NOT NULL,
  `birthdate` date NOT NULL,
  `active` int(1) NOT NULL,
  `date` datetime NOT NULL,
  `activeChange` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `person`
--

INSERT INTO `person` (`IDUser`, `firstname`, `surename`, `birthdate`, `active`, `date`, `activeChange`) VALUES
(1, 'Cezaryl', 'Misiek', '1985-10-27', 1, '2017-04-26 22:50:20', 1),
(2, 'Katarzyna', 'Bąk', '1990-01-27', 1, '2017-04-26 22:50:20', 1),
(3, 'Tomasz', 'Sojka', '1989-03-13', 1, '2017-04-26 22:50:20', 1),
(4, 'Kajak', 'Kuba', '1993-04-27', 1, '2017-04-26 22:50:20', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `timeline`
--

CREATE TABLE `timeline` (
  `ID` int(11) NOT NULL,
  `IDUser` int(10) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `datePost` datetime NOT NULL,
  `privatePolicy` int(11) NOT NULL COMMENT '1=only me|2=friends|3=public',
  `active` int(1) NOT NULL,
  `dateCreate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `timeline`
--

INSERT INTO `timeline` (`ID`, `IDUser`, `description`, `datePost`, `privatePolicy`, `active`, `dateCreate`) VALUES
(1, 1, 'Dzień dobry. Chciałbym dodać swój pierwszy post na tablicę!', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(2, 1, 'Ten portal jest cudowny, poznałem tutaj kobietę swojego życia', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(3, 1, 'Halina dzisiaj postanowiła ugotować mi obiad. Nie przepadam za sałatką ale zjadłem ze smakiem.', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(4, 1, 'Dzisiaj tylko piwko i mecz - rasowy mężczyzna', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(5, 1, 'Zapraszam wszystkich znajomych do mnie na domówkę - weźcie ze sobą alkohol', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(6, 2, 'Slawek kocham Cię :) Kajra Ciebie również <3 - rewelacja, że już puściliście w świat ten kawałek haha. Mas w sobie chłopie tyle pozytywnej energii, że za każdym, ale to każdym razem gdy Cię słyszę to od razu się uśmiecham!', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(7, 2, 'Ufff. Moja Mamusia jest bystra. Zdążyła uciec z tego revshare. Tylko 50k utopiliśmy. Może to jakaś piramida była?! Czekaj... to co robią Ci na samej górze jest prawne (znaczy szczycie Państwa, znaczy łańcucha pokarmowego, znaczy czubku ... dobra... ). Swoją drogą Mamusia się nie chwaliła, że byliśmy przez moment milionerami <3. Czemu nimi już nie ostaliśmy i musiałem ponad 20 lat na to pracować od rana do nocy?', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(8, 2, 'Nigdy NIE jest za późno, żeby zmienić ___________ i zacząć łapać swoje szczęście! Co Wy byście wpisali w to miejsce?! Na co nie powinno być dla Was za późno ? <3', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(9, 2, 'Majk: razem z Kiaruto chcielibyśmy podziękować za miły dzień ?❤️? Kiaruto: a ja mam na to wyje... ? pytam się, kto teraz karmi ⁉️', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(10, 2, 'Święta miałem przyjemność spędzić z Komornikiem! Mocny temat. Ciekawe Postapo, z religijnymi klimatami (dla mocno wierzących.. Hmm lepiej odpuścić..) oraz dobrym napięciem i zwrotami akcji. Ale Miszkę Gołkowskiego to ja zawsze polecam bo świetnie pisze i lubię go czytać. Namierzcie to sobie w księgarniach.', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(11, 3, 'Stoi na stacji lokomotywa, Ciężka, ogromna i pot z niej spływa: Tłusta oliwa. Stoi i sapie, dyszy i dmucha, ', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(12, 3, 'Żar z rozgrzanego jej brzucha bucha: Buch - jak gorąco! Uch - jak gorąco! Puff - jak gorąco! Uff - jak gorąco! ', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(13, 3, 'Już ledwo sapie, już ledwo zipie, A jeszcze palacz węgiel w nią sypie.', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(14, 3, 'Wagony do niej podoczepiali Wielkie i ciężkie, z żelaza, stali, I pełno ludzi w każdym wagonie, ', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(15, 3, 'A w jednym krowy, a w drugim konie, A w trzecim siedzą same grubasy, Siedzą i jedzą tłuste kiełbasy, ', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(16, 4, 'K jak Kuba, czaicie? xD', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(17, 4, 'Widziałem wczoraj ufo nad tesco', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(18, 4, 'Troszkę chcę mi się spać ale chyba jeszcze zagram.', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(19, 4, 'Mój wujek kupił sobie psa, całkiem spore bydle: https://www.youtube.com/watch?v=En2k5LGydE0', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20'),
(20, 4, 'Szanownym współgrupowiczom przypominam, jutro o 8 widzimy się na zajęciach.', '2017-04-26 22:50:20', 1, 1, '2017-04-26 22:50:20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `ID` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` char(128) NOT NULL,
  `active` int(1) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`ID`, `email`, `password`, `active`, `date`) VALUES
(1, 'miscezary@wp.pl', 'admin1', 1, '2017-04-26 22:50:20'),
(2, 'KBak@mail.com', 'password', 1, '2017-04-26 22:50:20'),
(3, 'sojka@gmail.com', '123', 1, '2017-04-26 22:50:20'),
(4, 'k_jak_kuba@interia.pl', 'splywkajakowy', 1, '2017-04-26 22:50:20');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `circle`
--
ALTER TABLE `circle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `friend`
--
ALTER TABLE `friend`
  ADD KEY `IDUsertSendReq` (`IDUsertSendReq`),
  ADD KEY `IDReciver` (`IDReciver`);

--
-- Indexes for table `friendcircle`
--
ALTER TABLE `friendcircle`
  ADD KEY `IDUser` (`IDUser`),
  ADD KEY `IDGroup` (`IDCircle`),
  ADD KEY `IDUserAdded` (`IDUserAdded`),
  ADD KEY `IDUser_2` (`IDUser`),
  ADD KEY `IDCircle` (`IDCircle`),
  ADD KEY `IDUserAdded_2` (`IDUserAdded`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDUser` (`IDUser`),
  ADD KEY `IDPost` (`IDPost`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD KEY `IDUser` (`IDUser`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD KEY `IDUser` (`IDUser`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD KEY `IDUser` (`IDUser`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `likes`
--
ALTER TABLE `likes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `timeline`
--
ALTER TABLE `timeline`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;