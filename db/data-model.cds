namespace quality;

@Analytics.dataCategory: #DIMENSION
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

@Analytics.dataCategory: #DIMENSION
@Catalog.tableType: #COLUMN
entity Defects {
  key ID : Integer;
  products_defect : Association to many Products_Defects on products_defect.defect=$self;
  description: String;
}

@Analytics.dataCategory: #DIMENSION
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

@Analytics.dataCategory: #DIMENSION
@Catalog.tableType: #COLUMN
entity Dates {
  key ID : Integer;
  year : Integer;
  month : Integer;
  day : Integer;
  hour : Integer;
}


