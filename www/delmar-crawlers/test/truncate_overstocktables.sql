TRUNCATE TABLE Overstock;
TRUNCATE TABLE Overstock_Attributes;
TRUNCATE TABLE Overstock_Images;
TRUNCATE TABLE Overstock_Links;
TRUNCATE TABLE Overstock_Temp_Ads;

SELECT name, AD_Link FROM `Overstock_Temp_Ads`

SELECT AD_Price, name, AD_Link FROM `Overstock_Temp_Ads` WHERE AD_Price IS NULL OR name=""

SELECT count(*), a.AD_Link FROM `Overstock_Images` i, `Overstock_Temp_Ads` a WHERE a.POST_ID = i.AD_id GROUP BY a.POST_ID

jQuery('ul.noZoom li img')

SELECT POST_ID, AD_Link, name FROM `Overstock_Temp_Ads` WHERE POST_ID NOT IN (SELECT a.POST_ID FROM `Overstock_Images` i, `Overstock_Temp_Ads` a WHERE a.POST_ID = i.AD_id GROUP BY a.POST_ID)
