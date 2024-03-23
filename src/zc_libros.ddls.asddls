@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions:true
@UI.headerInfo: {
    typeName                : 'Libro',
    typeNamePlural          : 'Libros',
    title                   : {type   : #STANDARD,
                               value  : 'Titulo'},
    description             : {type   : #STANDARD,
                               value  : 'Autor'},
    imageUrl                : 'Imagen'}

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZC_LIBROS
  as select from    ztb_libros_fmc as Libros
    inner join      ztb_catego_fmc as Catego on Libros.bi_categ = Catego.bi_categ
    left outer join ZC_CLNTS_LIB   as Ventas on Libros.id_libro = Ventas.IdLibro
  association [0..*] to ZC_CLIENTES as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key Libros.id_libro    as IdLibro,
  key Libros.bi_categ    as Categoria,
      Libros.titulo      as Titulo,
      Libros.autor       as Autor,
      Libros.editorial   as Editorial,
      Libros.idioma      as Idioma,
      Libros.paginas     as Paginas,
      @Semantics.amount.currencyCode: 'moneda'
      Libros.precio      as Precio,
      case
        when Ventas.ventas < 1 then 0
        when Ventas.ventas = 1 then 1
        when Ventas.ventas = 2 then 2
        when Ventas.ventas > 2 then 3
        else 0
        end              as ventas,
        ''               as Estado,
      Libros.moneda      as Moneda,
      Libros.formato     as Formato,
      Libros.descripcion as Descripcion,
      Libros.url         as Imagen,
      _Clientes
}
