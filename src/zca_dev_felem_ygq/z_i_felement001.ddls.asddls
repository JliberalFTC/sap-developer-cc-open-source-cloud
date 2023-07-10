@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FIORI ELEMENTS: Tabla partners'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z_i_felement001
  as select from zfelemt_001 as _Table1
{
  key _Table1.partner         as Partner,
  _Table1.partner_name    as PartnerName,
  _Table1.partner_address as PartnerAddress,
  _Table1.partner_country as PartnerCountry
}
