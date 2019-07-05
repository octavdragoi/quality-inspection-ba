namespace quality;

@Catalog.tableType: #COLUMN
entity Factories {
  key ID : Integer;
  location  : String;
  products: Association to many Products on products.factory= $self;
}

@Catalog.tableType: #COLUMN
entity Images {
  key ID : Integer;
  product : Association to Products;
  url: String;
}

@Catalog.tableType: #COLUMN
entity Defects {
  key ID : Integer;
  products_defect : Association to many Products_Defects on products_defect.defect=$self;
  description: String;
}


@Catalog.tableType: #COLUMN
entity Products {
  key ID : Integer;
  factory  : Association to Factories;
  images : Association to many Images on images.product=$self;
  products_defects : Association to many Products_Defects on products_defects.product=$self;
  capture_date: DateTime;
}

@Catalog.tableType: #COLUMN
entity Products_Defects {
  key ID : Integer;
  defect : Association to Defects;
  product : Association to Products;
}

@Catalog.tableType: #COLUMN
entity Dates {
  key ID : Integer;
  year : Integer;
  month : Integer;
  day : Integer;
  hour : Integer;
}

view ItemsView as select from quality.Products
{
	key products_defects.ID as ItemID,
	ID as productID,
	images.url as imagePath,
	products_defects.defect.description as defect,
	capture_date as date,
	factory.location as factory
};

view AggregatesView as select from quality.Products{
	count(*) as NumDefect,
	key products_defects.defect.description as defect,
	key	factory.location as factoryName,
	key	hour(capture_date) as mHour,
	key	month(capture_date) as mMonth,
	key	year(capture_date) as mYear,
	key	dayofmonth(capture_date) as mDay
} group by products_defects.defect.description, factory.location,
hour(capture_date), month(capture_date), year(capture_date), dayofmonth(capture_date);


view countDefect as select from quality.Products_Defects{
	count(product.ID) as NumDefect,
	key defect.description as defect,
} where not(defect.ID =6) group by defect.description;

view countFactory as select from quality.Products_Defects {
	count(product.ID) as NumDefect,
	key	product.factory.location as factoryName,
}where not(defect.ID =6) group by product.factory.location;

view countYear as select from quality.Products_Defects{
	count(product.ID) as NumDefect,
	key	year(product.capture_date) as mYear,
}  where not(defect.ID =6)
group by year(product.capture_date);

view countMonth as select from quality.Products_Defects{
	count(product.ID) as NumDefect,
	key	month(product.capture_date) as mMonth,
	key	year(product.capture_date) as mYear,
}  where not(defect.ID =6)
group by month(product.capture_date), year(product.capture_date);
