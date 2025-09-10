%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	"status": error.errorMessage.payload.status,
	"responseId": error.errorMessage.payload.responseId,
	"transactionDate": error.errorMessage.payload.transactionDate,
	"data": {
		"fault": {
			"arguments":error.errorMessage.payload.data.fault.arguments,
			"type":error.errorMessage.payload.fault.data."type" default (error.errorMessage.payload.data.fault.'type' default error.errorMessage.payload.data.errorType as String default error.errorType.identifier as String),
			"message":error.errorMessage.payload.data.fault.message default (error.errorMessage.payload.data.fault.message default error.errorMessage.payload.data.errorDescription default error.detailedDescription)
		}
	}
}