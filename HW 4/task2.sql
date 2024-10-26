UPDATE petEvent
SET eventtype = "vet", remark = "antibiotics"
WHERE petname = "Fluffy" AND eventdate = "2020-10-15"; 

UPDATE petPet
SET owner = "Diane", species = "hamster", gender = "M", birth = "2010-10-30", death = NULL
WHERE petname = "Hammy";  

UPDATE petEvent
SET eventtype = "vet", remark = "antibiotics"
WHERE petname = "Hammy" AND eventdate = "2020-10-15";  

UPDATE petEvent
SET remark = "5 kittens, 2 male, 3 female"  
WHERE petname = "Fluffy" AND eventdate="1995-05-15" AND eventtype = "litter";  

UPDATE petEvent
SET eventtype = "vet", remark = "broken rib"
WHERE petname = "Claws" AND eventdate = "1997-08-03"; 

UPDATE petPet
SET death = "2020-09-01" 
WHERE petname = "Puffball";

DELETE FROM petEvent 
WHERE petname = "Buffy";

DELETE FROM petPet 
WHERE petname = "Buffy" AND owner = "Harold" AND species = "dog";
