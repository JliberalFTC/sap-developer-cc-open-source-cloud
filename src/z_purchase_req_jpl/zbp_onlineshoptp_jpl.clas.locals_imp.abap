CLASS LHC_ONLINESHOP DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR OnlineShop
        RESULT result,
      get_instance_features FOR INSTANCE FEATURES
            IMPORTING keys REQUEST requested_features FOR OnlineShop RESULT result.

          METHODS createPurchaseRequisitionItem FOR MODIFY
            IMPORTING keys FOR ACTION OnlineShop~createPurchaseRequisitionItem RESULT result.

          METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
            IMPORTING keys FOR OnlineShop~calculateTotalPrice.

          METHODS setInitialOrderValues FOR DETERMINE ON MODIFY
            IMPORTING keys FOR OnlineShop~setInitialOrderValues.

          METHODS checkDeliveryDate FOR VALIDATE ON SAVE
            IMPORTING keys FOR OnlineShop~checkDeliveryDate.

          METHODS checkOrderedQuantity FOR VALIDATE ON SAVE
            IMPORTING keys FOR OnlineShop~checkOrderedQuantity.
ENDCLASS.

CLASS LHC_ONLINESHOP IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD get_instance_features.
  ENDMETHOD.

  METHOD createPurchaseRequisitionItem.
  ENDMETHOD.

  METHOD calculateTotalPrice.
  ENDMETHOD.

  METHOD setInitialOrderValues.
  ENDMETHOD.

  METHOD checkDeliveryDate.
  ENDMETHOD.

  METHOD checkOrderedQuantity.
  ENDMETHOD.

ENDCLASS.
