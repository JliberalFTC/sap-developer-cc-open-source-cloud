@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FIORI ELEMENTS: Tabla partners Consupt'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.entitySet.name: 'A_Partner'
@OData.entityType.name: 'A_PartnerType'
define view entity z_c_felement001
  as select from z_i_felement001 as _Table1
  association [1..1] to I_Country as _Country on _Country.Country = $projection.PartnerCountry
{
      @ObjectModel.text.element: ['PartnerName']
  key _Table1.Partner,
      @Semantics.text:true
      _Table1.PartnerName,
      _Table1.PartnerAddress,
      @ObjectModel.foreignKey.association: '_Country'
      _Table1.PartnerCountry,
      _Country
}
