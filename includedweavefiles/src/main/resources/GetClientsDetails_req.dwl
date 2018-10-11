{
	GetClientsDetails @(nml-version:"001" , nml-type:"Structure"): {
		MsgProtocol: payload[0].MSGPROTOCOL,
		MsgProtocolVersionNum: payload[0].MSGPROTOCOLVERSIONNUM,
		MsgTypeCde: payload[0].MSGTYPECDE,
		MsgClientOperId: payload[0].MSGCLIENTOPERID,
		MsgSenderApplId: payload[0].MSGSENDERAPPLID,
		MsgName: payload[0].MSGNAME,
		MsgVersionNum: payload[0].MSGVERSIONNUM,
		Keys: {
			KeyCnt: (trim payload[0].KEYS.KEYCNT) as :number when payload[0].KEYS.KEYCNT != '' otherwise 0,
			(payload[0].KEYS.KEY map {
			Key: {
				LegalEntityId: $.LEGALENTITYID,
				LegEntIdSrcCde: $.LEGENTIDSRCCDE,
				LegEntTypeCde: $.LEGENTTYPECDE,
				BaseLegalEntityId: $.BASELEGALENTITYID,
				nmUniqueId: $.NMUNIQUEID
			}
		 })
		},
		Filter: {
			LegalEntity: {
				CltLifecycleCde: payload[0].FILTER.LEGALENTITY.CLTLIFECYCLECDE
			}
		},
		ClientsDetails: {
			LegalEntityCnt: payload[0].CLIENTSDETAILS.LEGALENTITYCNT,
			LegalEntity: {
				LegalEntityId: payload[0].CLIENTSDETAILS.LEGALENTITY.LEGALENTITYID,
				LegEntIdSrcCde: payload[0].CLIENTSDETAILS.LEGALENTITY.LEGENTIDSRCCDE,
				LegEntTypeCde: payload[0].CLIENTSDETAILS.LEGALENTITY.LEGENTTYPECDE,
				BaseLegalEntityId: payload[0].CLIENTSDETAILS.LEGALENTITY.BASELEGALENTITYID,
				CltLifecycleCde: payload[0].CLIENTSDETAILS.LEGALENTITY.CLTLIFECYCLECDE,
				AddressCnt: payload[0].CLIENTSDETAILS.LEGALENTITY.ADDRESSCNT,
				Address: {
					StreetAdrTxt: payload[0].CLIENTSDETAILS.LEGALENTITY.ADDRESS.STREETADRTXT,
					CityNam: payload[0].CLIENTSDETAILS.LEGALENTITY.ADDRESS.CITYNAM,
					StateProvCde: payload[0].CLIENTSDETAILS.LEGALENTITY.ADDRESS.STATEPROVCDE,
					ZipCde: payload[0].CLIENTSDETAILS.LEGALENTITY.ADDRESS.ZIPCDE
				}
			}
		}
	}
}