-- MySQL dump 10.13  Distrib 5.5.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: scorecard
-- ------------------------------------------------------
-- Server version	5.5.33-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mtx_legis_party_desired_vote_types`
--

DROP TABLE IF EXISTS `mtx_legis_party_desired_vote_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtx_legis_party_desired_vote_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legislation_id` int(11) NOT NULL,
  `desired_vote_type_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cns_leg_id2` (`legislation_id`),
  CONSTRAINT `cns_leg_id2` FOREIGN KEY (`legislation_id`) REFERENCES `tbl_legislation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='desirable votes for a party for a legislation(bill)-can be m';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtx_legis_party_desired_vote_types`
--

LOCK TABLES `mtx_legis_party_desired_vote_types` WRITE;
/*!40000 ALTER TABLE `mtx_legis_party_desired_vote_types` DISABLE KEYS */;
INSERT INTO `mtx_legis_party_desired_vote_types` VALUES (1,1,2,3),(2,2,2,3),(3,3,2,3),(4,4,2,3),(5,5,2,3),(6,37,2,3),(8,36,2,3),(16,52,2,3),(17,53,1,3),(18,54,1,3),(20,56,2,3),(21,57,3,3),(23,0,4,3),(24,0,4,3),(25,0,4,3),(26,0,4,3),(33,65,1,3),(35,67,1,3),(36,68,1,3),(37,69,1,3),(39,71,1,3),(43,75,1,3),(46,78,2,3),(47,79,1,3),(49,81,1,3),(50,82,2,3),(51,83,1,3),(52,84,1,3),(53,85,1,3),(54,86,2,3),(55,87,1,3),(56,88,1,3),(59,91,4,3),(60,92,1,3),(61,93,1,3),(62,94,1,3),(63,95,1,3),(64,96,1,3),(65,97,1,3),(66,98,1,3),(67,99,1,3),(68,100,1,3);
/*!40000 ALTER TABLE `mtx_legis_party_desired_vote_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mtx_voters_bodies`
--

DROP TABLE IF EXISTS `mtx_voters_bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtx_voters_bodies` (
  `voter_id` int(11) NOT NULL,
  `body_id` int(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mtx_voters_bodies`
--

LOCK TABLES `mtx_voters_bodies` WRITE;
/*!40000 ALTER TABLE `mtx_voters_bodies` DISABLE KEYS */;
INSERT INTO `mtx_voters_bodies` VALUES (1,1,1994),(2,1,1994),(3,1,1994),(4,1,1994),(5,1,1994),(6,1,1994),(7,1,1994),(8,1,1994),(9,1,1994),(10,1,2013),(11,1,2013),(12,1,2013),(13,1,2013),(14,1,2013),(15,1,2013),(16,1,2013),(17,1,2013),(18,1,2013);
/*!40000 ALTER TABLE `mtx_voters_bodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `str_menu_links`
--

DROP TABLE IF EXISTS `str_menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_menu_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` decimal(2,0) NOT NULL,
  `name` varchar(40) NOT NULL,
  `url` varchar(50) NOT NULL,
  `short_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `str_menu_links`
--

LOCK TABLES `str_menu_links` WRITE;
/*!40000 ALTER TABLE `str_menu_links` DISABLE KEYS */;
INSERT INTO `str_menu_links` VALUES (1,0,'Add/edit/delete big issues','aed_big_issues,php','aed_big_issues'),(2,0,'Add/edit/delete issues','aed_issues.php','aed_issues'),(3,0,'Add/edit/delete legislation','aed_legislation.php','aed_legislation'),(4,0,'Add/edit/delete parties','aed_parties.php','aed_parties'),(5,0,'Add/edit/delete bodies','aed_bodies.php','aed_bodies'),(6,0,'Add/edit/delete voters','aed_voters.php','aed_voters'),(7,0,'Add/edit/delete votes','aed_votes.php','aed_votes'),(8,0,'Add/edit/delete vote types','aed_vote_types.php','aed_vote_types');
/*!40000 ALTER TABLE `str_menu_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `str_sub_tables`
--

DROP TABLE IF EXISTS `str_sub_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_sub_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_table_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `str_sub_tables`
--

LOCK TABLES `str_sub_tables` WRITE;
/*!40000 ALTER TABLE `str_sub_tables` DISABLE KEYS */;
INSERT INTO `str_sub_tables` VALUES (4,6,3),(5,7,3),(6,8,3),(7,7,4),(8,8,2),(9,3,2),(10,4,5),(11,2,1),(12,5,1),(13,3,7);
/*!40000 ALTER TABLE `str_sub_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `str_table_columns`
--

DROP TABLE IF EXISTS `str_table_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_table_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `column_name` varchar(30) NOT NULL,
  `column_type` varchar(20) NOT NULL,
  `column_length` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `str_table_columns`
--

LOCK TABLES `str_table_columns` WRITE;
/*!40000 ALTER TABLE `str_table_columns` DISABLE KEYS */;
INSERT INTO `str_table_columns` VALUES (1,3,'name','varchar',100),(2,6,'vote','varchar',20),(3,7,'name','varchar',100),(4,8,'name','varchar',50),(6,9,'year','varchar',4);
/*!40000 ALTER TABLE `str_table_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `str_tables`
--

DROP TABLE IF EXISTS `str_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `str_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `str_tables`
--

LOCK TABLES `str_tables` WRITE;
/*!40000 ALTER TABLE `str_tables` DISABLE KEYS */;
INSERT INTO `str_tables` VALUES (1,'tbl_votes','Votes'),(2,'tbl_voters','Voters'),(3,'tbl_bodies','Bodies'),(4,'tbl_issues','Issues'),(5,'tbl_legislation','Legislation'),(6,'tbl_vote_types','Vote types'),(7,'tbl_big_issues','Big issues'),(8,'tbl_parties','Parties'),(9,'tbl_years','Years');
/*!40000 ALTER TABLE `str_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_big_issues`
--

DROP TABLE IF EXISTS `tbl_big_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_big_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_big_issues`
--

LOCK TABLES `tbl_big_issues` WRITE;
/*!40000 ALTER TABLE `tbl_big_issues` DISABLE KEYS */;
INSERT INTO `tbl_big_issues` VALUES (1,'Environment',1),(2,'Social Justice',1),(3,'Community Based Economics and Economic Justice',1),(4,'Grassroots Democracy',1),(5,'Feminism and Gender Equality',1),(6,'Nonviolence',1),(7,'Decentralization',1),(8,'Diversity',1),(9,'Personal and Global Responsibility',1),(10,'Future Focus and Sustainability',1);
/*!40000 ALTER TABLE `tbl_big_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_bodies`
--

DROP TABLE IF EXISTS `tbl_bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bodies`
--

LOCK TABLES `tbl_bodies` WRITE;
/*!40000 ALTER TABLE `tbl_bodies` DISABLE KEYS */;
INSERT INTO `tbl_bodies` VALUES (1,'Montgomery County MD Council');
/*!40000 ALTER TABLE `tbl_bodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_counties`
--

DROP TABLE IF EXISTS `tbl_counties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_counties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_counties`
--

LOCK TABLES `tbl_counties` WRITE;
/*!40000 ALTER TABLE `tbl_counties` DISABLE KEYS */;
INSERT INTO `tbl_counties` VALUES (1,'Montgomery',1),(2,'Prince George\'s',1);
/*!40000 ALTER TABLE `tbl_counties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_issues`
--

DROP TABLE IF EXISTS `tbl_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_issues` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `big_issue_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `pro_environment_vote` varchar(3) NOT NULL,
  `synopsis` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_issues`
--

LOCK TABLES `tbl_issues` WRITE;
/*!40000 ALTER TABLE `tbl_issues` DISABLE KEYS */;
INSERT INTO `tbl_issues` VALUES (1,1,'Environment','','Human societies must operate with the understanding that we are part of nature, not separate from nature.  We must maintain an ecological balance and live within the ecological and resource limits of our communities and our planet. We support a sustainable society which utilizes resources in such a way that future generations will benefit and not suffer from the practices of our generation. To this end we must practice agriculture which replenishes the soil; move to an energy efficient economy; and live in ways that respect the integrity of natural systems.','AYE',''),(2,2,'Social Justice and Equal Opportunity','','All persons should have the rights and opportunity to benefit equally from the resources afforded us by society and the environment. We must consciously confront in ourselves, our organizations, and society at large, barriers such as racism and class oppression, sexism and homophobia, ageism and disability, which act to deny fair treatment and equal justice under the law.','AYE',''),(3,1,'Community Based Economics and Economic Justice','','We recognize it is essential to create a vibrant and sustainable economic system, one that can create jobs and provide a decent standard of living for all people while maintaining a healthy ecological balance. A successful economic system will offer meaningful work with dignity, while paying a \"living wage\" which reflects the real value of a person\'s work.\r\nLocal communities must look to economic development that assures protection of the environment and workers\' rights; broad citizen participation in planning; and enhancement of our \"quality of life.\" We support independently owned and operated companies which are socially responsible, as well as co-operatives and public enterprises that distribute resources and control to more people through democratic participation.\r\n','AYE',''),(4,1,'Grassroots Democracy','','Every human being deserves a say in the decisions that affect their lives and not be subject to the will of another. Therefore, we will work to increase public participation at every level of government and to ensure that our public representatives are fully accountable to the people who elect them. We will also work to create new types of political organizations which expand the process of participatory democracy by directly including citizens in the decision-making process.','AYE',''),(5,1,'Feminism and Gender Equality','','We have inherited a social system based on male domination of politics and economics. We call for the replacement of the cultural ethics of domination and control with more cooperative ways of interacting that respect differences of opinion and gender. Human values such as equity between the sexes, interpersonal responsibility, and honesty must be developed with moral conscience. We should remember that the process that determines our decisions and actions is just as important as achieving the outcome we want.','AYE',''),(6,1,'Nonviolence','','It is essential that we develop effective alternatives to society\'s current patterns of violence. We will work to demilitarize, and eliminate weapons of mass destruction, without being naive about the intentions of other governments.  We recognize the need for self-defense and the defense of others who are in helpless situations. We promote non-violent methods to oppose practices and policies with which we disagree, and will guide our actions toward lasting personal, community and global peace.','AYE','cosmo'),(7,1,'Decentralization','','Centralization of wealth and power contributes to social and economic injustice, environmental destruction, and militarization. Therefore, we support a restructuring of social, political and economic institutions away from a system which is controlled by and mostly benefits the powerful few, to a democratic, less bureaucratic system. Decision-making should, as much as possible, remain at the individual and local level, while assuring that civil rights are protected for all citizens.','AYE',''),(8,1,'Diversity','','We believe it is important to value cultural, ethnic, racial, sexual, religious and spiritual diversity, and to promote the development of respectful relationships across these lines.\r\nWe believe that the many diverse elements of society should be reflected in our organizations and decision-making bodies, and we support the leadership of people who have been traditionally closed out of leadership roles. We acknowledge and encourage respect for other life forms than our own and the preservation of biodiversity.\r\n','AYE',''),(9,1,'Personal and Global Responsibility','','We encourage individuals to act to improve their personal well-being and, at the same time, to enhance ecological balance and social harmony. We seek to join with people and organizations around the world to foster peace, economic justice, and the health of the planet.','AYE',''),(10,1,'Future Focus and Sustainability','','Our actions and policies should be motivated by long-term goals. We seek to protect valuable natural resources, safely disposing of or \"unmaking\" all waste we create, while developing a sustainable economics that does not depend on continual expansion for survival. We must counterbalance the drive for short-term profits by assuring that economic development, new technologies, and fiscal policies are responsible to future generations who will inherit the results of our actions.','AYE','');
/*!40000 ALTER TABLE `tbl_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_legislation`
--

DROP TABLE IF EXISTS `tbl_legislation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_legislation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `legislation_name` varchar(100) NOT NULL,
  `legislation_date` date NOT NULL,
  `description` text NOT NULL,
  `body_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `bill_number` varchar(25) NOT NULL,
  `synopsis` text NOT NULL,
  `voting_body` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_legislation`
--

LOCK TABLES `tbl_legislation` WRITE;
/*!40000 ALTER TABLE `tbl_legislation` DISABLE KEYS */;
INSERT INTO `tbl_legislation` VALUES (1,1,'Bill 42-989','1999-01-03','This bill was designed to shift the tax burden from the rich to the poor in any way possible hoohah',1,1994,'test','',2),(2,1,'Bill 42-93','2000-01-01','This bill will bulldoze many trees in order to make way for parking lotsz',1,1994,'test','',2),(3,2,'ICC Bill 51-99','1999-01-01','This bill was snuck in in the middle of the night.',1,1994,'test','',2),(4,2,'ICC Bill 51-00','2000-01-01','This bill was paid for by the development interests',1,1994,'test','',2),(5,4,'Bill 42-92','1992-08-02','suburb building progresses',1,1994,'test','',2),(36,1,'for watkins mill','2013-10-01','test',1,2013,'test','',2),(37,1,'Another Watkins Mill','2013-10-01','yes another Watkin\'s Mill Creek bill',1,2013,'test','',4),(52,12,'boondoggie','2013-10-14','boonie',1,2013,'test','',2),(53,12,'Bill for Road to Hell','1994-10-01','test bill to hell',1,1994,'test','',2),(54,1,'Bill to make everybody feel good and do nothing','2001-01-01','This bill is pollyanna',1,1994,'test','',2),(56,14,'Single Payer Commission','2013-12-22','This is the descr. of the Single Payer Commission\r\ncreating a path to the healthiest, least expensive, and most compassionate approach to health care	Single payer health care insurance is a well-proven approach to providing better health care for far less cost than current federal and private insurance. As \"very large group insurance\" with 90% savings on paperwork, all residents can be covered and society\'s health improves. Canada has decades\' worth of successful experience. A proposal for a commission to create a path to implementation under the federal Affordable Care Act was presented to the Council by the Health Committee.',1,2013,'test','',2),(57,15,'Ssave 10 Mile creek','2001-12-20','test 123',1,2013,'test','',2),(65,2,'Increase enforcement of ban on discrimination against elderly in housing','2011-11-22','County Council was presented with a proposal to formally prohibit discrimination against the elderly in housing, by creating a dedicated position in the Office of Landlor-Tenant Affairs to focus on this issue and handle the many cases reported.  This position would work with landlords to assist them creating handicapped-accessible modifications including tax deductions, since this will allow the County\'s ageing population to stay in place and greatly reduce the drain on public funds for special housing and aides.',1,2013,'update','',2),(67,9,'Sister Province of Axum, Ethiopia','2013-12-03','The County Council considered a proposal to partner with Axum to introduce the proven sustainable development model of the Greenbelt Movement to both jurisdictions. Since Montgomery County has a large Ethiopian population, this provides a direct feedback link and uses the expertise of Montgomery Councy citizens.  The method is an integrated four-part program of reforestation, girls and womens empowerment, poverty reduction, and local democracy.  The model is Duluth, Minnesota\'s successful partnership with Petrozavodsk, Russia, with dramatic increases in health and development in that Russian town. The goal for this program is to increase the measurement indices for the four focus areas in both jurisdictions.',1,2013,'Bill aa-bb','',2),(68,8,'Budget for Office of Human Rights','2013-12-18','The County Executive proposed cutting the Office of Human Rights by 50% for FY2015.  This Office is currently responsible for monitoring a large range of racial, gender, and ethnic participation rates for programs and employment across the county. Without full funding, our public officials and we voters will not know the state of diversity in the County, and not be able to evaluate objectivity of program benefits and hiring.',1,2013,'test','',2),(69,4,'County Council-generated referendum on state level ballot referendums','2014-04-17','Maryland is one of the few states in the country that does not allow any grassroots initiatives on the state ballot.  Montgomery County allows referenda for County issues. County Council considered a proposal to express the County citizens\' wishes to change this state policy by demonstrating our own strong support and use of this grassroots democracy tool. The Council voted to put a referendum on the Montgomery County ballot, urging the state legislature to reverse the state-level ban. ',1,2013,'test','syn test 123',2),(71,7,'Permitting Local Town Incorporations for County Purposes','2013-10-01','In the 1970s, in a bid to centralize government control at the county and state levels and away from the local level, the Maryland State Legislature outlawed the creation of additional local towns. Existing local townships and villages already incorporated, such as Rockville, Gaithersburg, Derwood, and Chevy Chase were allowed to continue, but no new towns could be formed.  County Council was presented with a proposal to allow a workaround to the state law for new townships for County government purposes only. This would enhance community networks, promote further local and personal responsibility, and allow increased sustainability measures.  Local towns are a proven laboratory for innovative measures, and average higher incomes, home ownership, and many other advantages of caring, close-knit communities.',1,2013,'test','',2),(78,2,'Bill to increase wealth gap in County','2013-12-03','(This case has \"No\" as the preferred vote, for test purposes.)  Proposal to provide guaranteed profit margin of 15% for electric utility. This will benefit only the stockholders of the local utility PEPCO, and since 50% of Americans don\'t own stock at all, this is a welfare transfer from the middle class to the upper class.',1,2013,'test','',2),(79,3,'Real life economic indicators for County Office of Management and Budget','2012-11-06','The Office of Management and Budget is directed to calculate the \"real life\" state of the Montgomery County economy using the Sustainable Seattle indicator system instead of derivatives of the Maryland Grosss Domestic Product (GDP). This indicator system will become the main publication and self-evaluation of County quality of life, and include health care, food security, education, disposable time, as well as housing security.',1,2013,'mm-nn','',2),(81,6,'Ban on mililtary humvee tanks for Montgomery County police','2013-11-09','The US Army is offering free tanks to local police throughout the United States. These are returning tanks from the war in Afghanistan. Humvees and other advanced military weaponry are inappropriate to the civilian life and law enforcement methods.  County Council considered a proposal banning the County police from accepting surplus military weapons except for individual police equipment with a waiver from County Council.  The police force would be responsible for any repair, upgrades, and maintenance out of their current budget.',1,2013,'nn-mm','synopsis test 123  3-11-09	The US Army is offering free tanks to local police throughout the United States. These are returning tanks from the war in Afghanistan. Humvees and other advanced military weaponry are inappropriate to the civilian life and law enforcement methods. County Council considered a proposal banning the County police from accepting surplus military weapons except for individual police equipment with a waiver from County Council. The police force would be responsible for any repair, upgrades, and maintenance out of their current budget.',2),(82,3,'Costgo gas station in Wheaton','2013-12-02','County Council was asked to approve a major violation of the Wheaton zoning and other County requirements in order to allow a cut-price store that pays very low wages to bring thousands of cars near a school for breathing-difficulty kids.',1,2013,'test','',2),(83,3,'MInimum wage bill','2013-12-19','Minimum wage to $11.50 over three years',1,2013,'test','',2),(84,10,'100-year assessment of proposed legislation','2013-12-08','County Council considered a proposal for the sponsor of any legislation to add a section at th end of each bill on the envisioned effect on the County both (a) after 100 years of this policy; and (b) at 100 years, a snapshot. This extended Social/Environmental/Economic Impact Statement (SEEIS) will help the public and political leaders think of the true total cost and benefits of new legislation',1,2013,'test','',2),(85,5,'Creates crime of purchasing sex instead of selling sexual services ','2013-12-17','Following the very successful model implemented in Sweden that drastically reduced prostitution with no increase in enforcement cost, County Council considered a proposal to make it illegal to buy sexual services, but not to sell them. Pimping, procuring and operating a brothel are also illegal. The criminalisation of the purchasing, but not selling, of sex was unique when first enacted in 1999. The historical discrimination of arresting only the women prostitutes, while the male clients were not arrested, has resulted in distorted use of public resources for law enforcement, and contributed to a perpetual, violent environment for women sex workers, yet allowed the industry to continue flourishing since the \"market\" and continued the demand for services with no negative consequences on the demandn side. Since 95% of women prostitutes have been sexually abused as children, many are trapped into prostitution with forced drug use, and their mortality rate is 40 times the national average, this approach should both reduce the prostitution rate, and improve the health and welfare of young women in particular. The average age of entry into prostitution in the US is 13 years old.',1,2013,'dd-ee','',2),(86,1,'Appointment of Sam Someone to Planning Board','2012-07-11','Sam Someone is a strong supporter of rapid population growth and real estate development for the County and surrounding regions. His candidacy was supported strongly by the wealthy developers with many billions of dollars of applications to come before the Park and Planning Commission. He was opposed by the citizen groups whose stable, prosperous neighborhoods are the basis of Montgomery County\'s good reputation. The only two members of County Council which do not accept campaign contributions from real estate developers, were the only two votes against Mr. Someone.',1,2013,'testx','',2),(87,4,'john test','2014-01-15','desc',1,2013,'bb-cc','synopisis',2),(88,4,'Instant Runoff Voting/Ranked Voting for all County elections','2014-01-07','The Citizenship Committee of the Council was presented with a proposal to use the Instant Runoff Voting/Ranked Voting approach for all County elections.  This approach allows for the most accurate outcome reflecting the voters\' wishes, with multiple candidates instead of just two candidates.  A third, fourth, or fifth party does not \"spoil\" an election for their side, by taking away votes from the most similar large party. Since Montgomery County and Maryland have six registered, legitimate parties, this is fairer to the electorate to allow them to express their political views accurately, and stops \"fear-of-opposition\" based voting.',1,2013,'ee-ff','',2),(91,4,'Poll watching by any person','2014-01-09','Currently, the Maryland State Board of Elections requires certification from a registered party for a person to observe the vote counting process, including watching the voting machines have the vote totals taken off them right after closing at 8 p.m., and the right to ask questions about discrepancies between recorded voters and number of voters. The Council considered a proposal to send a recommendation to the State Board of Elections to remove these restrictions.  Any person with an interest, including observers from another state (such as a lawyer monitoring voting counts who happens to live in Virginia personally), a minor, and an independent who has chosen no party affiliation could observe the vote counts and tallies.',1,2013,'gg-hh','syno',2),(92,6,'Ban on acquisition of tasers until proven non-lethal','2013-11-06','Tasers were introduced to local police work across the United States in the 1980s. The corporate and police assertion that tasers are non-lethal, and safer than firearms, has been disproven in 30 years of local use. Local police in other jurisdictions have killed hundreds of people, when they would not have drawn a gun and found other means of subduing suspects. County Council was presented with a ban until further technological controls on the devices would prevent overuse or other solutions are presented to stop killing with supposedly non-lethal weapons.',1,2013,'xx-yy','',2),(93,6,'Ban on acquisition of tasers til they are proven non-LETHAL','2014-01-06','asers were introduced to local police work across the United States in the 1980s. The corporate and police assertion that tasers are non-lethal, and safer than firearms, has been disproven in 30 years of local use. Local police in other jurisdictions have killed hundreds of people, when they would not have drawn a gun and found other means of subduing suspects. County Council was presented with a ban until further technological controls on the devices would prevent overuse or other solutions are presented to stop killing with supposedly non-lethal weapons.',1,2013,'12-34','synops',2),(94,6,'','0000-00-00','',1,2013,'','',2),(95,6,'hope it works','2014-01-16','descr 1',1,2013,'22-32 hike','syn 1',2),(96,2,'health','2014-01-01','asdasdfsdf',1,2013,'12-34','23',2),(97,6,'nonvio test 123','2014-01-06','pub safety',1,2013,'12-34-56','asdfasdf',2),(98,6,'nv 234','2014-01-02','trans',1,2013,'234-123','trans',2),(99,6,'nv 234','2014-01-02','trans',1,2013,'234-123','trans',2),(100,6,'AAAA nv','2014-01-02','plan',1,2013,'asd','adsfasdf',2);
/*!40000 ALTER TABLE `tbl_legislation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_municipalities`
--

DROP TABLE IF EXISTS `tbl_municipalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_municipalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `county_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_municipalities`
--

LOCK TABLES `tbl_municipalities` WRITE;
/*!40000 ALTER TABLE `tbl_municipalities` DISABLE KEYS */;
INSERT INTO `tbl_municipalities` VALUES (1,'Takoma Park',1,1),(2,'Kensington',1,1);
/*!40000 ALTER TABLE `tbl_municipalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_parties`
--

DROP TABLE IF EXISTS `tbl_parties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `body_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_parties`
--

LOCK TABLES `tbl_parties` WRITE;
/*!40000 ALTER TABLE `tbl_parties` DISABLE KEYS */;
INSERT INTO `tbl_parties` VALUES (1,'Democrat',1),(2,'Republican',1),(3,'Green',1),(4,'Libertarian',1);
/*!40000 ALTER TABLE `tbl_parties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_states`
--

DROP TABLE IF EXISTS `tbl_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_states`
--

LOCK TABLES `tbl_states` WRITE;
/*!40000 ALTER TABLE `tbl_states` DISABLE KEYS */;
INSERT INTO `tbl_states` VALUES (1,'Maryland'),(2,'Virginia'),(3,'District of Columbia'),(4,'Delaware'),(5,'West Virginia');
/*!40000 ALTER TABLE `tbl_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_vote_types`
--

DROP TABLE IF EXISTS `tbl_vote_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_vote_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote` varchar(20) NOT NULL,
  `actual_vote` int(11) NOT NULL,
  `special_consideration` tinyint(4) NOT NULL,
  `special_consideration_text` varchar(50) NOT NULL,
  `body_id` int(11) NOT NULL,
  `displayorder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_vote_types`
--

LOCK TABLES `tbl_vote_types` WRITE;
/*!40000 ALTER TABLE `tbl_vote_types` DISABLE KEYS */;
INSERT INTO `tbl_vote_types` VALUES (-1,'N/A',0,0,'',1,5),(1,'yes',0,0,'',1,1),(2,'no',0,0,'',1,2),(3,'abstain',0,0,'',1,3),(4,'absent',0,0,'',1,4);
/*!40000 ALTER TABLE `tbl_vote_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_voters`
--

DROP TABLE IF EXISTS `tbl_voters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_voters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `party_id` int(11) NOT NULL,
  `body_id` int(11) NOT NULL,
  `district` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_voters`
--

LOCK TABLES `tbl_voters` WRITE;
/*!40000 ALTER TABLE `tbl_voters` DISABLE KEYS */;
INSERT INTO `tbl_voters` VALUES (1,'Bruce','Adams',2,1,NULL),(2,'Derick','Berlage',1,1,NULL),(3,'Nancy','Dacek',1,1,NULL),(4,'Gail','Ewing',2,1,NULL),(5,'William','Hanna',1,1,NULL),(6,'Betty Ann','Krahnke',1,1,NULL),(7,'Isiah','Legget',1,1,NULL),(8,'Marilyn','Praisner',2,1,NULL),(9,'Michael','Subin',3,1,NULL),(10,'Phil','Andrews',1,1,'District 3'),(11,'Roger','Berliner',1,1,'District 1'),(12,'Craig','Rice',1,1,'District 2'),(13,'Nancy','Navarro',1,1,'District 4'),(14,'Valerie','Ervin',1,1,'District 5'),(15,'Marc','Elrich',1,1,'At Large'),(16,'Nancy','Floreen',1,1,'At Large'),(17,'George','Leventhal',1,1,'At Large'),(18,'Hans','Riemer',1,1,'At Large');
/*!40000 ALTER TABLE `tbl_voters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_votes`
--

DROP TABLE IF EXISTS `tbl_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legislation_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `vote_type_id` int(11) NOT NULL,
  `vote_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cns_votes_legislation` (`legislation_id`),
  CONSTRAINT `cns_leg_id` FOREIGN KEY (`legislation_id`) REFERENCES `tbl_legislation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_votes`
--

LOCK TABLES `tbl_votes` WRITE;
/*!40000 ALTER TABLE `tbl_votes` DISABLE KEYS */;
INSERT INTO `tbl_votes` VALUES (1,1,1,1,0),(2,1,2,2,0),(3,1,3,2,0),(4,1,4,2,0),(5,1,5,3,0),(6,1,6,1,0),(7,1,7,2,0),(8,1,8,2,0),(9,1,9,2,0),(11,2,1,3,0),(12,2,2,3,0),(13,2,3,3,0),(14,2,4,1,0),(15,2,5,2,0),(16,2,6,1,0),(17,2,7,1,0),(18,2,8,3,0),(19,2,9,2,0),(20,3,1,2,0),(21,3,2,2,0),(22,3,3,3,0),(23,3,4,1,0),(24,3,5,2,0),(25,3,6,1,0),(26,3,7,1,0),(27,3,8,2,0),(28,3,9,3,0),(29,4,1,1,0),(30,4,2,2,0),(31,4,3,3,0),(32,4,4,1,0),(33,4,5,1,0),(34,4,6,1,0),(35,4,7,2,0),(36,4,8,3,0),(37,4,9,1,0),(39,5,1,1,0),(40,5,2,2,0),(41,5,3,3,0),(42,5,4,2,0),(43,5,5,1,0),(44,5,6,2,0),(45,5,7,1,0),(46,5,8,2,0),(47,5,9,1,0),(49,36,10,2,0),(50,36,11,3,0),(51,36,15,2,0),(52,36,14,1,0),(53,36,16,1,0),(54,36,17,1,0),(55,36,13,2,0),(56,36,12,1,0),(57,36,18,1,0),(58,37,10,2,0),(59,37,11,2,0),(60,37,15,2,0),(61,37,14,2,0),(62,37,16,3,0),(63,37,17,1,0),(64,37,13,1,0),(65,37,12,1,0),(66,37,18,1,0),(148,52,10,2,0),(149,52,11,2,0),(150,52,15,2,0),(151,52,14,1,0),(152,52,16,1,0),(153,52,17,1,0),(154,52,13,1,0),(155,52,12,2,0),(156,52,18,3,0),(157,53,1,3,0),(158,53,2,1,0),(159,53,3,2,0),(160,53,4,2,0),(161,53,5,1,0),(162,53,6,2,0),(163,53,7,3,0),(164,53,8,3,0),(165,53,9,1,0),(166,54,1,2,0),(167,54,2,2,0),(168,54,3,2,0),(169,54,4,2,0),(170,54,5,2,0),(171,54,6,2,0),(172,54,7,2,0),(173,54,8,2,0),(174,54,9,1,0),(184,56,10,3,0),(185,56,11,2,0),(186,56,15,3,0),(187,56,14,2,0),(188,56,16,3,0),(189,56,17,2,0),(190,56,13,3,0),(191,56,12,2,0),(192,56,18,3,0),(193,65,10,1,0),(194,65,15,1,0),(195,65,17,4,0),(196,65,12,4,0),(197,65,18,-1,0),(207,67,10,1,0),(208,67,11,1,0),(209,67,15,1,0),(210,67,14,1,0),(211,67,16,4,0),(212,67,17,1,0),(213,67,13,1,0),(214,67,12,2,0),(215,67,18,1,0),(216,68,10,2,0),(217,68,11,2,0),(218,68,15,2,0),(219,68,14,1,0),(220,68,16,2,0),(221,68,17,1,0),(222,68,13,2,0),(223,68,12,1,0),(224,68,18,1,0),(225,69,10,4,0),(226,69,11,3,0),(227,69,15,1,0),(228,69,14,2,0),(229,69,16,1,0),(230,69,17,1,0),(231,69,13,2,0),(232,69,12,6,0),(233,69,18,3,0),(234,71,10,1,0),(235,71,11,4,0),(236,71,15,1,0),(237,71,14,1,0),(238,71,16,1,0),(239,71,17,2,0),(240,71,13,6,0),(241,71,12,2,0),(242,71,18,2,0),(256,75,10,2,0),(257,75,11,2,0),(258,75,15,2,0),(259,75,14,2,0),(260,75,16,2,0),(261,75,17,2,0),(262,75,13,2,0),(263,75,12,1,0),(264,75,18,1,0),(283,78,10,2,0),(284,78,11,2,0),(285,78,15,2,0),(286,78,14,1,0),(287,78,16,1,0),(288,78,17,2,0),(289,78,13,2,0),(290,78,12,2,0),(291,78,18,2,0),(292,79,10,1,0),(293,79,11,1,0),(294,79,15,1,0),(295,79,14,1,0),(296,79,16,1,0),(297,79,17,2,0),(298,79,13,2,0),(299,79,12,3,0),(300,79,18,2,0),(310,81,10,4,0),(311,81,11,1,0),(312,81,15,1,0),(313,81,14,1,0),(314,81,16,1,0),(315,81,17,-1,0),(316,81,13,-1,0),(317,81,12,-1,0),(318,81,18,-1,0),(319,82,10,2,0),(320,82,11,2,0),(321,82,15,2,0),(322,82,14,1,0),(323,82,16,1,0),(324,82,17,1,0),(325,82,13,1,0),(326,82,12,1,0),(327,82,18,1,0),(328,83,10,2,0),(329,83,11,1,0),(330,83,15,1,0),(331,83,14,1,0),(332,83,16,1,0),(333,83,17,1,0),(334,83,13,1,0),(335,83,12,1,0),(336,83,18,1,0),(337,84,10,1,0),(338,84,11,2,0),(339,84,15,1,0),(340,84,14,1,0),(341,84,16,1,0),(342,84,17,2,0),(343,84,13,1,0),(344,84,12,2,0),(345,84,18,2,0),(346,85,10,1,0),(347,85,11,1,0),(348,85,15,1,0),(349,85,14,1,0),(350,85,16,1,0),(351,85,17,2,0),(352,85,13,2,0),(353,85,12,2,0),(354,85,18,2,0),(355,86,10,2,0),(356,86,11,1,0),(357,86,15,2,0),(358,86,14,1,0),(359,86,16,-1,0),(360,86,17,1,0),(361,86,13,1,0),(362,86,12,1,0),(363,86,18,1,0),(364,94,10,-1,0),(365,94,11,-1,0),(366,94,15,-1,0),(367,94,14,-1,0),(368,94,16,-1,0),(369,94,17,-1,0),(370,94,13,-1,0),(371,94,12,-1,0),(372,94,18,-1,0),(373,95,10,1,0),(374,95,11,2,0),(375,95,15,3,0),(376,95,14,2,0),(377,95,16,1,0),(378,95,17,-1,0),(379,95,13,-1,0),(380,95,12,-1,0),(381,95,18,-1,0),(382,96,10,-1,0),(383,96,11,-1,0),(384,96,15,-1,0),(385,96,14,-1,0),(386,96,16,-1,0),(387,96,17,-1,0),(388,96,13,-1,0),(389,96,12,-1,0),(390,96,18,-1,0),(391,97,10,1,0),(392,97,11,-1,0),(393,97,15,2,0),(394,97,14,-1,0),(395,97,16,-1,0),(396,97,17,1,0),(397,97,13,-1,0),(398,97,12,-1,0),(399,97,18,-1,0),(400,98,10,-1,0),(401,98,11,-1,0),(402,98,15,-1,0),(403,98,14,-1,0),(404,98,16,-1,0),(405,98,17,-1,0),(406,98,13,-1,0),(407,98,12,-1,0),(408,98,18,-1,0),(409,99,10,-1,0),(410,99,11,-1,0),(411,99,15,-1,0),(412,99,14,-1,0),(413,99,16,-1,0),(414,99,17,-1,0),(415,99,13,-1,0),(416,99,12,-1,0),(417,99,18,-1,0),(418,100,10,1,0),(419,100,11,-1,0),(420,100,15,-1,0),(421,100,14,-1,0),(422,100,16,-1,0),(423,100,17,-1,0),(424,100,13,-1,0),(425,100,12,-1,0),(426,100,18,-1,0);
/*!40000 ALTER TABLE `tbl_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_voting_bodies`
--

DROP TABLE IF EXISTS `tbl_voting_bodies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_voting_bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_voting_bodies`
--

LOCK TABLES `tbl_voting_bodies` WRITE;
/*!40000 ALTER TABLE `tbl_voting_bodies` DISABLE KEYS */;
INSERT INTO `tbl_voting_bodies` VALUES (1,'Education',1),(2,'Government Operations and Fiscal Policy',2),(3,'Health and Human Services',3),(4,'Planning, Housing and Economic Development',4),(5,'Public Safety',5),(6,'Transportation, Infrastructure, Energy and Environment',6);
/*!40000 ALTER TABLE `tbl_voting_bodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_years`
--

DROP TABLE IF EXISTS `tbl_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_years` (
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_years`
--

LOCK TABLES `tbl_years` WRITE;
/*!40000 ALTER TABLE `tbl_years` DISABLE KEYS */;
INSERT INTO `tbl_years` VALUES (1990),(1991),(1992),(1993),(1994),(1995),(1996),(1997),(1998),(1999),(2000),(2001),(2002),(2003),(2004),(2005),(2006),(2007),(2008),(2009),(2010),(2011),(2012),(2013);
/*!40000 ALTER TABLE `tbl_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fred','27a0f645e20497a65f997aef769b2c72324d983a92faac73e9cd467173466641');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-06 19:24:08
