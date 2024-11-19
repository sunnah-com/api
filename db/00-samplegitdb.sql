SET FOREIGN_KEY_CHECKS=0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `AppErrorReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AppErrorReport` (
  `englishURN` int NOT NULL,
  `details` text CHARACTER SET latin1 NOT NULL,
  `ipAddress` text CHARACTER SET latin1,
  `dateOfSubmission` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `AppErrorReport` WRITE;
/*!40000 ALTER TABLE `AppErrorReport` DISABLE KEYS */;
INSERT INTO `AppErrorReport` VALUES (3480,'English/Arabic mismatch - lakdsjlfadj\n','192.168.0.101','2014-08-11 20:21:28'),(3480,'English/Arabic mismatch - Dhxjjdd','0.0.0.0','2014-08-13 00:03:06'),(242920,'English/Arabic mismatch - Some test\n','0.0.0.0','2014-08-13 07:34:28');
/*!40000 ALTER TABLE `AppErrorReport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `ArabicHadithTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ArabicHadithTable` (
  `arabicURN` int NOT NULL DEFAULT '0',
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeNumber` int NOT NULL,
  `bookNumber` int NOT NULL,
  `babNumber` decimal(6,2) DEFAULT NULL,
  `hadithNumber` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bookName` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `babName` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hadithText` mediumtext COLLATE utf8mb3_unicode_ci,
  `annotations` text COLLATE utf8mb3_unicode_ci,
  `bookID` decimal(3,1) NOT NULL,
  `grade1` text COLLATE utf8mb3_unicode_ci,
  `ourHadithNumber` int NOT NULL,
  `matchingEnglishURN` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`arabicURN`),
  UNIQUE KEY `arabicURN` (`arabicURN`),
  KEY `matchingEnglishURN` (`matchingEnglishURN`),
  KEY `idx_collection_bookID_arabicURN` (`collection`,`bookID`,`arabicURN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `ArabicHadithTable` WRITE;
/*!40000 ALTER TABLE `ArabicHadithTable` DISABLE KEYS */;
INSERT INTO `ArabicHadithTable` VALUES (380020,'muslim',1,1,2.00,'1','تاب المقدمة',' باب فِي التَّحْذِيرِ مِنَ الْكَذِبِ عَلَى رَسُولِ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ',' وَحَدَّثَنَا أَبُو بَكْرِ بْنُ أَبِي شَيْبَةَ، حَدَّثَنَا غُنْدَرٌ، عَنْ شُعْبَةَ، ح وَحَدَّثَنَا مُحَمَّدُ بْنُ الْمُثَنَّى، وَابْنُ، بَشَّارٍ قَالاَ حَدَّثَنَا مُحَمَّدُ بْنُ جَعْفَرٍ، حَدَّثَنَا شُعْبَةُ، عَنْ مَنْصُورٍ، عَنْ رِبْعِيِّ بْنِ حِرَاشٍ، أَنَّهُ سَمِعَ عَلِيًّا، - رضى الله عنه - يَخْطُبُ قَالَ قَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏\"‏ لاَ تَكْذِبُوا عَلَىَّ فَإِنَّهُ مَنْ يَكْذِبْ عَلَىَّ يَلِجِ النَّارَ ‏\"‏ ‏.‏ \n',NULL,-1.0,NULL,1,280020,NULL),(380030,'muslim',1,1,2.00,'2','تاب المقدمة',' باب فِي التَّحْذِيرِ مِنَ الْكَذِبِ عَلَى رَسُولِ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ',' وَحَدَّثَنِي زُهَيْرُ بْنُ حَرْبٍ، حَدَّثَنَا إِسْمَاعِيلُ، - يَعْنِي ابْنَ عُلَيَّةَ - عَنْ عَبْدِ الْعَزِيزِ بْنِ صُهَيْبٍ، عَنْ أَنَسِ بْنِ مَالِكٍ، أَنَّهُ قَالَ إِنَّهُ لَيَمْنَعُنِي أَنْ أُحَدِّثَكُمْ حَدِيثًا كَثِيرًا أَنَّ رَسُولَ اللَّهِ صلى الله عليه وسلم قَالَ ‏\"‏ مَنْ تَعَمَّدَ عَلَىَّ كَذِبًا فَلْيَتَبَوَّأْ مَقْعَدَهُ مِنَ النَّارِ ‏\"‏ ‏.‏ \n',NULL,-1.0,NULL,2,280030,NULL),(380040,'muslim',1,1,2.00,'3','تاب المقدمة',' باب فِي التَّحْذِيرِ مِنَ الْكَذِبِ عَلَى رَسُولِ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ',' وَحَدَّثَنَا مُحَمَّدُ بْنُ عُبَيْدٍ الْغُبَرِيُّ، حَدَّثَنَا أَبُو عَوَانَةَ، عَنْ أَبِي حَصِينٍ، عَنْ أَبِي صَالِحٍ، عَنْ أَبِي هُرَيْرَةَ، قَالَ قَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏\"‏ مَنْ كَذَبَ عَلَىَّ مُتَعَمِّدًا فَلْيَتَبَوَّأْ مَقْعَدَهُ مِنَ النَّارِ ‏\"‏ ‏.‏ \n',NULL,-1.0,NULL,3,280040,NULL);
/*!40000 ALTER TABLE `ArabicHadithTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `BanglaHadithTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BanglaHadithTable` (
  `banglaURN` int NOT NULL DEFAULT '0',
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeNumber` int NOT NULL,
  `bookNumber` int NOT NULL,
  `bookName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `babNumber` int DEFAULT NULL,
  `babName` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hadithNumber` int NOT NULL,
  `hadithSanad` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `hadithText` text COLLATE utf8mb3_unicode_ci,
  `bookID` decimal(3,1) NOT NULL,
  `grade` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `ourHadithNumber` int NOT NULL,
  `matchingArabicURN` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`banglaURN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `BanglaHadithTable` WRITE;
/*!40000 ALTER TABLE `BanglaHadithTable` DISABLE KEYS */;
INSERT INTO `BanglaHadithTable` VALUES (6000010,'bukhari',1,1,NULL,1,NULL,1,'','‘আলক্বামাহ ইব্‌নু ওয়াক্কাস আল-লায়সী (রহঃ) থেকে বর্ণিতঃ আমি ‘উমর ইব্‌নুল খাত্তাব (রাঃ)-কে মিম্বারের উপর দাঁড়িয়ে বলতে শুনেছিঃ আমি আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম)-কে বলতে শুনেছিঃ কাজ (এর প্রাপ্য হবে) নিয়ত অনুযায়ী। আর মানুষ তার নিয়ত অনুযায়ী প্রতিফল পাবে। তাই যার হিজরত হবে ইহকাল লাভের অথবা কোন মহিলাকে বিবাহ করার উদ্দেশ্যে- তবে তার হিজরত সে উদ্দেশ্যেই হবে, যে জন্যে, সে হিজরত করেছে। \n(৫৪, ২৫২৯, ৩৮৯৮, ৫০৭০, ৬৬৮৯, ৬৯৫৩; মুসলিম ২৩/৪৫ হাঃ ১৯০৭, আহমাদ ১৬৮) ( আধুনিক প্রকাশনী- ১, ইসলামিক ফাউন্ডেশন ১)',1.0,'','',1,100010,NULL),(6000020,'bukhari',1,1,NULL,2,NULL,2,'','উম্মুল মু’মিনীন ‘আয়িশা (রাঃ) থেকে বর্ণিতঃ হারিস ইব্‌নু হিশাম (রাঃ) আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম)- কে জিজ্ঞেস করলেন, ‘হে আল্লাহর রসূল! আপনার নিকট ওয়াহী কিরূপে আসে?’ আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম) বললেনঃ [কোন কোন সময় তা ঘন্টা বাজার মত আমার নিকট আসে। আর এটি-ই আমার উপর সবচেয়ে বেদনাদায়ক হয় এবং তা শেষ হতেই মালাক (ফেরেশতা) যা বলেন তা আমি মুখস্ত করে নেই, আবার কখনো মালাক মানুষের রূপ ধারণ করে আমার সাথে কথা বলেন। তিনি যা বলেন আমি তা মুখস্ত করে নেই।] ‘আয়িশা (রাঃ) বলেন, আমি তীব্র শীতের সময় ওয়াহী নাযিলরত অবস্থায় তাঁকে দেখেছি। ওয়াহী শেষ হলেই তাঁর ললাট হতে ঘাম ঝরে পড়ত। (৩২১৫; মুসলিম ৪৩/২৩, হাঃ ২৩৩৩, আহমাদ ২৫৩০৭, ২৬২৫৮) (আধুনিক প্রকাশনীঃ ২, ইসলামী ফাউন্ডেশনঃ ২)',1.0,'','',2,100020,NULL),(6000030,'bukhari',1,1,NULL,3,NULL,3,'','উম্মুল মু’মিনীন ‘আয়িশা (রাঃ) থেকে বর্ণিতঃ তিনি বলেন, আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম)- এর নিকট সর্বপ্রথম যে ওয়াহী আসে, তা ছিল নিদ্রাবস্থায় বাস্তব স্বপ্নরূপে। যে স্বপ্নই তিনি দেখতেন তা একেবারে প্রভাতের আলোর ন্যায় প্রকাশিত হতো। অতঃপর তাঁর নিকট নির্জনতা পছন্দনীয় হয়ে দাঁড়ায় এবং তিনি ‘হেরা’র গুহায় নির্জনে অবস্থান করতেন। আপন পরিবারের নিকট ফিরে এসে কিছু খাদ্যসামগ্রী সঙ্গে নিয়ে যাওয়ার পূর্বে- এভাবে সেখানে তিনি এক নাগাড়ে বেশ কয়েক দিন ‘ইবাদাতে মগ্ন থাকতেন। অতঃপর  খাদীজা (রাঃ)-এর নিকট  ফিরে এসে আবার একই সময়ের জন্য কিছু খাদ্যদ্রব্য নিয়ে যেতেন। এভাবে ‘হেরা’ গুহায় অবস্থানকালে তাঁর নিকট ওয়াহী আসলো।  তাঁর নিকট ফেরেশতা এসে বললো, ‘পাঠ করুন’। আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম) বলেনঃ [“আমি বললাম, ‘আমি পড়তে জানি না।] তিনি (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম) বলেনঃ অতঃপর সে আমাকে জড়িয়ে ধরে এমন ভাবে চাপ দিলো যে, আমার খুব কষ্ট হলো। অতঃপর সে আমাকে ছেড়ে দিয়ে বললো, ‘পাঠ করুন’। আমি বললামঃ আমি তো পড়তে জানি না’। সে দ্বিতীয় বার আমাকে জড়িয়ে ধরে এমনভাবে চাপ দিলো যে, আমার খুব কষ্ট হলো। অতঃপর সে আমাকে ছেড়ে দিয়ে  বললো, ‘পাঠ করুন’। আমি উত্তর দিলাম, ‘আমি তো পড়তে জানি না’। আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম) বলেন, অতঃপর তৃতীয়বারে তিনি আমাকে জড়িয়ে ধরে চাপ দিলেন। তারপর ছেড়ে দিয়ে বললেন, “পাঠ করুন আপনার রবের নামে, যিনি সৃষ্টি করেছেন। যিনি সৃষ্টি করেছেন মানুষকে জমাট রক্ত পিন্ড থেকে, পাঠ করুন, আর আপনার রব অতিশয় দয়ালু”- (সূরা আলাক্ব ৯৬/১-৩)। অতঃপর এ আয়াত নিয়ে আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম)- প্রত্যাবর্তন করলেন। তাঁর হৃদয় তখন কাঁপছিল। তিনি খাদীজা বিন্‌তু খুওয়ায়লিদের নিকট এসে বললেন, ‘আমাকে চাদর দ্বারা আবৃত কর’, ‘আমাকে চাদর দ্বারা আবৃত কর’। তাঁরা তাঁকে চাদর দ্বারা আবৃত করলেন। এমনকি তাঁর শংকা দূর হলো। তখন তিনি খাদীজা (রাঃ) এর নিকট ঘটনাবৃত্তান্ত জানিয়ে তাঁকে বললেন, আমি আমার নিজেকে নিয়ে শংকা বোধ করছি। খাদীজা (রাঃ) বললেন, আল্লাহর কসম, কখনই নয়। আল্লাহ আপনাকে কখনো লাঞ্ছিত করবেন না।  আপনি তো আত্মীয়–স্বজনের সঙ্গে সদাচরণ করেন, অসহায় দুস্থদের দায়িত্ব বহন করেন, নিঃস্বকে সহযোগিতা করেন, মেহমানের আপ্যায়ন করেন এবং হক পথের দুর্দশাগ্রস্থকে সাহায্য করেন। অতঃপর তাঁকে নিয়ে খাদীজা (রাঃ) তাঁর চাচাত ভাই ওয়ারাকাহ ইব্‌নু নাওফাল ইব্‌নু ‘আবদুল আসাদ ইব্‌নু ‘আবদুল ‘উযযাহ’র নিকট গেলেন, যিনি অন্ধকার যুগে ‘ঈসায়ী ধর্ম গ্রহন করেছিলেন। যিনি ইবরানী ভাষায় লিখতে পারতেন এবং আল্লাহর তাওফীক অনুযায়ী ইবরানী ভাষায় ইনজীল হতে ভাষান্তর করতেন। তিনি ছিলেন অতি বৃদ্ধ এবং অন্ধ হয়ে গিয়েছিলেন। খাদীজা (রাঃ) তাঁকে বললেন, ‘হে চাচাত ভাই! আপনার ভাতিজার কথা শুনুন’। ওয়ারাকাহ তাঁকে জিজ্ঞেস করলেন, ‘ভাতিজা! তুমি কী দেখ?’ আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম) যা দেখেছিলেন, সবই বর্ণনা করলেন। তখন ওয়ারাকাহ তাঁকে বললেন, এটা সেই বার্তাবাহক যাকে আল্লাহ মূসা (‘আঃ)- এর নিকট পাঠিয়েছিলেন। আফসোস! আমি যদি সেদিন যুবক থাকতাম। আফসোস ! আমি যদি সেদিন জীবিত থাকতাম, যেদিন তোমার কওম তোমাকে বহিষ্কার করবে’। আল্লাহর রসূল (সাল্লাল্লাহু ‘আলাইহি ওয়া সাল্লাম) বললেন, [‘তারা কি আমাকে বের করে দেবে?’] তিনি বললেন, ‘হ্যাঁ, তুমি যা নিয়ে এসেছো অনুরূপ (ওয়াহী) কিছু যিনিই নিয়ে এসেছেন তাঁর সঙ্গেই বৈরিতাপূর্ণ আচরণ করা হয়েছে। সেদিন যদি আমি থাকি, তবে তোমাকে জোরালোভাবে সাহায্য করব। এর কিছুদিন পর ওয়ারাকাহ (‘আঃ) ইন্তিকাল করেন। আর ওয়াহীর বিরতি ঘটে।(৩৩৯২, ৪৯৫৩, ৪৯৫৫, ৪৯৫৬, ৪৯৫৭, ৬৯৮২; মুসলিম ১/৭৩ হাঃ ১৬০, আহমাদ ২৬০১৮) (আধুনিক প্রকাশনীঃ ৩, ইসলামী ফাউন্ডেশনঃ ৩)',1.0,'','',3,100030,NULL);
/*!40000 ALTER TABLE `BanglaHadithTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `BookData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BookData` (
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `englishBookID` decimal(3,1) NOT NULL DEFAULT '0.0',
  `englishBookNumber` int NOT NULL,
  `englishBookName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `englishBookIntro` text COLLATE utf8mb3_unicode_ci,
  `arabicBookID` decimal(3,1) DEFAULT NULL,
  `arabicBookNumber` int NOT NULL,
  `arabicBookName` varchar(300) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `arabicBookIntro` text COLLATE utf8mb3_unicode_ci,
  `indonesianBookID` decimal(3,1) DEFAULT NULL,
  `indonesianBookNum` int NOT NULL,
  `indonesianBookName` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `urduBookID` decimal(3,1) DEFAULT NULL,
  `urduBookNum` int NOT NULL,
  `urduBookName` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `banglaBookID` decimal(3,1) DEFAULT NULL,
  `banglaBookNum` int NOT NULL,
  `banglaBookName` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ourBookID` int NOT NULL,
  `ourBookNum` tinytext COLLATE utf8mb3_unicode_ci,
  `linkpath` tinytext COLLATE utf8mb3_unicode_ci,
  `reference_template` tinytext COLLATE utf8mb3_unicode_ci,
  `firstNumber` int NOT NULL,
  `lastNumber` int NOT NULL,
  `firstURN` int DEFAULT NULL,
  `lastURN` int DEFAULT NULL,
  `totalNumber` int NOT NULL,
  `status` int NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT '2015-01-01 08:00:00',
  `lastHadithUpdated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`collection`,`ourBookID`),
  KEY `collection` (`collection`,`ourBookID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `BookData` WRITE;
/*!40000 ALTER TABLE `BookData` DISABLE KEYS */;
INSERT INTO `BookData` VALUES ('bukhari',1.0,1,'Revelation',NULL,1.0,1,'كتاب بدء الوحى ',NULL,1.0,1,'Permulaan Wahyu',1.0,1,'کتاب وحی کے بیان میں',1.0,1,'ওহীর সূচনা অধ্যায়',1,NULL,NULL,NULL,1,7,10,60,7,4,'2013-09-15 22:22:05',NULL),('bukhari',2.0,2,'Belief',NULL,2.0,2,'كتاب الإيمان ',NULL,2.0,2,'Iman',2.0,2,'کتاب ایمان کے بیان میں',2.0,2,'ঈমান',2,NULL,NULL,NULL,8,58,70,550,51,4,'2013-09-15 22:22:05',NULL),('bukhari',3.0,3,'Knowledge',NULL,3.0,3,'كتاب العلم ',NULL,3.0,3,'Ilmu',3.0,3,'کتاب علم کے بیان میں',3.0,3,'ইল্‌ম',3,NULL,NULL,NULL,59,134,560,1370,76,4,'2013-09-15 22:22:05',NULL);
/*!40000 ALTER TABLE `BookData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `ChapterData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChapterData` (
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `englishBookID` decimal(3,1) NOT NULL DEFAULT '0.0',
  `arabicBookID` decimal(3,1) NOT NULL DEFAULT '0.0',
  `babID` decimal(6,2) NOT NULL,
  `arabicBabNumber` varchar(21) COLLATE utf8mb3_unicode_ci NOT NULL,
  `englishBabNumber` varchar(21) COLLATE utf8mb3_unicode_ci NOT NULL,
  `englishBabName` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `arabicBabName` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `arabicIntro` text COLLATE utf8mb3_unicode_ci,
  `englishIntro` text COLLATE utf8mb3_unicode_ci,
  `arabicEnding` text COLLATE utf8mb3_unicode_ci,
  `englishEnding` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`collection`,`arabicBookID`,`babID`),
  KEY `collection` (`collection`,`arabicBookID`,`babID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `ChapterData` WRITE;
/*!40000 ALTER TABLE `ChapterData` DISABLE KEYS */;
INSERT INTO `ChapterData` VALUES ('bukhari',1.0,1.0,1.00,'1','1','How the Divine Revelation started being revealed to Allah\'s Messenger','باب كَيْفَ كَانَ بَدْءُ الْوَحْىِ إِلَى رَسُولِ اللَّهِ صلى الله عليه وسلم','وَقَوْلُ اللَّهِ جَلَّ ذِكْرُهُ: {إِنَّا أَوْحَيْنَا إِلَيْكَ كَمَا أَوْحَيْنَا إِلَى نُوحٍ وَالنَّبِيِّينَ مِنْ بَعْدِهِ}',NULL,NULL,NULL),('bukhari',1.0,1.0,2.00,'2','2','','باب ',NULL,NULL,NULL,NULL),('bukhari',1.0,1.0,3.00,'3','3','','باب ',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ChapterData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `Collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Collections` (
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `collectionID` int NOT NULL,
  `type` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `englishTitle` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `arabicTitle` varchar(400) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasvolumes` varchar(3) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasbooks` varchar(3) COLLATE utf8mb3_unicode_ci NOT NULL,
  `haschapters` varchar(3) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'yes',
  `numhadith` int NOT NULL,
  `totalhadith` int DEFAULT NULL,
  `englishgrade1` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `arabicgrade1` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `showEnglishTranslationNumber` varchar(10) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'yes',
  `showInBookReference` tinyint(1) NOT NULL DEFAULT '1',
  `showOnHome` tinyint(1) NOT NULL DEFAULT '1',
  `showTranslationProgress` tinyint NOT NULL DEFAULT '0',
  `reference_template` tinytext COLLATE utf8mb3_unicode_ci,
  `annotation` varchar(300) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `shortintro` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `numberinginfodesc` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`collectionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `Collections` WRITE;
/*!40000 ALTER TABLE `Collections` DISABLE KEYS */;
INSERT INTO `Collections` VALUES ('bukhari',1,'collection','Sahih al-Bukhari','صحيح البخاري','yes','yes','yes',7277,7291,NULL,'','yes',1,1,0,NULL,'<font color=green>(complete)</font>','Sahih al-Bukhari is a collection of hadith compiled by Imam Muhammad al-Bukhari (d. 256 AH/870 AD) (rahimahullah).\r\n\r\nHis collection is recognized by the overwhelming majority of the Muslim world to be the most authentic collection of reports of the <i>Sunnah</i> of the Prophet Muhammad (ﷺ). It contains over 7500 hadith (with repetitions) in 97 books.\r\n\r\nThe translation provided here is by Dr. M. Muhsin Khan.','Now included from file. This should not be visible on the website.','complete','The numbering below corresponds with Shaykh Muhammad Fuad `Abd al-Baqi\'s (rahimahullah) numbering scheme.'),('muslim',2,'collection','Sahih Muslim','صحيح مسلم','no','yes','yes',7459,7470,NULL,'','yes',1,1,0,NULL,'<font color=green>(complete)</font>','Sahih Muslim is a collection of hadith compiled by Imam Muslim ibn al-Hajjaj al-Naysaburi (rahimahullah).\r\nHis collection is considered to be one of the most authentic\r\ncollections of the Sunnah of the Prophet (ﷺ), and along with\r\nSahih al-Bukhari forms the \"Sahihain,\" or the \"Two Sahihs.\"\r\nIt contains roughly 7500 hadith (with repetitions) in 57 books.\r\n<br>\r\nThe translation provided here is by Abdul Hamid Siddiqui.','','complete','The numbering below corresponds with Shaykh Muhammad Fuad `Abd al-Baqi\'s (rahimahullah) numbering scheme.'),('malik',40,'collection','Muwatta Malik',' موطأ مالك','no','yes','yes',1973,1973,NULL,'','yes',1,1,0,NULL,'(<font color=green>complete</font>)','','','complete','');
/*!40000 ALTER TABLE `Collections` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `EnglishHadithTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EnglishHadithTable` (
  `englishURN` int NOT NULL DEFAULT '0',
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeNumber` int NOT NULL,
  `bookNumber` int NOT NULL,
  `bookName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `babNumber` decimal(6,2) DEFAULT NULL,
  `babName` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hadithNumber` int NOT NULL,
  `hadithText` text COLLATE utf8mb3_unicode_ci,
  `bookID` decimal(3,1) NOT NULL,
  `grade1` text COLLATE utf8mb3_unicode_ci,
  `grade2` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `ourHadithNumber` int NOT NULL,
  `matchingArabicURN` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`englishURN`),
  UNIQUE KEY `englishURN_2` (`englishURN`),
  KEY `englishURN` (`englishURN`),
  KEY `idx_collection_bookID_englishURN` (`collection`,`bookID`,`englishURN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `EnglishHadithTable` WRITE;
/*!40000 ALTER TABLE `EnglishHadithTable` DISABLE KEYS */;
INSERT INTO `EnglishHadithTable` VALUES (200010,'muslim',1,1,'The Book of Faith (Kitab Al-Iman)',1.00,NULL,1,'<p>\nIt is narrated on the authority of Yahya b. Ya\'mur that the first man who discussed <i>qadr</i> (Divine Decree) in Basra was Ma\'bad al-Juhani. I along with Humaid b. \'Abdur-Rahman Himyari set out for pilgrimage or for \'Umrah and said: Should it so happen that we come into contact with one of the Companions of the Messenger of Allah (peace be upon him) we shall ask him about what is talked about <i>taqdir</i> (Divine Decree). Accidentally we came across Abdullah ibn Umar ibn al-Khattab, while he was entering the mosque. My companion and I surrounded him. One of us (stood) on his right and the other stood on his left. I expected that my companion would authorize me to speak. I therefore said: Abu Abdur Rahman! There have appeared some people in our land who recite the Qur\'an and pursue knowledge. And then after talking about their affairs, added: They (such people) claim that there is no such thing as Divine Decree and events are not predestined. He (Abdullah ibn Umar) said: When you happen to meet such people tell them that I have nothing to do with them and they have nothing to do with me. And verily they are in no way responsible for my (belief). Abdullah ibn Umar swore by Him (the Lord) (and said): If any one of them (who does not believe in the Divine Decree) had with him gold equal to the bulk of (the mountain) Uhud and spent it (in the way of Allah), Allah would not accept it unless he affirmed his faith in Divine Decree. He further said: My father, Umar ibn al-Khattab, told me: One day we were sitting in the company of Allah\'s Apostle (peace be upon him) when there appeared before us a man dressed in pure white clothes, his hair extraordinarily black. There were no signs of travel on him. None amongst us recognized him. At last he sat with the Apostle (peace be upon him) He knelt before him placed his palms on his thighs and said: Muhammad, inform me about al-Islam. The Messenger of Allah (peace be upon him) said: Al-Islam implies that you testify that there is no god but Allah and that Muhammad is the messenger of Allah, and you establish prayer, pay Zakat, observe the fast of Ramadan, and perform pilgrimage to the (House) if you are solvent enough (to bear the expense of) the journey. He (the inquirer) said: You have told the truth. He (Umar ibn al-Khattab) said: It amazed us that he would put the question and then he would himself verify the truth. He (the inquirer) said: Inform me about Iman (faith). He (the Holy Prophet) replied: That you affirm your faith in Allah, in His angels, in His Books, in His Apostles, in the Day of Judgment, and you affirm your faith in the Divine Decree about good and evil. He (the inquirer) said: You have told the truth. He (the inquirer) again said: Inform me about al-Ihsan (performance of good deeds). He (the Holy Prophet) said: That you worship Allah as if you are seeing Him, for though you don\'t see Him, He, verily, sees you. He (the enquirer) again said: Inform me about the hour (of the Doom). He (the Holy Prophet) remarked: One who is asked knows no more than the one who is inquiring (about it). He (the inquirer) said: Tell me some of its indications. He (the Holy Prophet) said: That the slave-girl will give birth to her mistress and master, that you will find barefooted, destitute goat-herds vying with one another in the construction of magnificent buildings. He (the narrator, Umar ibn al-Khattab) said: Then he (the inquirer) went on his way but I stayed with him (the Holy Prophet) for a long while. He then, said to me: Umar, do you know who this inquirer was? I replied: Allah and His Apostle knows best. He (the Holy Prophet) remarked: He was Gabriel (the angel). He came to you in order to instruct you in matters of religion.',1.0,NULL,'','',1,301020,'2013-08-01 21:29:23'),(200020,'muslim',1,1,'The Book of Faith (Kitab Al-Iman)',1.00,'',2,'<p>\nIt is narrated on the authority of Yahya b. Ya\'mur that when Ma\'bad discussed the problem pertaining to Divine Decree, we refuted that. He (the narrator) said: I and Humaid b. Abdur-Rahman Himyari argued. And they carried on the conversation about the purport of the hadith related by Kahmas and its chain of transmission too, and there is some variation of words.',1.0,NULL,'','',2,301030,'2012-04-26 14:00:00'),(200030,'muslim',1,1,'The Book of Faith (Kitab Al-Iman)',1.00,'',3,'<p>\nIt is narrated on the authority of Yahya b. Ya\'mur and Humaid b. \'Abdur-Rahman that they said: We met Abdullah b. \'Umar and we discussed about the Divine Decree, and what they talked about it and he narrated the hadith that has been transmitted by \'Umar (may Allah be pleased with him) from the Apostle (may peace be upon him). There is a slight variation in that.',1.0,NULL,'','',3,301040,'2012-04-26 14:00:00');
/*!40000 ALTER TABLE `EnglishHadithTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `HadithTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HadithTable` (
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `bookNumber` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `babID` decimal(6,2) NOT NULL,
  `englishBabNumber` varchar(21) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `arabicBabNumber` varchar(21) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hadithNumber` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ourHadithNumber` int NOT NULL,
  `arabicURN` int NOT NULL,
  `arabicBabName` text COLLATE utf8mb3_unicode_ci,
  `arabicText` text COLLATE utf8mb3_unicode_ci,
  `arabicgrade1` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `englishURN` int NOT NULL,
  `englishBabName` text COLLATE utf8mb3_unicode_ci,
  `englishText` text COLLATE utf8mb3_unicode_ci,
  `englishgrade1` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  `xrefs` varchar(1000) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`arabicURN`),
  UNIQUE KEY `arabicURN` (`arabicURN`),
  UNIQUE KEY `englishURN` (`englishURN`),
  KEY `colbook` (`collection`,`bookNumber`),
  KEY `hadithNumber` (`hadithNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `HadithTable` WRITE;
/*!40000 ALTER TABLE `HadithTable` DISABLE KEYS */;
INSERT INTO `HadithTable` VALUES ('bukhari','1',1.00,'1','1','1',1,100010,'باب كَيْفَ كَانَ بَدْءُ الْوَحْىِ إِلَى رَسُولِ اللَّهِ صلى الله عليه وسلم','[prematn]حَدَّثَنَا[narrator id=\"4698\" tooltip=\"عبد الله بن الزبير بن عيسى بن عبيد الله بن أسامة بن عبد الله بن حميد بن زهير بن الحارث بن أسد بن عبد العزى\"] الْحُمَيْدِيُّ عَبْدُ اللَّهِ بْنُ الزُّبَيْرِ  [/narrator]، قَالَ : حَدَّثَنَا[narrator id=\"3443\" tooltip=\"سفيان بن عيينة بن ميمون\"] سُفْيَانُ  [/narrator]، قَالَ : حَدَّثَنَا[narrator id=\"8272\" tooltip=\"يحيى بن سعيد بن قيس بن عمرو بن سهل بن ثعلبة بن الحارث بن زيد بن ثعلبة بن غنم بن مالك بن النجار\"] يَحْيَى بْنُ سَعِيدٍ الْأَنْصَارِيُّ  [/narrator]، قَالَ : أَخْبَرَنِي[narrator id=\"6796\" tooltip=\"محمد بن إبراهيم بن الحارث بن خالد بن صخر بن عامر بن كعب بن سعد بن تيم بن مرة\"] مُحَمَّدُ بْنُ إِبْرَاهِيمَ التَّيْمِيُّ  [/narrator]، أَنَّهُ سَمِعَ[narrator id=\"5719\" tooltip=\"علقمة بن وقاص بن محصن بن كلدة بن عبد ياليل\"] عَلْقَمَةَ بْنَ وَقَّاصٍ اللَّيْثِيَّ  [/narrator]، يَقُولُ : سَمِعْتُ[narrator id=\"5913\" tooltip=\"عمر بن الخطاب بن نفيل بن عبد العزى بن رياح بن عبد الله بن قرط بن رزاح بن عدي بن كعب\"] عُمَرَ بْنَ الْخَطَّابِ  [/narrator] رَضِيَ اللَّهُ عَنْهُ عَلَى الْمِنْبَرِ، قَالَ : سَمِعْتُ رَسُولَ اللَّهِ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ، يَقُولُ : \"[/prematn]\r\n[matn]إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى، فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى دُنْيَا يُصِيبُهَا أَوْ إِلَى امْرَأَةٍ يَنْكِحُهَا، فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ \"[/matn]','صحيح',10,'How the Divine Revelation started being revealed to Allah\'s Messenger','Narrated \'Umar bin Al-Khattab:\n<p>\n\n     I heard Allah\'s Apostle saying, \"The reward of deeds depends upon the \n     intentions and every person will get the reward according to what he \n     has intended. So whoever emigrated for worldly benefits or for a woman\n     to marry, his emigration was for what he emigrated for.\"\n<p>\n\n\n','Sahih','2021-03-04 23:36:31',''),('bukhari','1',2.00,'2','2','2',2,100020,'باب ','حَدَّثَنَا عَبْدُ اللَّهِ بْنُ يُوسُفَ، قَالَ أَخْبَرَنَا مَالِكٌ، عَنْ هِشَامِ بْنِ عُرْوَةَ، عَنْ أَبِيهِ، عَنْ عَائِشَةَ أُمِّ الْمُؤْمِنِينَ ـ رضى الله عنها ـ أَنَّ الْحَارِثَ بْنَ هِشَامٍ ـ رضى الله عنه ـ سَأَلَ رَسُولَ اللَّهِ صلى الله عليه وسلم فَقَالَ يَا رَسُولَ اللَّهِ كَيْفَ يَأْتِيكَ الْوَحْىُ فَقَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏\"‏ أَحْيَانًا يَأْتِينِي مِثْلَ صَلْصَلَةِ الْجَرَسِ ـ وَهُوَ أَشَدُّهُ عَلَىَّ ـ فَيُفْصَمُ عَنِّي وَقَدْ وَعَيْتُ عَنْهُ مَا قَالَ، وَأَحْيَانًا يَتَمَثَّلُ لِيَ الْمَلَكُ رَجُلاً فَيُكَلِّمُنِي فَأَعِي مَا يَقُولُ ‏\"‏‏.‏ قَالَتْ عَائِشَةُ رضى الله عنها وَلَقَدْ رَأَيْتُهُ يَنْزِلُ عَلَيْهِ الْوَحْىُ فِي الْيَوْمِ الشَّدِيدِ الْبَرْدِ، فَيَفْصِمُ عَنْهُ وَإِنَّ جَبِينَهُ لَيَتَفَصَّدُ عَرَقًا‏.‏','صحيح',20,'','<p>\r\n\r\n     Narrated \'Aisha:\r\n<p>\r\n\r\n     (the mother of the faithful believers) Al-Harith bin Hisham asked Allah\'s Apostle \"O Allah\'s Apostle! How is the Divine Inspiration revealed to you?\" Allah\'s Apostle replied, \"Sometimes it is (revealed) like the ringing of a bell, this form of Inspiration is the hardest of all and then this state passes off after I have grasped what is inspired. Sometimes the Angel comes in the form of a man and talks to me and I grasp whatever he says.\" \'Aisha added: Verily I saw the Prophet being inspired divinely on a very cold day and noticed the sweat dropping from his forehead (as the Inspiration was over).\r\n<p>','Sahih','2012-04-26 07:00:00',''),('bukhari','1',3.00,'3','3','3',3,100030,'باب ','حَدَّثَنَا يَحْيَى بْنُ بُكَيْرٍ، قَالَ حَدَّثَنَا اللَّيْثُ، عَنْ عُقَيْلٍ، عَنِ ابْنِ شِهَابٍ، عَنْ عُرْوَةَ بْنِ الزُّبَيْرِ، عَنْ عَائِشَةَ أُمِّ الْمُؤْمِنِينَ، أَنَّهَا قَالَتْ أَوَّلُ مَا بُدِئَ بِهِ رَسُولُ اللَّهِ صلى الله عليه وسلم مِنَ الْوَحْىِ الرُّؤْيَا الصَّالِحَةُ فِي النَّوْمِ، فَكَانَ لاَ يَرَى رُؤْيَا إِلاَّ جَاءَتْ مِثْلَ فَلَقِ الصُّبْحِ، ثُمَّ حُبِّبَ إِلَيْهِ الْخَلاَءُ، وَكَانَ يَخْلُو بِغَارِ حِرَاءٍ فَيَتَحَنَّثُ فِيهِ ـ وَهُوَ التَّعَبُّدُ ـ اللَّيَالِيَ ذَوَاتِ الْعَدَدِ قَبْلَ أَنْ يَنْزِعَ إِلَى أَهْلِهِ، وَيَتَزَوَّدُ لِذَلِكَ، ثُمَّ يَرْجِعُ إِلَى خَدِيجَةَ، فَيَتَزَوَّدُ لِمِثْلِهَا، حَتَّى جَاءَهُ الْحَقُّ وَهُوَ فِي غَارِ حِرَاءٍ، فَجَاءَهُ الْمَلَكُ فَقَالَ اقْرَأْ‏.‏ قَالَ ‏\"‏ مَا أَنَا بِقَارِئٍ ‏\"‏‏.‏ قَالَ ‏\"‏ فَأَخَذَنِي فَغَطَّنِي حَتَّى بَلَغَ مِنِّي الْجَهْدَ، ثُمَّ أَرْسَلَنِي فَقَالَ اقْرَأْ‏.‏ قُلْتُ مَا أَنَا بِقَارِئٍ‏.‏ فَأَخَذَنِي فَغَطَّنِي الثَّانِيَةَ حَتَّى بَلَغَ مِنِّي الْجَهْدَ، ثُمَّ أَرْسَلَنِي فَقَالَ اقْرَأْ‏.‏ فَقُلْتُ مَا أَنَا بِقَارِئٍ‏.‏ فَأَخَذَنِي فَغَطَّنِي الثَّالِثَةَ، ثُمَّ أَرْسَلَنِي فَقَالَ <A id=\"q2\" name=\"q2\" href=\"javascript:openquran(95,1,3)\"><c_q2>‏{‏اقْرَأْ بِاسْمِ رَبِّكَ الَّذِي خَلَقَ * خَلَقَ الإِنْسَانَ مِنْ عَلَقٍ * اقْرَأْ وَرَبُّكَ الأَكْرَمُ‏}‏</c_q2></a> ‏\"‏‏.‏ فَرَجَعَ بِهَا رَسُولُ اللَّهِ صلى الله عليه وسلم يَرْجُفُ فُؤَادُهُ، فَدَخَلَ عَلَى خَدِيجَةَ بِنْتِ خُوَيْلِدٍ رضى الله عنها فَقَالَ ‏\"‏ زَمِّلُونِي زَمِّلُونِي ‏\"‏‏.‏ فَزَمَّلُوهُ حَتَّى ذَهَبَ عَنْهُ الرَّوْعُ، فَقَالَ لِخَدِيجَةَ وَأَخْبَرَهَا الْخَبَرَ ‏\"‏ لَقَدْ خَشِيتُ عَلَى نَفْسِي ‏\"‏‏.‏ فَقَالَتْ خَدِيجَةُ كَلاَّ وَاللَّهِ مَا يُخْزِيكَ اللَّهُ أَبَدًا، إِنَّكَ لَتَصِلُ الرَّحِمَ، وَتَحْمِلُ الْكَلَّ، وَتَكْسِبُ الْمَعْدُومَ، وَتَقْرِي الضَّيْفَ، وَتُعِينُ عَلَى نَوَائِبِ الْحَقِّ‏.‏ فَانْطَلَقَتْ بِهِ خَدِيجَةُ حَتَّى أَتَتْ بِهِ وَرَقَةَ بْنَ نَوْفَلِ بْنِ أَسَدِ بْنِ عَبْدِ الْعُزَّى ابْنَ عَمِّ خَدِيجَةَ ـ وَكَانَ امْرَأً تَنَصَّرَ فِي الْجَاهِلِيَّةِ، وَكَانَ يَكْتُبُ الْكِتَابَ الْعِبْرَانِيَّ، فَيَكْتُبُ مِنَ الإِنْجِيلِ بِالْعِبْرَانِيَّةِ مَا شَاءَ اللَّهُ أَنْ يَكْتُبَ، وَكَانَ شَيْخًا كَبِيرًا قَدْ عَمِيَ ـ فَقَالَتْ لَهُ خَدِيجَةُ يَا ابْنَ عَمِّ اسْمَعْ مِنَ ابْنِ أَخِيكَ‏.‏ فَقَالَ لَهُ وَرَقَةُ يَا ابْنَ أَخِي مَاذَا تَرَى فَأَخْبَرَهُ رَسُولُ اللَّهِ صلى الله عليه وسلم خَبَرَ مَا رَأَى‏.‏ فَقَالَ لَهُ وَرَقَةُ هَذَا النَّامُوسُ الَّذِي نَزَّلَ اللَّهُ عَلَى مُوسَى صلى الله عليه وسلم يَا لَيْتَنِي فِيهَا جَذَعًا، لَيْتَنِي أَكُونُ حَيًّا إِذْ يُخْرِجُكَ قَوْمُكَ‏.‏ فَقَالَ رَسُولُ اللَّهِ صلى الله عليه وسلم ‏\"‏ أَوَمُخْرِجِيَّ هُمْ ‏\"‏‏.‏ قَالَ نَعَمْ، لَمْ يَأْتِ رَجُلٌ قَطُّ بِمِثْلِ مَا جِئْتَ بِهِ إِلاَّ عُودِيَ، وَإِنْ يُدْرِكْنِي يَوْمُكَ أَنْصُرْكَ نَصْرًا مُؤَزَّرًا‏.‏ ثُمَّ لَمْ يَنْشَبْ وَرَقَةُ أَنْ تُوُفِّيَ وَفَتَرَ الْوَحْىُ‏.‏   \r','صحيح',31,'','Narrated \'Aisha (the mother of the faithful believers): The commencement of the Divine Inspiration to Allah\'s Apostle was in the form of good dreams which came true like bright daylight, and then the love of seclusion was bestowed upon him. He used to go in seclusion in the cave of Hira where he used to worship (Allah alone) continuously for many days before his desire to see his family. He used to take with him the journey food for the stay and then come back to (his wife) Khadija to take his food likewise again till suddenly the Truth descended upon him while he was in the cave of Hira. The angel came to him and asked him to read. The Prophet replied, \"I do not know how to read.\" The Prophet added, \"The angel caught me (forcefully) and pressed me so hard that I could not bear it any more. He then released me and again asked me to read and I replied, \'I do not know how to read.\' Thereupon he caught me again and pressed me a second time till I could not bear it any more. He then released me and again asked me to read but again I replied, \'I do not know how to read (or what shall I read)?\' Thereupon he caught me for the third time and pressed me, and then released me and said, \'Read in the name of your Lord, who has created (all that exists), created man from a clot. Read! And your Lord is the Most Generous.\" (96.1, 96.2, 96.3) Then Allah\'s Apostle returned with the Inspiration and with his heart beating severely. Then he went to Khadija bint Khuwailid and said, \"Cover me! Cover me!\" They covered him till his fear was over and after that he told her everything that had happened and said, \"I fear that something may happen to me.\" Khadija replied, \"Never! By Allah, Allah will never disgrace you. You keep good relations with your kith and kin, help the poor and the destitute, serve your guests generously and assist the deserving calamity-afflicted ones.\"  Khadija then accompanied him to her cousin Waraqa bin Naufal bin Asad bin \'Abdul \'Uzza, who, during the pre-Islamic Period became a Christian and used to write the writing with Hebrew letters. He would write from the Gospel in Hebrew as much as Allah wished him to write. He was an old man and had lost his eyesight. Khadija said to Waraqa, \"Listen to the story of your nephew, O my cousin!\" Waraqa asked, \"O my nephew! What have you seen?\" Allah\'s Apostle described whatever he had seen. Waraqa said, \"This is the same one who keeps the secrets (angel Gabriel) whom Allah had sent to Moses. I wish I were young and could live up to the time when your people would turn you out.\" Allah\'s Apostle asked, \"Will they drive me out?\" Waraqa replied in the affirmative and said, \"Anyone (man) who came with something similar to what you have brought was treated with hostility; and if I should remain alive till the day when you will be turned out then I would support you strongly.\" But after a few days Waraqa died and the Divine Inspiration was also paused for a while.','Sahih','2021-04-07 03:45:48','');
/*!40000 ALTER TABLE `HadithTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `IndonesianHadithTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IndonesianHadithTable` (
  `indonesianURN` int NOT NULL DEFAULT '0',
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeNumber` int NOT NULL,
  `bookNumber` int NOT NULL,
  `bookName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `babNumber` int DEFAULT NULL,
  `babName` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hadithNumber` int NOT NULL,
  `hadithText` varchar(20000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bookID` decimal(3,1) NOT NULL,
  `grade` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `ourHadithNumber` int NOT NULL,
  `matchingArabicURN` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`indonesianURN`),
  UNIQUE KEY `indonesianURN` (`indonesianURN`),
  KEY `englishURN` (`indonesianURN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `IndonesianHadithTable` WRITE;
/*!40000 ALTER TABLE `IndonesianHadithTable` DISABLE KEYS */;
INSERT INTO `IndonesianHadithTable` VALUES (3000010,'bukhari',1,1,'Permulaan Wahyu',1,'Permulaan Wahyu',1,'Telah menceritakan kepada kami Al Humaidi Abdullah bin Az Zubair dia berkata, Telah menceritakan kepada kami Sufyan yang berkata, bahwa Telah menceritakan kepada kami Yahya bin Sa\'id Al Anshari berkata, telah mengabarkan kepada kami Muhammad bin Ibrahim At Taimi, bahwa dia pernah mendengar Alqamah bin Waqash Al Laitsi berkata; saya pernah mendengar Umar bin Al Khaththab diatas mimbar berkata; saya mendengar Rasulullah shallallahu \'alaihi wasallam bersabda: \"Semua perbuatan tergantung niatnya, dan (balasan) bagi tiap-tiap orang (tergantung) apa yang diniatkan; Barangsiapa niat hijrahnya karena dunia yang ingin digapainya atau karena seorang perempuan yang ingin dinikahinya, maka hijrahnya adalah kepada apa dia diniatkan\"',1.0,'','',1,100010,NULL),(3000020,'bukhari',1,1,'Permulaan Wahyu',NULL,'',2,'Telah menceritakan kepada kami Abdullah bin Yusuf berkata, telah mengabarkan kepada kami Malik dari Hisyam bin \'Urwah dari bapaknya dari Aisyah Ibu Kaum Mu\'minin, bahwa Al Harits bin Hisyam bertanya kepada Rasulullah shallallahu \'alaihi wasallam: \"Wahai Rasulullah, bagaimana caranya wahyu turun kepada engkau?\" Maka Rasulullah shallallahu \'alaihi wasallam menjawab: \"Terkadang datang kepadaku seperti suara gemerincing lonceng dan cara ini yang paling berat buatku, lalu terhenti sehingga aku dapat mengerti apa yang disampaikan. Dan terkadang datang Malaikat menyerupai seorang laki-laki lalu berbicara kepadaku maka aku ikuti apa yang diucapkannya\". Aisyah berkata: \"Sungguh aku pernah melihat turunnya wahyu kepada Beliau shallallahu \'alaihi wasallam pada suatu hari yang sangat dingin lalu terhenti, dan aku lihat dahi Beliau mengucurkan keringat.\"',1.0,'','',2,100020,NULL),(3000040,'bukhari',1,1,'Permulaan Wahyu',NULL,'',4,'Telah menceritakan kepada kami Musa bin Isma\'il dia berkata, Telah menceritakan kepada kami Abu \'Awanah berkata, bahwa Telah menceritakan kepada kami Musa bin Abu Aisyah berkata, Telah menceritakan kepada kami Sa\'id bin Jubair dari Ibnu \'Abbas tentang firman Allah Ta\'ala: (Janganlah kamu gerakkan lidahmu untuk (membaca) Al Quran karena hendak cepat-cepat ingin (menguasainya).\" Berkata Ibnu \'Abbas: \"Rasulullah shallallahu \'alaihi wasallam sangat kuat keinginannya untuk menghafalkan apa yang diturunkan (Al Qur\'an) dan menggerak-gerakkan kedua bibir Beliau.\" Berkata Ibnu \'Abbas: \"aku akan menggerakkan kedua bibirku (untuk membacakannya) kepada kalian sebagaimana Rasulullah shallallahu \'alaihi wasallam melakukannya kepadaku\". Berkata Sa\'id: \"Dan aku akan menggerakkan kedua bibirku (untuk membacakannya) kepada kalian sebagaimana aku melihat Ibnu \'Abbas melakukannya. Maka Nabi shallallahu \'alaihi wasallam menggerakkan kedua bibirnya, Kemudian turunlah firman Allah Ta\'ala: Janganlah kamu gerakkan lidahmu untuk (membaca) Al Quran karena hendak cepat-cepat (menguasai) nya. Sesungguhnya atas tanggungan Kamilah mengumpulkannya (di dadamu) dan (membuatmu pandai) membacanya\". Maksudnya Allah mengumpulkannya di dalam dadamu (untuk dihafalkan) dan kemudian kamu membacanya: \"Apabila Kami telah selesai membacakannya, maka ikutilah bacaannya itu\". Maksudnya: \"Dengarkanlah dan diamlah\". Kemudian Allah Ta\'ala berfirman: \"Kemudian, sesungguhnya atas tanggungan Kamilah penjelasannya. Maksudnya: \"Dan Kewajiban Kamilah untuk membacakannya\" Dan Rasulullah shallallahu \'alaihi wasallam sejak saat itu bila Jibril \'Alaihis Salam datang kepadanya, Beliau mendengarkannya. Dan bila Jibril \'Alaihis Salam sudah pergi, maka Nabi shallallahu \'alaihi wasallam membacakannya (kepada para sahabat) sebagaimana Jibril \'Alaihis Salam membacakannya kepada Beliau shallallahu \'alaihi wasallam',1.0,'','',5,100050,NULL);
/*!40000 ALTER TABLE `IndonesianHadithTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `Narrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Narrators` (
  `ID` int NOT NULL,
  `NewID` int NOT NULL,
  `Age` smallint NOT NULL,
  `RawiRank` smallint NOT NULL,
  `DateOfBirth` tinytext COLLATE utf8mb3_unicode_ci,
  `BaladEkama` text COLLATE utf8mb3_unicode_ci,
  `BaladWafa` text COLLATE utf8mb3_unicode_ci,
  `Bokhary` tinyint(1) NOT NULL,
  `Moslem` tinyint(1) NOT NULL,
  `DeathYear` tinytext COLLATE utf8mb3_unicode_ci,
  `Karaba` text COLLATE utf8mb3_unicode_ci,
  `Konya` tinytext COLLATE utf8mb3_unicode_ci,
  `Lakab` tinytext COLLATE utf8mb3_unicode_ci,
  `Mawaaly` tinytext COLLATE utf8mb3_unicode_ci,
  `Mazhab` tinytext COLLATE utf8mb3_unicode_ci,
  `Name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `Badeel` text COLLATE utf8mb3_unicode_ci,
  `Nasab` text COLLATE utf8mb3_unicode_ci,
  `Shohra` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `San3a` text COLLATE utf8mb3_unicode_ci,
  `Tabaka` smallint NOT NULL,
  `Wasf` tinytext COLLATE utf8mb3_unicode_ci,
  `WasfRotba` tinytext COLLATE utf8mb3_unicode_ci,
  `Rotba` int NOT NULL,
  `Tadleese` tinyint(1) NOT NULL,
  `E5telat` tinyint(1) NOT NULL,
  `CommonName` text COLLATE utf8mb3_unicode_ci,
  `Marweyaat` int NOT NULL,
  `IsMale` tinyint(1) NOT NULL,
  `DisplayID` int NOT NULL,
  `MarweyaatCountSymbol` tinytext COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `Narrators` WRITE;
/*!40000 ALTER TABLE `Narrators` DISABLE KEYS */;
INSERT INTO `Narrators` VALUES (1,0,0,0,'','','',0,0,'','','','','','','مسند الربيع بن حبيب','','','مسند الربيع بن حبيب','',0,'Book','',-1,0,0,'',0,0,0,'\r'),(2,6720,88,0,'132','بغداد ، الكوفة ، البصرة ، الحجاز ، مصر ، الشام ، عسقلان ، خراسان ، مرو','عسقلان',1,0,'220','والد عبيد','أبو الحسن','ابن أبي إياس','مولى بني تميم ، مولى بني تيم','','آدم بن عبد الرحمن بن محمد بن شعيب','آدم بن ناهية','الخراساني،المروزي،العسقلاني','آدم بن أبي إياس','',9,'','ثقة',3,0,0,'',671,1,0,'\r'),(3,6719,0,0,'','الكوفة','',0,1,'','والد يحيى بن آدم','أبو يحيى','','مولى خالد بن خالد بن عقبة بن أبي معيط','','آدم بن سليمان','أبو يحيى الكوفي','القرشي،الكوفي','آدم بن سليمان القرشي','',7,'','ثقة',3,0,0,'',2,1,0,'\r');
/*!40000 ALTER TABLE `Narrators` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `UrduHadithTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UrduHadithTable` (
  `urduURN` int NOT NULL DEFAULT '0',
  `collection` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeNumber` int NOT NULL,
  `bookNumber` int NOT NULL,
  `bookName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `babNumber` int DEFAULT NULL,
  `babName` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hadithNumber` int NOT NULL,
  `hadithSanad` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `hadithText` text COLLATE utf8mb3_unicode_ci,
  `bookID` decimal(3,1) NOT NULL,
  `grade` varchar(200) COLLATE utf8mb3_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `ourHadithNumber` int NOT NULL,
  `matchingArabicURN` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`urduURN`),
  KEY `englishURN` (`urduURN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `UrduHadithTable` WRITE;
/*!40000 ALTER TABLE `UrduHadithTable` DISABLE KEYS */;
INSERT INTO `UrduHadithTable` VALUES (4000010,'bukhari',0,1,'کتاب وحی کے بیان میں',NULL,NULL,1,'ہم کو حمیدی نے یہ حدیث بیان کی ، انھوں نے کہا کہ ہم کو سفیان نے یہ حدیث بیان کی ، وہ کہتے ہیں ہم کو یحییٰ بن سعید انصاری نے یہ حدیث بیان کی ، انھوں نے کہا کہ مجھے یہ حدیث محمد بن ابراہیم+تیمی سے حاصل ہوئی ۔ انھوں نے اس حدیث کو علقمہ+بن+وقاص لیثی سے سنا ، ان کا بیان ہے کہ میں نے مسجدنبوی میں منبر رسول صلی اللہ علیہ وسلم پر حضرت عمر بن+خطاب رضی+اللہ+عنہ کی زبان سے سنا ، وہ فرما رہے تھے کہ میں نے جناب رسول اللہ صلی اللہ علیہ وسلم سے سنا','آپ صلی اللہ علیہ وسلم فرما رہے تھے کہ تمام اعمال کا دارومدار نیت پر ہے اور ہر عمل کا نتیجہ ہر انسان کو اس کی نیت کے مطابق ہی ملے گا ۔ پس جس کی ہجرت ( ترک وطن ) دولت دنیا حاصل کرنے کے لیے ہو یا کسی عورت سے شادی کی غرض ہو ۔ پس اس کی ہجرت ان ہی چیزوں کے لیے ہو گی جن کے حاصل کرنے کی نیت سے اس نے ہجرت کی ہے ۔',1.0,'','',1,100010,NULL),(4000020,'bukhari',0,1,'کتاب وحی کے بیان میں',NULL,NULL,2,'ہم کو عبداللہ بن یوسف نے حدیث بیان کی ، ان کو مالک نے ہشام بن عروہ کی روایت سے خبر دی ، انھوں نے اپنے والد سے نقل کی ، انھوں نے ام+المؤمنین حضرت عائشہ صدیقہ رضی+اللہ+عنہا سے نقل کی آپ نے فرمایا کہ','ایک شخص حارث بن+ہشام نامی نے آنحضرت صلی اللہ علیہ وسلم سے سوال کیا تھا کہ یا رسول اللہ ! آپ پر وحی کیسے نازل ہوتی ہے ؟ آپ صلی اللہ علیہ وسلم نے فرمایا کہ وحی نازل ہوتے وقت کبھی مجھ کو گھنٹی کی سی آواز محسوس ہوتی ہے اور وحی کی یہ کیفیت مجھ پر بہت شاق گذرتی ہے ۔ جب یہ کیفیت ختم ہوتی ہے تو میرے دل و دماغ پر اس ( فرشتے ) کے ذریعہ نازل شدہ وحی محفوظ ہو جاتی ہے اور کسی وقت ایسا ہوتا ہے کہ فرشتہ بشکل انسان میرے پاس آتا ہے اور مجھ سے کلام کرتا ہے ۔ پس میں اس کا کہا ہوا یاد رکھ لیتا ہوں ۔ حضرت عائشہ رضی+اللہ+عنہا کا بیان ہے کہ میں نے سخت کڑاکے کی سردی میں آنحضرت صلی اللہ علیہ وسلم کو دیکھا ہے کہ آپ صلی اللہ علیہ وسلم پر وحی نازل ہوئی اور جب اس کا سلسلہ موقوف ہوا تو آپ صلی اللہ علیہ وسلم کی پیشانی پسینے سے شرابور تھی ۔',1.0,'','',2,100020,NULL),(4000030,'bukhari',0,1,'کتاب وحی کے بیان میں',NULL,NULL,3,'ہم کو یحییٰ بن بکیر نے یہ حدیث بیان کی ، وہ کہتے ہیں کہ اس حدیث کی ہم کو لیث نے خبر دی ، لیث عقیل سے روایت کرتے ہیں ۔ عقیل ابن+شہاب سے ، وہ عروہ+بن+زبیر سے ، وہ ام+المؤمنین حضرت عائشہ رضی+اللہ+عنہا سے نقل کرتے ہیں کہ انھوں نے بتلایا کہ','آنحضرت صلی اللہ علیہ وسلم پر وحی کا ابتدائی دور اچھے سچے پاکیزہ خوابوں سے شروع ہوا ۔ آپ صلی اللہ علیہ وسلم خواب میں جو کچھ دیکھتے وہ صبح کی روشنی کی طرح صحیح اور سچا ثابت ہوتا ۔ پھر من جانب قدرت آپ صلی اللہ علیہ وسلم تنہائی پسند ہو گئے اور آپ صلی اللہ علیہ وسلم نے غار حرا میں خلوت نشینی اختیار فرمائی اور کئی کئی دن اور رات وہاں مسلسل عبادت اور یاد الٰہی و ذکر و فکر میں مشغول رہتے ۔ جب تک گھر آنے کو دل نہ چاہتا توشہ ہمراہ لیے ہوئے وہاں رہتے ۔ توشہ ختم ہونے پر ہی اہلیہ محترمہ حضرت خدیجہ رضی+اللہ+عنہا کے پاس تشریف لاتے اور کچھ توشہ ہمراہ لے کر پھر وہاں جا کر خلوت گزیں ہو جاتے ، یہی طریقہ جاری رہا یہاں تک کہ آپ صلی اللہ علیہ وسلم پر حق منکشف ہو گیا اور آپ صلی اللہ علیہ وسلم غار حرا ہی میں قیام پذیر تھے کہ اچانک حضرت جبرائیل علیہ+السلام آپ صلی اللہ علیہ وسلم کے پاس حاضر ہوئے اور کہنے لگے کہ اے محمد ! پڑھو آپ صلی اللہ علیہ وسلم فرماتے ہیں کہ میں نے کہا کہ میں پڑھنا نہیں جانتا ، آپ صلی اللہ علیہ وسلم فرماتے ہیں کہ فرشتے نے مجھے پکڑ کر اتنے زور سے بھینچا کہ میری طاقت جواب دے گئی ، پھر مجھے چھوڑ کر کہا کہ پڑھو ، میں نے پھر وہی جواب دیا کہ میں پڑھا ہوا نہیں ہوں ۔ اس فرشتے نے مجھ کو نہایت ہی زور سے بھینچا کہ مجھ کو سخت تکلیف محسوس ہوئی ، پھر اس نے کہا کہ پڑھ ! میں نے کہا کہ میں پڑھا ہوا نہیں ہوں ۔ فرشتے نے تیسری بار مجھ کو پکڑا اور تیسری مرتبہ پھر مجھ کو بھینچا پھر مجھے چھوڑ دیا اور کہنے لگا کہ پڑھو اپنے رب کے نام کی مدد سے جس نے پیدا کیا اور انسان کو خون کی پھٹکی سے بنایا ، پڑھو اور آپ کا رب بہت ہی مہربانیاں کرنے والا ہے ۔ پس یہی آیتیں آپ صلی اللہ علیہ وسلم حضرت جبرائیل علیہ+السلام سے سن کر اس حال میں غار حرا سے واپس ہوئے کہ آپ صلی اللہ علیہ وسلم کا دل اس انوکھے واقعہ سے کانپ رہا تھا ۔ آپ صلی اللہ علیہ وسلم حضرت خدیجہ کے ہاں تشریف لائے اور فرمایا کہ مجھے کمبل اڑھا دو ، مجھے کمبل اڑھا دو ۔ لوگوں نے آپ صلی اللہ علیہ وسلم کو کمبل اڑھا دیا ۔ جب آپ صلی اللہ علیہ وسلم کا ڈر جاتا رہا ۔ تو آپ صلی اللہ علیہ وسلم نے اپنی زوجہ محترمہ حضرت خدیجہ رضی+اللہ+عنہا کو تفصیل کے ساتھ یہ واقعہ سنایا اور فرمانے لگے کہ مجھ کو اب اپنی جان کا خوف ہو گیا ہے ۔ آپ صلی اللہ علیہ وسلم کی اہلیہ محترمہ حضرت خدیجہ رضی+اللہ+عنہا نے آپ صلی اللہ علیہ وسلم کی ڈھارس بندھائی اور کہا کہ آپ کا خیال صحیح نہیں ہے ۔ خدا کی قسم آپ کو اللہ کبھی رسوا نہیں کرے گا ، آپ تو اخلاق فاضلہ کے مالک ہیں ، آپ تو کنبہ پرور ہیں ، بے کسوں کا بوجھ اپنے سر پر رکھ لیتے ہیں ، مفلسوں کے لیے آپ کماتے ہیں ، مہمان نوازی میں آپ بےمثال ہیں اور مشکل وقت میں آپ امر حق کا ساتھ دیتے ہیں ۔ ایسے اوصاف حسنہ والا انسان یوں بے وقت ذلت و خواری کی موت نہیں پا سکتا ۔ پھر مزید تسلی کے لیے حضرت خدیجہ رضی+اللہ+عنہا آپ صلی اللہ علیہ وسلم کو ورقہ بن نوفل کے پاس لے گئیں ، جو ان کے چچا+زاد بھائی تھے اور زمانہ جاہلیت میں نصرانی مذہب اختیار کر چکے تھے اور عبرانی زبان کے کاتب تھے ، چنانچہ انجیل کو بھی حسب منشائے خداوندی عبرانی زبان میں لکھا کرتے تھے ۔ ( انجیل سریانی زبان میں نازل ہوئی تھی پھر اس کا ترجمہ عبرانی زبان میں ہوا ۔ ورقہ اسی کو لکھتے تھے ) وہ بہت بوڑھے ہو گئے تھے یہاں تک کہ ان کی بینائی بھی رخصت ہو چکی تھی ۔ حضرت خدیجہ رضی+اللہ+عنہا نے ان کے سامنے آپ صلی اللہ علیہ وسلم کے حالات بیان کیے اور کہا کہ اے چچا+زاد بھائی ! اپنے بھتیجے ( محمد صلی اللہ علیہ وسلم ) کی زبانی ذرا ان کی کیفیت سن لیجیئے وہ بولے کہ بھتیجے آپ نے جو کچھ دیکھا ہے ، اس کی تفصیل سناؤ ۔ چنانچہ آپ صلی اللہ علیہ وسلم نے از اول تا آخر پورا واقعہ سنایا ، جسے سن کر ورقہ بے اختیار ہو کر بول اٹھے کہ یہ تو وہی ناموس ( معزز راز دان فرشتہ ) ہے جسے اللہ نے حضرت موسیٰ علیہ+السلام پر وحی دے کر بھیجا تھا ۔ کاش ، میں آپ کے اس عہد+نبوت کے شروع ہونے پر جوان عمر ہوتا ۔ کاش میں اس وقت تک زندہ رہتا جب کہ آپ کی قوم آپ کو اس شہر سے نکال دے گی ۔ رسول کریم صلی اللہ علیہ وسلم نے یہ سن کر تعجب سے پوچھا کہ کیا وہ لوگ مجھ کو نکال دیں گے ؟ ( حالانکہ میں تو ان میں صادق و امین و مقبول ہوں ) ورقہ بولا ہاں یہ سب کچھ سچ ہے ۔ مگر جو شخص بھی آپ کی طرح امر حق لے کر آیا لوگ اس کے دشمن ہی ہو گئے ہیں ۔ اگر مجھے آپ کی نبوت کا وہ زمانہ مل جائے تو میں آپ کی پوری پوری مدد کروں گا ۔ مگر ورقہ کچھ دنوں کے بعد انتقال کر گئے ۔ پھر کچھ عرصہ تک وحی کی آمد موقوف رہی ۔',1.0,'','',3,100030,NULL);
/*!40000 ALTER TABLE `UrduHadithTable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;
SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';
DROP TABLE IF EXISTS `matchtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchtable` (
  `arabicURN` int NOT NULL,
  `englishURN` int NOT NULL,
  `ourHadithNumber` int NOT NULL,
  `indonesianURN` int DEFAULT NULL,
  `urduURN` int NOT NULL,
  `banglaURN` int DEFAULT NULL,
  PRIMARY KEY (`arabicURN`,`englishURN`),
  KEY `arabicURN` (`arabicURN`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `matchtable` WRITE;
/*!40000 ALTER TABLE `matchtable` DISABLE KEYS */;
INSERT INTO `matchtable` VALUES (100010,10,1,3000010,4000010,6000010),(127080,25990,44,3025720,4027490,6027810),(100050,40,5,3000040,4000050,6000050);
/*!40000 ALTER TABLE `matchtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

SET FOREIGN_KEY_CHECKS=1;
