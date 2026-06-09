   A1/*** Nombre d'engins par site***/
SELECT 
    s.nom,
    COUNT(e.id_engin) AS nombre_engins
FROM engins e
INNER JOIN sites s ON e.id_site = s.id_site
GROUP BY s.nom;   

A2/****Identifier s'il y a des jours où la production a été nulle (Tonnage = 0).***/


SELECT date_prod , tonnage_brut
FROM production p 
WHERE p.tonnage_brut = 0

A3***/la liste des engins avec le nom de leur site respectif ***/

SELECT e.id_engin ,s.nom
FROM engins e 
INNER JOIN sites s 
ON e.id_site = s.id_site;

B1***/Somme du tonnage brut par Province et par Type de Minerai.***/

SELECT 
    s.province,
    p.type_minerai,
    SUM(p.tonnage_brut) AS production_totale
FROM production p
INNER JOIN sites s ON p.id_site = s.id_site
GROUP BY s.province, p.type_minerai
ORDER BY s.province;

B2***/Le tonnage de métal pur (Tonnage Brut * Teneur %).***/


SELECT s.nom, SUM(e.tonnage_vendu * e.prix_unitaire_usd) AS CA
FROM sites s 
INNER JOIN exportations e 
ON s.id_site = e.id_site
GROUP BY s.nom 
ORDER BY CA 

B3***/Chiffre d'affaires total par site (Tonnage Vendu * Prix Unitaire).***/

SELECT
 s.nom ,SUM(tonnage_vendu*prix_unitaire_usd) AS chiffre_affaire
FROM production p 
INNER JOIN exportations e 
ON p.id_site = e.id_site 
INNER JOIN sites s 
ON e.id_site = s.id_site
GROUP BY e.id_site 

B4***/Lister les sites dont la teneur moyenne est inférieure à 2.5% (seuil de rentabilité).***/

SELECT s.nom ,AVG(p.teneur) AS moyenne_teneur  
FROM production p 
INNER JOIN sites s 
ON p.id_site = p.id_site 
GROUP BY s.nom 
HAVING AVG(p.teneur) >2.5



					




