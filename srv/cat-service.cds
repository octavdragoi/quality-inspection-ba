using quality as quality from '../db/data-model';


service DatabaseServices {
   @readOOnly entity Factories as projection on quality.Factories;
   entity Images as projection on quality.Images;
   @readOnly entity Defects as projection on quality.Defects;
   entity Products as projection on quality.Products;
   entity Products_Defects as projection on quality.Products_Defects;
}
