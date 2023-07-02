@EndUserText.label: 'RAP BACKLOG: CDS Proyección - Paises'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity z_c_rqapbklog_ctry
  as projection on z_i_rqapbklog_ctry
{
  key CountryId,
      CountryDesc  as CountryDescription,
      CreaDateTime as CreationDate,
      CreaUser     as CreationUser,
      LchgDateTime as LastChangeDate,
      LchgUser     as LastChangeUser
}
