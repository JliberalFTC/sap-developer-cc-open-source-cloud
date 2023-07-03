@EndUserText.label: 'RAP BACKLOG: CDS Proyección - Paises'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity z_c_rqapbklog_ctry
  provider contract transactional_query
  as projection on z_i_rqapbklog_ctry
{
  key CountryId,
      CountryDesc  as CountryDescription,
      @Semantics.systemDateTime.createdAt: true
      CreaDateTime as CreationDate,
      @Semantics.user.createdBy: true
      CreaUser     as CreationUser,
      @Semantics.systemDateTime.lastChangedAt: true
      LchgDateTime as LastChangeDate,
      @Semantics.user.lastChangedBy: true
      LchgUser     as LastChangeUser
}
