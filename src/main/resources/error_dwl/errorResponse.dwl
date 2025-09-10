%dw 2.0
output application/json
---
{
  status: vars.httpStatus,
  responseId: correlationId,
  transactionDate: now(),
  data: {
  		errorCode: error.errorMessage.payload.data.errorCode default vars.errCode,
		errorType: error.errorMessage.payload.data.errorType default error.errorType.identifier as String,
		errorDescription: vars.errMessage default error.errorMessage.payload.data.errorDescription default error.detailedDescription
  }
}