const Utils = {
    successTrue: (statusCode, message, data) => {
        return {
            statusCode : statusCode,
            message: message,
            data: data
        }
    },
    successFalse: (statusCode, message, data) => {
        return {
            statusCode : statusCode,
            message: message,
            data: data
        }
    },
}
module.exports = Utils