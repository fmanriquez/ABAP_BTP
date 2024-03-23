@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI.headerInfo: {
    typeName                        : 'Client   e',
    title                           : { type   : #STANDARD,
                                        value  : 'NombreCompleto' },
    description                     : { type   : #STANDARD,
                                        value  : 'Email'},
    imageUrl                        : 'Imagen'
}
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CLIENTES
  as select from ztb_clientes_fmc as clientes
    inner join   ztb_clnts_lib_fm as clnts on clientes.id_cliente = clnts.id_cliente
{
      //Clnts
  key clnts.id_libro                                            as IdLibro,
      //Clientes
  key clientes.id_cliente                                       as IdCliente,
  key clientes.tipo_acceso                                      as TipoAcceso,
      clientes.nombre                                           as Nombre,
      clientes.apellidos                                        as Apellidos,
      clientes.email                                            as Email,
      clientes.url                                              as Imagen,
      concat_with_space(clientes.nombre, clientes.apellidos, 1) as NombreCompleto
}
