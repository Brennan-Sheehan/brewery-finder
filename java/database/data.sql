BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role,email_address, request) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER','bs@gmail.com', 'false');
INSERT INTO users (username,password_hash,role,email_address, request) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN', 'admin@gmail.com', 'false');
INSERT INTO users (username, password_hash, role, email_address, request) VALUES ('brennan', '$2a$10$XPBX922/oEnVOyK6wxUyQOBs4j4T7G4GvmhcQwS/oTLkpgny0RhtK', 'ROLE_ADMIN', 'brennan@brewersunion.com', 'false');
INSERT INTO users (username, password_hash, role, email_address, request) VALUES ('steve', '$2a$10$zNkqxMBRRGw2NDNAym6.XOS0Uhfw7zoyEV24otsQIMGJj67OBRy1S', 'ROLE_USER', 'beerIsAwesome@beer.com', 'false');
INSERT INTO users (username, password_hash, role, email_address, request) VALUES ('paris', '$2a$10$UZ9EMCbCDKVqV5e/R9b.b.297O6.Vn53VVC7zQNpcsByz.HoiGS32', 'ROLE_MANAGER', 'paris@beerbuddy.com', 'false');
INSERT INTO users (username, password_hash, role, email_address, request) VALUES (‘kristin’, '$2a$10$3yiXJhHF9b0Txd.8yCKPXeWZ8d/Tqn1.oUK1GeBq4KFU/UwHHrefG', 'ROLE_USER', 'kristin@gmail.com', 'false');
INSERT INTO users (username, password_hash, role, email_address, request) VALUES (‘bram’, '$2a$10$8YvnqqPCYD43BaIy05GayudZour4h6v1.OE0E4Cvn5PILDx2uCuDS', 'ROLE_USER', 'bram@gmail.com', 'false');
INSERT INTO users (username, password_hash, role, email_address, request) VALUES (‘nitara’, '$2a$10$fCWvJoPKliCQV4Gfp3KGcOvVnRPZFF7Og1JcV6Z18Ngk/GTdAwc3e', 'ROLE_USER', 'nitara@gmail.com', 'false');
INSERT INTO users (username, password_hash, role, email_address, request) VALUES (‘chayim’, '$2a$10$0.Aq91z/jCq3rqQpb1b15evkQoO5GzlBwTdi3cAmikx4D8Hp9YQCC', 'ROLE_USER', 'chayim@gmail.com', 'false');

INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Rhinegeist Brewery', '513-381-1367', 'a.georgia@rhinegeist.com','1910 Elm St, Cincinnati, OH 45202','Rhinegeist is located in the historic Over-the-Rhine neighborhood in Cincinnati, Ohio. Our 25,000 square foot, active brewing facility is housed in the former bottling plant of Christian Moerlein Brewing Co., a formidable pre-Prohibition beermaker. We cant wait to meet ya!', '12:00pm-1:00am', 'https://ohiomagazine.imgix.net/sitefinity/images/default-source/articles/2015/2---february-2015/rhinegeist_3142.jpg?sfvrsn=4b9ad138_2&w=960&auto=compress%2cformat', '-84.520101', '39.117266', 'false',  3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('MadTree', '513-835-8733', 'john@madtree.com','3301 Madison Road, Cincinnati, OH 45209', 'Bring your dogs, bring your kids! Boasting over 30 taps including beer, cider, wine, and cocktails, you’re sure to find something you’ll love. Hungry? We’ve got wood-fired pizza, wings, salads & apps ready to fire up just for you.', '11:00am-12:00am', 'https://ewscripps.brightspotcdn.com/dims4/default/b5031f3/2147483647/strip/true/crop/2133x1200+58+0/resize/1280x720!/quality/90/?url=http%3A%2F%2Fewscripps-brightspot.s3.amazonaws.com%2Fb9%2F6c%2F95ff8ae848f0894c4d7d702c11d5%2F23118-madtree-230412-render-resize.png', '-84.424840', '39.155960', 'false', 3, 0.0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id,  average_rating)
VALUES('Deadlow Brewing', '513-800-1231', 'julie@deadlowbrew.com','5959 Kellogg Avenue, Cincinnati, OH 45230', 'Where it’s Cinco de Mayo every day!’', '3:00pm-1:00am', 'https://images.getbento.com/accounts/edd9f5b71e380445633d5713f78c22dc/media/images/61347Dead-Low-Brewing_Taproom-21.jpg?w=1800&fit=max&auto=compress,format&h=1800', '-84.423230', '39.063630', 'false', 3, 0.0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Northern Row Brewery & Distillery', '513-620-8302', 'jeff@northernrow.com', '111 W McMicken Ave, Cincinnati, OH 45202', 'A brewery and distillery, with a historic taproom in the heart of Cincinnati', '4:00pm-12:00am', 'https://media2.citybeat.com/citybeat/imager/u/blog/12024617/northernrowbrewing_hb_15.5cdb2e7194008.png?cb=1642192453', '-84.519740', '39.118120', 'false', 3, 0.0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Esoteric Brewing Co.', '513-214-1987', 'admin@esotericbrewing.com','918 E McMillan St, Cincinnati, OH 45206', 'Our vision is to craft a beer with such integrity that it has a profound social impact. Thats why we brew with pure ingredients, sourced locally, and grown organically, in order to craft a beer with such integrity that it has a profound social impact.', '12:00pm-1:00am', 'https://cdn2.cincinnatimagazine.com/wp-content/uploads/sites/5/2020/11/EsotericIntWide2.jpg', '-84.490067', '39.126060', 'false', 3, 0.0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Streetside Brewery', '513-615-5877', 'admin@streetside.com','4003 Eastern Ave, Cincinnati, OH 45226', 'As a new local brewery rooted in Cincinnatis oldest neighborhood, we bring together a down-to-earth experience and a selection of exceptional craft beer thats as diverse as the community we serve.', '11:00am-11:00pm', 'https://i0.wp.com/absolutebeer.com/wp-content/uploads/2020/03/AB-Breweries-Streetside-Brewery-Exterior-3-Banner.jpg?fit=2400%2C1200&ssl=1', '-84.433098', '39.109180', 'false', 3, 0.0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Eldorado Gaming Scioto Downs', '614-295-4700', 'admin@eldoradogaming.com','6000 South High Street, Columbus, OH 43207', 'The first Racino in Ohio, Eldorado Gaming Scioto Downs offers over 2,200 of the worlds hottest games in a 120,000 square foot facility open 24/7! Enjoy live harness horse racing every May - September and simulcast wagering year-round. We have been bringing harness racing to the community for 58 years!', '12:00am-11:59pm', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/f5/c9/05/brew-brothers.jpg?w=1200&h=-1&s=1', '-82.997730', '39.839130', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Warped Wing Brewing Company', '937-222-7003', 'info@warpedwing.com','26 Wyandot St, Dayton, OH 45402-2145', 'Warped Wing Brewing Co. is a Dayton craft brewery inspired by the rich history of innovation and invention in Ohio. We are committed to carrying that spirit forward by brewing new proprietary beer styles along with original warped interpretations.', '11:00am-8:00pm', 'https://scontent.fagc1-2.fna.fbcdn.net/v/t39.30808-6/366366427_687260773447846_238314500724509747_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=7f8c78&_nc_ohc=jHtVEgNqmh8AX-vLUgU&_nc_ht=scontent.fagc1-2.fna&oh=00_AfCSRBKG91rlgA-C4Z2-_kngzWuNOMkT8RBk27E3hKo7jw&oe=64DF6248', '-84.185400', '39.759730', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Twin Oast Brewing', '419-573-6126', 'info@twinoastbrewing.com','3630 NE Catawba Rd, Port Clinton, OH 43452-9121', 'Twin Oast Brewing is above all things, an experience. It is first and foremost about experiencing great beer, crafted by people obsessed with making unique flavors for beer enthusiasts and casual drinkers alike. Customers will enjoy their brew in the middle of a beautiful 60-acre farm estate, featuring forested areas, stone fruit orchards, and home-grown produce. The brewery features a small menu year-round, offering meals that celebrate the seasons, and creative dishes that pair perfectly with our brews.', '11:00am-9:00pm', 'https://static.wixstatic.com/media/eeff99_801b0c8232dc4766ac8f869a19181ee5~mv2.jpg/v1/fill/w_738,h_626,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/eeff99_801b0c8232dc4766ac8f869a19181ee5~mv2.jpg', '-82.834860', '41.577230', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Rockmill Brewery', '740-808-0305', 'jackie@rockmill.com','5705 Lithopolis Rd NW, Lancaster, OH 43130-9515', 'OUR FAMILY-OWNED SMALL PRODUCTION BREWERY WAS FOUNDED IN 2010. Built on a 23-acre 19th-century horse farm that once served as a stagecoach stop, tavern and gathering place. In that tradition of hospitality, our Tasting Room welcomes guests for an impressive selection of fresh, flavor-forward beers. As stewards of this beautiful place, we honor the rich history of this land and its water with our dedication to craft farmhouse ales and fine but approachable food. Situated at the headwaters of the Hocking River, our water is filtered through Black Hand Sandstone, imparting a minerality that plays on the palate. Strong backbone and complexity that unfolds give our beers a breadth of expressions, from delicate floral notes to subtle spices.', '12:00pm-8:00pm', 'https://images.squarespace-cdn.com/content/v1/55e1deb4e4b01d70a6f1d0f7/1606504643286-14498PD86YA94X643HH0/rockmill-e1504800099430.jpg?format=2500w', '-82.709070', '39.748300', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Moeller Brew Barn', '740-808-0305', 'greg@moellerbrewbarn.com','8016 Marion Drive, Maria Stein, OH 45860-8706', 'When you see big barns dotting the countryside in the Land of the Cross-Tipped Churches, you will know you are close. Moeller Brew Barn was built because we believe everyone should have a choice to enjoy Fresh Local Craft Beer.', '9:00am-9:00pm', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/80/1c/b1/moeller-brew-barn.jpg?w=1200&h=-1&s=1', '-84.493088', '40.421291', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Urban Vines Winery & Brewery Co.', '317-763-0678', 'hello@urban-vines.com','303 E 161st St, Westfield, IN 46074-7608', 'Urban Vines opened the spring of 2017 in Westfield, Indiana. We are Westfields first winery and second brewery. The Herron family acquired 5 acres in the heart of the city where they have built a winery, brewery, tasting room and vineyard. The tasting room can accommodate over 80 patrons and outdoor patio and meadow can host large events overlooking the pond and vineyard  The meadow out back provides the perfect setting for the Westfield weekends where people gather to enjoy great wine, beer, live music and light fare.', '12:00pm-9:00pm', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/68/b6/37/urban-vines-front-of.jpg?w=1200&h=-1&s=1', '-86.1535166', '40.0206524', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Sun King Brewery', '317-602-3702', 'info@sunking.com','135 N College Ave, Indianapolis, IN 46202-3801', 'The original downtown Indianapolis location opened as a small twelve tap tasting room and fifteen barrel brewhouse in half of an unused warehouse space. Today our all-ages downtown brewery campus occupies three buildings as our offerings and capacity continue to expand. Now featuring food from Nacho by La Margarita.', '11:00am-8:00pm', 'https://www.sunkingbrewing.com/wp-content/uploads/2019/11/DSC8207.jpg', '-86.1446404', '39.7691917', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Three Floyds Brewing Co', '219-238-6815', 'floyd@3floydsbrew.com','9750 Indiana Pkwy, Munster, IN 46321-4004', 'Three Floyds Brewing is a Midwestern brewery dedicated to crafting a wide and not normal range of quality ales and lagers. Since our founding in 1996 by Nick Floyd we have been brewing uncompromising, unrelenting, full-flavored beers for a range of tastes. With a constant eye toward sound technical brewing practices, we use ingredients from around the world to bring you the best artisanal, innovative and fresh beers we can.', '12:00pm-12:00am', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/01/cd/77/photo0jpg.jpg?w=1200&h=-1&s=1', '-87.5165134', '41.5353502', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Cedar Creek Winery, Brewery and Distillery', '765-342-9000', 'bryce@cedarcreekbrewing.com','3820 Leonard Rd, Martinsville, IN 46151-5600', 'In the 13 years since the winery opened, the Cedar Creek name has grown in several different directions, now offering a brewery, distillery, eatery and even cigar company, all under the same name, and run by the same family. Operations for the business originally expanded into the town of Nashville in 2013, in the form of Cedar Creek’s wine tasting room located at 38 E. Franklin St. Cedar Creek Brewing Co. was originally opened in 2015 by Bryce Elsner, son of Larry and Donell, and his wife, Jamie Elsner. Bryce is the brewery owner and operator, as well as the owner of the new food truck.', '12:00pm-6:00pm', 'https://21e34a9e3a94181b62c8.cdn6.editmysite.com/uploads/b/21e34a9e3a94181b62c8fab006883ca0addf6d166c7ca4ebfd1ad413c756ec20/43959_42971_1682710816.jpg?width=1600&optimize=medium', '-86.354735', '39.406333', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Switchyard Brewing Company', '812-287-8295', 'hello@switchyardbrewing.com','419 N Walnut St, Bloomington, IN 47404-3842', 'Founded in 2014 Switchyard Brewing is located in a 80+ year old building that was originally built as an International Harvester dealership. We brew, can, and keg our beer out of our downtown taproom, selling it at bars, restaurants, grocery and liquor stores throughout the state of Indiana. We take a lot of pride in the beer that we craft on site, cultivating an employee culture like no other, and having a positive impact on the communities we’re a part of. Switchyard was born as a startup on the workbench of a two-car garage in Northern Monroe County. We set out to redefine the brewery experience by producing hand-crafted, flavorful beers alongside a functional co-working environment that encourages other entrepreneurs to create great things.', '12:00pm-8:00pm', 'https://1.bp.blogspot.com/-xLqupSmueR4/Wym2_oYNrJI/AAAAAAAHDJU/2SOGtS-yPAE5DwrWLYXX6pGAsRw10l6ywCKgBGAs/s640/IMG_20180615_171434.jpg', '-86.5339724', '39.1701331', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Shoreline Brewery', '812-287-8295', 'tabitha@shorelinebrewery.com','208 Wabash St, Michigan City, IN 46360-3244', 'Shoreline Brewery has been serving handcrafted beers at the edge of Lake Michigan since it’s opening in August of 2005.  To this day Shoreline is family-owned and independently run by its original founder and Head Brewer, Sam Strupeck.  With twelve beers always on tap everyone will find a beer to fall in love with, whether it be the award-winning Beltaine Scottish Ale, the fan-favorite Curse the Goat, or the seasonal Stellar Blue blueberry ale. The globally inspired cuisine at Shoreline ranges from nostalgic and uncomplicated to elaborate and complex. From the small plates such as the Veracruz Fish Tacos to the more filling Grecian Lamb Burger, each bite offers a unique fusion of flavors.', '12:00pm-8:00pm', 'https://panoramanow.com/wp-content/uploads/2018/07/shoreline-brewery-michigan-city-indiana.jpeg', '-86.9062197', '41.7193131', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Terre Haute Brewing Company', '812-814-3071', 'hello@terrehaute.com','401 S 9th St, Terre Haute, IN 47807-4417', 'THBC is Indianas oldest and Americas second-oldest brewery in operation. In its more than 100-year history, THBC grew to become the seventh-largest brewery in the USA. The brewery has been skillfully resurrected to preserve its heritage and brews modern, high-grade beers to honor its legacy.', '11:00am-11:00pm', 'https://i0.wp.com/absolutebeer.com/wp-content/uploads/2019/06/AB-Breweries-Terre-Haute-Brewing-Company-FULL.jpg?fit=2400%2C1200&ssl=1', '-87.4047096', '39.4621531', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Metazoa Brewing Company', '317-522-0251', 'taylor@metazoa.beer','140 South College Avenue, Indianapolis, IN 46202', 'At Metazoa Brewing Company, balance is our guiding philosophy. A craft brewery in the heart of downtown Indianapolis, we create a wide range of true-to-style traditional ales and quirky experimental styles — always easy drinking, but big on flavor. Since day one we’ve donated 5% of our profits to animal and wildlife organizations to give back to the planet that gives us beer. Drink beer. Help animals.', '11:00am-11:00pm', 'https://media-cdn.tripadvisor.com/media/photo-s/19/a6/69/0b/view-of-the-bar.jpg', '-86.1460738', '39.7640647', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('St. Benedicts Brew Works', '812-998-2337', 'brewing@stbenedictsbrewworks.com','860 E 10th St, Ferdinand, IN 47532-9240', 'Located in the beautiful rolling hills of Ferdinand, Indiana, our brewery is dedicated to creating delicious craft beers and serving delectable comfort food to feed our community. Pray, work, brew. . . thats our motto.', '10:00am-10:00pm', 'https://inontap.wpenginepowered.com/wp-content/uploads/2016/11/2-.png', '-86.85428', '38.224216', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Peoples Brewing Company', '812-998-2337', 'info@peoplesbrew.com','2006 N 9th Street, Lafayette, IN 47904-1068', 'We were established in 2009 and are located in Lafayette, Indiana. We produce hand-crafted beers to fit many people. We brew beers that you want to drink, not just try. Our selection of year-round, seasonal and specialty beers means there is something for everyone. We have a passion for classic styles. American ales, German lagers, Belgian ales, English ales and more can be found all around Indiana and Chicago. Ask for Peoples where you buy beer or come see us at the brewery.', '12:00pm-9:00pm', 'https://cdn.craftbeer.com/wp-content/uploads/2016/08/Peoples-Brewing-Co-feature.jpg', '-86.8867462', '40.4376445', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Lexington Brewing & Distilling Co.', '859-255-2337', 'tours@lexingtonbrewingco.com','401 Cross St, Lexington, KY 40508', 'In the heart of bourbon country, Lexington Brewing & Distilling Co. celebrates timeless traditions and bold imaginations. Our award-winning beers and spirits are steeped in the history, charm and excitement of Kentucky – where legends live fast and free. Our family-owned brewery and distillery is shaped by a heritage that includes seven generations of Irish distillers, brewers and coopers. Uncompromising in excellence, we carefully select natural ingredients for their superior quality. From tours to pours, we are committed to delivering a world-class customer experience. Our story is deeply rooted in the rolling green hills of Ireland and the limestone-rich landscape of Kentucky. Make Lexington Brewing & Distilling Co. part of your story.', '9:30am-6:00pm', 'https://cdn.hourdetroit.com/wp-content/uploads/sites/20/2017/09/2016-Brewery-June-2-1.jpg', '-84.50932', '38.049783', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('West Sixth Brewing', '859-705-0915', 'hello@westsixthbrewing.com','501 W Sixth St, Lexington, KY 40508-1341', 'Founded in 2012, West Sixth Brewing is located in a 100 year old building called the Bread Box, historically used for the Rainbo Bread Factory, in Lexington, Kentucky. We brew, can and bottle our beer out of this location, selling it at bars, restaurants, grocery and liquor stores throughout the state of Kentucky and across the Ohio River in Cincinnati. We pride ourselves on the craft beer we make and having a positive impact on the communities were a part of. ', '11:00am-12:00am', 'https://images.squarespace-cdn.com/content/v1/58811a07a5790a4cf9ddc853/1612463480437-CZFHKOHXJIEYMSDVZQLC/NuLuExterior-Oct2020-5.jpg?format=2500w', '-84.4923207', '38.0596696', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Dueling Barrels Brewery & Distillery', '606-766-3835', 'DuelingBarrels@Alltech.com','745 Hambley Blvd, Pikeville, KY 41501-9078', 'Welcome to Dueling Barrels Brewery & Distillery, where handcrafted beverages are a toast to the proud spirit of the mountains and the passionate people who shape the region. Founders Pearse and Deirdre Lyons have long felt a special kinship with the mountains, craftsmanship and hardworking people of Appalachia. After immigrating to Kentucky from Ireland, they developed an affinity for the region because of the many ways it reminds them of home. Stories that move mountains live here, including the legendary Hatfields and McCoys feud, the dawn of Bluegrass music and starry nights spent making moonshine along the Tug Fork stream. Dueling Barrels welcomes you to explore this rich history and culture through the lens of brewing and distilling.', '11:00am-12:00am', 'https://www.duelingbarrels.com/sites/default/files/Dueling-Barrels-May11-18-013%20shutters.jpg', '-82.5190502', '37.4809926', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Country Boy Brewing', '859-554-6200', 'alex@countryboybrew.com','436 Chair Ave, Lexington, KY 40508-3106', 'COUNTRY BOY BREWING WAS FOUNDED IN 2012 BY FOUR NATIVE KENTUCKIANS WITH A PASSION FOR GREAT CRAFT BEER. COUNTRY BOY PRIDES ITSELF ON MAKING MINIMALLY PROCESSED BEERS WITH HIGH QUALITY, REAL INGREDIENTS. THEIR PASSION FOR GREAT BEER SHINES THROUGH THEIR CORE BRANDS, COUGAR BAIT AMERICAN BLONDE ALE AND SHOTGUN WEDDING VANILLA BROWN ALE. THEIR RECENT EXPANSION TO GEORGETOWN, KY WITH THE LARGEST PRODUCTION BREWERY IN THE STATE WILL ALLOW THEM TO CAN THEIR POPULAR CLIFF JUMPER IPA AND HALFWAY HOME PALE ALE, IN ADDITION TO SEVERAL SEASONAL OFFERINGS.', '11:00am-12:00am', 'https://gray-wkyt-prod.cdn.arcpublishing.com/resizer/N5QHIWOkY87td2sIfZCvCO7Xo1g=/1200x675/smart/filters:quality(85)/cloudfront-us-east-1.images.arcpublishing.com/gray/H56UQXP63JNNXG4NX6GIORBIRY.jpg', '-84.5092527', '38.0439487', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Ethereal Brewing', '859-309-1254', 'hello@etherealbrewing.com','1224 Manchester St, Lexington, KY 40504-1129', 'This 25-acre property was home to the historic James E. Pepper Distillery, which began making bourbon in 1879. However, in 1958 the site was abandoned completely, untouched for nearly 50 years. Ethereal Brewings place on the property begins with Andrew Bishop traveling to Northwood IA to visit family where he found his uncle brewing beer in a small brewery and taproom called Worth Brewing. Andrew saw this as his future, owning and operating a Craft Brewery. He soon found a partner in beer, Brandon Floan, who was captivated by the science of the production of craft beer. Since then, this revitalized piece of Lexington history has become a lively downtown destination.', '12:00pm-12:00am', 'https://scontent.fagc1-1.fna.fbcdn.net/v/t39.30808-6/356232431_744384187490041_6520955096431634886_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=300f58&_nc_ohc=05_zJOPhNUYAX9ka6Wy&_nc_ht=scontent.fagc1-1.fna&oh=00_AfDKYnEm3zEfv2RMawc0WSVIR2MGq4Yvm7lpYhtH4XaEQg&oe=64DE013A', '-84.5200035', '38.056562', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Blue Stallion Brewing Company', '877-928-2337', 'hello@bluestallion','610 W Third St, Lexington, KY 40508-1243', 'The idea behind Blue Stallion Brewing Company started over the winter of 2012 by founders Kore Donnelly, Nico Schulz, Xavier Donnelly, Jim Clemons, and Zac Donnelly. Lexington was primed for local craft beer and these gentlemen wanted to bring their passion and expertise to the local beer scene. This is where wanting to foster tradition with innovation was born. Blue Stallion Brewing specializes in boldly traditional German style ales and lagers. We offer approachable beers, such as light lagers along with trendy IPAs and various sours. This hybrid of constantly brewing truly authentic German beers and pulling off new stylish trends, we believe we offer something truly unique to the Lexington beer scene.', '11:00am-12:00am', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/f1/71/d4/blue-stallion-brewing.jpg?w=1200&h=-1&s=1', '-84.5200035', '38.056562', 'false', 3, 0);
INSERT INTO breweries (brewery_name, phone_number, email_address, address, brewery_history, operating_hours, brewery_image, longitude, latitude, from_third_party, brewer_id, average_rating)
VALUES('Wooden Cask Brewery Company', '859-261-2172', 'info@woodencask.com','629 York St, Newport, KY 41071-1815', 'Our location used to be home to the gangsters, mobsters, and gamblers at the Flamingo Club (633 Club). In the late 1930s, Arthur Dennert opened the Flamingo Club at 633 York Street. Dennert was a local bootlegger who subsequently opened Club Alexandria and was a partner in a beer distributing company. The Eastern Syndicate, with full concurrence of the Cleveland Syndicate (who owned the Northern Kentucky area), forced Dennert out of the Flamingo. The Levinson brothers, Mike, Ed and Sleepout Louis ran the Flamingo. The back room featured a large gambling area. ', '12:00pm-7:00pm', 'https://img.grouponcdn.com/deal/2NUFocMzca9MhJAEVehgZbppzab4/2N-2000x1200/v1/c870x524.webp', '-84.494123', '39.090119', 'false', 3, 0);



INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Red Stripe', 'Delicious Lager', 5, 'pale lager', 'Red Stripes aroma is grainy sweet with just a hint of sweet apples. Its flavor follows suit with a generally nondescript sweetness and a healthy carbonation sting on the tongue.', 4.7,
'https://us.redstripebeer.com/wp-content/uploads/RedStripe_Bottle1-e1584649389617.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Heineken', 'When you see the red-star on the green bottle, you know every ice-cold, crisp sip will deliver that richly satisfying flavor with subtle fruity notes.', 4, 'lager', 'Heineken is a lager beer with a mild yet bitter taste. Unlike other beers that are infused with a variety of flavors, Heineken is about as simple as it gets.', 5.0,'https://www.heineken.com/media-us/01pfxdqq/heineken-original-bottle.png?quality=85',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Blue Moon', 'This is a cheep beer... yum', 4, 'Wheat Beer', 'Blue Moon, brewed with pineapple and orange peel for a lighter, exceptional taste', 5.4,
'https://dydza6t6xitx6.cloudfront.net/ci-blue-moon-belgian-white-d6c2c5a09c25d4ee.jpeg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Yuengling', 'This is a cheep beer... yum', 5, 'Lager',
'Famous for its rich amber color and medium-bodied flavor, with roasted caramel malt for a subtle sweetness and a combination of cluster and cascade hops, this true original delivers a well-balanced taste with very distinct character.'
, 4.5,
'https://icdn.bottlenose.wine/images/full/630151.png?min-w=200&min-h=200&fit=crop', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Budweiser', 'This is a cheep beer... yum', 5, 'Lager', 'Budweiser is a medium-bodied, flavorful, crisp American-style lager. It is brewed with the best barley malt and a blend of premium hop varieties.', 5.0,
'https://instagopher.com/media/amasty/webp/catalog/product/cache/db9d44ade45d2eecb0f317a9b55d669d/b/u/budweiser_beer_bottles_jpg.webp',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Coors', 'Coors Light Beer is an American style light lager. Crisp, clean and refreshing, this light beer has a 4.2% alcohol by volume. Full of Rocky Mountain refreshment, this light calorie beer has a light body with clean malt notes and low bitterness.',
3, 'lager', 'light crisp grain, corn, and banana bread notes', 4.0,
'https://thepartysource.com/image/cache/catalog/inventory/COORS-BANQUET-24-PACK-CAN-500x500.jpg',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Shock Top', 'Shock Top is an unfiltered Belgian-style wheat ale (also known as a White or Wit beer due to its appearance) that is naturally cloudy with a billowy white foam head, light golden hue and slight taste of orange peel and coriander.',
 3, 'lager', 'Lemon And Lime Peels. Deliver a tart punch.', 5.2,
'https://www.drinkhacker.com/wp-content/uploads/2014/04/Shock-Top-Honey-Bourbon-Cask-Wheat-bottle.jpg',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Voodoo Ranger', 'Bursting with tropical aromas and juicy fruit flavors from Mosaic and Amarillo hops, this golden IPA is perfectly bitter with a refreshing, sublime finish. This IPA style beer is best paired with curried dishes and Thai cuisine featuring shellfish.',
 3, 'IPA', 'Lemon And Lime Peels. Deliver a tart punch.', 9.5,
'https://www.ufsdeal.com/media/catalog/product/cache/d9fd7e296718bfd658e7e6b610a33c7c/M/-/M-1151260_zb0kiKu0AOsL4qkz.jpg',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Kona Big Wave', 'Big Wave is a light golden ale with a subtle fruitiness and delicate hop aroma. A smooth, easy drinking refreshing ale. The lightly roasted honey malt contributes to the golden hue of this beer and also gives a slight sweetness that is balanced out by our special blend of hops.',
 3, 'Lager', 'Light, bready malt overlayed with spicy, slightly resinous hops.', 4.4,
'https://halftimebeverage.com/media/catalog/product/cache/5a9ece781d558937ae51db0fc99c94f4/1/0/10433.png',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Corona', 'Corona is a light and crisp pale Mexican lager thats wildly popular in the U.S. Its flavor profile is not overly complex, with sweet notes and a bit of hoppy skunkiness on the palate that places it squarely between mass-produced light American lagers and heavier, more complex beer from Europe.',
 3, 'Lager', 'Corona is a light and crisp pale Mexican lager thats wildly popular in the U.S. Its flavor profile is not overly complex, with sweet notes and a bit of hoppy skunkiness.', 4.8,
'https://www.rossofinefood.com/3991-large_default/corona-beer-extra-355-cl.jpg',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Dos Equis', 'Dos Equis® Lager Especial is a golden pilsner-style beer made from water and the choicest hops. With a balanced composition and a smooth, clean finish, its the party guest who is always invited and never overstays his welcome. ',
 3, 'Lager', 'Dos Equis Lager has a unique flavor that includes light caramel and malt but no hoppiness, resulting in a flavor profile that includes a touch of sweetness and only a mild bitterness.', 4.7,
'https://dosequis.com/wp-content/uploads/dos-equis-lager-especial-bottle-001-1.png',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Tecate', 'Tecate is part of the San Diego-Tijuana metropolitan area and the largest city between Tijuana and Mexicali. Tecate is a regional economic hub and popular tourist destination, known as home to the Tecate Port of Entry and to Tecate Beer. ',
 3, 'Lager', 'Tecate reveals, as expected, some pale, malty sweetness. Its lightly grainy, with a character more reminiscent of corn sweetness than that of bread or yeasty.', 7.5,
'https://www.wine-searcher.com/images/labels/91/61/10929161.jpg',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Pachanga', 'Pachanga is a Mexican-Style Lager with a crisp malt flavor and thirst quenching character, perfect for hot days in the summer sun.',
4, 'lager', 'Low bitterness, subtle sweetness, slight lingering bitterness.', 4.2,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/Pachanga12ozWeb.jpg',0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Sunlight', 'Sunlight Cream Ale celebrates American brewing tradition by balancing smooth malt complexity with a crisp, clean finish.',
4, 'cream ale', 'Slightly sweet, lightly bitter, with a subtle lingering sweetness.', 5.3,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/Sunlight12ozWeb.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Orange Vanilla Sunlight', 'Orange Vanilla Sunlight Cream Ale combines smooth malt character with the flavors and orange, all with a crisp, clean finish.',
4, 'cream ale', 'Slightly sweet, lightly bitter, with a subtle lingering sweetness.', 5.3,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/OrangeVanilla12ozWeb.jpg', 0);


INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Electric Reindeer', 'Electric Reindeer is a Brown Ale brewed with ginger and molasses for NewFields Winter Lights.',
3, 'brown ale', 'Moderately sweet, lightly bitter, with a mild lingering sweetness.', 5.5,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/ElectricReindeer12ozWeb.jpg', 0);


INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Keller Haze', 'Keller Haze is an IPA with pronounced flavors of pineapple, citrus, tropical fruit, and orange peel finished in a slightly hazy kellerbier style.',
4, 'india pale ale', 'Light sweet, slightly sweet liner, subtle bitterness.', 6.3,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/KellerHaze12ozWeb.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('GFJ', 'GFJ American Ipa crafted with a unique blend of hops to provide the tropical aroma and flavors of grapefruit, passionfruit, tangerine, and apricot.',
4, 'american ipa', 'Mildly bitter, gentle sweetness,and a lightly bitter lingering finish.', 7.7,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/GFJ16ozWeb.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Amber Has Two Moms', 'Amber Has Two Moms is an American Amber Ale with beautiful red hue and a rich caramel malt flavor',
4, 'amber ale', 'Light sweet, slightly sweet liner, lightly bitter lingering finish.', 5.3,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/AmberHasTwoMoms16ozWeb.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Eels on Wheels', 'Eels on Wheels is a Double IPA brewers with Mosaic and Nugget hops and a hazy yeast strain for a tropical and fruity character.',
4, 'double ipa', 'Mildly bitter, gentle sweetness, and a lightly bitter lingering finish.', 7.6,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/EelsOnWheels16ozWeb.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Wee Mac', 'Wee Mac Scottish-style Ale is an enticing and malty brown ale with caramen, cocoa, and hazelnut character balanced with toffee undertones.',
5, 'scottish-style ale', 'Moderately sweet, subtly bitter, with a gentle lingering sweetness.', 5.3,
'https://www.sunkingbrewing.com/wp-content/uploads/2022/12/WeeMac12ozWeb.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Beer for Humans', 'Beer for Humans features a satisfyingly crisp, crackery malt bill high-fived by a bright & citrusy blend of Centennial. Mosaic, el Dorado, Eureka and Suitana hops.',
3, 'Ale', 'Low bitterness, subtle sweetness, slight lingering bitterness .', 4.5,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2023/01/30234418/BFH_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Bubbles', 'Bubbles is a refreshingly effervescent blend of peach, apple and cranberry.',
4, 'fruited hard beverage', 'Moderate sweetness, mild acidity, lingering notes of apple and cranberry.', 5.0,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2023/01/30234418/BFH_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Cheetah', 'Cheetah sprints ever forward. A blur of pure instinct. Buena onda. Pure, crisp, clean. Blissful simplicity. Savor this moment. All we have and all we need is now. Feel free and therefore you are free.',
3, 'lager', 'Low bitterness, subtle sweetness, slight lingering bitterness.', 4.8,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2018/08/04022328/Cheetah_12oz_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Cincy Light', 'Cincy Light, a refreshingly crisp lager brewed in partnership with Cincy Reigns benefitting student-athletes. This easy-drinking classic is the perfect way to celebrate the Queen City. Raise a toast to triumph, that the Red and Black shall reign.',
3, 'lager', 'Low bitterness, subtle sweetness, slight lingering bitterness.', 4.2,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2023/06/10185212/CincyLight_12oz_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Geist Tea', 'Exceptionally refreshing and just sweet enough, Geist Tea captures the taste and spirit of classic, sun-brewed iced tea, with a little extra nerve.',
3, 'hard tea', 'Hint of candied lemon, medium sweetness, leading to a clean, crisp finish.', 5.0,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2022/04/09131648/GeistTea_12oz_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Geist Tea Half & Half', 'Geist Tea Half & Half is a sun-kissed blend of hard black tea and bright lemonade, perfect for sunny day sippin. Geist Tea Half & Half is available in cans year round.',
4, 'hard tea', 'Hint of candied lemon, medium sweetness, leading to a clean, crisp finish.', 5.0,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2023/07/19133550/GeistTea_HalfnHalf_12oz_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Juicy Truth', 'Brewed to unleash the mouthwatering, tropical notes and aromas of the generous hop bill, Juicy Truth delivers on the promise made by our iconic flagship IPA: always bold, always consistent, always fresh, always delicious.',
5, 'india pale ale', 'Notes of juicy pineapple, medium sweetness, leading to a clean, crisp  fruity finish.', 6.5,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2022/12/31102148/JuicyTruth_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Titanoboa', 'This Imperial IPA devours a titanic amount of hops for a dense tropical profile loaded with pineapple, passionfruit, and just a bit of citrus on the tail end (see what we did there?). Titanoboa is a limited release',
4, 'imperial ipa', 'Hint of pineapple, just a bit of citrus on the tail end.', 9.0,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2023/06/11134912/Titanoboa_19.2oz_Render-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Zango Crush', 'A citrus celebration with tropical trimmings, Zango Crush is an uncommonly refreshing blend of mango and blood orange',
3, 'fruited hard beverage', 'Blend of mango, just a bit of citrus on the tail end.', 5.0,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2022/03/11135436/RGBevs_ZangoCrush_CanRender-1-768x1178.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Amber Lager', 'Antelope gracefully leaps through fields of toasty, amber malts and light, aromatic hops. Crafted for fans of traditionally balanced brews, this Amber Lager is as agile, dynamic and robust as its namesake.',
3, 'lager', 'Low bitterness, subtle sweetness, slight lingering bitterness.', 5.0,
'https://d24v69n0tr7hm9.cloudfront.net/wp-content/uploads/2022/12/12103630/Antelope_12oz_CanRender-768x1179.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Happy Amber', 'From restaurant foodie to backyard griller, Happy Amber is here to elevate any meal. Infused into a gourmet dish or just sipped from a can while barbecuing, find your happy place and enjoy this award-winning beer',
5, 'ale', 'Caramel, Flora, Bready.', 6.0,
'https://madtree.com/wp-content/uploads/2023/01/Happy-Amber_Can-Render.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Legendary Lager', 'A balanced and crisp lager with light kettle hop aroma and floral notes followed by a dry finish. MadTree Legendary Lager balances the line between a craft Pilsner and Macro American Lager. So crack open a classic & crisp MadTree Legendary Lager and keep the story flowing',
4, 'lager', 'Classic & Crisp.', 4.2,
'https://madtree.com/wp-content/uploads/2023/01/Legendary-Lager.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Phantom Forest', 'Patterns of stone fruit, berry medley and tropical hop flavors come together to create an artfully crafted beer. Followed by a juicy taste and smooth finish, now’s the time to enjoy the moment you’ve been looking forward to. Find your forest.',
4, 'india pale ale', 'Stone Fruit, Tropical, & Smooth.', 8.0,
'https://madtree.com/wp-content/uploads/2023/01/Phantom-Forest_Can-Render.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Psychopathy', 'A staple beer to keep stocked in the fridge, this reliable IPA bursts with bright citrus flavors followed by a smooth finish. PsycHOPathy is the go-to option for any day, especially the ones hanging out with friends.',
4, 'india pale ale', 'Cascade, Chinook, & Centennial.', 6.9,
'https://madtree.com/wp-content/uploads/2023/01/PsycHOPathy_Can-Render-3.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Shade', 'Have it made with Shade and add a splash of color to any occasion. With real blackberries, this fruit ales versatility compliments a day of relaxation to a fun, vibrant happy hour get together.',
4, 'tart fruit ale', 'Fruity, Refreshing, & Slightly Tart.', 4.0,
'https://madtree.com/wp-content/uploads/2023/01/Shade_Can-Render.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Sway Blackberry + hibiscus', 'Sway by MadTree is made for any moment that moves you. Artfully crafted with natural fruit essences of blackberry and hibiscus, our premium cocktails are light and refreshing, deliciously unique, and always ready for the taking.',
4, 'vodka soda', 'Blackberry, and Hibiscus.', 4.5,
'https://madtree.com/wp-content/uploads/2023/01/Sway-Blackberry-Hibiscus-Can-Render-e1682951920965.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Sway Grapefruit + Ginger ', ' Sway by MadTree is made for any moment that moves you. Artfully crafted with natural fruit essences of grapefruit and ginger, our premium cocktails are light and refreshing, deliciously unique, and always ready for the taking.',
4, 'vodka soda', 'Grapefruit, and Ginger.', 4.5,
'https://madtree.com/wp-content/uploads/2023/01/Sway-Grapefruit-_-Ginger-Can-Render-e1682947127414.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Sway Raspberry + Lemon ', 'Sway by MadTree is made for any moment that moves you. Artfully crafted with natural fruit essences of raspberry and lemon, our premium cocktails are light and refreshing, deliciously unique, and always ready for the taking.',
3, 'vodka soda', 'Raspberry, and Lemon.', 4.5,
'https://madtree.com/wp-content/uploads/2023/01/Sway-Raspberry-_-Lemon-Can-Render-e1682947079971.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Sway Strawberry + Guava ', 'Sway by MadTree is made for any moment that moves you. Artfully crafted with natural fruit essences of strawberry and guava, our premium cocktails are light and refreshing, deliciously unique, and always ready for the taking.',
4, 'vodka soda', 'Strawberry, and Guava.', 4.5,
'https://madtree.com/wp-content/uploads/2023/01/Sway-Strawberry-_-Guava-Can-Render-e1682952023191.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Tropical Psychopathy ', 'We took our flagship IPA and added flavors of passion fruit, orange, and guava for a tropical twist on a classic IPA.',
4, 'india pale ale', 'Passion Fruit, Orange, and Guava.', 6.9,
'https://madtree.com/wp-content/uploads/2023/01/Tropical-Pyschopathy_-Can-Render.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Lagon Scandinavian Farmhouse', 'Not too much, not too little. A farmhouse ale with wheat, barley, rye, and juniper. Fermented with honey using a Nordic Kveik yeast.',
3, 'ale', 'Classic & Crisp.', 6.0,
'https://d2s742iet3d3t1.cloudfront.net/restaurants/restaurant-29986000000000000/menu/items/8/item-500000003643458338_1646169321.jpg?size=medium', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Haze Between New England IPA', 'A swirling bouquet of tropical and citrus flavors gives way to a full bodied creamy finish. Brewed with Amarillo and dry-hopped with Mosaic and Citra hops.',
4, 'ipa', 'Tropical & Sweet.', 7.3,
'https://assets.untappd.com/photos/2023_05_27/157657d495c6148ae5ee95cac5207ee8_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('First of All Session IPA', 'A low ABV IPA thats both sessionable and over hopped with Mosaic and Cascade.',
3, 'ipa', 'Nicely balanced and easy to drink with bitter citrus hop presence.', 4.8,
'https://assets.untappd.com/photos/2023_05_06/abbf8c5e3099464d062a131a31d0d8c4_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Kick It Kottbusser', 'Kick it old school. This historical German beer has notes of honey, molasses, and oats. This clean fermenting beer is considered to be in the "white beer" family.',
3, 'beer', 'Notes of honey, molasses, and oats.', 5.8,
'https://d2s742iet3d3t1.cloudfront.net/restaurants/restaurant-29986000000000000/menu/items/5/item-500000027170507405_1688670116.jpg?size=medium', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Carnage Red IPA', 'This Red IPA has an upfront sweet caramel flavor followed by a soft bitterness. Finishes with in a piney bitterness on the backend.',
3, 'ipa', 'Nicely balanced and easy to drink with bitter citrus hop presence.', 6.6,
'https://assets.untappd.com/photos/2023_07_21/da83af9abfe06a2b4f83d218a22fa716_640x640.jpghttps://assets.untappd.com/photos/2023_08_12/84dd7e2f0d554f201e92d325a87ce8e3_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Asle Lebanese Wit', 'Our Lebanese take on a Witbier starts off sweet from an addition of pomegranate, followed by a slight tartness.',
3, 'beer', ' Notes of clove and a bit of banana are closely followed with a bit of spice from coriander and Zaatar.', 6.6,
'https://assets.untappd.com/photos/2023_06_10/15774e42e5f33c67b79986f1501c2ed2_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Norse Golden Ale', 'A crisp golden ale with a bright tartness from the addition of fresh lemongrass.',
3, 'ale', ' Notes of clove and a bit of banana are closely followed with a bit of spice from coriander and Zaatar.', 6.6,
'https://assets.untappd.com/photos/2023_08_09/aa15849e6ecb1ef08869b7c44ca2d1b4_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Poppin Berliner Weisse', 'This kettle sour Berliner has notes of pink guava, passion fruit, and papaya.',
3, 'wiesse', 'The aroma is floral and pleasant with a citrus note. Floral and sweet up front', 3.7,
'https://assets.untappd.com/photos/2023_07_30/c6c5e0a3d7c64485def173aa40746d52_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Mums N’ Roses Rose Gose', 'The aroma is floral and pleasant with a citrus note. Floral and sweet up front followed by a slight tartness. Finishes clean with a small amount of malt sweetness.',
3, 'gose', ' Floral and sweet up front followed by a slight tartness. Finishes clean with a small amount of malt sweetness.', 3.3,
'https://assets.untappd.com/photos/2023_07_02/eaa3f1d8be7ceb09ee6bf539e9c277ee_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Nycto Imperial Stout', 'This Imperial Stout starts with a small amount of orchard fruit and then goes into milk and dark chocolate notes. Medium bodied with a bitter coffee finish, rather than hoppy.',
3, 'gose', ' Floral and sweet up front followed by a slight tartness. Finishes clean with a small amount of malt sweetness.', 9.4,
'https://assets.untappd.com/photos/2023_08_10/0c2e42a370f147d0cf437c1e905e4288_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Hustler', 'Light, crisp traditional German lager.Like brewing in a Speedo: Nothing to hide behind',
3, 'lager', 'grainy citrus straw, light and crisp with a slight sweet finish.', 4.5,
'https://assets.untappd.com/photos/2023_07_19/c995e82778e52e69c9b7b8514f73a12a_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Barrister', 'Light, crisp, refreshing and subtly sweet. We use traditional ingredients to pay homage to a classic style out of Cologne, Germany',
4, 'ale', ' Has a slight sweetness to it. Finishes clean and dry with no bitterness.', 5.2,
'https://assets.untappd.com/photos/2023_07_28/43ac1b6bd32a1fdf3a30825cc8f5973d_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Designer', 'Light, crisp, refreshing and subtly sweet. We use traditional ingredients to pay homage to a classic style out of Cologne, Germany',
3, 'hefeweizen', ' Slightly bitter feel, light and crisp.', 5.2,
'https://cdn.beeradvocate.com/im/beers/471322.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Brewer', 'German amber lager, nutty, toasty and caramelly festbier with malt character',
3, 'lager', ' Nutty caramel malts and nice sweet note, and a faint bitterness in the finish.', 5.8,
'https://cdn.beeradvocate.com/im/beers/471322.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Butcher', 'Made with German Pilsner malt and Noble hops,it has a dry, crisp refreshing finish, with a spritzy effervescence. Try it from our Czech Side Pour Handle.',
3, 'pilsner', 'Has a dry, crisp refreshing finish, with a spritzy effervescence.', 5.6,
'https://assets.untappd.com/photos/2023_01_01/9184d85d814d4ab343675637b2708b0c_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Heckler', 'Juicy hop profile - citrusy, fruit punch, finishes with some bitterness.',
4, 'ipa', 'citrusy, fruit punch, finishes with some bitterness.', 7.0,
'https://assets.untappd.com/photos/2023_08_10/3d9bcadeac9d89d4cc532410a030ef50_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('BA Importer', 'Rich and robust export stout aged in bourbon barrels for 1 year.Smooth roastiness with notes of vanilla and caramel.',
4, 'lager', 'Smooth roastiness with notes of vanilla and caramel.', 8.0,
'https://assets.untappd.com/photos/2023_06_10/c33ff7e54c4c4c87558446f7855cf7d4_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Brawler', 'Justin, our head brewer, created a schwarzbier recipe and turned it up to 10.5! This rich, dark lager has a sweet malty backbone, sporting notes of chocolate raisin and a voluminous texture.',
3, 'lager', 'Has a sweet malty backbone, sporting notes of chocolate raisin and a voluminous texture.', 10.5,
'https://assets.untappd.com/photos/2020_10_16/b8a3d4b0493d39ccd9a30cf13e04aedc_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Berliner', 'A traditional German style wheat ale.',
3, 'ale', 'Tart, crisp and refreshing.', 10.5,
'https://assets.untappd.com/photos/2023_08_12/a21317c780bfec4847a841af6452536a_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Preacher', 'Peach puree, malted barely and a dash of lactose combine to create a luscious, slightly sweet summer sipper sure to transport you to heavenly heights.',
4, 'ale', 'Slightly sweet summer sipper sure to transport you to heavenly heights.', 5.8,
'https://assets.untappd.com/photos/2023_08_12/77582a54af1ca0434aa323cb60b2b344_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Crusher', 'Helles lager blended with lemon soda.',
4, 'lager', 'Tart, light and refreshing.', 2.8,
'https://assets.untappd.com/photos/2023_06_18/79971165637f137c23dcd77816582982_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Solara Hefeweizen', 'A harmonious blend of traditional banana and clove flavors. Solara is a refreshing Hefeweizen that offers a tantalizing balance of fruity sweetness and subtle spice, making it a perfect companion for sunny afternoons.',
3, 'lager', 'Offers a tantalizing balance of fruity sweetness and subtle spice, making it a perfect companion for sunny afternoons.', 4.7,
'https://static.spotapps.co/spots/76/4799eaebd24027837e49dc6c214384/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Paraiso Mexican Lager', 'Inspired by Mexicos rich and vibrant culture, Paraíso delivers a crisp and refreshing taste with just the right amount of sweetness.',
4, 'lager', 'Delivers a crisp and refreshing taste with just the right amount of sweetness.', 4.7,
'https://static.spotapps.co/spots/6d/761a5d056f4bd2a15b4017ff265a09/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Luminati Lager', ' Inspired by the Lagers that built this city, this Helles style Lager is light, crisp and crushable.',
3, 'lager', 'Is light, crisp and crushable.', 5.2,
'https://static.spotapps.co/spots/6d/761a5d056f4bd2a15b4017ff265a09/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Lemon Shandy', 'This invigorating brew harmonizes the crispness of lemonade with the smooth bright character of a classic lager, creating a perfect balance of flavors for a truly refreshing drinking experience.',
4, 'lager', 'Is moderately sweet, crisp and sour.', 3.9,
'https://static.spotapps.co/spots/68/3844cb77e64a30a216b5131480a7b6/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Kallima', 'We take a crisp cream ale and infuse it with a special roasted La Terza coffee blend to provide a tantalizing twist thats refreshingly invigorating.',
4, 'ale', 'Provides a tantalizing twist thats refreshingly invigorating.', 4.8,
'https://static.spotapps.co/spots/bc/25ba4060054899b6d5a4b02c2ac95a/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Lotus IPA', 'A blossoming bouquet of grapefruit, orange and pine with a bitter and delightful finish.',
4, 'ale', 'Provides a tantalizing twist thats refreshingly invigorating.', 6.4,
'https://static.spotapps.co/spots/a8/6c180329a44442bd4dfb52ebca13d0/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Odyssey', 'Our adventure has come with some haze. But through it all, we maintain a commitment to brewing social change. This is our Odyssey.',
4, 'ipa', 'Provides a tantalizing twist thats refreshingly invigorating.', 6.5,
'https://static.spotapps.co/spots/dc/48857ab6fc4bc6a471c4f9d21181c6/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Dahlia', 'A medium-body ale with the aroma of dark chocolate & almond toffee. Expect a mellow malty finish.',
3, 'ale', 'Aroma of dark chocolate & almond toffee. Expect a mellow malty finish.', 5.4,
'https://static.spotapps.co/spots/65/8cc7369d594fe19d7d72ca10251636/full', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Rainy Day Clubhouse', ' Rainy Day Clubhouse Festbier is perfect for imbibing at a tailgate, fire pit, or in your cobbled together tent/clubhouse that protects you from the elements.',
3, 'lager', 'Provides a tantalizing twist thats refreshingly invigorating.', 5.2,
'https://streetsidebrewery.com/wp-content/uploads/2022/08/rainy-day-16oz.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Outer Space Orange Super Punch', ' Outer Space Orange Super Punch is a kick in a (pint) glass! Let that familiar cosmic orange flavor wash over your tongue as we take you back to the good ol days with this celestial treat.',
4, 'weisse', 'Low bitterness, subtle sweetness, slight lingering bitterness.', 7.0,
'https://streetsidebrewery.com/wp-content/uploads/2022/08/super-punch-16oz-can.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Earnest', ' Earnest Hefeweizen is our honest to goodness take on the classic German style. Made with German Pilsner and Wheat, we blended two German yeast strains to achieve copious banana esters and a rich, yeasty profile to compliment breadiness from the Red and White Wheat used in the grist.',
3, 'hefeweizen', 'Classic & Crisp.', 5.5,
'https://streetsidebrewery.com/wp-content/uploads/2022/07/earnest-16oz-can.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Species 001', ' Species 001, our NEIPA with HopBurst Nectaron, Citra, and El Dorado is an all out alien assault of flavor on your palate. Intense citrus, distinct pineapple, and juicy watermelon all make for a swillable NEIPA sensation.',
4, 'ipa', 'Slightly sweet, lightly bitter, with a subtle lingering sweetness.', 6.5,
'https://streetsidebrewery.com/wp-content/uploads/2022/07/species-16oz-can.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Wolf in Sheep’s Clothes', ' Wolf in Sheeps Clothes is an Imperial Pastry Stout that is absolutely inundated with Vanilla. Delicious caramel, decadent vanilla, and rich dark chocolate coat the tongue for a pastry experience like few others!',
4, 'ipa', 'Delicious caramel, decadent vanilla, and rich dark chocolate coat the tongue for a pastry experience like few others.', 11.0,
'https://streetsidebrewery.com/wp-content/uploads/2022/07/wolf-16oz-can.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Barrel ages creme brulee interstate pastry fight', ' Inspired by a favorite donut at The Barrel House, we aged the already delicious base in a Buffalo Trace and New Riff barrel for a year and then added Creme Brulee donuts to the mix to make this a pastry masterpiece. Thank you to the whole Barrel House crew for helping us make Batch 2 happen.',
4, 'ipa', 'Delicious sweet, decadent vanilla, coat the tongue for a pastry experience like few others.', 14.0,
'https://streetsidebrewery.com/wp-content/uploads/2022/06/interstate-pastry-fight-creme-brulee-16oz-can.png', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Vibe Merchant No.4', 'Vibe Merchant is a rotating New England IPA series showcasing different hops and yeasts. This adventure in ethereal experimentation will bring Streetside and their fans to the brink of the newest flavors, ideas, and techniques.',
3, 'ipa', 'Delicious sweet, decadent vanilla, coat the tongue for a pastry experience like few others.', 6.5,
'https://streetsidebrewery.com/wp-content/uploads/2022/06/vibe-merchant-no-4-streetsibe-brewery-16oz.png.webp', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Plu 4381', 'PLU 4381 is a Blood Orange Milkshake IPA with Citra, Mosaic, and you guessed it loads of Blood Orange. Fruity, citrusy, and a little tart, this Milkshake IPA is a collaboration with Dorothy Lane Market. This delightful, dessert beer is the perfect way to start summer off right.',
3, 'ipa', 'Fruity, citrusy, and a little tart.', 6.0,
'https://streetsidebrewery.com/wp-content/uploads/2022/07/plu-16oz-can.png.webp', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Come on in the Water’s Fine', 'Are you feeling nervous are you having fun its almost over its just begun dont overthink this look in my eye dont be scared dont be shy come on in the waters fine you say the whole worlds ending honey it already did.',
4, 'ipa', 'Fruity, citrusy, and a little tart.', 6.5,
'https://streetsidebrewery.com/wp-content/uploads/2022/05/Come-On-In-The-Waters-Fine-16-oz-Can.png.webp', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Big Dog Ipa', 'Our American IPA with bold hop flavor and aroma. This easy drinking draft has medium bitterness and a dry finish. Plus, it won the 2021 Alpha King Challenge.',
4, 'ipa', 'Light sweet, slightly sweet liner, lightly bitter lingering finish.', 6.0,
'https://assets.untappd.com/photos/2023_06_17/fc9227b7407719250f02ab850d43f1f5_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Gold Dollar Pale Ale', 'Sessionable American pale ale with lime and tropical fruit character. Featuring Citra and Motueka hops.',
3, 'ipa', 'Delivers a crisp and refreshing taste with just the right amount of sweetness.', 3.8,
'https://assets.untappd.com/photos/2023_06_04/67e7ecc7601942d8dca8e4cf17179841_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Pacer Pils', 'Our track favorite. An easy-drinking pilsner with a light bready malt profile and classic noble hop character.',
3, 'lager', 'Mildly bitter, gentle sweetness,and a lightly bitter lingering finish.', 5.3,
'https://assets.untappd.com/photos/2023_08_11/9dc1e8cfbdf26e1b3a36c691c1ea38b2_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Staycation', 'Margarita inspired Gose style ale brewed with coriander, sea salt, lemon and lime zest',
4, 'lager', 'Low bitterness, subtle sweetness, slight lingering bitterness.', 4.5,
'https://assets.untappd.com/photos/2022_07_05/c306975a50f7b4c96b392798ad45cd65_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Toasty', 'An English-style dark mild with flavors and aromas of toast, toffee, chocolate and roast. Another proud award-winner taking home a GABF bronze medal.',
3, 'ipa', 'Dark mild with flavors and aromas of toast, toffee, chocolate and roast.', 3.0,
'https://assets.untappd.com/photos/2023_01_09/d99ee833353487ca2bfc3b79af7587f2_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Hefeweizen', 'A straw-colored German style wheat beer with flavors and aromas of banana and clove',
3, 'lager', 'Provides a tantalizing twist thats refreshingly invigorating.', 5.0,
'https://assets.untappd.com/photos/2022_05_14/762abb43d5cfa53c7bf38d271a1942a0_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Vienna Lager', 'An amber lager with a smooth and complex bready malt character.',
4, 'lager', 'Provides a tantalizing twist thats refreshingly invigorating.', 5.0,
'https://assets.untappd.com/photos/2022_04_01/e378804b91174e54674b939395f3e176_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Double Down Stout', 'American stout with bold roast character and balanced hoppiness from generous additions of Cascade hops.',
4, 'lager', 'Provides a tantalizing twist thats refreshingly invigorating.', 5.0,
'https://assets.untappd.com/photos/2023_08_11/9dc1e8cfbdf26e1b3a36c691c1ea38b2_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Cake The Great', 'American stout with bold roast character and balanced hoppiness from generous additions of Cascade hops.',
4, 'lager', 'Provides a tantalizing twist thats refreshingly invigorating.', 5.0,
'https://assets.untappd.com/photos/2023_03_17/19b10a9c6aaabaa5373580944d290dbe_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Trotwood', 'Fireflies flash. Crickets hum. And the campfire, around which you and your companion sit, crackles and smokes. You watch the plumes, as they slip through the arms of old-growth trees, and vanish into an expanse of ancient stars.',
3, 'lager', 'A crisp, cold-fermented beer. Best enjoyed in the middle of nowhere with family and friends.', 4.0,
'https://warpedwing.com/wp-content/uploads/2018/04/trotwood_can_web.png', 0);

INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Old Ohio', 'Sometimes you just want an easy-drinking, light-bodied beer -- Old Ohio is just that.  Brewed to be balanced, this American Blonde Ale finishes with subtle citrus tones, and is the perfect beer to reach for after a long day on the farm.',
3, 'ale', 'Finishes with subtle citrus tones, and is the perfect beer to reach for after a long day on the farm.', 4.7,
'https://static.wixstatic.com/media/eeff99_285e468d92c748ca88e2d850c0dbe20a~mv2.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Oasteweizen', 'The first beer our Founder fell in love with was a Bavarian Hefeweizen, which is why we stated as traditional as possible with this brew.  Oasteweizens authentic Bavarian yeast lends notes of banana and clove to this haus favorite.',
3, 'hefeweizen', 'Oasteweizen’s authentic Bavarian yeast lends notes of banana and clove to this haus favorite.', 4.7,
'https://static.wixstatic.com/media/eeff99_58b2163977e5485f88830ca654c0e104~mv2.jpg/v1/crop/x_0,y_995,w_3718,h_3587/fill/w_198,h_191,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/IMG_0007.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Witbier', 'Wheat Ale Brewed with spices.',
4, 'ale', 'Crisp, refreshing body with citrus bouquet & subdued bitterness. Spice, Coriander & Orange Peel.', 6.0,
'https://assets.untappd.com/photos/2022_02_20/bbf5cf8824d2190b7105e0f6cf5c3f64_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Saison', 'Farmhouse Ale.',
4, 'ale', 'Rustic, earthy, complex spice notes in the aroma. Subtle cardamon and nutmeg.', 7.0,
'https://assets.untappd.com/photos/2022_11_06/389e78da107132ed2c6ae86941280fe6_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Honey Wagon', 'Its no load of manure - the aromatics of this Honeywagon has an eye-opening tropical mango-pineapple fruitiness.',
4, 'ipa', 'Honey malt sweetness provides enough body to accompany big hop.', 6.6,
'https://assets.untappd.com/photos/2023_08_12/b8514db137dd9569a5d06f0d11143959_640x640.jpg', 0);
INSERT INTO beers(beer_name, description, rating, beer_type, tasting_notes, abv, image, average_rating)
VALUES ('Wally Post Red', 'Summer, baseball and beer! This American Red is brewed to have a complex malt backbone with a subtle rye spiciness to celebrate a local legend.',
3, 'ale', 'Slightly sweet, lightly bitter, with a subtle lingering sweetness.', 5.4,
'https://www.untappd.com/photos/2023_08_09/b85ff3c8b59103f7cae59f306cbb58da_640x640.jpg', 0);


























--INSERT INTO reviews (rating, description, user_id, breweries_id, username)
--VALUES(4, 'I met my second ex-wife here. Love this place!', 2, 1, 'brennan');
--INSERT INTO reviews (rating, description, user_id, breweries_id, username)
--VALUES(5, 'I really like the staff theyre super welcoming and the atmosphere here is great too!', 2, 1,'steve');




INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(1,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(1,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(1,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(1,4);


INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(2,6);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(2,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(2,8);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(2,9);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(3,10);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(3,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(3,12);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(3,2);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(4,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(4,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(4,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(4,4);


INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(5,4);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(5,5);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(5,6);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(5,11);



INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(6,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(6,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(6,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(6,12);


INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(7,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(7,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(7,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(7,12);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(8,4);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(8,5);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(8,6);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(8,11);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(9,10);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(9,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(9,12);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(9,2);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(10,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(10,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(10,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(10,4);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(11,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(11,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(11,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(11,4);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(12,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(12,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(12,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(12,12);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(13,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(13,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(13,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(13,12);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(14,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(14,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(14,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(14,4);



INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(15,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(15,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(15,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(15,4);


INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(16,6);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(16,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(16,8);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(16,9);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(17,10);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(17,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(17,12);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(17,2);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(18,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(18,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(18,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(18,4);


INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(19,4);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(19,5);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(19,6);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(19,11);



INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(20,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(20,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(20,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(20,12);


INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(21,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(21,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(21,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(21,12);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(22,4);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(22,5);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(22,6);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(22,11);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(23,10);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(23,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(23,12);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(23,2);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(24,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(24,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(24,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(24,4);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(25,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(25,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(25,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(25,4);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(26,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(26,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(26,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(26,12);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(27,9);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(27,7);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(27,11);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(27,12);

INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(28,1);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(28,2);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(28,3);
INSERT INTO breweries_beers (breweries_id, beer_id)
VALUES(28,4);

COMMIT TRANSACTION;

