-- ===========================================================
-- DATA CLEANING & STANDARDIZATION
-- • Create a clean, standardized version of the dataset
-- • Normalize text, trim whitespace, fix inconsistent labels
-- ===========================================================

DROP TABLE IF EXISTS supplychain.supplychain_cleaned;

CREATE TABLE supplychain.supplychain_cleaned AS
SELECT 
    LOWER(TRIM(Type)) AS Type,
    `Days for shipping (real)` AS Days_for_shipping_real,
    `Days for shipment (scheduled)` AS Days_for_shipment_scheduled,
    ROUND(`Benefit per order`, 2) AS Benefit_per_order,
    ROUND(`sales per customer`,2) AS sales_per_customer,
    LOWER(TRIM(`Delivery Status`)) AS Delivery_Status,
    late_delivery_risk,
    `Category Id` AS category_id,
    LOWER(TRIM(`Category Name`)) AS category_name,
    LOWER(TRIM(`Customer City`)) AS customer_city,
    CASE 
        WHEN `Customer Country` = 'EE. UU.' THEN 'United States'
        ELSE `Customer Country`
    END AS customer_country,
    `customer Fname` AS customer_first_name,
    `customer Lname` AS customer_last_name,
    `customer Id` AS customer_id,
    `customer Segment` AS customer_segment,
    `customer State` AS customer_state,
    `Customer Street` AS customer_street,
    `Customer Zipcode` AS customer_zipcode,
    `Department Id` AS department_id,
    `Department Name` AS department_name,
    latitude,
    longitude,
    TRIM(Market) AS market,
    LOWER(TRIM(`Order City`)) AS order_city,

    /* Country normalization */
    CASE 
        WHEN `order country` = 'Afganistán' THEN 'Afghanistan'
        WHEN `order country` = 'Arabia Saudí' THEN 'Albania'
        WHEN `order country` = 'Alemania' THEN 'Saudi Arabia'
        WHEN `order country` = 'Argelia' THEN 'Algeria'
        WHEN `order country` = 'Azerbaiyán' THEN 'Azerbaijan'
        WHEN `order country` = 'Bangladés' THEN 'Bangladesh'
        WHEN `order country` = 'Baréin' THEN 'Bahrain'
        WHEN `order country` = 'Bélgica' THEN 'Belgium'
        WHEN `order country` = 'Benín' THEN 'Benin'
        WHEN `order country` = 'Bielorrusia' THEN 'Belarus'
        WHEN `order country` = 'Bosnia y Herzegovina' THEN 'Bosnia and Herzegovina'
        WHEN `order country` = 'Botsuana' THEN 'Botswana'
        WHEN `order country` = 'Brasil' THEN 'Brazil'
        WHEN `order country` = 'Bután' THEN 'Bhutan'
        WHEN `order country` = 'Camboya' THEN 'Cambodia'
        WHEN `order country` = 'Camerún' THEN 'Cameroon'
        WHEN `order country` = 'Chipre' THEN 'Cyprus'
        WHEN `order country` = 'Corea del Sur' THEN 'South Korea'
        WHEN `order country` = 'Costa de Marfil' THEN 'Ivory Coast'
        WHEN `order country` = 'Croacia' THEN 'Croatia'
        WHEN `order country` = 'Dinamarca' THEN 'Denmark'
        WHEN `order country` = 'Egipto' THEN 'Egypt'
        WHEN `order country` = 'Emiratos Árabes Unidos' THEN 'United Arab Emirates'
        WHEN `order country` = 'Eslovaquia' THEN 'Slovakia'
        WHEN `order country` = 'Eslovenia' THEN 'Slovenia'
        WHEN `order country` = 'España' THEN 'Spain'
        WHEN `order country` = 'Estados Unidos' THEN 'United States'
        WHEN `order country` = 'Etiopía' THEN 'Ethiopia'
        WHEN `order country` = 'Filipinas' THEN 'Philippines'
        WHEN `order country` = 'Finlandia' THEN 'Finland'
        WHEN `order country` = 'Francia' THEN 'France'
        WHEN `order country` = 'Gabón' THEN 'Gabon'
        WHEN `order country` = 'Grecia' THEN 'Greece'
        WHEN `order country` = 'Guadalupe' THEN 'Guadeloupe'
        WHEN `order country` = 'Guayana Francesa' THEN 'French Guiana'
        WHEN `order country` = 'Guinea Ecuatorial' THEN 'Equatorial Guinea'
        WHEN `order country` = 'Haití' THEN 'Haiti'
        WHEN `order country` = 'Hungría' THEN 'Hungary'
        WHEN `order country` = 'Irak' THEN 'Iraq'
        WHEN `order country` = 'Irán' THEN 'Iran'
        WHEN `order country` = 'Irlanda' THEN 'Ireland'
        WHEN `order country` = 'Italia' THEN 'Italy'
        WHEN `order country` = 'Japón' THEN 'Japan'
        WHEN `order country` = 'Jordania' THEN 'Jordan'
        WHEN `order country` = 'Kazajistán' THEN 'Kazakhstan'
        WHEN `order country` = 'Kirguistán' THEN 'Kyrgyzstan'
        WHEN `order country` = 'Lesoto' THEN 'Lesotho'
        WHEN `order country` = 'Líbano' THEN 'Lebanon'
        WHEN `order country` = 'Libia' THEN 'Libya'
        WHEN `order country` = 'Lituania' THEN 'Lithuania'
        WHEN `order country` = 'Luxemburgo' THEN 'Luxembourg'
        WHEN `order country` = 'Macedonia' THEN 'North Macedonia'
        WHEN `order country` = 'Malasia' THEN 'Malaysia'
        WHEN `order country` = 'Marruecos' THEN 'Morocco'
        WHEN `order country` = 'Martinica' THEN 'Martinique'
        WHEN `order country` = 'México' THEN 'Mexico'
        WHEN `order country` = 'Moldavia' THEN 'Moldova'
        WHEN `order country` = 'Níger' THEN 'Niger'
        WHEN `order country` = 'Noruega' THEN 'Norway'
        WHEN `order country` = 'Nueva Zelanda' THEN 'New Zealand'
        WHEN `order country` = 'Omán' THEN 'Oman'
        WHEN `order country` = 'Países Bajos' THEN 'Netherlands'
        WHEN `order country` = 'Pakistán' THEN 'Pakistan'
        WHEN `order country` = 'Panamá' THEN 'Panamá'
        WHEN `order country` = 'Papúa Nueva Guinea' THEN 'Papua New Guinea'
        WHEN `order country` = 'Perú' THEN 'Peru'
        WHEN `order country` = 'Polonia' THEN 'Poland'
        WHEN `order country` = 'Reino Unido' THEN 'United Kingdom'
        WHEN `order country` = 'República Centroafricana' THEN 'Central African Republic'
        WHEN `order country` = 'República Checa' THEN 'Czech Republic'
        WHEN `order country` = 'República de Gambia' THEN 'Gambia'
        WHEN `order country` = 'República del Congo' THEN 'Republic of the Congo'
        WHEN `order country` = 'República Democrática del Congo' THEN 'Democratic Republic of the Congo'
        WHEN `order country` = 'República Dominicana' THEN 'Dominican Republic'
        WHEN `order country` = 'Ruanda' THEN 'Rwanda'
        WHEN `order country` = 'Rumania' THEN 'Romania'
        WHEN `order country` = 'Rusia' THEN 'Russia'
        WHEN `order country` = 'Sáhara Occidental' THEN 'Western Sahara'
        WHEN `order country` = 'Sierra Leona' THEN 'Sierra Leone'
        WHEN `order country` = 'Singapur' THEN 'Singapore'
        WHEN `order country` = 'Siria' THEN 'Syria'
        WHEN `order country` = 'Somalia' THEN 'Somalia'
        WHEN `order country` = 'Suazilandia' THEN 'Eswatini'
        WHEN `order country` = 'SudAfrica' THEN 'South Africa'
        WHEN `order country` = 'Sudán' THEN 'Sudan'
        WHEN `order country` = 'Sudán del Sur' THEN 'South Sudan'
        WHEN `order country` = 'Suecia' THEN 'Sweden'
        WHEN `order country` = 'Suiza' THEN 'Switzerland'
        WHEN `order country` = 'Surinam' THEN 'Suriname'
        WHEN `order country` = 'Tailandia' THEN 'Thailand'
        WHEN `order country` = 'Taiwán' THEN 'Taiwan'
        WHEN `order country` = 'Tayikistán' THEN 'Tajikistan'
        WHEN `order country` = 'Trinidad y Tobago' THEN 'Trinidad and Tobago'
        WHEN `order country` = 'Túnez' THEN 'Tunisia'
        WHEN `order country` = 'Turquía' THEN 'Turkey'
        WHEN `order country` = 'Ucrania' THEN 'Ukraine'
        WHEN `order country` = 'Uzbekistán' THEN 'Uzbekistan'
        WHEN `order country` = 'Yibuti' THEN 'Djibouti'
        ELSE `order country`
    END AS order_country,
    `order Customer Id` AS order_customer_id,
    DATE(STR_TO_DATE(`order date (DateOrders)`, '%c/%e/%Y %H:%i')) AS order_date,
    TIME(STR_TO_DATE(`order date (DateOrders)`, '%c/%e/%Y %H:%i')) AS order_time,
    `Order Id` AS order_id,
    `Order Item Cardprod Id` AS order_item_cardprod_id,
    ROUND(`Order Item Discount`, 2) AS order_item_discount,
    ROUND(`Order Item Discount Rate`, 2) AS order_item_discount_rate,
    `Order Item Id` AS order_item_id,
    ROUND(`Order Item Product Price`, 2) AS order_item_price,
    ROUND(`Order Item Profit Ratio`,2) AS order_item_profit_ratio,
    `Order Item Quantity` AS order_item_quantity,
    sales,
    ROUND(`Order Item Total`, 2) AS order_item_total,
    ROUND(`Order Profit Per Order`, 2) AS order_profit_per_order,
    `Order Region` AS order_region,
    `Order State` AS order_state,
    `Order Status` AS order_status,
    `Product Card Id` AS product_card_id,
    `Product Category Id` AS product_category_id,
    `Product Name` AS product_name,
    `Product Price` AS product_price,
    `Product Status` AS product_status,
    DATE(STR_TO_DATE(`shipping date (DateOrders)`, '%c/%e/%Y %H:%i')) AS shipping_date,
    TIME(STR_TO_DATE(`shipping date (DateOrders)`, '%c/%e/%Y %H:%i')) AS shipping_time,
    `Shipping Mode` AS shipping_mode
FROM supplychain.datacosupplychaindataset;
