@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP BACKLOG: CDS Interface - Paises'
define root view entity z_i_rqapbklog_ctry
  as select from zrapbklogt_ctry as _Country
{
  key _Country.country_id     as CountryId,
      _Country.country_desc   as CountryDesc ,
      _Country.crea_date_time as CreaDateTime,
      _Country.crea_user      as CreaUser,
      _Country.lchg_date_time as LchgDateTime,
      _Country.lchg_user      as LchgUser
}
