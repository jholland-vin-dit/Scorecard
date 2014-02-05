-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 05, 2014 at 12:39 PM
-- Server version: 5.5.35
-- PHP Version: 5.4.4-14+deb7u7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scorecard`
--
CREATE DATABASE `scorecard` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `scorecard`;

-- --------------------------------------------------------

--
-- Table structure for table `mtx_legis_party_desired_vote_types`
--

CREATE TABLE IF NOT EXISTS `mtx_legis_party_desired_vote_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legislation_id` int(11) NOT NULL,
  `desired_vote_type_id` int(11) NOT NULL,
  `party_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cns_leg_id2` (`legislation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='desirable votes for a party for a legislation(bill)-can be m' AUTO_INCREMENT=159 ;

--
-- Dumping data for table `mtx_legis_party_desired_vote_types`
--

INSERT INTO `mtx_legis_party_desired_vote_types` (`id`, `legislation_id`, `desired_vote_type_id`, `party_id`) VALUES
(1, 1, 2, 3),
(2, 2, 2, 3),
(3, 3, 2, 3),
(4, 4, 2, 3),
(5, 5, 2, 3),
(16, 52, 2, 3),
(17, 53, 1, 3),
(18, 54, 1, 3),
(20, 56, 2, 3),
(23, 0, 4, 3),
(24, 0, 4, 3),
(25, 0, 4, 3),
(26, 0, 4, 3),
(35, 67, 1, 3),
(36, 68, 1, 3),
(37, 69, 1, 3),
(39, 71, 1, 3),
(43, 75, 1, 3),
(46, 78, 2, 3),
(47, 79, 1, 3),
(49, 81, 1, 3),
(50, 82, 2, 0),
(51, 83, 1, 3),
(52, 84, 1, 3),
(53, 85, 1, 3),
(54, 86, 2, 3),
(56, 88, 1, 3),
(59, 91, 4, 3),
(60, 92, 1, 3),
(69, 101, 1, 3),
(70, 102, 1, 3),
(71, 103, 1, 3),
(75, 107, 1, 3),
(77, 109, 1, 3),
(79, 111, 2, 3),
(80, 112, 1, 3),
(145, 177, 1, 3),
(153, 185, 1, 3),
(154, 186, 2, 3),
(155, 187, 1, 3),
(156, 188, 1, 3),
(157, 189, 1, 3),
(158, 190, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mtx_voters_bodies`
--

CREATE TABLE IF NOT EXISTS `mtx_voters_bodies` (
  `voter_id` int(11) NOT NULL,
  `body_id` int(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mtx_voters_bodies`
--

INSERT INTO `mtx_voters_bodies` (`voter_id`, `body_id`, `year`) VALUES
(1, 1, 1994),
(2, 1, 1994),
(3, 1, 1994),
(4, 1, 1994),
(5, 1, 1994),
(6, 1, 1994),
(7, 1, 1994),
(8, 1, 1994),
(9, 1, 1994),
(10, 1, 2013),
(11, 1, 2013),
(12, 1, 2013),
(13, 1, 2013),
(14, 1, 2013),
(15, 1, 2013),
(16, 1, 2013),
(17, 1, 2013),
(18, 1, 2013);

-- --------------------------------------------------------

--
-- Table structure for table `str_menu_links`
--

CREATE TABLE IF NOT EXISTS `str_menu_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` decimal(2,0) NOT NULL,
  `name` varchar(40) NOT NULL,
  `url` varchar(50) NOT NULL,
  `short_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `str_menu_links`
--

INSERT INTO `str_menu_links` (`id`, `sort`, `name`, `url`, `short_name`) VALUES
(1, 0, 'Add/edit/delete big issues', 'aed_big_issues,php', 'aed_big_issues'),
(2, 0, 'Add/edit/delete issues', 'aed_issues.php', 'aed_issues'),
(3, 0, 'Add/edit/delete legislation', 'aed_legislation.php', 'aed_legislation'),
(4, 0, 'Add/edit/delete parties', 'aed_parties.php', 'aed_parties'),
(5, 0, 'Add/edit/delete bodies', 'aed_bodies.php', 'aed_bodies'),
(6, 0, 'Add/edit/delete voters', 'aed_voters.php', 'aed_voters'),
(7, 0, 'Add/edit/delete votes', 'aed_votes.php', 'aed_votes'),
(8, 0, 'Add/edit/delete vote types', 'aed_vote_types.php', 'aed_vote_types');

-- --------------------------------------------------------

--
-- Table structure for table `str_sub_tables`
--

CREATE TABLE IF NOT EXISTS `str_sub_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_table_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `str_sub_tables`
--

INSERT INTO `str_sub_tables` (`id`, `sub_table_id`, `table_id`) VALUES
(4, 6, 3),
(5, 7, 3),
(6, 8, 3),
(7, 7, 4),
(8, 8, 2),
(9, 3, 2),
(10, 4, 5),
(11, 2, 1),
(12, 5, 1),
(13, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `str_table_columns`
--

CREATE TABLE IF NOT EXISTS `str_table_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `column_name` varchar(30) NOT NULL,
  `column_type` varchar(20) NOT NULL,
  `column_length` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `str_table_columns`
--

INSERT INTO `str_table_columns` (`id`, `table_id`, `column_name`, `column_type`, `column_length`) VALUES
(1, 3, 'name', 'varchar', 100),
(2, 6, 'vote', 'varchar', 20),
(3, 7, 'name', 'varchar', 100),
(4, 8, 'name', 'varchar', 50),
(6, 9, 'year', 'varchar', 4);

-- --------------------------------------------------------

--
-- Table structure for table `str_tables`
--

CREATE TABLE IF NOT EXISTS `str_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `str_tables`
--

INSERT INTO `str_tables` (`id`, `name`, `screen_name`) VALUES
(1, 'tbl_votes', 'Votes'),
(2, 'tbl_voters', 'Voters'),
(3, 'tbl_bodies', 'Bodies'),
(4, 'tbl_issues', 'Issues'),
(5, 'tbl_legislation', 'Legislation'),
(6, 'tbl_vote_types', 'Vote types'),
(7, 'tbl_big_issues', 'Big issues'),
(8, 'tbl_parties', 'Parties'),
(9, 'tbl_years', 'Years');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_big_issues`
--

CREATE TABLE IF NOT EXISTS `tbl_big_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_big_issues`
--

INSERT INTO `tbl_big_issues` (`id`, `name`, `body_id`) VALUES
(1, 'Environment', 1),
(2, 'Social Justice', 1),
(3, 'Community Based Economics and Economic Justice', 1),
(4, 'Grassroots Democracy', 1),
(5, 'Feminism and Gender Equality', 1),
(6, 'Nonviolence', 1),
(7, 'Decentralization', 1),
(8, 'Diversity', 1),
(9, 'Personal and Global Responsibility', 1),
(10, 'Future Focus and Sustainability', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bodies`
--

CREATE TABLE IF NOT EXISTS `tbl_bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_bodies`
--

INSERT INTO `tbl_bodies` (`id`, `name`) VALUES
(1, 'County Council Scorecard  2011-2014');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_counties`
--

CREATE TABLE IF NOT EXISTS `tbl_counties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_counties`
--

INSERT INTO `tbl_counties` (`id`, `name`, `state_id`) VALUES
(1, 'Montgomery', 1),
(2, 'Prince George''s', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_issues`
--

CREATE TABLE IF NOT EXISTS `tbl_issues` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `big_issue_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `pro_environment_vote` varchar(3) NOT NULL,
  `synopsis` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_issues`
--

INSERT INTO `tbl_issues` (`id`, `big_issue_id`, `title`, `subtitle`, `description`, `pro_environment_vote`, `synopsis`) VALUES
(1, 1, 'Environment', '', 'Human societies must operate with the understanding that we are part of nature, not separate from nature.  We must maintain an ecological balance and live within the ecological and resource limits of our communities and our planet. We support a sustainable society which utilizes resources in such a way that future generations will benefit and not suffer from the practices of our generation. To this end we must practice agriculture which replenishes the soil; move to an energy efficient economy; and live in ways that respect the integrity of natural systems.', 'AYE', ''),
(2, 2, 'Social Justice and Equal Opportunity', '', 'All persons should have the rights and opportunity to benefit equally from the resources afforded us by society and the environment. We must consciously confront in ourselves, our organizations, and society at large, barriers such as racism and class oppression, sexism and homophobia, ageism and disability, which act to deny fair treatment and equal justice under the law.', 'AYE', ''),
(3, 1, 'Community Based Economics and Economic Justice', '', 'We recognize it is essential to create a vibrant and sustainable economic system, one that can create jobs and provide a decent standard of living for all people while maintaining a healthy ecological balance. A successful economic system will offer meaningful work with dignity, while paying a "living wage" which reflects the real value of a person''s work.\r\nLocal communities must look to economic development that assures protection of the environment and workers'' rights; broad citizen participation in planning; and enhancement of our "quality of life." We support independently owned and operated companies which are socially responsible, as well as co-operatives and public enterprises that distribute resources and control to more people through democratic participation.\r\n', 'AYE', ''),
(4, 1, 'Grassroots Democracy', '', 'Every human being deserves a say in the decisions that affect their lives and not be subject to the will of another. Therefore, we will work to increase public participation at every level of government and to ensure that our public representatives are fully accountable to the people who elect them. We will also work to create new types of political organizations which expand the process of participatory democracy by directly including citizens in the decision-making process.', 'AYE', ''),
(5, 1, 'Feminism and Gender Equality', '', 'We have inherited a social system based on male domination of politics and economics. We call for the replacement of the cultural ethics of domination and control with more cooperative ways of interacting that respect differences of opinion and gender. Human values such as equity between the sexes, interpersonal responsibility, and honesty must be developed with moral conscience. We should remember that the process that determines our decisions and actions is just as important as achieving the outcome we want.', 'AYE', ''),
(6, 1, 'Nonviolence', '', 'It is essential that we develop effective alternatives to society''s current patterns of violence. We will work to demilitarize, and eliminate weapons of mass destruction, without being naive about the intentions of other governments.  We recognize the need for self-defense and the defense of others who are in helpless situations. We promote non-violent methods to oppose practices and policies with which we disagree, and will guide our actions toward lasting personal, community and global peace.', 'AYE', 'cosmo'),
(7, 1, 'Decentralization', '', 'Centralization of wealth and power contributes to social and economic injustice, environmental destruction, and militarization. Therefore, we support a restructuring of social, political and economic institutions away from a system which is controlled by and mostly benefits the powerful few, to a democratic, less bureaucratic system. Decision-making should, as much as possible, remain at the individual and local level, while assuring that civil rights are protected for all citizens.', 'AYE', ''),
(8, 1, 'Diversity', '', 'We believe it is important to value cultural, ethnic, racial, sexual, religious and spiritual diversity, and to promote the development of respectful relationships across these lines.\r\nWe believe that the many diverse elements of society should be reflected in our organizations and decision-making bodies, and we support the leadership of people who have been traditionally closed out of leadership roles. We acknowledge and encourage respect for other life forms than our own and the preservation of biodiversity.\r\n', 'AYE', ''),
(9, 1, 'Personal and Global Responsibility', '', 'We encourage individuals to act to improve their personal well-being and, at the same time, to enhance ecological balance and social harmony. We seek to join with people and organizations around the world to foster peace, economic justice, and the health of the planet.', 'AYE', ''),
(10, 1, 'Future Focus and Sustainability', '', 'Our actions and policies should be motivated by long-term goals. We seek to protect valuable natural resources, safely disposing of or "unmaking" all waste we create, while developing a sustainable economics that does not depend on continual expansion for survival. We must counterbalance the drive for short-term profits by assuring that economic development, new technologies, and fiscal policies are responsible to future generations who will inherit the results of our actions.', 'AYE', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_legislation`
--

CREATE TABLE IF NOT EXISTS `tbl_legislation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `legislation_name` varchar(512) NOT NULL,
  `legislation_date` date NOT NULL,
  `description` text NOT NULL,
  `body_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `bill_number` varchar(25) NOT NULL,
  `synopsis` text NOT NULL,
  `voting_body` int(255) DEFAULT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=191 ;

--
-- Dumping data for table `tbl_legislation`
--

INSERT INTO `tbl_legislation` (`id`, `issue_id`, `legislation_name`, `legislation_date`, `description`, `body_id`, `year`, `bill_number`, `synopsis`, `voting_body`, `published`) VALUES
(1, 1, 'Bill 42-989', '1999-01-03', 'This bill was designed to shift the tax burden from the rich to the poor in any way possible hoohah', 1, 1994, 'test', '', 2, 0),
(2, 1, 'Bill 42-93', '2000-01-01', 'This bill will bulldoze many trees in order to make way for parking lotsz', 1, 1994, 'test', '', 2, 0),
(3, 2, 'ICC Bill 51-99', '1999-01-01', 'This bill was snuck in in the middle of the night.', 1, 1994, 'test', '', 2, 0),
(4, 2, 'ICC Bill 51-00', '2000-01-01', 'This bill was paid for by the development interests', 1, 1994, 'test', '', 2, 0),
(5, 4, 'Bill 42-92', '1992-08-02', 'suburb building progresses', 1, 1994, 'test', '', 2, 0),
(52, 12, 'boondoggie', '2013-10-14', 'boonie', 1, 2013, 'test', '', 2, 0),
(53, 12, 'Bill for Road to Hell', '1994-10-01', 'test bill to hell', 1, 1994, 'test', '', 2, 0),
(54, 1, 'Bill to make everybody feel good and do nothing', '2001-01-01', 'This bill is pollyanna', 1, 1994, 'test', '', 2, 0),
(56, 14, 'Single Payer Commission', '2013-12-22', 'This is the descr. of the Single Payer Commission\r\ncreating a path to the healthiest, least expensive, and most compassionate approach to health care	Single payer health care insurance is a well-proven approach to providing better health care for far less cost than current federal and private insurance. As "very large group insurance" with 90% savings on paperwork, all residents can be covered and society''s health improves. Canada has decades'' worth of successful experience. A proposal for a commission to create a path to implementation under the federal Affordable Care Act was presented to the Council by the Health Committee.', 1, 2013, 'test', '', 2, 0),
(67, 9, 'Sister Province of Axum, Ethiopia', '2013-12-03', 'The County Council considered a proposal to partner with Axum to introduce the proven sustainable development model of the Greenbelt Movement to both jurisdictions. Since Montgomery County has a large Ethiopian population, this provides a direct feedback link and uses the expertise of Montgomery Councy citizens.  The method is an integrated four-part program of reforestation, girls and womens empowerment, poverty reduction, and local democracy.  The model is Duluth, Minnesota''s successful partnership with Petrozavodsk, Russia, with dramatic increases in health and development in that Russian town. The goal for this program is to increase the measurement indices for the four focus areas in both jurisdictions.', 1, 2013, 'test', '', 2, 1),
(68, 8, 'Budget for Office of Human Rights', '2013-12-18', 'The County Executive proposed cutting the Office of Human Rights by 50% for FY2015.  This Office is currently responsible for monitoring a large range of racial, gender, and ethnic participation rates for programs and employment across the county. Without full funding, our public officials and we voters will not know the state of diversity in the County, and not be able to evaluate objectivity of program benefits and hiring.', 1, 2013, 'test', '', 2, 1),
(69, 4, 'County Council-generated referendum on state level ballot referendums', '2014-04-17', 'Maryland is one of the few states in the country that does not allow any grassroots initiatives on the state ballot.  Montgomery County allows referenda for County issues. County Council considered a proposal to express the County citizens'' wishes to change this state policy by demonstrating our own strong support and use of this grassroots democracy tool. The Council voted to put a referendum on the Montgomery County ballot, urging the state legislature to reverse the state-level ban. ', 1, 2013, 'test', 'syn test 123', 2, 1),
(71, 7, 'Permitting Local Town Incorporations for County Purposes', '2013-10-01', 'In the 1970s, in a bid to centralize government control at the county and state levels and away from the local level, the Maryland State Legislature outlawed the creation of additional local towns. Existing local townships and villages already incorporated, such as Rockville, Gaithersburg, Derwood, and Chevy Chase were allowed to continue, but no new towns could be formed.  County Council was presented with a proposal to allow a workaround to the state law for new townships for County government purposes only. This would enhance community networks, promote further local and personal responsibility, and allow increased sustainability measures.  Local towns are a proven laboratory for innovative measures, and average higher incomes, home ownership, and many other advantages of caring, close-knit communities.', 1, 2013, 'test', '', 2, 1),
(78, 2, 'Guaranteed profit for electric utility monopoly - increasing the wealth gap in our County', '2013-12-03', '(This case has "No" as the preferred vote, for test purposes.)  Proposal to provide guaranteed profit margin of 15% for electric utility. This will benefit only the stockholders of the local utility PEPCO, and since 50% of Americans don''t own stock at all, this is a welfare transfer from the middle class to the upper class.', 1, 2013, 'test', '', 2, 1),
(79, 3, 'Real life economic indicators for County Office of Management and Budget', '2012-11-06', 'The Office of Management and Budget is directed to calculate the "real life" state of the Montgomery County economy using the Sustainable Seattle indicator system instead of derivatives of the Maryland Grosss Domestic Product (GDP). This indicator system will become the main publication and self-evaluation of County quality of life, and include health care, food security, education, disposable time, as well as housing security.', 1, 2013, 'test', '', 2, 1),
(81, 6, 'Ban on mililtary humvee tanks for Montgomery County police', '2013-11-09', 'The US Army is offering free tanks to local police throughout the United States. These are returning tanks from the war in Afghanistan. Humvees and other advanced military weaponry are inappropriate to the civilian life and law enforcement methods.  County Council considered a proposal banning the County police from accepting surplus military weapons except for individual police equipment with a waiver from County Council.  The police force would be responsible for any repair, upgrades, and maintenance out of their current budget.', 1, 2013, 'test', 'Peace Action''s website', 2, 1),
(82, 3, 'Costgo gas station in Wheaton - protecting children''s health and forest buffers for residential areas', '2012-07-24', 'County Council was asked to approve a major violation of the Wheaton zoning and other County requirements in order to allow a cut-price store that pays very low wages to bring thousands of cars near a school for breathing-difficulty kids.  The County has already granted 20 exemptions from zoning and other regulations to the world''s largest real estate development, Westfield Mall, and Costgo, to bring in this mega store. With 17 gas stations already within a mile of the proposed Costgo megastation site, this proposal undermines local small businesses, harms children with medical problems, and further degrades a fragmenting forest and community.<br><br>\r\nPolitical situation? proposal before Council? vote?<br><br>\r\n\r\nThe desired vote is ??.', 1, 2013, 'ZTA 12-07', 'Coalition:<br>\r\nhttp://www.stopcostcogas.org/\r\n\r\nGroups supporting this position:<br>\r\nKensington Heights Civic Association<br>\r\nKensington View Civic Association<br>\r\nMontgomery County Civic Federation<br>\r\nSierra Club<br>\r\nAudubon Naturalist Society<br>\r\n', 2, 1),
(83, 3, 'Minimum wage increase to $11.50/hour in four years', '2013-11-26', 'Maryland''s current minimum wage of $7.25 per hour, or $15,000 a year, leaves employees well below the federal poverty line for any worker supporting one child or more. Twenty-one states have raised their minimum wage above Maryland''s rate. After the raise, the Montgomery County minimum wage will still be at close to the 1968 original federal minimum wage adjusted for inflation. Over the past 40 years, Maryland’s workers have become far more productive, yet their pay has not kept pace with their ability to generate more from an hour’s worth of work. From 1979 through 2012, output per worker expanded 74 percent for workers in Maryland, yet median real compensation grew only 18 percent. For low-wage workers, it was even worse: over that same time period workers in the bottom fifth of wages saw their wages increase only 3.2 percent.\r\n<br><br>\r\nThe 59 percent increase in this bill would be phased in over the next four years. The rate would be $8.40 per hour on Oct. 1, 2014, $9.55 per hour on Oct 1, 2015, $10.75 per hour on Oct. 1, 2016, and $11.50 per hour on Oct. 1, 2017.\r\n<br><br>\r\nDuring final consideration, Rice offered an amendment to table the proposal until the state might take up the issue in January 2014. Since the state legislature had failed to pass a similar bill in the 2013, this amendment could effectively kill any successful action.\r\n<br><br>\r\nThe desired vote is No, to allow the Council to vote on the full bill and raise Montgomery County workers back above the poverty line. Berliner, Elrich, Ervin, Floreen, Leventhal, Navarro, and Riemer voted correctly. Andrews and Rice voted incorrectly.', 1, 2013, '27-13', 'Coalition:  www.raisemd.org\r\n<br><br>\r\nOther groups supporting the increase:<br>\r\nAFL-CIO, Economic Policy Institute, Jews United for Justice, Montgomery County chapter of National Organization for Women, United Food and Commercial Workers Union Local 400, many others', 7, 1),
(84, 10, '100-year environmental and social assessment of proposed legislation', '2013-12-08', 'County Council considered a proposal for the sponsor of any legislation to add a section at th end of each bill on the envisioned effect on the County both (a) after 100 years of this policy; and (b) at 100 years, a snapshot. This extended Social/Environmental/Economic Impact Statement (SEEIS) will help the public and political leaders think of the true total cost and benefits of new legislation', 1, 2013, 'test', '', 6, 1),
(85, 5, 'Changes prostitution crime to purchasing sexual services from selling sexual services ', '2013-12-17', 'Following the very successful model implemented in Sweden that drastically reduced prostitution with no increase in enforcement cost, County Council considered a proposal to make it illegal to buy sexual services, but not to sell them. Pimping, procuring and operating a brothel are also illegal. The criminalisation of the purchasing, but not selling, of sex was unique when first enacted in 1999. The historical discrimination of arresting only the women prostitutes, while the male clients were not arrested, has resulted in distorted use of public resources for law enforcement, and contributed to a perpetual, violent environment for women sex workers, yet allowed the industry to continue flourishing since the "market" and continued the demand for services with no negative consequences on the demandn side. Since 95% of women prostitutes have been sexually abused as children, many are trapped into prostitution with forced drug use, and their mortality rate is 40 times the national average, this approach should both reduce the prostitution rate, and improve the health and welfare of young women in particular. The average age of entry into prostitution in the US is 13 years old.', 1, 2013, 'test', '', 2, 1),
(86, 1, 'Appointment of Sam Someone to Planning Board', '2012-07-11', 'Sam Someone is a strong supporter of rapid real estate development and population growth for the County and surrounding regions. His candidacy was supported strongly by the wealthy developers with many billions of dollars of applications to come before the Park and Planning Commission. He was opposed by the citizen groups whose stable, prosperous neighborhoods are the basis of Montgomery County''s good reputation. The only two members of County Council which do not accept campaign contributions from real estate developers, were the only two votes against Mr. Someone.', 1, 2013, 'test', 'Montgomery County Civic Federation website\r\nMontgomery Neighbors Association website\r\nWeAreMoco.org', 2, 1),
(88, 4, 'Instant Runoff Voting/Ranked Voting for all County elections', '2014-01-07', 'The Citizenship Committee of the Council was presented with a proposal to use the Instant Runoff Voting/Ranked Voting approach for all County elections.  This approach allows for the most accurate outcome reflecting the voters'' wishes, with multiple candidates instead of just two candidates.  A third, fourth, or fifth party does not "spoil" an election for their side, by taking away votes from the most similar large party. Since Montgomery County and Maryland have six registered, legitimate parties, this is fairer to the electorate to allow them to express their political views accurately, and stops "fear-of-opposition" based voting.', 1, 2013, 'test', '', 2, 1),
(91, 4, 'Poll watching by any person', '2014-01-09', 'Currently, the Maryland State Board of Elections requires certification from a registered party for a person to observe the vote counting process, including watching the voting machines have the vote totals taken off them right after closing at 8 p.m., and the right to ask questions about discrepancies between recorded voters and number of voters. The Council considered a proposal to send a recommendation to the State Board of Elections to remove these restrictions.  Any person with an interest, including observers from another state (such as a lawyer monitoring voting counts who happens to live in Virginia personally), a minor, and an independent who has chosen no party affiliation could observe the vote counts and tallies.', 1, 2013, 'test', 'Fair Vote website', 2, 1),
(92, 6, 'Ban on acquisition of tasers until proven non-lethal', '2013-11-06', 'Tasers were introduced to local police work across the United States in the 1980s. The corporate and police assertion that tasers are non-lethal, and safer than firearms, has been disproven in 30 years of local use. Local police in other jurisdictions have killed hundreds of people, when they would not have drawn a gun and found other means of subduing suspects. County Council was presented with a ban until further technological controls on the devices would prevent overuse or other solutions are presented to stop killing with supposedly non-lethal weapons.', 1, 2013, 'test', '', 2, 1),
(101, 2, 'Increase enforcement of ban on discrimination against elderly in housing', '2012-09-11', 'County Council was presented with a proposal to formally prohibit discrimination against the elderly in housing, by creating a dedicated position in the Office of Landlor-Tenant Affairs to focus on this issue and handle the many cases reported. This position would work with landlords to assist them creating handicapped-accessible modifications including tax deductions, since this will allow the County''s ageing population to stay in place and greatly reduce the drain on public funds for special housing and aides.', 1, 2013, 'test', '', 5, 1),
(102, 4, 'Annual Public Hearing and Honest Name for "Growth Policy"', '2011-11-04', '(Test of changing size of description field to accommodate alot of text.) The direction, amount, and speed of real estate development and related population growth of the county was guided in the past by an overarching annual decision of the speed of increased growth by the Council. Under Council President Blair Ewing in 19??, a Councilmember dedicated to increasing public participation in County government, the Council held an annual open hearing when any citizen or resident could testify on any aspect of this policy. \r\n\r\nHowever, a later Council in 2005(?) changed the name of the policy to \r\n(a) hide the basic nature of the policy, calling it "Timing of Something Picky"\r\n(b) stopped having annual hearings\r\nthereby freezing this critical public policy as an increase in real estate development and population as the basis for county government and development.\r\n\r\nConstant, unreviewed, indefinite development is not environmentally sustainable, and does not support stable, long-term, people-friendly communities.  It also is the source of many of the multiple unsustainable pressures on the MoCo environment, such as loss of acquifer recharge area for drinking water; loss of threatened and endangered species; loss of resilience during droughts; increased flooding during storms; increased heating and climate change; and many others. It also financially costs more to support the infrastructure for new towns, which are all borne by the average taxpayer and not currently by the real estate development companies. \r\n\r\n(This is deliberately a really really long description, ours will never be this long.) The Council was presented with a proposal to resume the long-time, well-known name for this policy, and resume public hearings so that the public can comment on the basic direction of the County economic, environmental, urbanization, transportation and physical development, instead of being piece-mealed in each small individual rezoning and housing request.', 1, 2013, 'test', '', 4, 1),
(103, 2, 'Single-payer universal health care insurance for County employees', '2011-01-24', 'Given that 75% or more of Montgomery County residents support the much more efficient and healthy approach to universal health care called "single payer," the County as a large employer has the option of implementing this approach under a modification of the federal Affordable Care Act.  The Council was presented with a proposal to at least implement it where possible, with full coverage of all County employees (though not their families).  This eliminates 30% of the paperwork in health care, returns half to the public treasury as savings, and uses the other half to provide coverage for those County employees who could not previously afford it. Health of our public employees improves, absenteeism reduces, the County saves money, doctors focus on healing instead of bureaucratic paperwork, and we all live knowing our public servants are taken care of for medical problems.', 1, 2013, 'test', '*  Maryland Single Payer website:  http://healthcareisahumanrightmaryland.org/\r\n<br>\r\n*  Facebook: https://www.facebook.com/HealthcareIsAHumanRightMaryland\r\n<br>\r\n*  Montgomery County contact:  MargaretSomeone@gmail.com\r\n<br>\r\n* Video/documentary:  http http://thehealthcaremovie.net/home/order-screening-license/\r\n\r\n', 1, 1),
(107, 5, 'Support for Domestic Violence Victims - supporting people under attack', '2014-01-22', 'People in long-term abusive situations, including relationships, drugs, and other forms of abuse, are best reached to transform the situation with help immediately after a crisis.  A proposal was put forward by the women''s support community for provide a small one-time grant to each hospital in the county to develop special training for emergency room staff to recognize abuse victims and connect them with professional support services during the visit. This includes translation services for many victims whose lack of English is exploited by abusers.  ', 1, 2013, 'test', '(list of women''s advocacy groups working on domestic violence).', 1, 1),
(109, 1, 'Protecting roadside trees -  preserving mature communities'' health and quality of life', '2013-07-23', 'Roadside trees provide critical shade in summer, windbreaks in winter, and noise buffers.  In addition, trees are documented to have a health benefit, reducing stress levels of people living near them and mitigating air and water pollution especially in heavily built areas. Mature roadside trees are under increasing pressure as established communities undergo concentrated infill construction and development.<br><br>\r\nThis proposal would require a county permit for any work that is likely to damage trees in a public, county right of way (a publicly-owned tree).  A tree plan and tree protection would be required under the permit, instead of being voluntary.  The goal is to prompt decisions up front before construction and digging begin.  If a roadside tree can be saved, the permit holder must take appropriate action. If not, replacement trees or payment into a replacement fund is allowed.<br><br>\r\nThe desired vote is Yes, to preserve mature tree canopy and protect established communities'' quality of life.', 1, 2013, '41-12', 'ConservationMontgomery.org (Archives/September 2013)\r\n<br>\r\nOther groups supporting 41-12:  Audubon Naturalist Society, Casey Trees, Chevy Chase West Neighborhood Association, Montgomery Countryside Alliance, Muddy Branch Alliance, \r\nNorbeck Meadows Civic Association, Potomac Conservancy, Rock Creek Conservancy, West Montgomery Citizens Association', 7, 1),
(111, 1, 'Canopy Tree Replacement - keeping our neighborhoods cool and shaded', '2013-07-23', 'Tall, mature canopy trees help mitigate climate change, improve air and water quality, cool neighborhoods in the summer, increase property value, and create pleasant communities where we live and work.  Studies also show that businesses with trees attract more customers and realize higher profits. Although County tree canopy was 50% in 2013, some sections are as low as 8-13%. <br><br>\r\nThis law would require replacing shade trees destroyed by new development on small lots that do not meet the threshold for the County Forest Conservation Law. The law applies to soil disturbances of at least 5,000 sq ft, not affecting the individual homeowner. Trees must be replanted within the same subwatershed where canopy trees have been lost or are needed to be increased. Other Maryland and US jurisdictions already have laws stronger than this proposal.\r\n<br><br>\r\nOn the day of the Council vote, Floreen offered an amendment to roll back the proposal to the weaker Option 1 preferred by real estate developers. That option had already been rejected unanimously by the Council''s Transportation and Environment Committee. \r\n<br><br>\r\nThe desired vote is No, to maintain the stronger tree protection in Option 2 already approved by the relevant committee.', 1, 2013, '35-12', 'ConservationMontgomery.org (Archives/September 2013)\r\n<br>\r\nOther groups supporting Option 2:  <br>\r\nAudubon Naturalist Society, Casey Trees, Chevy Chase West Neighborhood Association, Montgomery Countryside Alliance, Muddy Branch Alliance, Norbeck Meadows Civic Association, Potomac Conservancy, Rock Creek Conservancy, West Montgomery Citizens Association   ', 7, 1),
(112, 3, 'Lockheed hotel tax exemption - welfare for world''s largest arms producer', '2012-05-09', 'The County Executive included a no-strings-attached grant of $900,000 to Lockheed Martin, headquartered in Bethesda, in the FY 2013 budget.  This was the latest attempt by the world''s largest arms producer to back out of paying the normal county lodging tax on a luxury hotel and conference center, for employees, contractors, vendors, and members of the public.  Lockheed Martin had a $3,900,000,000 profit in 2010 (not income - profit), with 84% coming from US taxpayers already through federal contracts.  Yet the company had come back to the Council a second time for this handout, after a firm denial in 2010. Meanwhile, the County has had to cut after-school programs for children and other services due to budget shortfalls. Peace activists objected to the proposed grant of nearly a million dollars. GET OK FROM JEAN TO USE HER WORDING <br><br>\r\n\r\nDuring Council consideration of the FY 2013 budget, ??? proposed an amendment to delete this grant. All Council members voted to deny this request. Due to the egregious nature of the repeat request, the excellent united front by the Council against this behavior, and the subsequent end run to the state legislature by Lockheed Martin, the unanimous vote is included here.<br><br>\r\n\r\nThe desired vote is Yes, to delete a nearly one million dollar handout to one of the world''s richest companies, and preserve local tax revenues for public schools and services.', 1, 2013, 'FY13 budget CHECK DATE', 'Groups supporting this position:<br>\r\nPeace Action Montgomery County:  http://peaceactionmc.org/ <br>\r\nOccupy Montgomery County', 7, 1),
(177, 10, 'Bus Rapid Transit Planning - increasing transit options at lowest price and least environmental harm', '2013-01-22', 'Bus rapid transit (BRT) is the least expensive and least environmentally damaging means to increase movement of people in most County transportation corridors. This approach is generally preferable to light rail, as it uses existing corridors, creates minimal disturbance of existing communities, is fielded sooner, and costs much less than light rail. BRT also shifts the transportation focus from moving cars to moving people. If real estate development is to occur, investing in BRT instead of roads increases profitability near established infrastructure, rather than subsidizing conversion of open space.<br><br>\r\nThe Council''s Transportation, Energy, Infrastructure, and Environment Committee had recommended providing half the planning funds requested by the County Executive to start planning Phase I of the Transit Task Force’s May 2012 recommendations, for three BRT corridors already approved in master plans. If the studies began in the current fiscal year (FY2014), they would enable Montgomery to launch a rapid transit system by 2020. Councilmember complaints that the funds were requested ahead of the full BRT addition to the County-wide Transit Corridors Functional Master Plan overlooked the prior approval of these three corridors. Amendments during final consideration improved the planning process by adding citizen advisory committees and public hearings to the final proposal for $500,000.<br><br>\r\nThe desired vote is Yes, to begin planning the the least expensive and least harmful addition of rapid bus lines to three approved transit corridors.', 1, 2013, 'xx-xx VERIFY VOTE', 'More information:<br>\r\nhttp://www.communitiesfortransit.org/<br>\r\nhttp://montgomerycollegesustainability.wordpress.com/brt/\r\n<br><br>\r\nGroups supporting this effort:<br>\r\nSierra Club (Montgomery County Group)    \r\nhttp://maryland.sierraclub.org/montgomery/<br>\r\nCommunitiesForTransit.org<br>\r\nCoalition for Smarter Growth', 7, 1),
(185, 10, 'test for return to edting after date error', '2014-01-06', '', 1, 2013, 'test', '', 7, 0),
(186, 5, 'Women''s Commission Funding - supporting women''s improvement projects', '2014-01-09', 'The Montgomery County Commission for Women has led the improvement of the legal and economic status of women for many years.  Women in 2013 however still make only 82 cents to men''s 1.00 wage for comparable work, and are the subject of physical assault, rape, and harassment at significant levels. <br><br>\r\n\r\nThe County Executive proposed reducing the budget dramatically in the FY2012 budget, and merging the Women''s Commission with regional commissions.  Specific legislation and programs to reduce inequalities and improve opportunities for women would be reduced, and not proposed for Montgomery County under the proposal. Also, the independent monitor of County government handling of women''s issues would be removed.<br><br>\r\n\r\nAll County Council members voted to reduce this critical funding in the FY2012 bill, without discussion or alternate proposals. Due to the importance of the issue, this unanimous vote is included.<br><br>\r\n\r\nThe desired vote is No, to preserve current funding levels for addressing major inequalities in social, economic, and justice for women and girls in Montgomery County.', 1, 2013, 'VERIFY ALL', 'Montgomery County group of the National Organization for Women:  http://www.mcmdnow.org/', 7, 1),
(187, 5, 'Preserving Earned Income Credit for Parents - protecting families and children', '2014-01-14', 'With 40% (?) of American families headed by single women, and 40% of the remainder headed by married women, the Earned Income Credit to help low-income parents provide for their families particularly helps women coping with jobs and child-rearing. With Montgomery County registering a 40% unintended pregnancy rate, keeping children healthy, fed and sheltered when their mothers work is essential.<br><br>\r\n\r\nThe County Executive proposed a reduction in the Earned Income Credit. (Add legislative texture here) <br><br>\r\n\r\nThe desired vote is Yes, to keep the current Earned Income Credit for low-income parents to protect children and working parents, primarily women.', 1, 2013, 'GET VOTE, DATE', 'These groups supported this position:<br>\r\nMontgomery County group of the National Organization for Women (NOW):  http://www.mcmdnow.org/', 7, 1),
(188, 1, '10 Mile Creek Development - protecting our last, best creek and our emergency drinking water supply', '2014-02-28', 'Ten Mile Creek is the last healthy stream in Montgomery County.  All the rest have been degraded by real estate development, transportation, and paving of watersheds. Developer promises to offset harm to streams have proven unworkable. Ten Mile Creek is also one of three streams feeding the metropolitan Washington''s emergency drinking water supply of Little Seneca Lake in upper Montgomery County.   It supports the last natural population of brown trout and many other species becoming rare in our area.  One of the largest environmental and civic coalitions ever assembled advocated for preservation of this important acquifer recharge zone, for the past five years. Also, no inventory of rare, threatened, or endangered species was even done by the County before considering this destruction of 10 Mile Creek headwaters. Meanwhile, the nation''s largest housing construction company, Pulte, received a 300% increase in recommended houses from the Park & Planning Commission''s Board, against the recommendations of its own staff. <br><br>\r\n\r\nPark and Planning Board proposed 600 new houses west of I-270, covering 25% of the Ten Mile Creek watershed with impermeable surface. This proposal reverses its previous recommendation to keep this watershed undeveloped, as rural farmland and sparsely developed residential area. The proposal is an amendment to the Clarksburg Master Plan. This reversal also confirms the inability of citizens to trust the zoning and master plan process in general, since amendments are being used ad hoc to change zoning for the timing of real estate investors.<br><br>\r\n\r\nThe desired vote is No, to honor previous Council commitments to keep the zoning rural, preserve one of the last healthy watersheds in Montgomery County, and protect emergency drinking water for four million people.<br><br>\r\n\r\nVOTE TBD, estimated during February. Members scored N/A until vote occurs. We recommend Council members receiving campaign contributions from any companies connected with the Clarksburg development recuse themselves from this vote due to conflict of interest.', 1, 2013, 'Zoning #', 'Coalition:<br>\r\nhttp://www.savetenmilecreek.com/', 7, 1),
(189, 5, 'Restoring county match of Earned Income Credit for poor parents - helping people care for children', '0000-00-00', 'This bill would restore the county’s match with Maryland’s Earned Income Tax Credit funding to 100 percent, as it was from 2000 through 2010. It would greatly ease the burden of making ends meet for thousands of households living below the poverty level in Montgomery. A “hand up,” not a “hand out” from the EITC has proven successful for 40 years since President Ford signed it into law in 1974. It helps the working poor — most of whom are single adults with two children, A MAJORITY WOMEN?? — survive while earning at or near the minimum wage of $7.25 an hour. That comes to an insufficient $15,000 a year full time for those fortunate enough to secure full-time work in these challenging times.\r\nFully restoring the county’s match means more than 30,000 residents will get a modest tax credit of over $500. That’s not a complete solution, but enough for many to fully cover their medical expenses or most of their monthly food bills. Such assistance not only eases some of the pressure on low-income families, but is a wise public investment in the long-term strength of our region’s economy, children and future.\r\n<br><br>\r\n(political background/texture)<br><br>\r\n\r\nThe desired vote is ??.  \r\n\r\n', 1, 2013, '8-13', 'Groups supporting this proposal:<br>\r\nMontgomery County group of the National Organization for Women (NOW):  http://www.mcmdnow.org/', 7, 0),
(190, 5, 'Restoring county match of Earned Income Credit for poor parents - helping people care for children', '2013-10-29', 'This bill would restore the county’s match with Maryland’s Earned Income Tax Credit funding to 100 percent, as it was from 2000 through 2010. It would greatly ease the burden of making ends meet for thousands of households living below the poverty level in Montgomery. A “hand up,” not a “hand out” from the EITC has proven successful for 40 years since President Ford signed it into law in 1974. It helps the working poor — most of whom are single adults with two children, A MAJORITY WOMEN?? — survive while earning at or near the minimum wage of $7.25 an hour. That comes to an insufficient $15,000 a year full time for those fortunate enough to secure full-time work in these challenging times.\r\nFully restoring the county’s match means more than 30,000 residents will get a modest tax credit of over $500. That’s not a complete solution, but enough for many to fully cover their medical expenses or most of their monthly food bills. Such assistance not only eases some of the pressure on low-income families, but is a wise public investment in the long-term strength of our region’s economy, children and future.\r\n<br><br>\r\n(political background/texture)<br><br>\r\n\r\nThe desired vote is ??.  \r\n\r\n', 1, 2013, '8-13E', 'Groups supporting this proposal:<br>\r\nMontgomery County group of the National Organization for Women (NOW):  http://www.mcmdnow.org/', 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_municipalities`
--

CREATE TABLE IF NOT EXISTS `tbl_municipalities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `county_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_municipalities`
--

INSERT INTO `tbl_municipalities` (`id`, `name`, `county_id`, `state_id`) VALUES
(1, 'Takoma Park', 1, 1),
(2, 'Kensington', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parties`
--

CREATE TABLE IF NOT EXISTS `tbl_parties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `body_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_parties`
--

INSERT INTO `tbl_parties` (`id`, `name`, `body_id`) VALUES
(1, 'Democrat', 1),
(2, 'Republican', 1),
(3, 'Green', 1),
(4, 'Libertarian', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_states`
--

CREATE TABLE IF NOT EXISTS `tbl_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_states`
--

INSERT INTO `tbl_states` (`id`, `name`) VALUES
(1, 'Maryland'),
(2, 'Virginia'),
(3, 'District of Columbia'),
(4, 'Delaware'),
(5, 'West Virginia');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vote_types`
--

CREATE TABLE IF NOT EXISTS `tbl_vote_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote` varchar(20) NOT NULL,
  `actual_vote` int(11) NOT NULL,
  `special_consideration` tinyint(4) NOT NULL,
  `special_consideration_text` varchar(50) NOT NULL,
  `body_id` int(11) NOT NULL,
  `displayorder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_vote_types`
--

INSERT INTO `tbl_vote_types` (`id`, `vote`, `actual_vote`, `special_consideration`, `special_consideration_text`, `body_id`, `displayorder`) VALUES
(-1, 'N/A', 0, 0, '', 1, 5),
(1, 'Yes', 0, 0, '', 1, 1),
(2, 'No', 0, 0, '', 1, 2),
(3, 'Abstain', 0, 0, '', 1, 3),
(4, 'Absent', 0, 0, '', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_voters`
--

CREATE TABLE IF NOT EXISTS `tbl_voters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `party_id` int(11) NOT NULL,
  `body_id` int(11) NOT NULL,
  `district` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tbl_voters`
--

INSERT INTO `tbl_voters` (`id`, `first_name`, `last_name`, `party_id`, `body_id`, `district`) VALUES
(1, 'Bruce', 'Adams', 2, 1, NULL),
(2, 'Derick', 'Berlage', 1, 1, NULL),
(3, 'Nancy', 'Dacek', 1, 1, NULL),
(4, 'Gail', 'Ewing', 2, 1, NULL),
(5, 'William', 'Hanna', 1, 1, NULL),
(6, 'Betty Ann', 'Krahnke', 1, 1, NULL),
(7, 'Isiah', 'Legget', 1, 1, NULL),
(8, 'Marilyn', 'Praisner', 2, 1, NULL),
(9, 'Michael', 'Subin', 3, 1, NULL),
(10, 'Phil', 'Andrews', 1, 1, 'District 3'),
(11, 'Roger', 'Berliner', 1, 1, 'District 1'),
(12, 'Craig', 'Rice', 1, 1, 'District 2'),
(13, 'Nancy', 'Navarro', 1, 1, 'District 4'),
(14, 'Valerie', 'Ervin', 1, 1, 'District 5'),
(15, 'Marc', 'Elrich', 1, 1, 'At Large'),
(16, 'Nancy', 'Floreen', 1, 1, 'At Large'),
(17, 'George', 'Leventhal', 1, 1, 'At Large'),
(18, 'Hans', 'Riemer', 1, 1, 'At Large');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_votes`
--

CREATE TABLE IF NOT EXISTS `tbl_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legislation_id` int(11) NOT NULL,
  `voter_id` int(11) NOT NULL,
  `vote_type_id` int(11) NOT NULL,
  `vote_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cns_votes_legislation` (`legislation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1193 ;

--
-- Dumping data for table `tbl_votes`
--

INSERT INTO `tbl_votes` (`id`, `legislation_id`, `voter_id`, `vote_type_id`, `vote_date`) VALUES
(1, 1, 1, 1, 0),
(2, 1, 2, 2, 0),
(3, 1, 3, 2, 0),
(4, 1, 4, 2, 0),
(5, 1, 5, 3, 0),
(6, 1, 6, 1, 0),
(7, 1, 7, 2, 0),
(8, 1, 8, 2, 0),
(9, 1, 9, 2, 0),
(11, 2, 1, 3, 0),
(12, 2, 2, 3, 0),
(13, 2, 3, 3, 0),
(14, 2, 4, 1, 0),
(15, 2, 5, 2, 0),
(16, 2, 6, 1, 0),
(17, 2, 7, 1, 0),
(18, 2, 8, 3, 0),
(19, 2, 9, 2, 0),
(20, 3, 1, 2, 0),
(21, 3, 2, 2, 0),
(22, 3, 3, 3, 0),
(23, 3, 4, 1, 0),
(24, 3, 5, 2, 0),
(25, 3, 6, 1, 0),
(26, 3, 7, 1, 0),
(27, 3, 8, 2, 0),
(28, 3, 9, 3, 0),
(29, 4, 1, 1, 0),
(30, 4, 2, 2, 0),
(31, 4, 3, 3, 0),
(32, 4, 4, 1, 0),
(33, 4, 5, 1, 0),
(34, 4, 6, 1, 0),
(35, 4, 7, 2, 0),
(36, 4, 8, 3, 0),
(37, 4, 9, 1, 0),
(39, 5, 1, 1, 0),
(40, 5, 2, 2, 0),
(41, 5, 3, 3, 0),
(42, 5, 4, 2, 0),
(43, 5, 5, 1, 0),
(44, 5, 6, 2, 0),
(45, 5, 7, 1, 0),
(46, 5, 8, 2, 0),
(47, 5, 9, 1, 0),
(148, 52, 10, 2, 0),
(149, 52, 11, 2, 0),
(150, 52, 15, 2, 0),
(151, 52, 14, 1, 0),
(152, 52, 16, 1, 0),
(153, 52, 17, 1, 0),
(154, 52, 13, 1, 0),
(155, 52, 12, 2, 0),
(156, 52, 18, 3, 0),
(157, 53, 1, 3, 0),
(158, 53, 2, 1, 0),
(159, 53, 3, 2, 0),
(160, 53, 4, 2, 0),
(161, 53, 5, 1, 0),
(162, 53, 6, 2, 0),
(163, 53, 7, 3, 0),
(164, 53, 8, 3, 0),
(165, 53, 9, 1, 0),
(166, 54, 1, 2, 0),
(167, 54, 2, 2, 0),
(168, 54, 3, 2, 0),
(169, 54, 4, 2, 0),
(170, 54, 5, 2, 0),
(171, 54, 6, 2, 0),
(172, 54, 7, 2, 0),
(173, 54, 8, 2, 0),
(174, 54, 9, 1, 0),
(184, 56, 10, 3, 0),
(185, 56, 11, 2, 0),
(186, 56, 15, 3, 0),
(187, 56, 14, 2, 0),
(188, 56, 16, 3, 0),
(189, 56, 17, 2, 0),
(190, 56, 13, 3, 0),
(191, 56, 12, 2, 0),
(192, 56, 18, 3, 0),
(207, 67, 10, 1, 0),
(208, 67, 11, 1, 0),
(209, 67, 15, 1, 0),
(210, 67, 14, 1, 0),
(211, 67, 16, -1, 0),
(212, 67, 17, 1, 0),
(213, 67, 13, 1, 0),
(214, 67, 12, 2, 0),
(215, 67, 18, 1, 0),
(216, 68, 10, 2, 0),
(217, 68, 11, 2, 0),
(218, 68, 15, 2, 0),
(219, 68, 14, 1, 0),
(220, 68, 16, 2, 0),
(221, 68, 17, 1, 0),
(222, 68, 13, 2, 0),
(223, 68, 12, 1, 0),
(224, 68, 18, 1, 0),
(225, 69, 10, 4, 0),
(226, 69, 11, 3, 0),
(227, 69, 15, 1, 0),
(228, 69, 14, 2, 0),
(229, 69, 16, 1, 0),
(230, 69, 17, 1, 0),
(231, 69, 13, 2, 0),
(232, 69, 12, 6, 0),
(233, 69, 18, 3, 0),
(234, 71, 10, 1, 0),
(235, 71, 11, 4, 0),
(236, 71, 15, 1, 0),
(237, 71, 14, 1, 0),
(238, 71, 16, 1, 0),
(239, 71, 17, 2, 0),
(240, 71, 13, 6, 0),
(241, 71, 12, 2, 0),
(242, 71, 18, 2, 0),
(256, 75, 10, 2, 0),
(257, 75, 11, 2, 0),
(258, 75, 15, 2, 0),
(259, 75, 14, 2, 0),
(260, 75, 16, 2, 0),
(261, 75, 17, 2, 0),
(262, 75, 13, 2, 0),
(263, 75, 12, 1, 0),
(264, 75, 18, 1, 0),
(283, 78, 10, 2, 0),
(284, 78, 11, 2, 0),
(285, 78, 15, 2, 0),
(286, 78, 14, 1, 0),
(287, 78, 16, 1, 0),
(288, 78, 17, 2, 0),
(289, 78, 13, 2, 0),
(290, 78, 12, 2, 0),
(291, 78, 18, 2, 0),
(292, 79, 10, 1, 0),
(293, 79, 11, 1, 0),
(294, 79, 15, 1, 0),
(295, 79, 14, 1, 0),
(296, 79, 16, 1, 0),
(297, 79, 17, 2, 0),
(298, 79, 13, 2, 0),
(299, 79, 12, 3, 0),
(300, 79, 18, 2, 0),
(310, 81, 10, 2, 0),
(311, 81, 11, 1, 0),
(312, 81, 15, 1, 0),
(313, 81, 14, 1, 0),
(314, 81, 16, 1, 0),
(315, 81, 17, 3, 0),
(316, 81, 13, 1, 0),
(317, 81, 12, 2, 0),
(318, 81, 18, 2, 0),
(319, 82, 10, 2, 0),
(320, 82, 11, 2, 0),
(321, 82, 15, 2, 0),
(322, 82, 14, 1, 0),
(323, 82, 16, 1, 0),
(324, 82, 17, 1, 0),
(325, 82, 13, 1, 0),
(326, 82, 12, 1, 0),
(327, 82, 18, 1, 0),
(328, 83, 10, 2, 0),
(329, 83, 11, 1, 0),
(330, 83, 15, 1, 0),
(331, 83, 14, 1, 0),
(332, 83, 16, 1, 0),
(333, 83, 17, 1, 0),
(334, 83, 13, 1, 0),
(335, 83, 12, 2, 0),
(336, 83, 18, 1, 0),
(337, 84, 10, 1, 0),
(338, 84, 11, 2, 0),
(339, 84, 15, 1, 0),
(340, 84, 14, 1, 0),
(341, 84, 16, 1, 0),
(342, 84, 17, 2, 0),
(343, 84, 13, 1, 0),
(344, 84, 12, 2, 0),
(345, 84, 18, 2, 0),
(346, 85, 10, 1, 0),
(347, 85, 11, 1, 0),
(348, 85, 15, 1, 0),
(349, 85, 14, 1, 0),
(350, 85, 16, 1, 0),
(351, 85, 17, 2, 0),
(352, 85, 13, 2, 0),
(353, 85, 12, 2, 0),
(354, 85, 18, 2, 0),
(355, 86, 10, 2, 0),
(356, 86, 11, 1, 0),
(357, 86, 15, 2, 0),
(358, 86, 14, 1, 0),
(359, 86, 16, -1, 0),
(360, 86, 17, 1, 0),
(361, 86, 13, 1, 0),
(362, 86, 12, 1, 0),
(363, 86, 18, 1, 0),
(427, 101, 10, 1, 0),
(428, 101, 11, 1, 0),
(429, 101, 15, 1, 0),
(430, 101, 14, 1, 0),
(431, 101, 16, 1, 0),
(432, 101, 17, 2, 0),
(433, 101, 13, 1, 0),
(434, 101, 12, 2, 0),
(435, 101, 18, 2, 0),
(436, 102, 10, 1, 0),
(437, 102, 11, 2, 0),
(438, 102, 15, 1, 0),
(439, 102, 14, 2, 0),
(440, 102, 16, 2, 0),
(441, 102, 17, 2, 0),
(442, 102, 13, 2, 0),
(443, 102, 12, 3, 0),
(444, 102, 18, 3, 0),
(445, 103, 10, 1, 0),
(446, 103, 11, 1, 0),
(447, 103, 15, 1, 0),
(448, 103, 14, 1, 0),
(449, 103, 16, 1, 0),
(450, 103, 17, 1, 0),
(451, 103, 13, 1, 0),
(452, 103, 12, 4, 0),
(453, 103, 18, 2, 0),
(481, 107, 10, 1, 0),
(482, 107, 11, 1, 0),
(483, 107, 15, 1, 0),
(484, 107, 14, 1, 0),
(485, 107, 16, 1, 0),
(486, 107, 17, 1, 0),
(487, 107, 13, 1, 0),
(488, 107, 12, 2, 0),
(489, 107, 18, 3, 0),
(499, 109, 10, 1, 0),
(500, 109, 11, 1, 0),
(501, 109, 15, 1, 0),
(502, 109, 14, 1, 0),
(503, 109, 16, 2, 0),
(504, 109, 17, 2, 0),
(505, 109, 13, 1, 0),
(506, 109, 12, 1, 0),
(507, 109, 18, 1, 0),
(517, 111, 10, 2, 0),
(518, 111, 11, 2, 0),
(519, 111, 15, 2, 0),
(520, 111, 14, 1, 0),
(521, 111, 16, 1, 0),
(522, 111, 17, 1, 0),
(523, 111, 13, 2, 0),
(524, 111, 12, 2, 0),
(525, 111, 18, 1, 0),
(526, 112, 10, 1, 0),
(527, 112, 11, 1, 0),
(528, 112, 15, 1, 0),
(529, 112, 14, 1, 0),
(530, 112, 16, 1, 0),
(531, 112, 17, 1, 0),
(532, 112, 13, 1, 0),
(533, 112, 12, 1, 0),
(534, 112, 18, 1, 0),
(1067, 177, 10, 1, 0),
(1068, 177, 11, 1, 0),
(1069, 177, 15, 1, 0),
(1070, 177, 14, 1, 0),
(1071, 177, 16, 2, 0),
(1072, 177, 17, 1, 0),
(1073, 177, 13, 1, 0),
(1074, 177, 12, 1, 0),
(1075, 177, 18, 1, 0),
(1139, 185, 10, -1, 0),
(1140, 185, 11, -1, 0),
(1141, 185, 15, -1, 0),
(1142, 185, 14, -1, 0),
(1143, 185, 16, -1, 0),
(1144, 185, 17, -1, 0),
(1145, 185, 13, -1, 0),
(1146, 185, 12, -1, 0),
(1147, 185, 18, -1, 0),
(1148, 186, 10, 1, 0),
(1149, 186, 11, 1, 0),
(1150, 186, 15, 1, 0),
(1151, 186, 14, 1, 0),
(1152, 186, 16, 1, 0),
(1153, 186, 17, 1, 0),
(1154, 186, 13, 1, 0),
(1155, 186, 12, 1, 0),
(1156, 186, 18, 1, 0),
(1157, 187, 10, 1, 0),
(1158, 187, 11, 1, 0),
(1159, 187, 15, 1, 0),
(1160, 187, 14, 1, 0),
(1161, 187, 16, 1, 0),
(1162, 187, 17, 1, 0),
(1163, 187, 13, 1, 0),
(1164, 187, 12, 1, 0),
(1165, 187, 18, 1, 0),
(1166, 188, 10, -1, 0),
(1167, 188, 11, -1, 0),
(1168, 188, 15, -1, 0),
(1169, 188, 14, -1, 0),
(1170, 188, 16, -1, 0),
(1171, 188, 17, -1, 0),
(1172, 188, 13, -1, 0),
(1173, 188, 12, -1, 0),
(1174, 188, 18, -1, 0),
(1175, 189, 10, -1, 0),
(1176, 189, 11, -1, 0),
(1177, 189, 15, -1, 0),
(1178, 189, 14, -1, 0),
(1179, 189, 16, -1, 0),
(1180, 189, 17, -1, 0),
(1181, 189, 13, -1, 0),
(1182, 189, 12, -1, 0),
(1183, 189, 18, -1, 0),
(1184, 190, 10, -1, 0),
(1185, 190, 11, -1, 0),
(1186, 190, 15, -1, 0),
(1187, 190, 14, -1, 0),
(1188, 190, 16, -1, 0),
(1189, 190, 17, -1, 0),
(1190, 190, 13, -1, 0),
(1191, 190, 12, -1, 0),
(1192, 190, 18, -1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_voting_bodies`
--

CREATE TABLE IF NOT EXISTS `tbl_voting_bodies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tbl_voting_bodies`
--

INSERT INTO `tbl_voting_bodies` (`id`, `name`, `displayorder`) VALUES
(1, 'Education Committee', 1),
(2, 'Government Operations and Fiscal Policy Committee', 2),
(3, 'Health and Human Services Committee', 3),
(4, 'Planning, Housing and Economic Development Committee', 4),
(5, 'Public Safety Committee', 5),
(6, 'Transportation, Infrastructure, Energy and Environment Committee', 6),
(7, 'County Council', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_years`
--

CREATE TABLE IF NOT EXISTS `tbl_years` (
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_years`
--

INSERT INTO `tbl_years` (`year`) VALUES
(1990),
(1991),
(1992),
(1993),
(1994),
(1995),
(1996),
(1997),
(1998),
(1999),
(2000),
(2001),
(2002),
(2003),
(2004),
(2005),
(2006),
(2007),
(2008),
(2009),
(2010),
(2011),
(2012),
(2013);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` char(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'root', 'cf72bff409c26154d0b35977eae8374d2f97f1ec71aa508fcdb29b5cbdaa178e'),
(2, 'fred', '27a0f645e20497a65f997aef769b2c72324d983a92faac73e9cd467173466641'),
(4, 'trees', '27a0f645e20497a65f997aef769b2c72324d983a92faac73e9cd467173466641');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mtx_legis_party_desired_vote_types`
--
ALTER TABLE `mtx_legis_party_desired_vote_types`
  ADD CONSTRAINT `cns_leg_id2` FOREIGN KEY (`legislation_id`) REFERENCES `tbl_legislation` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_votes`
--
ALTER TABLE `tbl_votes`
  ADD CONSTRAINT `cns_leg_id` FOREIGN KEY (`legislation_id`) REFERENCES `tbl_legislation` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
