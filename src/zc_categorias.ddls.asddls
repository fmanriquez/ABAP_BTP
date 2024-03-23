@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorias'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CATEGORIAS
  as select from ztb_catego_fmc
{
  key bi_categ    as Categoria,
//Bloqueo de columna en @consuption.Value  
//   @UI.hidden: true 
      descripcion as Descripcion
}
