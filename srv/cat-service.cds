using quality as quality from '../db/data-model';


service DatabaseServices {
   @readOOnly entity Factories as projection on quality.Factories;
   entity Images as projection on quality.Images;
   @readOnly entity Defects as projection on quality.Defects;
   entity Products as projection on quality.Products;
   entity Products_Defects as projection on quality.Products_Defects;
}

service ViewConsumerServices{

  
   @readOnly entity Defects as projection on quality.Defects
   {
	ID,
	description,
	products_defects:redirected to Products_Defects
   };
   
   @readOnly entity Products_Defects as projection on quality.Products_Defects
   {
	ID,
	product:redirected to Products,
	defect:redirected to Defects
   };
   
   @readOnly entity Images as projection on quality.Images{
   	ID,
   	url,
   	product: redirected to Products
   };
   
   @readOnly entity Products as projection on quality.Products
   {
	  ID,
	  factory.location,
	  images: redirected to Images,
	  products_defects: redirected to Products_Defects,
	  capture_date
   };
   
	@readOnly entity ItemView as select from quality.Products
	{
	   key ID as productID,
		capture_date as date,
		factory.location as factory
	};
	
  @readOnly entity countFactory as select from quality.Products_Defects {
	count(product.ID) as NumDefect:Integer,
	key	product.factory.location as factoryName,
	}where not(defect.ID =6) group by product.factory.location;
	
 @readOnly entity countDefect as select from quality.Products_Defects{
	count(product.ID) as NumDefect:Integer,
	key defect.description as defect,
} where not(defect.ID =6) group by defect.description;
	
/*
@readOnly entity countYear as select from quality.Products_Defects{
	count(product.ID) as NumDefect:Integer,
	key	year(product.capture_date) as mYear:Integer,
}  where not(defect.ID =6)
group by year(product.capture_date);

@readOnly entity countMonth as select from quality.Products_Defects{
	count(product.ID) as NumDefect:Integer,
	key	month(product.capture_date) as mMonth:Integer,
	key	year(product.capture_date) as mYear:Integer,
}  where not(defect.ID =6)
group by month(product.capture_date), year(product.capture_date);
*/
}