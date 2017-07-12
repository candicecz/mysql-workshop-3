--CONT'd from workshop 2
--exercise 1
--Which Account owns the most Address Books?
mysql> SELECT name, accountId, COUNT(*)
    -> FROM AddressBook
    -> GROUP BY accountId
    -> ORDER BY COUNT(*) DESC
    -> LIMIT 5;
+------------------------------+-----------+----------+
| name                         | accountId | COUNT(*) |
+------------------------------+-----------+----------+
| Justo Nec Incorporated       |         5 |       19 |
| Varius Incorporated          |        14 |       19 |
| Libero Proin Sed Corporation |        42 |       18 |
| Sed Dui Corporation          |        58 |       18 |
| Fermentum Fermentum Company  |         2 |       17 |
+------------------------------+-----------+----------+
--ANSWER: JUSTO NEC INCORPORATED

--Which Address Book contains the most Entries?
mysql> SELECT firstName, addressBookId
    -> FROM Entry
    -> GROUP BY addressBookId
    -> ORDER BY COUNT(*) DESC LIMIT 1;
+-----------+---------------+
| firstName | addressBookId |
+-----------+---------------+
| Sophia    |            37 |
+-----------+---------------+
1 row in set (0.00 sec)

--exercise 2
--How many Address Book Entries have phones starting with area code 3XX?
mysql> SELECT subtype, COUNT(*)
    -> FROM Entry
    -> WHERE subtype = 'phone' AND contentLineOne LIKE '(3%' OR contentLineOne LIKE '1-3%';
+---------+----------+
| subtype | COUNT(*) |
+---------+----------+
| phone   |       60 |
+---------+----------+
1 row in set (0.00 sec)


--How many Address Book Entries have home phones not containing the digit 5?

mysql> SELECT subtype, COUNT(*)
    -> FROM Entry
    -> WHERE subtype = 'phone' AND type = 'home' AND contentLineOne NOT LIKE '%5%';
+---------+----------+
| subtype | COUNT(*) |
+---------+----------+
| phone   |       76 |
+---------+----------+
1 row in set (0.00 sec)

--How many Address Book Entries are work phones starting with a country code?
mysql> SELECT subtype, COUNT(*)
    -> FROM Entry
    -> WHERE subtype = 'phone' AND type = 'work' AND contentLineOne NOT LIKE '(%';
+---------+----------+
| subtype | COUNT(*) |
+---------+----------+
| phone   |       60 |
+---------+----------+
1 row in set (0.00 sec)

--Beginning of workshop 3
--exercise 1

CREATE TABLE Account(
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255),
  password VARCHAR(40),
  createdOn DATETIME,
  modifiedOn DATETIME
);

CREATE TABLE AddressBook(
  id INT AUTO_INCREMENT PRIMARY KEY,
  accountId INT,
  name VARCHAR(255),
  createdOn DATETIME,
  modifiedOn DATETIME
);

CREATE TABLE Entry(
  id INT AUTO_INCREMENT PRIMARY KEY,
  addressBookId INT,
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  birthday DATETIME,
  type ENUM('phone','address','electronic-mail')
);

CREATE TABLE Address(
  id INT AUTO_INCREMENT PRIMARY KEY,
  entryId INT,
  type ENUM('home','work','other'),
  addressLine1 VARCHAR(255),
  addressLine2 VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(128),
  country VARCHAR(128),
  postalCode VARCHAR(10)
);

CREATE TABLE ElectronicMail(
  id INT AUTO_INCREMENT PRIMARY KEY,
  entryId INT,
  type ENUM('home','work','other'),
  content VARCHAR(255)
);

CREATE TABLE Phone(
  id INT AUTO_INCREMENT PRIMARY KEY,
  entryId INT,
  type ENUM('home','work','other'),
  subtype ENUM('landline','cellular','fax'),
  content VARCHAR(255)
);
--exercise 2
source data/import-account.sql
source data/import-addressbook.sql
source data/import-entry.sql

--exercise 3
mysql> SELECT LOWER(country), COUNT(*)
    -> FROM Address
    -> GROUP BY country
    -> ORDER BY COUNT(*) DESC;
+----------------------------------------------+----------+
| LOWER(country)                               | COUNT(*) |
+----------------------------------------------+----------+
| mozambique                                   |       18 |
| saint helena, ascension and tristan da cunha |       16 |
| curaçao                                      |       15 |
| thailand                                     |       15 |
| united states minor outlying islands         |       15 |
| andorra                                      |       15 |
| canada                                       |       15 |
| argentina                                    |       15 |
| lebanon                                      |       15 |
| wallis and futuna                            |       15 |
| united kingdom (great britain)               |       14 |
| sri lanka                                    |       14 |
| ethiopia                                     |       14 |
| netherlands                                  |       14 |
| united arab emirates                         |       14 |
| brazil                                       |       14 |
| congo, the democratic republic of the        |       14 |
| dominica                                     |       14 |
| seychelles                                   |       13 |
| norfolk island                               |       13 |
| aruba                                        |       13 |
| venezuela                                    |       13 |
| lithuania                                    |       13 |
| cook islands                                 |       13 |
| french polynesia                             |       13 |
| liberia                                      |       13 |
| equatorial guinea                            |       13 |
| switzerland                                  |       13 |
| tonga                                        |       13 |
| mayotte                                      |       13 |
| cocos (keeling) islands                      |       13 |
| slovakia                                     |       13 |
| virgin islands, united states                |       12 |
| saint kitts and nevis                        |       12 |
| isle of man                                  |       12 |
| guinea                                       |       12 |
| botswana                                     |       12 |
| grenada                                      |       12 |
| finland                                      |       12 |
| senegal                                      |       12 |
| oman                                         |       12 |
| ireland                                      |       12 |
| christmas island                             |       12 |
| kazakhstan                                   |       12 |
| guinea-bissau                                |       12 |
| jordan                                       |       12 |
| anguilla                                     |       12 |
| malaysia                                     |       12 |
| turkey                                       |       12 |
| syria                                        |       12 |
| myanmar                                      |       11 |
| faroe islands                                |       11 |
| guernsey                                     |       11 |
| guatemala                                    |       11 |
| qatar                                        |       11 |
| belize                                       |       11 |
| peru                                         |       11 |
| tanzania                                     |       11 |
| india                                        |       11 |
| djibouti                                     |       11 |
| ukraine                                      |       11 |
| lesotho                                      |       11 |
| panama                                       |       11 |
| saint lucia                                  |       11 |
| latvia                                       |       11 |
| cambodia                                     |       11 |
| åland islands                                |       11 |
| vanuatu                                      |       11 |
| belarus                                      |       11 |
| turks and caicos islands                     |       11 |
| austria                                      |       11 |
| palau                                        |       11 |
| philippines                                  |       11 |
| congo (brazzaville)                          |       11 |
| burundi                                      |       11 |
| mexico                                       |       11 |
| bouvet island                                |       11 |
| luxembourg                                   |       11 |
| kiribati                                     |       11 |
| san marino                                   |       11 |
| french southern territories                  |       11 |
| antarctica                                   |       10 |
| cape verde                                   |       10 |
| timor-leste                                  |       10 |
| indonesia                                    |       10 |
| kuwait                                       |       10 |
| tunisia                                      |       10 |
| dominican republic                           |       10 |
| kyrgyzstan                                   |       10 |
| tokelau                                      |       10 |
| cayman islands                               |       10 |
| taiwan                                       |       10 |
| australia                                    |       10 |
| zambia                                       |       10 |
| chad                                         |       10 |
| jersey                                       |       10 |
| guam                                         |       10 |
| south africa                                 |       10 |
| ghana                                        |       10 |
| madagascar                                   |       10 |
| zimbabwe                                     |       10 |
| rwanda                                       |       10 |
| benin                                        |       10 |
| afghanistan                                  |       10 |
| algeria                                      |       10 |
| costa rica                                   |       10 |
| micronesia                                   |       10 |
| united states                                |       10 |
| antigua and barbuda                          |       10 |
| nicaragua                                    |        9 |
| russian federation                           |        9 |
| albania                                      |        9 |
| martinique                                   |        9 |
| turkmenistan                                 |        9 |
| slovenia                                     |        9 |
| belgium                                      |        9 |
| france                                       |        9 |
| tuvalu                                       |        9 |
| israel                                       |        9 |
| tajikistan                                   |        9 |
| western sahara                               |        9 |
| cuba                                         |        9 |
| gambia                                       |        9 |
| uruguay                                      |        9 |
| swaziland                                    |        9 |
| hungary                                      |        9 |
| cyprus                                       |        9 |
| serbia                                       |        9 |
| guyana                                       |        9 |
| bangladesh                                   |        9 |
| saint pierre and miquelon                    |        9 |
| british indian ocean territory               |        9 |
| cameroon                                     |        9 |
| bosnia and herzegovina                       |        9 |
| reunion                                      |        9 |
| virgin islands, british                      |        9 |
| suriname                                     |        9 |
| montserrat                                   |        9 |
| gibraltar                                    |        9 |
| bonaire, sint eustatius and saba             |        9 |
| greenland                                    |        9 |
| armenia                                      |        9 |
| bulgaria                                     |        9 |
| iraq                                         |        8 |
| japan                                        |        8 |
| central african republic                     |        8 |
| marshall islands                             |        8 |
| côte divoire (ivory coast)                  |        8 |
| pitcairn islands                             |        8 |
| comoros                                      |        8 |
| colombia                                     |        8 |
| czech republic                               |        8 |
| nigeria                                      |        8 |
| northern mariana islands                     |        8 |
| honduras                                     |        8 |
| american samoa                               |        8 |
| new caledonia                                |        8 |
| bermuda                                      |        8 |
| solomon islands                              |        8 |
| estonia                                      |        8 |
| greece                                       |        8 |
| mali                                         |        8 |
| macedonia                                    |        8 |
| brunei                                       |        8 |
| uganda                                       |        8 |
| yemen                                        |        8 |
| eritrea                                      |        8 |
| korea, north                                 |        8 |
| saint barthélemy                             |        8 |
| puerto rico                                  |        8 |
| papua new guinea                             |        8 |
| bhutan                                       |        8 |
| maldives                                     |        8 |
| georgia                                      |        8 |
| azerbaijan                                   |        8 |
| italy                                        |        8 |
| holy see (vatican city state)                |        8 |
| chile                                        |        8 |
| sao tome and principe                        |        8 |
| germany                                      |        8 |
| el salvador                                  |        8 |
| south sudan                                  |        8 |
| uzbekistan                                   |        8 |
| sierra leone                                 |        7 |
| pakistan                                     |        7 |
| singapore                                    |        7 |
| ecuador                                      |        7 |
| falkland islands                             |        7 |
| mauritania                                   |        7 |
| macao                                        |        7 |
| south georgia and the south sandwich islands |        7 |
| saint martin                                 |        7 |
| bahrain                                      |        7 |
| kenya                                        |        7 |
| norway                                       |        7 |
| barbados                                     |        7 |
| poland                                       |        7 |
| heard island and mcdonald islands            |        7 |
| bahamas                                      |        7 |
| fiji                                         |        7 |
| malta                                        |        7 |
| mongolia                                     |        7 |
| egypt                                        |        7 |
| niue                                         |        7 |
| gabon                                        |        7 |
| iran                                         |        7 |
| libya                                        |        6 |
| china                                        |        6 |
| romania                                      |        6 |
| angola                                       |        6 |
| svalbard and jan mayen islands               |        6 |
| spain                                        |        6 |
| french guiana                                |        6 |
| namibia                                      |        6 |
| laos                                         |        6 |
| sudan                                        |        6 |
| morocco                                      |        6 |
| croatia                                      |        6 |
| guadeloupe                                   |        6 |
| denmark                                      |        6 |
| new zealand                                  |        6 |
| sint maarten                                 |        6 |
| moldova                                      |        6 |
| paraguay                                     |        6 |
| bolivia                                      |        6 |
| togo                                         |        6 |
| somalia                                      |        6 |
| portugal                                     |        6 |
| burkina faso                                 |        6 |
| malawi                                       |        6 |
| viet nam                                     |        6 |
| monaco                                       |        5 |
| montenegro                                   |        5 |
| haiti                                        |        5 |
| trinidad and tobago                          |        5 |
| korea, south                                 |        5 |
| sweden                                       |        5 |
| palestine, state of                          |        5 |
| liechtenstein                                |        5 |
| nauru                                        |        5 |
| nepal                                        |        5 |
| hong kong                                    |        5 |
| samoa                                        |        5 |
| jamaica                                      |        4 |
| iceland                                      |        3 |
| saint vincent and the grenadines             |        3 |
| mauritius                                    |        3 |
| saudi arabia                                 |        3 |
| niger                                        |        2 |
+----------------------------------------------+----------+
249 rows in set (0.00 sec)

--exercise 4
SELECT *
FROM Entry
JOIN AddressBook
ON AddressBook.id = Entry.addressBookId
WHERE AddressBook.name = "Pharetra Ut Limited";
   --first 5 on display but real answer is 65.
+-----+---------------+-----------+----------+---------------------+-------+----+-----------+---------------------+---------------------+---------------------+
| id  | addressBookId | firstName | lastName | birthday            | type  | id | accountId | name                | createdOn           | modifiedOn          |
+-----+---------------+-----------+----------+---------------------+-------+----+-----------+---------------------+---------------------+---------------------+
|   7 |            10 | Zelenia   | Griffin  | 1956-04-27 22:39:12 | phone | 10 |        88 | Pharetra Ut Limited | 2016-05-23 06:09:38 | 2016-05-10 09:47:12 |
|  45 |            10 | Abdul     | Cannon   | 1997-10-01 12:34:47 | phone | 10 |        88 | Pharetra Ut Limited | 2016-05-23 06:09:38 | 2016-05-10 09:47:12 |
| 335 |            10 | Idola     | Smith    | 1952-02-01 22:45:27 | phone | 10 |        88 | Pharetra Ut Limited | 2016-05-23 06:09:38 | 2016-05-10 09:47:12 |
| 472 |            10 | Illana    | Kramer   | 1951-03-02 12:06:10 | phone | 10 |        88 | Pharetra Ut Limited | 2016-05-23 06:09:38 | 2016-05-10 09:47:12 |
| 659 |            10 | Winifred  | Pierce   | 1965-12-25 13:09:24 | phone | 10 |        88 | Pharetra Ut Limited | 2016-05-23 06:09:38 | 2016-05-10 09:47:12 |
+-----+---------------+-----------+----------+---------------------+-------+----+-----------+---------------------+---------------------+---------------------+
--exercise 5

mysql> SELECT email
    -> FROM Account
    -> JOIN AddressBook
    -> ON AddressBook.accountId = Account.id
    -> WHERE AddressBook.id=100;
+----------------------------------+
| email                            |
+----------------------------------+
| dapibus.quam@interdumligulaeu.ca |
+----------------------------------+
1 row in set (0.00 sec)
--or

SELECT content FROM ElectronicMail JOIN Entry ON ElectronicMail.entryId = Entry.id WHERE Entry.addressBookId = 100;

--exercise 6

SELECT content
FROM Phone
JOIN Entry
ON Phone.entryId = Entry.id
WHERE Entry.firstName = "Charlotte" AND Entry.lastName = 'Jenkins';

--exercise 7

SELECT SUBSTRING_INDEX(content, '@', -1)
FROM ElectronicMail;

--exercise 8
SELECT COUNT(*)
FROM Phone
JOIN Entry
ON Phone.entryId = Entry.id
WHERE (birthday BETWEEN '1950-10-01' AND '1960-10-01')
GROUP BY subtype;

+----------+
| COUNT(*) |
+----------+
|      170 |
|      138 |
|      134 |

--exercise 9
SELECT city, country
FROM Address
WHERE country IN ('Canada','Austria','Isle of Man','Ireland','Japan');
