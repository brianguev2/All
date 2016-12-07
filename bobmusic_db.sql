/*****************************************
* Create the bobmusic_db database
*****************************************/
DROP DATABASE IF EXISTS rojasg5_bobmusic_db;
CREATE DATABASE rojasg5_bobmusic_db;
USE rojasg5_bobmusic_db;


CREATE TABLE account(
  a_ID                 INT            	NOT NULL   AUTO_INCREMENT,
  a_Email              VARCHAR(255)   	NOT NULL,
  a_FName          	   VARCHAR(60)    	NOT NULL,
  a_LName         	   VARCHAR(60)    	NOT NULL,
  a_Username         	 VARCHAR(60)    	NOT NULL,
  a_Password        	 VARCHAR(60)    	NOT NULL,
  PRIMARY KEY (a_ID, a_Username)
);


INSERT INTO account (a_ID, a_Email, a_FName, a_LName, a_Username, a_Password) 
VALUES (1,'hello@aol.com','John','Smith','jsmith','green123');


CREATE TABLE admins(
  admin_ID                	INT            	NOT NULL   AUTO_INCREMENT,
  admin_Email             	VARCHAR(255)   	NOT NULL,
  admin_FName          	    VARCHAR(60)    	NOT NULL,
  admin_LName         		  VARCHAR(60)    	NOT NULL,
  admin_Username         	  VARCHAR(60)    	NOT NULL,
  admin_Password        	  VARCHAR(60)    	NOT NULL,
  PRIMARY KEY (admin_ID, admin_Username)
);


INSERT INTO admins (admin_ID, admin_Email, admin_FName, admin_LName, admin_Username, admin_Password) 
VALUES (1,'admin@aol.com','Admin','Harry', 'admin','admin');


CREATE TABLE category (
  p_Category        		INT            		NOT NULL   AUTO_INCREMENT,
  categoryName      		VARCHAR(255)   	  NOT NULL,
  PRIMARY KEY (p_Category)
);


-- Insert data into the tables
INSERT INTO category (p_Category, categoryName) VALUES
(1, 'Guitars'),
(2, 'Keyboards'),
(3, 'Percussion'),
(4, 'Orchestra'),
(5, 'Sound Equipment');




CREATE TABLE product (
  p_ID              	INT            		NOT NULL   AUTO_INCREMENT,
  p_Category        	INT            		NOT NULL,
  p_Price           	DECIMAL(10,2)  	  NOT NULL,
  p_Name            	VARCHAR(255)   	  NOT NULL,
  p_Quantity        	INT            		NOT NULL,
  p_Description	      TEXT			        NOT NULL,
  PRIMARY KEY (p_ID), 
  INDEX p_Category (p_Category) 
);


INSERT INTO product (p_ID, p_Category, p_Price, p_Name, p_Quantity, p_Description) 
VALUES (1,1,'1999.00','Gibson Les Paul',15, 'The perfect guitar for the player who is looking for authentic Gibson tones, 
  with the best of what modern craftsmanship has to offer. The traditional mahogany-maple tonewoods with satin finish and nickel 
  hardware, accompanied by vintage-style keystone tuners, give this Les Paul Tribute a true vintage vibe. Its slim-taper neck 
  profile, powerful modern humbucking pickups, and comfort-enhancing weight relief make it fit for todays most demanding players. 
  Delivered in a padded gig bag with a strap and polishing cloth.');


ALTER TABLE product ADD abbrvName VARCHAR(60) AFTER p_Name;
UPDATE product SET abbrvName='lespaul' WHERE p_ID=1;


CREATE TABLE employee (
  e_ID              	INT            	  NOT NULL   AUTO_INCREMENT,
  e_FName           	VARCHAR(255)   		NOT NULL,
  e_LName           	VARCHAR(255)   		NOT NULL,
  e_Phone           	VARCHAR(12)    		NOT NULL,
  e_Address         	VARCHAR(255)   		NOT NULL,
  e_DOB             	DATE     			    NOT NULL,
  e_Username         	VARCHAR(60)    		NOT NULL,
  e_Password        	VARCHAR(60)    		NOT NULL,
  SSN               	VARCHAR(11)     	NOT NULL,
  PRIMARY KEY (e_ID)
);


INSERT INTO employee (e_ID, e_FName, e_LName,  e_Phone,  e_Address,  e_DOB, e_Username, e_Password, SSN) 
VALUES (1, 'Jerry', 'Willis', '862-000-0000', '123 Willow Street, New York, NY','1993-11-22', 'willisj1','employee1', '123-45-6789');


CREATE TABLE orders (
  o_ID                INT            		NOT NULL   AUTO_INCREMENT,
  o_Date              DATETIME       	  NOT NULL,
  o_Bill            	DECIMAL(10,2)  	  NOT NULL,
  o_Quantity         	INT            		NOT NULL,
  o_Address         	VARCHAR(255)   	  NOT NULL,
  o_PaymentType     	INT            		NOT NULL,
  o_cardNumber     	  CHAR(16)       	  NOT NULL,
  o_cardExpires     	CHAR(7)        		NOT NULL,
  o_Status          	VARCHAR(40)    	  NOT NULL,
  PRIMARY KEY (o_ID)
);


CREATE TABLE orderItems (
  item_ID		           INT			          NOT NULL   AUTO_INCREMENT,
  o_ID                 INT            		NOT NULL,
  p_ID			           INT			          NOT NULL,
  item_Bill            DECIMAL(10,2)  	  NOT NULL,
  item_Quantity        INT            		NOT NULL,
  PRIMARY KEY (item_ID),
  INDEX o_ID (o_ID), 
  INDEX p_ID (p_ID)
);

CREATE TABLE manager(
  manager_ID                  INT             NOT NULL   AUTO_INCREMENT,
  manager_Email               VARCHAR(255)    NOT NULL,
  manager_FName               VARCHAR(60)     NOT NULL,
  manager_LName               VARCHAR(60)     NOT NULL,
  manager_Username            VARCHAR(60)     NOT NULL,
  manager_Password            VARCHAR(60)     NOT NULL,
  PRIMARY KEY (manager_ID, manager_Username)
);

INSERT INTO manager (manager_ID, manager_Email, manager_FName, manager_LName, manager_Username, manager_Password) 
VALUES (1,'manager@aol.com','Bob','Law', 'managerbob','musicstore');


INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (2,1,'1250.00','Fender Stratocaster', 'strat', 10, 'The American Standard Stratocaster Electric Guitar with Maple 
  Fingerboard is a Fender icon. It is a beauty to behold in sound, look and feel. Features include hand-rolled 
  fingerboard edges, Custom Shop Fat 50s pickups, staggered tuners, improved bridge with bent steel saddles and 
  copper-infused high-mass block for increased resonance and sustain, tinted neck, high-gloss maple fretboard, satin 
  neck back for smooth playability, thin-finish undercoat that lets the body breathe and improves resonance, and Fender Tolex case.');


INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (3,1,'1250.00','Gibson ES-355','gibson', 12, 'The ES-355 Limited Run electric guitar makes one of the great Gibson 
  classics of the late 50s available again as a beautifully crafted and finished Custom Shop masterpiece. This one 
  sports the classic Bigsby vibrato. Includes black levant hardshell case. The Gibson ES-335 brought hollowbody 
  tradition and solidbody performance together in 1958, and it is still one of the all-time classic guitar designs. 
  It is among the most versatile guitars you can own. Classic semi-hollowbody design and dual 57 Classic Gibson humbuckers 
  combine to produce everything from full-bodied growls to singing sustain. The ES-335 also features a thin-tapered 1960s 
  neck and Richlite fingerboard (24-3/4" scale), body/neck binding, nickel-plated hardware with Grover kidney tuners, 
  Tune-O-Matic bridge with stopbar tailpiece, separate volume and tone controls, and a 3-way switch.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (4,1,'2500.00','Gretsch White Falcon', 'gretschwhite', 20, 'Luxurious gold appointments and elegant white finish enhance the 
  world-famous appeal of the classic Gretsch Guitars G6136T White Falcon. The White Falcon features dual High 
  Sensitive Filter Tron pickups, a vertical Gretsch headstock logo, Bigsby B6GB vibrato tailpiece, and feather 
  engraved mother-of-pearl hump block position markers. Gretsch includes a hardshell case with the G6136T. Includes case.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (5,1,'1499.00','Martin Mahogany Acoustic', 'martin', 29, 'The Martin 00015M acoustic guitar has the long recognized the 
  excellent tonal qualities of mahogany – bright, clear trebles and a warm mid-range. Among Martins most affordable 
  solid wood guitars, the 00015M acoustic guitar is the most visually distinctive and innovative. Additional features 
  include herringbone rosette, rich satin finish, patented neck mortise and A-frame X bracing for enhanced tone.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (6,1,'1550.00','Fender USA Custom Pro', 'fenderpro', 23, 'Created by experienced luthiers in a limited quantity at the 
  Fender Acoustic Custom Shop, the TPD-2 is available in Natural and Three-color Sunburst finishes and is designed 
  for professional guitarists who require the ultimate in tone and feel. Every detail of the TPD-2 comes from a painstaking 
  process of hand-selecting matched woods and well thought-out components, including a fine AAA Sitka spruce top and 
  master-grade solid rosewood back and sides. Includes deluxe hard-shell case, deluxe leather strap and certificate of authenticity.');



INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (7,2,'169.00','M-Audio Oxygen 49 MKIV', 'oxygen49', 11, 'Created by experienced luthiers in a limited quantity at the 
  Fender Acoustic Custom Shop, the TPD-2 is available in Natural and Three-color Sunburst finishes and is designed 
  for professional guitarists who require the ultimate in tone and feel. Every detail of the TPD-2 comes from a painstaking 
  process of hand-selecting matched woods and well thought-out components, including a fine AAA Sitka spruce top and 
  master-grade solid rosewood back and sides. Includes deluxe hard-shell case, deluxe leather strap and certificate of authenticity.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (8,2,'129.00','Casio Inc. LK175 61-Key Lighted Key Personal Keyboard', 'casiolighted', 12, 'Casio LK-175 makes learning to play 
  the piano entertaining and fun. The lighted keys and Casios Step up Lesson System provide instruction and 
  assistance allowing you to gain experience and eventually play on your own. The LK-175 is much more than an 
  instructional keyboard. It offers 61 piano-style lighted keys, a Sound EFX Sampler with built-in Microphone, 
  400 Tones, 150 Rhythms, 110 Songs, 48 Note Polyphony, USB MIDI, Step up Lesson System. The LK-175 has more than enough 
  features to take you beyond the initial learning steps.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (9,2,'6290.00','Korg Kronos X 88-Key Music Workstation', 'korg', 9, 'The Kronos music workstation was unveiled 
  in 2011. Everyone who experiences its sound reacts with astonishment at how far electronic musical instruments have come. 
  But, in the year since its inception, KORG has continued to release system updates and additional Kronos Sound Libraries, 
  bringing the Kronos to an even higher state of perfection. Rather than resting on its laurels in 2012, the Kronos continued 
  to evolve. Boosting its internal memory capacity and the size of its SSD, as well as enhancing its sampler functionality, we 
  have included more of the latest technology in order to make the Kronos the ultimate workstation. Fittingly, its new name 
  adds an X to indicate its unknown potential. Ready to take off into the unknown future of sound we present the Kronos X music workstation.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (10,2,'3995.00','Suzuki Acoustic Pianos SZV-48 Acoustic Vertical Piano 48', 'suzuki', 4, 'Compact vertical piano for home. Exceptional furniture 
  quality hand rubbed black lacquer cabinet featuring European Chrome Hardware. From beginner to Pro, a beautiful instrument ideal for home, 
  school, church or performing arts center.  Individually crafted from the finest materials. Select solid spruce soundboard with 
  contoured ribs, German Roslau strings, 18 ply cross grained pinblocks, imported felt bushings and hammerheads with Japanese 
  virgin wool felt coverings.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (11,2,'3095.00','Moog MIN010010 Minimoog Voyager Performer Edition, Black', 'moog', 13, 'The Miniboom Voyager Performer Edition is 
  a handcrafted, all-analog performance synthesizer that incorporates the features and incredible sonic range of the original Miniboom, 
  while adding a vast number of new functional improvements to its design. And just like the original Miniboom, the Miniboom Voyager was
   designed and brought to life by synthesizer pioneer, Bob Moog. The Miniboom Voyager Performer Edition is the traditional Miniboom 
   Voyager. It is housed in a rugged steel chassis that is secured in a stunning, custom finished ash cabinet. It is fitted with a 
   top of the line, 44-key Fatar key bed and comes stock with cool grey pitch/mod wheels. Features: 100% Analog Signal Path Ultra-Stable 
   Oscillators 2 Legendary Moog Ladder Filters 2 Four-Stage Analog Envelope Generators 2 Flexible Modulation Busses Assignable X/Y/A 
   Touch Control Interface Over 800 Onboard Presets CV/Gate Expansion Port Awards include: "Key Buy" award from Keyboard magazine 
   "Platinum Award" from Future Music magazine "Excellence Award" from Music Tech magazine "TEC" award from Mix magazine 
   "Editors Choice award" from Electronic Musician magazine. Oscillators Module3 wide-range, high-stability VCOs (Voltage Controlled
    Oscillators) with continuously variable waveforms. FREQUENCY controls (2) vary the frequencies of Oscillators #2 and #3 over a +/-7 
    semitone range with respect to Oscillator #1.OCTAVE selectors (3) set the frequency ranges of the oscillators in six octave steps. 
    WAVE controls (3) provide continuous control over the waveforms of the oscillators, from triangular, to saw tooth, to square, to 
    narrow rectangular.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (12,2,'199.77','Yamaha YPG-235 76-Key Portable Grand Piano', 'yamahapiano', 32, 'The Yamaha Portable Grands have an 
  easy-to-use panel, a wealth of piano-centric features including piano-style keys, Graded Soft Touch (GST) action with 
  different levels of resistance and a high resolution stereo piano sample. It is the music student or professional musicians 
  answer to more keys! And many music teachers encourage new students to get a keyboard that will grow with their needs.');


INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (13,3,'399.99','DW Performance 5 Piece', 'dwdrums', 4, 'The Yamaha Gigmaker 5-Piece Shell Pack is the perfect solution 
  for beginning or intermediate drummers who want the quality of a Yamaha drum kit, without the hefty price tag. Includes 
  a 22"x 16" kick drum, 13" x 9-1/2" and 12"x 9" mounted toms, a 16" x 16" floor tom, and 14" x 5-1/2" wood snare. 
  The Gigmaker kick drum shell is 7 plies of basswood/poplar, and the floor toms, rack toms, and snare drum shells are 6 plies 
  of basswood/poplar. Each drum is equipped with triple-flange, 1.6mm steel hoops and pro-quality lugs-eight on the kick and 
  snare, six on the rack and floor toms. The springless design of these popular Yamaha drum lugs is structured to effectively 
  eliminate unwanted noise. Cymbals and hardware sold separately.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (14,3,'2450.00','Roland TD-25 KV Tour Kit', 'rolanddrums', 10, 'A mid-level kit for home or studio, TD-25KV is 
  equipped with a sound engine derived from the flagship TD-30 and delivers all the acclaimed expressiveness that 
  makes Roland top-line V-Drums the undisputed choice of pro players everywhere. A streamlined interface makes it 
  easy to create personalized kits, while the built-in audio recording function lets you capture drum performances 
  for evaluation and sharing. Other premium features include mesh-head pads for a natural feel, positional snare 
  sensing for enhanced expression, and the VH-11 V-Hi-Hat for playing with authentic hi-hat techniques.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (15,3,'4500.00','PDP Z5 5-Piece Drum Set', 'pdpdrums', 33, 'An ideal shell pack for aspiring drummers. The 
  perfect shell pack for beginning drummers.This 5-piece Z5 Series drum shell pack from PDP is a great shell pack 
  for drummers that are just starting out. The 5-piece shell pack comes in fusion tom sizes (10" x 8", 12" x 9", 
  and 14" x 12") with all-wood shells, FinishPly wrap, and a variety of stunning colors. Cymbals and hardware not included.');


INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (16,3,'2500.00','Simmons SD1500 Electronic Drum Set with Blue Metallic Rack', 'simmonsdrums', 23, 'The Simmons SD1500KIT
 is the most realistic and comprehensive electronic drum kit in its class. With a versatile 6-pad configuration PLUS four 
 cymbals and hi-hat controller, it is maxed out right out of the box. Built around the exceptional sound library of the 
 SD1000 Digital Sound Module, you benefit from 22 separate trigger zones, plus chokes on the cymbal pads.The SD1500KIT 
 also features several key updates from the SD1000, including triple zone snare, floor tom and cymbal pads, heavy-duty 
 kick pad stand and the new heavy-duty hex drum rack. Whether you are practicing, recording or playing out, the SD1500KIT 
 provides a biggest drumming experience in its class.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (17,3,'399.00','Ludwig BreakBeats 4-Piece by QuestLove', 'ludwigdrums', 7, 'For anyone putting together an ideal 
  drum set for less-than-ideal environments, Ludwigs Breakbeats 4-piece shell pack is perfect. Ludwig actually 
  brought in the famous Roots drummer Questlove to help them create a compact set of drums that travel wonderfully 
  and still pack more than enough punch to fill out the backbeat when you are playing tight clubs. With hardwood shells, 
  Remo Pinstripe heads, and ingenious hardware, you will feel right at home behind this set. Top it off with an included 
  set of velvet gig bags, and you are ready to grab your Breakbeats drums and go.  The thing that makes Ludwig Breakbeats
   drums such a great solution for gigging drummers is that they do not feel restrictive. That is because these drums 
   combine clever designs and full-sized heads to achieve the feel and sound of a full kit. When the drummers here at 
   Sweetwater got to check out this setup, one of the things that impressed us the most is the bass drum riser, which 
   elevates the compact 16" bass drum so that it is the perfect height for your kick pedal.');


INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (18,3,'5500.00','Roland TD30KV Pro-Series', 'rolandtd30kv', 5, 'The Roland TD-30KV V-Pro electronic drum kit gives 
  you a whole new level of e-drum realism and expression. When you are playing Rolands flagship kit, you will forget that 
  you are hitting sophisticated technology and simply relish the natural feel of acoustic drums. The TD-30KV V-Pro kit 
  faithfully responds to all the subtlety and nuance of your performance while sending killer SuperNATURAL drum sounds 
  to your DAW or digital board via USB. If you are a drummer seeking state-of-the-art electronic drums, we have your 
  kit: Rolands TD-30KV V-Pro.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (19,4,'999.00','Etude Trumpet', 'etudetrumpet', 17, 'The Etude ETR-100 Student Trumpets generous bore makes it easy 
  for a beginner to play while learning to form notes accurately. You will be heard on your ETR-100 trumpet whether you
   are performing on stage or with your marching band thanks to the Etude trumpets red brass lead pipe-crafted for easy 
   tone production and great projection. More trumpet players drop the instrument in the first year or two than in any 
   other. Oftentimes, the reasons are as much mechanical as they are musical. With the Etude ETR-100, a satisfying bleat 
   often pops out of the end of the horn within the first couple of attempts. Then, as the valves become less of a mystery, 
   you can count on smooth action and precise note slotting.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (20,4,'899.00','Etude Trumpet', 'etudetrombone', 29, 'The Etude ETB-100 Series Student Trombone features a 
  .495" bore designed for easy tone production and projection. This trombone also features a brass outer handslide 
  and crook plus a chrome inner handslide for enhanced durability. Includes a mouthpiece and case. The ETB-100 displays
  a great design and reflects Etudes commitment to outstanding construction, resulting in an instrument that will 
  give you years of musical enjoyment and give your student every chance to develop a lifelong association with the love of music.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (21,4,'4200.00','Holton Double Horn', 'holtonhorn', 19, 'Same as the H180 with detachable bell. Free-blowing 
  horn with rich and resonant intonation. Bell and branch are made of a special brass alloy for slightly darker tonal 
  coloring. Good projection. Model H180 is an excellent orchestral horn with dark sound and bright overtones.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (22,4,'2000.00','Etude Saxophone', 'etudesax', 17, 'Made out of fine metals for superior tone production, the Etude 
  EAS-100 is the perfect instrument for starting out on the alto saxophone. The keywork, pads, and adjustment all work 
  together to make tone production easier, more consistent, and stronger. And the bell brace and construction help make it 
  as durable as possible. Includes case, mouthpiece, cap, and ligature.It may be tempting to buy a "better" horn used, but 
  saxophones are mechanically complex, and if the horn is not well regulated and set up properly, it will be extremely difficult 
  for a student to play. It is perhaps advisable then for a new student to get an Etude EAS-100, brand new, set up perfectly, 
  and ready to play right out of the case. It will be shiny and beautiful, and your young saxophonist will jump up and down 
  and squeal when he or she sees it. Pride of ownership inspires practice, and practice leads to success.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (23,4,'599.00','Etude Clarinet', 'etudeclarinet', 12, 'The Etude ECL-100 Clarinet offers sturdy construction
 with classic looks and sound. Combining a plastic body with nickel keys, it is designed for easy tone production 
 and durability. With strong projection and smooth, responsive playability, it sounds and feels like a much more 
 expensive instrument Includes case, mouthpiece, cap, and ligature. Etude believes price should not be a barrier 
 to experiencing the growth and joy that comes from making music. That is why Etude offers five of the most popular woodwind 
 and brass instruments at an incredible price: flute, clarinet, alto sax, trumpet, and trombone. And no matter which you 
 choose, you get a great design and outstanding construction that will give you years of musical enjoyment. See for yourself!');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (24,4,'1050.00','Stentor Violin', 'stentorviolin', 22, 'Stentor Student I Violin is hand carved from solid 
  tonewoods with good quality rosewood pegs and fingerboard and alloy tailpiece with four integral adjusters. 
  The outfit includes a reliable student wood bow and well designed lightweight case with accessory pockets and 
  carrying straps. Available in sizes: 4/4, 3/4, 1/2, 1/4, 1/8. Stentor violins, violas, and cellos are made by 
  hand in a workshop environment in much the same way that they have been made in Europe for hundreds of years. 
  Stentor instruments have the essential characteristics of good tone quality plus correct measurements and 
  specifications. Stentor sells more violins than any other company worldwide.');


INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (25,5,'700.00','QSC K10 10" Powered PA Speaker', 'qscspeaker', 6, 'The QSC K10 10" powered loudspeaker, 
  featuring its revolutionary 1000W power module, delivers the high-quality amplification, HF driver, and 
  low-frequency driver of the K-Series speakers, offering 90 conical coverage and 129dB peak output, low 
  frequencies extending to 56Hz. The K10 offers exceptional power and performance from an extremely compact system, 
  and it can also be used as an ultra low-profile, horizontal wedge or side fill.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (26,5,'1499.00','Electro-Voice ETX-18SP 18" Powered Subwoofer', 'subwoofer', 9, 'No matter what kind of music 
  you play, a subwoofer will add a warmth and depth of presence that you and your audience will find engaging, 
  pleasing, and even intoxicating. "But I play in an acoustic band," you say. A lot of the charm and character 
  of an acoustic guitar signal resides in some surprisingly low frequencies. The fundamental frequency of an E 
  string is 82 Hz, and the A is 110 Hz. The EV ETX-18SP is an 18" powered subwoofer with 1800 watts of Class-D 
  power with 135 dB peak SPL. It reproduces frequencies from 28 Hz to 180 Hz, so whether you are adding depth 
  and warmth to vocals and acoustic guitars in an Americana setting or DJing dubstep and drum and bass in a dance 
  club, the ETX-18SP will add a new dimension to your performance.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (27,5,'199.00','Yamaha MG10XU 10-Channel Mixer with Effects', 'yamahamixer', 20, 'Now in its third incarnation, 
  the MG Series embodies the pursuit of design excellence, and incorporates some of the same technologies developed 
  for use in high-end professional consoles, including studio-quality preamps, powerful digital processing, and a
   rugged, reliable construction. The MG10XU is the ten-channel version of the series, with four mono XLR and 1/4" 
   hybrid inputs along with three stereo line inputs.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (28,5,'399.00','Shure SM7B Microphone with Switchable Response', 'shuremic', 11, 'The flat, 50Hz-20kHz frequency 
  response of the Shure SM7B Microphone with Switchable Response is designed especially for spoken word, but recording 
  engineers have discovered that it is also an exceptional mic for adding body to thin vocals and handling 
  loud rock/metal singers. It also has the ability to tame harsh or sibilant sounds from hi-hat, cymbals, and 
  voice. Highly shielded against electrical interference. Bass roll-off and mid-range emphasis (presence boost) 
  controls with graphic display. Internal "air suspension" shock isolation. Ships with standard windscreen and 
  an A7WS detachable windscreen for close-talk applications.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (29,5,'300.00','Sennheiser HD8 DJ Headphones', 'sennheiserheadphones', 34, 'Take control of the club with 
  Sennheisers top-of-the-line DJ model - HD8 DJ. Designed for the most demanding users and punishing pro environments, 
  they have been developed in conjunction with some of the worlds top DJs. Acoustically, they are inspired by the 
  legendary HD 25 and deliver an excellent sound reproduction, focusing on the rhythm and beat matching which professionals need.');

INSERT INTO product (p_ID, p_Category, p_Price, p_Name, abbrvName, p_Quantity, p_Description) 
VALUES (30,5,'800.00','QSC GXD 8 Professional Power Amplifier', 'qscamplifier', 10, 'Lightweight, powerful and affordable 
  are the chief defining characteristics of the QSC GXD series amplifiers. The GXD 8 is sure to become a favorite with 
  bands, DJs and sound reinforcement professionals of all kinds.');