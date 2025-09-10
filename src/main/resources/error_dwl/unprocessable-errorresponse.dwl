%dw 2.0
output application/json
---
{
  status: vars.httpStatus,
  responseId: correlationId,
  transactionDate: now(),
  data: {
  		errorCode: vars.errCode,
		errorType: "UNPROCESSABLE_ENTITY",
		errorDescription: if(error.muleMessage.typedValue.data.errorDescription != null and error.muleMessage.typedValue.data.errorDescription?) error.muleMessage.typedValue.data.errorDescription else error.muleMessage.typedValue.data.errorDescription   //if(error.muleMessage.typedValue.message != null and error.muleMessage.typedValue.message?) error.muleMessage.typedValue.message else error.muleMessage.typedValue.error 
	 }
}