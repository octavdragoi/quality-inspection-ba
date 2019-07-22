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
