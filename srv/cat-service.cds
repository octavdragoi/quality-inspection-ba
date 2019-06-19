using quality as quality from '../db/data-model';


service DatabaseServices {
   entity Factories as projection on quality.Factories;
   entity Images as projection on quality.Images;
   entity Defects as projection on quality.Defects;
   entity Products as projection on quality.Products;
   entity Dates as projection on quality.Dates;
   entity Products_Defects as projection on quality.Products_Defects;
}
