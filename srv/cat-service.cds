using quality as quality from '../db/data-model';


service DatabaseServices {
   @readOOnly entity Factories as projection on quality.Factories;
   entity Images as projection on quality.Images;
   @readOnly entity Defects as projection on quality.Defects;
   entity Products as projection on quality.Products;
   entity Products_Defects as projection on quality.Products_Defects;
}

service ViewConsumerServices{
	@readOnly view ItemView as select from quality.ItemsView
	{
		key ItemID,
		productID,
		imagePath,
		defect,
		date,
		factory
	};
	
	@readOnly view countDefect as select from quality.countDefect
	{
		key defect,
		NumDefect:Integer
	};
	
	@readOnly view countFactory as select from quality.countFactory
	{
		key factoryName,
		NumDefect:Integer
	};
	
	@readOnly view countYear as select from quality.countYear
	{
		key mYear:Integer,
		NumDefect:Integer
	};
	
	@readOnly view countMonth as select from quality.countMonth
	{
		key mYear:Integer,
		key mMonth:Integer,
		NumDefect:Integer
	};
}