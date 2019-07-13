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
  products_defects : Association to many Products_Defects on products_defects.defect=$self;
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

/*

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
group by month(product.capture_date), year(product.capture_date);*/
