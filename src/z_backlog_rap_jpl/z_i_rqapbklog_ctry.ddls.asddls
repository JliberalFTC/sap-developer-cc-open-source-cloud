@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP BACKLOG: CDS Interface - Paises'
define root view entity z_i_rqapbklog_ctry
  as select from zrapbklogt_ctry as _Country
{
  key _Country.country_id     as CountryId,
      _Country.country_desc   as CountryDesc ,
      @Semantics.systemDateTime.createdAt: true
      _Country.crea_date_time as CreaDateTime,
      @Semantics.user.createdBy: true
      _Country.crea_user      as CreaUser,
      @Semantics.systemDateTime.lastChangedAt: true
      _Country.lchg_date_time as LchgDateTime,
      @Semantics.user.lastChangedBy: true
      _Country.lchg_user      as LchgUser
}
